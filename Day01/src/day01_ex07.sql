SELECT po.order_date, 
	CONCAT(person.name, ' (age:', person.age, ')') 
	AS person_information
FROM person_order po
JOIN person ON po.person_id = person.id
ORDER BY po.order_date ASC, person.name ASC;