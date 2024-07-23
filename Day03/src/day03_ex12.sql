WITH person_amount 
	AS (SELECT COUNT(*) 
		AS p_amount FROM person),
	person_min_max 
		AS (SELECT min(id) AS p_min, 
		max(id) AS p_max FROM person),
	orders 
		AS (SELECT max(id) AS id FROM person_order),
	greek_pizza_id 
		AS (SELECT id FROM menu 
		WHERE pizza_name = 'greek pizza')
INSERT INTO person_order
SELECT 
	GENERATE_SERIES(orders.id + 1, 
		orders.id + person_amount.p_amount) AS id,
	GENERATE_SERIES(person_min_max.p_min,
		person_min_max.p_max) AS person_id,
	greek_pizza_id.id AS menu_id,
	'2022-02-25' AS order_date
	FROM person_amount, person_min_max, 
		orders, greek_pizza_id;