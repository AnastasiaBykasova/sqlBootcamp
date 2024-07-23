WITH visits AS (SELECT pa.name, count(*) AS count,
	'visit' AS action_type
	FROM person_visits pv
JOIN pizzeria pa ON pa.id = pv.pizzeria_id
GROUP BY pa.name
), orders AS (SELECT pa.name, count(*) as count,
	'order' AS action_type
	FROM person_order po
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
GROUP BY pa.name)
SELECT coalesce(v.name, o.name) AS name,
	CASE
		WHEN v.count IS NULL AND o.count IS NULL THEN 0
		WHEN v.count IS NULL THEN o.count
		WHEN o.count IS NULL THEN v.count
		ELSE v.count + o.count
	END AS total_count
FROM visits v
FULL OUTER JOIN orders o ON o.name = v.name
ORDER BY total_count DESC, name;