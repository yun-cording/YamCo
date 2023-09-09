#u_recipe 테이블정보에 member테이블의 m_image 컬럼을 더한 뷰
CREATE VIEW u_recipe_with_member_image AS
SELECT 
    ur.*,
    m.m_image
FROM 
    u_recipe ur
JOIN 
    member m ON ur.m_idx = m.m_idx;
    
DROP VIEW recipe;
#p_recipe, u_recipe 두 테이블 정보를 더한 뷰
#주의: p_recipe의 p_rcp_hit를 u_rcp_hit에 저장하였다.
#주의: p_recipe의 u_rcp_status 기본값을 0으로 저장하였다.
CREATE VIEW recipe AS
SELECT rcp_idx, NULL m_idx, NULL u_rcp_title, NULL u_rcp_comment, NULL u_rcp_category, NULL u_rcp_ing, NULL u_rcp_main, NULL u_rcp_level, NULL u_rcp_keyword, NULL u_rcp_tip, NULL u_rcp_blind, NULL m_nick, COALESCE(0) u_rcp_status, p_rcp_hit u_rcp_hit, NULL u_rcp_ctype, NULL u_rcp_time, NULL u_rcp_img
FROM p_recipe
UNION
SELECT rcp_idx, m_idx, u_rcp_title, u_rcp_comment, u_rcp_category, u_rcp_ing, u_rcp_main, u_rcp_level, u_rcp_keyword, u_rcp_tip, u_rcp_blind, m_nick, u_rcp_status, u_rcp_hit, u_rcp_ctype, u_rcp_time, u_rcp_img
FROM u_recipe;

DROP VIEW recipe_metadata;
#recipe에 부가적인 정보를 더한 뷰
CREATE VIEW recipe_metadata AS
SELECT 
    r.*,
    rcs.c_count, rcs.avg_grade,
    ul_7days.hit AS hit_7day,
    ul_1month.hit AS hit_1mon,
    ul_today.hit_today AS hit_today,
    w.w_count
FROM 
    recipe r
LEFT JOIN 
    recipe_comment_summary rcs ON r.rcp_idx = rcs.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_7days ul_7days ON r.rcp_idx = ul_7days.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_1month ul_1month ON r.rcp_idx = ul_1month.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_today ul_today ON r.rcp_idx = ul_today.rcp_idx
LEFT JOIN 
    u_recipe_wish_count w ON r.rcp_idx = w.rcp_idx;
LEFT JOIN 
	 

#p_recipe, u_recipe 테이블 정보에 comment테이블의 댓글수와 평점을 더한 뷰
CREATE VIEW recipe_comment_summary AS
SELECT rcp_idx, total_comments c_count, avg_c_grade avg_grade
FROM p_recipe_comment_summary
UNION
SELECT * FROM u_recipe_comment_summary;
    
#p_recipe 테이블 정보에 comment테이블의 댓글수와 평점을 더한 뷰
CREATE VIEW p_recipe_comment_summary AS
SELECT 
    pr.rcp_idx,
    COUNT(c.c_idx) AS c_count,
    ROUND(AVG(c.c_grade), 1) AS avg_grade
FROM 
    p_recipe pr
LEFT JOIN 
    comment c ON pr.rcp_idx = c.rcp_idx
GROUP BY 
    pr.rcp_idx;

#u_recipe 테이블 정보에 comment테이블의 댓글수와 평점을 더한 뷰
CREATE VIEW u_recipe_comment_summary AS
SELECT 
    ur.rcp_idx,
    COUNT(c.c_idx) AS c_count,
    ROUND(AVG(c.c_grade), 1) AS avg_grade
FROM 
    u_recipe ur
LEFT JOIN 
    comment c ON ur.rcp_idx = c.rcp_idx
GROUP BY 
    ur.rcp_idx;
    
#u_recipe 테이블 정보에 wish_list테이블의 찜수를 더한 뷰
CREATE VIEW u_recipe_wish_count AS
SELECT 
    ur.rcp_idx,
    COUNT(wl.rcp_idx) AS w_count
FROM 
    u_recipe ur
LEFT JOIN 
    wish_list wl ON ur.rcp_idx = wl.rcp_idx
GROUP BY 
    ur.rcp_idx;
    
DROP VIEW u_recipe_metadata;
#u_recipe에 부가적인 정보를 더한 뷰
CREATE VIEW u_recipe_metadata AS
SELECT 
    u.*,
    c.c_count,
    c.avg_grade,
    ul_7days.hit AS hit_7day,
    ul_1month.hit AS hit_1mon,
    ul_today.hit_today AS hit_today,
    w.w_count
FROM 
    u_recipe_with_member_image u
LEFT JOIN 
    u_recipe_comment_summary c ON u.rcp_idx = c.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_7days ul_7days ON u.rcp_idx = ul_7days.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_1month ul_1month ON u.rcp_idx = ul_1month.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_today ul_today ON u.rcp_idx = ul_today.rcp_idx
