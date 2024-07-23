DROP VIEW IF EXISTS v_persons_male;
DROP VIEW IF EXISTS v_persons_female;

DROP VIEW IF EXISTS v_generated_dates;
SELECT * FROM v_generated_dates;

SELECT * FROM v_symmetric_union;
DROP VIEW IF EXISTS v_symmetric_union;

SELECT * FROM v_price_with_discount;
DROP VIEW IF EXISTS v_price_with_discount;

SELECT * FROM mv_dmitriy_visits_and_eats;
DROP MATERIALIZED VIEW IF EXISTS mv_dmitriy_visits_and_eats;


DELETE FROM person_visits WHERE id = 23;

DROP MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT * FROM mv_dmitriy_visits_and_eats;

		
		
		