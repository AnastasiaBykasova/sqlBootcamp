CREATE SEQUENCE seq_person_discounts AS int 
	START 1 OWNED BY person_discounts.id;

SELECT SETVAL('seq_person_discounts', 
	max(id)) FROM person_discounts; 
	

ALTER TABLE person_discounts ALTER COLUMN id 
 	SET DEFAULT nextval('seq_person_discounts');


 
--проверяем работоспособность
--INSERT INTO person_discounts(person_id, pizzeria_id, discount)
--	VALUES(7, 4, 22);
--INSERT INTO person_discounts(person_id, pizzeria_id, discount)
--	VALUES(7, 5, 22);
--INSERT INTO person_discounts(person_id, pizzeria_id, discount)
--	VALUES(7, 6, 22);
 
 
-- select count(*)=1 as check1, max("start_value") = 1 as check2, max("last_value") > 5 as check3 from pg_sequences where sequencename = 'seq_person_discounts'
 