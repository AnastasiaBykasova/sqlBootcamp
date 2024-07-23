INSERT INTO person_order
	VALUES ((SELECT (max(id) + 1) FROM person_order),
		(SELECT pn.id FROM person pn WHERE pn.name = 'Denis'),
	    (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
	    ('2022-02-24'));

INSERT INTO person_order
	    VALUES ((SELECT (max(id) + 1) FROM person_order),
	    (SELECT pn.id FROM person pn WHERE pn.name = 'Irina'),
	    (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
	    ('2022-02-24'));