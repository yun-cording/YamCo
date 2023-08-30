CREATE VIEW u_recipe_with_member_image AS
SELECT 
    ur.*,
    m.m_image
FROM 
    u_recipe ur
JOIN 
    member m ON ur.m_idx = m.m_idx;


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
    c.avg_grade
FROM 
    u_recipe_with_member_image u
LEFT JOIN 
    u_recipe_comment_summary c ON u.rcp_idx = c.rcp_idx;