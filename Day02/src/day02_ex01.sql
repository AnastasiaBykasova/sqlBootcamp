SELECT dates::date AS missing_date
FROM generate_series(
    TIMESTAMP '2022-01-01', 
    TIMESTAMP '2022-01-10', 
    INTERVAL '1 day'
) AS dates
LEFT JOIN (
    SELECT visit_date 
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2)
AS filtered ON dates::date = filtered.visit_date
WHERE filtered.visit_date IS NULL
ORDER BY visit_date ASC;