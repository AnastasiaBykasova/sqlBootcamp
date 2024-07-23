DELETE FROM person_audit WHERE row_id = 10;
DELETE FROM person WHERE id = 10;

DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DROP TRIGGER IF EXISTS trg_person_update_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_update_audit();
DROP TRIGGER IF EXISTS trg_person_delete_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit();

--!!
DROP TRIGGER IF EXISTS trg_person_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_audit();
DELETE FROM person_audit;
DROP TRIGGER IF EXISTS trg_person_insert_audit ON person;
DROP FUNCTION IF EXISTS fnc_trg_person_insert_audit();
DELETE FROM person WHERE id = 10;


DROP FUNCTION IF EXISTS fnc_persons_female();
DROP FUNCTION IF EXISTS fnc_persons_male();

DROP FUNCTION IF EXISTS fnc_persons();
DROP FUNCTION IF EXISTS fnc_persons(VARCHAR);

DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date();

DROP FUNCTION IF EXISTS func_minimum(NUMERIC[]);

DROP FUNCTION IF EXISTS fnc_fibonacci(INTEGER);