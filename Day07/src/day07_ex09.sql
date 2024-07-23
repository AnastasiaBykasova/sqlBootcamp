WITH count_values 
	AS (SELECT address,
	round((max(age)::numeric - (min(age)::numeric / 
		max(age)::numeric)), 2) AS formula,
	round(avg(age), 2) AS average
	FROM person
	GROUP BY address
	ORDER BY address
)
SELECT cv.address, cv.formula, cv.average,
	(CASE
		WHEN cv.formula > cv.average THEN true
		ELSE false
	END) AS comparison
	FROM count_values cv;