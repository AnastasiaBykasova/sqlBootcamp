SELECT object_id, object_name FROM (
    SELECT id AS object_id, 
    	pizza_name AS object_name FROM menu
    UNION ALL
    SELECT id, name AS object_name FROM person
) AS combined
ORDER BY object_id ASC, object_name ASC;