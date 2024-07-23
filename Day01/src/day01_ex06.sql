SELECT combined.action_date, 
	person.name AS person_name
FROM person
JOIN (SELECT visit_date AS action_date, 
		person_id FROM person_visits
	INTERSECT
	SELECT order_date AS action_date, 
		person_id FROM person_order) 
AS combined ON person.id = combined.person_id
ORDER BY action_date ASC, person_name DESC;