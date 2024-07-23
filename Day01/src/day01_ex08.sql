SELECT po.order_date, 
	CONCAT(p_info.name, ' (age:', p_info.age, ')') 
	AS person_information 
FROM person_order po
NATURAL JOIN 
(SELECT id AS person_id, name, 
	age FROM person) AS p_info
ORDER BY po.order_date ASC, p_info.name ASC;