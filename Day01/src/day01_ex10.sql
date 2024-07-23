SELECT 
	pn.name AS person_name, 
	m.pizza_name, 
	pa.name AS pizzeria_name 
FROM person_order po
JOIN person pn ON person_id = pn.id
JOIN menu m ON menu_id = m.id
JOIN pizzeria pa ON pizzeria_id = pa.id
ORDER BY person_name ASC, 
	pizza_name ASC, 
	pizzeria_name ASC;