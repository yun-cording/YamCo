#u_recipe 테이블정보에 member테이블의 m_image 컬럼을 더한 뷰
CREATE VIEW u_recipe_with_member_image AS
SELECT 
    ur.*,
    m.m_image
FROM 
    u_recipe ur
JOIN 
    member m ON ur.m_idx = m.m_idx;


comment_avg_c_grade
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

CREATE VIEW user_log_recipe_hit_7days AS 
SELECT rcp_idx, COUNT(*) hit
FROM user_log
WHERE
ul_status = 3
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 7 DAY)
GROUP BY rcp_idx;

CREATE VIEW user_log_recipe_hit_1month AS 
SELECT rcp_idx, COUNT(*) hit
FROM user_log
WHERE
ul_status = 3
AND ul_logtime < SYSDATE()
AND ul_logtime >= DATE_SUB(sysdate(), INTERVAL 1 MONTH)
GROUP BY rcp_idx;
    
update u_recipe set u_rcp_hit = u_rcp_hit + 1 where rcp_idx = 10008;
insert into user_log(m_idx, rcp_idx, ul_logtime, ul_status) VALUES(45, 10004, '2023-08-03 17:06:53', 3);
SELECT * FROM user_log WHERE rcp_idx = 10008;