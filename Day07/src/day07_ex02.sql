(SELECT pa.name, count(*) AS count,
	'visit' AS action_type
	FROM person_visits pv
JOIN pizzeria pa ON pa.id = pv.pizzeria_id
GROUP BY pa.name
LIMIT 3)
UNION
(SELECT pa.name, count(*) as count,
	'order' AS action_type
	FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
GROUP BY pa.name
LIMIT 3)
ORDER BY action_type, count DESC;


----второй способ
--WITH combined_data AS (
--    SELECT pa.name,
--        COUNT(*) AS count,
--        'visit' AS action_type
--    FROM person_visits pv
--    JOIN pizzeria pa ON pa.id = pv.pizzeria_id
--    GROUP BY pa.name
--
--    UNION ALL
--
--    SELECT pa.name, 
--        COUNT(*) AS count,
--        'order' AS action_type
--    FROM person_order po
--    JOIN menu m ON m.id = po.menu_id
--    JOIN pizzeria pa ON pa.id = m.pizzeria_id
--    GROUP BY pa.name
--),
--sorted_results AS (
--    SELECT *,
--        ROW_NUMBER() OVER(PARTITION BY action_type ORDER BY count DESC) AS rn
--    FROM combined_data
--)
--SELECT name, count, action_type
--FROM sorted_results
--WHERE rn <= 3
--ORDER BY action_type ASC, count DESC;
