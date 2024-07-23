SELECT action_date, person_id FROM (
	SELECT visit_date AS action_date, 
		person_id FROM person_visits
	INTERSECT
	SELECT order_date AS action_date, 
		person_id FROM person_order) AS combined
ORDER BY action_date ASC, person_id DESC;