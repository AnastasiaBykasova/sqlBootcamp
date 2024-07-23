WITH women AS
	(SELECT pn.name, m.pizza_name 
		FROM person_order po
	JOIN person pn ON pn.id = po.person_id
	JOIN menu m ON m.id = po.menu_id
	WHERE pn.gender = 'female')
SELECT w_pep.name FROM women w_pep
WHERE w_pep.pizza_name = 'pepperoni pizza' AND
	EXISTS (SELECT w_ch.name FROM women w_ch
		WHERE w_ch.pizza_name = 'cheese pizza' 
		AND w_ch.name = w_pep.name)
ORDER BY name;