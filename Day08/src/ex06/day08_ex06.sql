--Session #1, Session #2

--started a transaction mode
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
----------------------------------------------------

--Session #1

--summarized all ratings for all pizzerias = 26.9
SELECT sum(rating) FROM pizzeria;
----------------------------------------------------

--Session #2

--made INSERT of the new restaurant 'Kazan Pizza' 
--with rating 5 and ID=10
INSERT INTO pizzeria VALUES(11, 'Kazan Pizza 2', 4);
--published changes for all parallel sessions
COMMIT;
----------------------------------------------------

--Session #1

--summarized all ratings for all pizzerias = 26.9
SELECT sum(rating) FROM pizzeria;
COMMIT;

--summarized all ratings for all pizzerias = 30.9
SELECT sum(rating) FROM pizzeria;
----------------------------------------------------

--Session #2

--summarized all ratings for all pizzerias = 30.9
SELECT sum(rating) FROM pizzeria;
----------------------------------------------------

--Changes from Session #2 are visible in 
--Session #1 only after the current transaction 
--is completed in the first session