--Session #1

--started a transaction mode
BEGIN;
--updated of rating for "Pizza Hut" to 5 points
UPDATE pizzeria SET rating = 5.0
	WHERE name = 'Pizza Hut';
--checked the update of 'pizzeria' --> success
SELECT * FROM pizzeria;
-------------------------------------------------------------

--Session #2

--checked the update of 'pizzeria' --> no changes are shown
SELECT * FROM pizzeria;
-------------------------------------------------------------

--Session #1

--published changes for all parallel sessions
COMMIT;
--checked the update --> success
SELECT * FROM pizzeria;
-------------------------------------------------------------

--Session #2

--checked the update of 'pizzeria' --> success
SELECT * FROM pizzeria;
-------------------------------------------------------------

--The result of Session #1 update was seen by Session #2
--only after COMMIT by Session #1