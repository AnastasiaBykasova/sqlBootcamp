CREATE OR REPLACE FUNCTION 
	fnc_fibonacci(pstop INTEGER DEFAULT 10)
	RETURNS TABLE(fib_number INTEGER) AS $$
BEGIN
	RETURN QUERY
	WITH recursive fib_ints(prev_num, next_num) AS 
		(SELECT 0 AS prev_num, 1 AS next_num
		UNION ALL
		SELECT next_num, prev_num + next_num FROM fib_ints
			WHERE prev_num + 1 <= pstop)
	SELECT prev_num FROM fib_ints 
		WHERE prev_num < pstop;
END;
$$ LANGUAGE plpgsql;


select * from fnc_fibonacci(100);
select * from fnc_fibonacci();