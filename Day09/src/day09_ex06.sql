CREATE OR REPLACE FUNCTION 
    fnc_person_visits_and_eats_on_date
        (IN pperson VARCHAR DEFAULT 'Dmitriy', 
         IN pprice NUMERIC DEFAULT 500, 
         IN pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE (pizzeria_name VARCHAR) AS $$
BEGIN 
	RETURN QUERY
	SELECT pa.name FROM person_visits pv
	JOIN pizzeria pa ON pa.id = pv.pizzeria_id
	JOIN person pn ON pn.id = pv.person_id
	JOIN menu m ON m.pizzeria_id = pa.id
	WHERE pn.name = pperson AND m.price < pprice 
	    AND pv.visit_date = pdate;
END;
$$ LANGUAGE plpgsql;


select * from fnc_person_visits_and_eats_on_date(pprice := 800);
select * from fnc_person_visits_and_eats_on_date
	(pperson := 'Anna', pprice := 1300,pdate := '2022-01-01');
