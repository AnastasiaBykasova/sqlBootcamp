SELECT pn.name,
	count(*) AS count_of_visits
	FROM person_visits pv
JOIN person pn ON pn.id = pv.person_id
GROUP BY pn.name
ORDER BY count_of_visits DESC, name
LIMIT 4;