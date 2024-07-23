INSERT INTO person_visits
	VALUES ((SELECT (max(id) + 1) FROM person_visits),
		(SELECT pn.id FROM person pn WHERE pn.name = 'Denis'),
    	(SELECT pa.id FROM pizzeria pa WHERE pa.name = 'Dominos'),
    	('2022-02-24'));

INSERT INTO person_visits
    VALUES ((SELECT (max(id) + 1) FROM person_visits),
    	(SELECT pn.id FROM person pn WHERE pn.name = 'Irina'),
    	(SELECT pa.id FROM pizzeria pa WHERE pa.name = 'Dominos'),
    	('2022-02-24'));