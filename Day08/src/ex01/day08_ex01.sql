--Session #1, Session #2

--the isolation level in the 
--database is "read committed"
SHOW TRANSACTION ISOLATION LEVEL;
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
--update in Session #2 is finished
COMMIT;
----------------------------------------------------

--Session #2

--published changes for all parallel sessions
COMMIT;
----------------------------------------------------

--Session #1

--checked the update of 'pizzeria' --> success
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--checked the update of 'pizzeria' --> success
SELECT * FROM pizzeria 
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--The result of Session #1 update was lost