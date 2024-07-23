--Session #1, Session #2

--the isolation level in the 
--database is "read committed"
SHOW TRANSACTION ISOLATION LEVEL;
--started a transaction mode
BEGIN;
----------------------------------------------------

--Session #1

--rating = 4
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--made an UPDATE of the rating to a value of 3.6
UPDATE pizzeria SET rating = 3.6
	WHERE name = 'Pizza Hut';
--published changes for all parallel sessions
COMMIT;
----------------------------------------------------

--Session #1

--rating = 3.6
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
--closed transaction
COMMIT;

--rating = 3.6
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--rating = 3.6
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--There are different tuple states during one 
--transaction because there was an update
--between these states