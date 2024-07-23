SELECT DISTINCT pn.name FROM person_order po
JOIN person pn ON pn.id = po.person_id
JOIN menu m ON m.id = po.menu_id
WHERE pn.gender = 'male' AND 
	pn.address IN ('Moscow', 'Samara') AND 
	m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY name DESC;