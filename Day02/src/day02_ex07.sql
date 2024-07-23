SELECT DISTINCT pa.name AS pizzeria_name 
	FROM person_visits pv 
JOIN person pn ON pn.id = pv.person_id
JOIN pizzeria pa ON pa.id = pv.pizzeria_id
JOIN menu m ON m.pizzeria_id = pa.id
WHERE pn.name = 'Dmitriy' 
	AND pv.visit_date = '2022-01-08'
	AND m.price < 800;