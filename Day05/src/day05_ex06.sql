EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating 
    	ORDER BY rating ROWS BETWEEN 
    	UNBOUNDED PRECEDING AND UNBOUNDED 
    	FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;


CREATE INDEX IF NOT EXISTS idx_1 ON pizzeria(rating);
SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT m.pizza_name AS pizza_name,
	max(rating) OVER (PARTITION BY rating 
    ORDER BY rating ROWS BETWEEN 
    UNBOUNDED PRECEDING AND UNBOUNDED 
    FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;

--индекс отсутствует:
--Planning Time: 0.806 ms
--Execution Time: 0.445 ms

--по индексу:
--Planning Time: 0.269 ms
--Execution Time: 0.133 ms