WITH visited
	AS (SELECT pa.name AS pizzeria_name, pn.gender
    	FROM person_visits AS pv
    	JOIN person pn ON pn.id = pv.person_id
    	JOIN pizzeria pa ON pa.id = pv.pizzeria_id),
    female AS (SELECT female_v.pizzeria_name 
    	FROM visited AS female_v WHERE female_v.gender = 'female'),
    male AS (SELECT male_v.pizzeria_name 
    	FROM visited AS male_v WHERE male_v.gender = 'male')
(SELECT * FROM female EXCEPT ALL (SELECT * FROM male))
UNION ALL
(SELECT * FROM male EXCEPT ALL (SELECT * FROM female))
ORDER BY pizzeria_name;