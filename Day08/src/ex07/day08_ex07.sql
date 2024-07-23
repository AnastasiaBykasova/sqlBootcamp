--Session #1, Session #2

--started a transaction mode
BEGIN;
----------------------------------------------------

--Session #1

UPDATE pizzeria SET rating = 3.3
	WHERE id = 1;
----------------------------------------------------

--Session #2

UPDATE pizzeria SET rating = 5.0
	WHERE id = 2;
----------------------------------------------------

--Session #1

UPDATE pizzeria SET rating = 4.9
	WHERE id = 2;
----------------------------------------------------

--Session #2

UPDATE pizzeria SET rating = 3.8
	WHERE id = 1;
----------------------------------------------------

--Session #1

--published changes for all parallel sessions
COMMIT;
SELECT * FROM pizzeria;
----------------------------------------------------

--Session #2

--published changes for all parallel sessions
COMMIT;
SELECT * FROM pizzeria;
----------------------------------------------------

--Deadlocks occur when two or more transactions 
--each hold a lock and need a lock held by the 
--other transaction to proceed. 