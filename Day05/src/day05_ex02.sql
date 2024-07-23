--DROP INDEX IF EXISTS idx_person_name;

CREATE INDEX idx_person_name 
	ON person(upper(name));

SET enable_seqscan = OFF;

EXPLAIN ANALYZE

SELECT pn.name, pn.address FROM person pn 
	WHERE upper(pn.name) = 'NATALY';