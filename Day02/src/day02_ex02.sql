SELECT COALESCE(pn.name, '-') AS person_name,
	visited.visit_date,
	COALESCE(pa.name, '-') AS pizzeria_name
FROM (SELECT pv.person_id, 
	pv.pizzeria_id, pv.visit_date 
	FROM person_visits AS pv
    WHERE pv.visit_date 
    BETWEEN '2022-01-01' AND '2022-01-03') AS visited
FULL JOIN person AS pn ON visited.person_id = pn.id
FULL JOIN pizzeria AS pa ON visited.pizzeria_id = pa.id
ORDER BY person_name ASC,
    visit_date ASC,
    pizzeria_name ASC;