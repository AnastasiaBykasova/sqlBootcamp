CREATE VIEW v_price_with_discount AS
	(SELECT pn.name, m.pizza_name, m.price,
		(m.price - m.price * 0.1)::int 
			AS discount_price 
		FROM person pn
	JOIN person_order po ON po.person_id = pn.id
	JOIN menu m ON m.id = po.menu_id
	ORDER BY pn.name, m.pizza_name);

SELECT * FROM v_price_with_discount;