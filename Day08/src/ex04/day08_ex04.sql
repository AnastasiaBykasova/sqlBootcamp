--Session #1, Session #2

--the isolation level in the 
--database is "serializable";
--started a transaction mode
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;
----------------------------------------------------

--Session #1

--rating = 4
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--made an UPDATE of the rating to a value of 3.0
UPDATE pizzeria SET rating = 3.0
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

--rating = 3.0
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Session #2

--rating = 3.0
SELECT * FROM pizzeria
	WHERE name = 'Pizza Hut';
----------------------------------------------------

--Unlike READ COMMITTED, SERIALIZABLE provides a 
--complete sequence of actions. If two transactions 
--are trying to update the same data, then one of 
--them will wait for the other to complete.