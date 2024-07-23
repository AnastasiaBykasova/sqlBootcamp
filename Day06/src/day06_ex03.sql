CREATE UNIQUE INDEX IF NOT EXISTS 
	idx_person_discounts_unique 
	ON person_discounts(person_id, pizzeria_id);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person_discounts 
	WHERE person_id BETWEEN 5 AND 10 AND
		pizzeria_id BETWEEN 3 AND 6;

	
--проверка, что значения не будут дублироваться
--INSERT INTO person_discounts 
--	VALUES(16, 4, 2, 0);