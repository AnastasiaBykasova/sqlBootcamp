WITH person_kate AS 
	(SELECT id, name FROM person p 
		WHERE p.name = 'Kate')
SELECT m.pizza_name, m.price, 
	pa.name AS pizzeria_name, 
	pv.visit_date 
	FROM person_kate
JOIN person_visits pv ON pv.person_id = person_kate.id
JOIN pizzeria pa ON pa.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pa.id
WHERE m.price BETWEEN 800 AND 1000
ORDER BY m.pizza_name, m.price, pa.name;