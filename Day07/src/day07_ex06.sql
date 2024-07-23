SELECT pa.name, 
	count(po.id) AS count_of_orders, 
	round(avg(m.price), 2) AS average_price, 
	max(m.price) AS max_price, 
	min(m.price) AS min_price 
	FROM pizzeria pa
JOIN menu m ON m.pizzeria_id = pa.id
JOIN person_order po ON po.menu_id = m.id
GROUP BY pa.name
ORDER BY name;