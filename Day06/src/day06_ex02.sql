SELECT pn.name, m.pizza_name, m.price,
	round(m.price - (m.price * pd.discount / 100))
		AS discount_price,
	pa.name AS pizzeria_name
	FROM person_order po
JOIN person pn ON pn.id = po.person_id
JOIN menu m ON m.id = po.menu_id
JOIN pizzeria pa ON pa.id = m.pizzeria_id
JOIN person_discounts pd ON pd.person_id = pn.id 
	AND pd.pizzeria_id = pa.id
ORDER BY name, pizza_name;