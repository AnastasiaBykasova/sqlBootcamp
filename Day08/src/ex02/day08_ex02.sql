--Session #1, Session #2

--set the transaction isolation
--level: "repeatable read"
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
--started a transaction mode
BEGIN;
----------------------------------------------------

--Session #1

--checked a rating for "Pizza Hut"
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--checked a rating for "Pizza Hut"
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #1

--made an UPDATE of the rating to a value of 4
UPDATE pizzeria SET rating = 4
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--made an UPDATE of the rating to a value of 3.6
--update is waiting for the Session #1 finish
UPDATE pizzeria SET rating = 3.6
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #1

--published changes for all parallel sessions
--update in Session #2 wasn't finished,
--got an error "could not serialize access 
--due to concurrent update"
COMMIT;
----------------------------------------------------

--Session #2

--ROLLBACK was applied (output)
COMMIT;
----------------------------------------------------

--Session #1

--checked the update of 'pizzeria' --> success
--by Session #1
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--checked the update of 'pizzeria' --> success
--by Session #1
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--The result of Session #2 update was lost