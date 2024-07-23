INSERT INTO person_visits
	VALUES (
		(SELECT (max(id) + 1) FROM person_visits),
		(SELECT id FROM person WHERE name = 'Dmitriy'),
		(SELECT DISTINCT pizzeria_id FROM 
			(SELECT name AS pizzeria_name FROM pizzeria pa
			EXCEPT
			SELECT pizzeria_name 
				FROM mv_dmitriy_visits_and_eats mv)
				AS without_specific
			JOIN pizzeria pa 
				ON pa.name = without_specific.pizzeria_name
			JOIN menu m ON pa.id = m.pizzeria_id
			WHERE m.price < 800
			LIMIT 1),
		'2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM mv_dmitriy_visits_and_eats;