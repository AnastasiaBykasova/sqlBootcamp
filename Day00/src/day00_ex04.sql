--SELECT name || ' (age:' || age || ',gender:' || quote_literal(gender) || ',address:' || quote_literal(address) || ')' AS person_information FROM person ORDER BY person_information ASC;
SELECT CONCAT(name, ' (age:', CAST(age AS VARCHAR), ',gender:''', CAST(gender AS VARCHAR), '''', ',address:''', CAST(address AS VARCHAR), ''')') AS person_information FROM person ORDER BY person_information ASC;