WITH people AS (
    SELECT id, name, address
    FROM person
)
SELECT p1.name AS person_name1,
    p2.name AS person_name2,
    p1.address AS common_address
FROM people AS p1
JOIN people AS p2
    ON (p1.address = p2.address
        AND p1.name <> p2.name)
WHERE p1.id > p2.id
ORDER BY person_name1 ASC,
    person_name2 ASC,
    common_address ASC;