COMMENT ON TABLE person_discounts IS 
	'Stores discount information for people in the different pizzerias.';
COMMENT ON COLUMN person_discounts.id IS 
	'Primary key identifying each record uniquely.';
COMMENT ON COLUMN person_discounts.person_id IS 
	'Foreign Key linking to the person table, indicating the person who received the discount.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 
	'Foreign Key linking to the pizzeria table, specifying the pizzeria where the discount was received.';
COMMENT ON COLUMN person_discounts.discount IS 
	'Stores the discount value for people.';


--проверка наличия комментариев
--SELECT a.attname AS column_name, 
--    d.description AS column_comment
--FROM pg_attribute a
--JOIN pg_description d ON a.attrelid = d.objoid 
--	AND a.attnum = d.objsubid
--WHERE a.attrelid = 'person_discounts'::regclass;

--SELECT count(*) = 5 as check FROM pg_description WHERE objoid = 'person_discounts'::regclass