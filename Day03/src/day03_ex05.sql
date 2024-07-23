WITH diff AS (SELECT pv.pizzeria_id,
	pv.visit_date FROM person pn
    JOIN person_visits pv ON pv.person_id = pn.id
    WHERE pn.name = 'Andrey'
    EXCEPT   
    SELECT m.pizzeria_id, po.order_date
	    FROM person pn
    JOIN person_order po ON po.person_id = pn.id
    JOIN menu m ON m.id = po.menu_id)
SELECT pa.name AS pizzeria_name FROM diff
JOIN pizzeria pa ON pa.id = diff.pizzeria_id
ORDER BY pizzeria_name;