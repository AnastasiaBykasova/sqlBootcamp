SELECT pizza_name, pa.name AS pizzeria_name 
	FROM person_order po
JOIN person pn ON pn.id = po.person_id
JOIN menu m ON menu_id = m.id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
WHERE (pn.name = 'Denis' OR pn.name = 'Anna')
ORDER BY pizza_name ASC, pizzeria_name ASC;