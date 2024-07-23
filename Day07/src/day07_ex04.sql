SELECT pn.name, count(*) AS count_of_visits
	FROM person_visits pv
JOIN person pn ON pn.id = pv.person_id
GROUP BY pn.name
HAVING count(*) > 3
ORDER BY pn.name, count_of_visits DESC;