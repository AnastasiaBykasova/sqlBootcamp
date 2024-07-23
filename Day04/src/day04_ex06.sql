CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
	(SELECT DISTINCT pa.name AS pizzeria_name 
		FROM person_visits pv
	JOIN person pn ON pn.id = pv.person_id
	JOIN pizzeria pa ON pa.id = pv.pizzeria_id
	JOIN menu m ON m.pizzeria_id = pv.pizzeria_id
	WHERE pv.visit_date = '2022-01-08'
		AND pn.name = 'Dmitriy'
		AND m.price < 800);

SELECT * FROM mv_dmitriy_visits_and_eats;