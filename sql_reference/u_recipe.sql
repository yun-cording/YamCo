#u_recipe 테이블정보에 member테이블의 m_image 컬럼을 더한 뷰
CREATE VIEW u_recipe_with_member_image AS
SELECT 
    ur.*,
    m.m_image
FROM 
    u_recipe ur
JOIN 
    member m ON ur.m_idx = m.m_idx;


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
    
#u_recipe에 부가적인 정보를 더한 뷰
CREATE VIEW u_recipe_metadata AS
SELECT 
    u.*,
    c.c_count,
    c.avg_grade,
    ul_7days.hit AS hit_7day,
    ul_1month.hit AS hit_1mon
FROM 
    u_recipe_with_member_image u
LEFT JOIN 
    u_recipe_comment_summary c ON u.rcp_idx = c.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_7days ul_7days ON u.rcp_idx = ul_7days.rcp_idx
LEFT JOIN 
    user_log_recipe_hit_1month ul_1month ON u.rcp_idx = ul_1month.rcp_idx;

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

update u_recipe set u_rcp_hit = u_rcp_hit + 1 where rcp_idx = 10008;
insert into user_log(m_idx, rcp_idx, ul_logtime, ul_status) VALUES(45, 10004, '2023-08-03 17:06:53', 3);
SELECT * FROM user_log WHERE rcp_idx = 10008;