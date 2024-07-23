DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS person_order CASCADE;
DROP TABLE IF EXISTS person_visits CASCADE;
DROP TABLE IF EXISTS pizzeria CASCADE;
DROP TABLE IF EXISTS person_discounts CASCADE;

DELETE FROM person_discounts;


INSERT INTO person_discounts VALUES (16, NULL, 5, 4);



DROP INDEX IF EXISTS idx_person_discounts_unique;
DELETE FROM person_discounts WHERE id > 15;
DROP SEQUENCE seq_person_discounts CASCADE;
