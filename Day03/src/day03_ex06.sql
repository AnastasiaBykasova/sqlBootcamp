WITH pizza 
	AS (SELECT pizza_name, pizzeria_id, 
			pa.name AS pizzeria_name, price 
    		FROM menu m
    	JOIN pizzeria pa ON pa.id = m.pizzeria_id)
SELECT pa_1.pizza_name,
	pa_1.pizzeria_name AS pizzeria_name_1,
    pa_2.pizzeria_name AS pizzeria_name_2,
    pa_1.price 
    FROM pizza pa_1
JOIN pizza pa_2 ON pa_1.pizza_name = pa_2.pizza_name 
	AND pa_1.price = pa_2.price
WHERE pa_1.pizzeria_id > pa_2.pizzeria_id
 ORDER BY pizza_name;