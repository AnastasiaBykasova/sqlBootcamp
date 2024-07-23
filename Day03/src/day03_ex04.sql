WITH women_orders 
    AS (SELECT DISTINCT pa.name FROM person_order po 
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pa ON pa.id = m.pizzeria_id
        JOIN person pn ON pn.id = po.person_id
        WHERE pn.gender = 'female'),
    men_orders AS (SELECT DISTINCT pa.name FROM person_order po 
        JOIN menu m ON m.id = po.menu_id
        JOIN pizzeria pa ON pa.id = m.pizzeria_id
        JOIN person pn ON pn.id = po.person_id
        WHERE pn.gender = 'male')
(SELECT name AS pizzeria_name 
	FROM men_orders EXCEPT (SELECT * FROM women_orders))
UNION 
(SELECT name AS pizzeria_name 
	FROM women_orders EXCEPT (SELECT * FROM men_orders))
ORDER BY pizzeria_name;