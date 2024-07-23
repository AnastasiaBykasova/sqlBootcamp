SELECT DISTINCT pn.address, pa.name,
	count(*) AS count_of_orders
	FROM person_order po
JOIN person pn ON pn.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
GROUP BY pn.address, pa.name
ORDER BY pn.address, pa.name;