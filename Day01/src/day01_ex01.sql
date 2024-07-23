SELECT object_name FROM (
    SELECT pizza_name AS object_name FROM menu
    UNION ALL
    SELECT name AS object_name FROM person
) AS combined
ORDER BY object_name ASC;