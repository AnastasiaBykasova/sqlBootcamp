--перед созданием ограничений проверяем, что
--значения с элементами NULL добавляются

ALTER TABLE person_discounts 
	ADD CONSTRAINT ch_nn_person_id 
		CHECK (person_id IS NOT NULL),
	ADD CONSTRAINT ch_nn_pizzeria_id
		CHECK (pizzeria_id IS NOT NULL),
	ADD CONSTRAINT ch_nn_discount
		CHECK (discount IS NOT NULL),
	ALTER COLUMN discount SET DEFAULT 0,
	ADD CONSTRAINT ch_range_discount
		CHECK (discount BETWEEN 0 AND 100);


--проверим, что после создания ограничений
--добавить в таблицу значения с элементом NULL невозможно
--INSERT INTO person_discounts VALUES (16, NULL, 5, 10);
--INSERT INTO person_discounts VALUES (17, 4, NULL, 10);
--INSERT INTO person_discounts VALUES (18, 5, 5, NULL);
	
	
--select count(*) = 4 as check from pg_constraint where conname in ('ch_nn_person_id','ch_nn_pizzeria_id','ch_nn_discount','ch_range_discount')
--
--select column_default::integer = 0 as check from information_schema.columns where column_name = 'discount' and table_name = 'person_discounts'