LEFT JOIN 
    u_recipe_wish_count w ON u.rcp_idx = w.rcp_idx;

#검색어에 대한 일주인간 검색수를 볼 수 있는 뷰
CREATE VIEW user_log_search_number_7days AS 
SELECT s_name, COUNT(*) search_number
FROM user_log
WHERE
ul_status = 2
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 7 DAY)
GROUP BY s_name;

#검색어에 대한 한갈간 검색수를 볼 수 있는 뷰
CREATE VIEW user_log_search_number_1month AS 
SELECT s_name, COUNT(*) search_number
FROM user_log
WHERE
ul_status = 2
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 1 MONTH)
GROUP BY s_name;

#recipe에 대한 일주인간 조회수를 볼 수 있는 뷰
CREATE VIEW user_log_recipe_hit_7days AS 
SELECT rcp_idx, COUNT(*) hit
FROM user_log
WHERE
ul_status = 3
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 7 DAY)
GROUP BY rcp_idx;

#recipe에 대한 한달간 조회수를 볼 수 있는 뷰
CREATE VIEW user_log_recipe_hit_1month AS 
SELECT rcp_idx, COUNT(*) hit
FROM user_log
WHERE
ul_status = 3
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 1 MONTH)
GROUP BY rcp_idx;

#member가 작성한 recipe의 한달간 조회수 총합과 최고 조회수의 rcp_idx를 볼 수 있는 뷰
#주의: ul.m_state가 0인 것만 계산함(노출되는 게시물만 계산)
CREATE VIEW member_u_recipe_hit_1month AS
SELECT 
    m.m_idx,
    SUM(ul.hit) AS total_hit_in_1month,
    MAX(ul.rcp_idx) AS max_hit_rcp_idx
FROM 
    member m
JOIN 
    u_recipe u ON m.m_idx = u.m_idx
LEFT JOIN 
    user_log_recipe_hit_1month ul ON u.rcp_idx = ul.rcp_idx
WHERE u.u_rcp_status = 0
GROUP BY 
    m.m_idx;
    
#member에 부가적인 정보를 더한 뷰
CREATE VIEW member_metadata AS
SELECT 
    m.*,
    m_h_1month.total_hit_in_1month AS tot_hit_1mon,
    m_h_1month.max_hit_rcp_idx AS max_hit_1mon_rcp_idx
FROM 
    member m
LEFT JOIN 
    member_u_recipe_hit_1month m_h_1month ON m.m_idx = m_h_1month.m_idx;

#commnent에 부가적인 정보를 더한 뷰
CREATE VIEW comment_metadata AS
SELECT 
    c.*,
    ur.u_rcp_title
FROM 
    comment c
LEFT JOIN 
    u_recipe ur ON ur.rcp_idx = c.rcp_idx;

#전체회원 수, 탈퇴회원 수, 자체가입 회원 수, 소셜가입 회원 수를 저장하는 뷰
#m_status = 0 슈퍼바이저, m_status = 2 일반 관리자
#m_status = 1 일반회원, m_status = 3 탈퇴회원, m_status = 4 금지회원
CREATE VIEW member_count_summary AS
SELECT
    SUM(m_status = 1 OR m_status = 3 or m_status = 4) AS total_member,
    SUM(m_login_type = 1) AS member_type_self,
    SUM(m_login_type >= 2) AS member_type_social,
    SUM(m_status = 3) AS drop_out_member,
    SUM(m_status = 0 OR m_status = 2) AS total_admin,
    SUM(m_status = 0) AS supervisor,
    SUM(m_status = 2) AS common_admin
FROM member;

DROP VIEW report_t_metadata;
#report_t에 부가적인 정보를 더한 뷰
CREATE VIEW report_t_metadata AS
SELECT 
    r.*,
    COALESCE(ur.u_rcp_title, cm.u_rcp_title) u_rcp_title,
	 ur.u_rcp_status,
	 cm.c_contents,
    cm.c_status
FROM 
    report_t as r
LEFT JOIN 
    u_recipe ur ON r.rcp_idx = ur.rcp_idx
LEFT JOIN
	 comment_metadata cm ON r.c_idx = cm.c_idx;

update u_recipe set u_rcp_hit = u_rcp_hit + 1 where rcp_idx = 10008;
insert into user_log(m_idx, rcp_idx, ul_logtime, ul_status) VALUES(45, 10004, '2023-08-03 17:06:53', 3);
SELECT * FROM user_log WHERE rcp_idx = 10008;

SELECT * FROM u_recipe_metadata WHERE m_idx = 90 ORDER BY u_rcp_hit DESC;

select * from report_t_metadata where rcp_idx is not null order by r_idx desc;