DROP TABLE IF EXISTS menu CASCADE;
DROP TABLE IF EXISTS person CASCADE;
DROP TABLE IF EXISTS person_order CASCADE;
DROP TABLE IF EXISTS person_visits CASCADE;
DROP TABLE IF EXISTS pizzeria CASCADE;

DROP INDEX IF EXISTS idx_menu_pizzeria_id;
DROP INDEX IF EXISTS idx_person_visits_person_id;
DROP INDEX IF EXISTS idx_person_visits_pizzeria_id;
DROP INDEX IF EXISTS idx_person_order_person_id;
DROP INDEX IF EXISTS idx_person_order_menu_id;

DROP INDEX IF EXISTS idx_person_name;
DROP INDEX IF EXISTS idx_person_order_multi;
DROP INDEX IF EXISTS idx_menu_unique;
DROP INDEX IF EXISTS idx_person_order_order_date;
DROP INDEX IF EXISTS idx_1;