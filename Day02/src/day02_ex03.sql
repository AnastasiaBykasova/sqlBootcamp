WITH date_gen AS (
    SELECT dates::date AS missing_date
    FROM generate_series(
        TIMESTAMP '2022-01-01', 
        TIMESTAMP '2022-01-10', 
        INTERVAL '1 day'
    ) AS dates
),
filtered_pv AS (
    SELECT visit_date
    FROM person_visits
    WHERE person_id = 1 OR person_id = 2
)
SELECT dg.missing_date FROM date_gen dg
LEFT JOIN filtered_pv fpv ON dg.missing_date = fpv.visit_date
WHERE fpv.visit_date IS NULL
ORDER BY dg.missing_date;