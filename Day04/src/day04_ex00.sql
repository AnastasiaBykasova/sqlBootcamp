CREATE VIEW v_persons_female AS
SELECT * FROM person pn
WHERE pn.gender = 'female';

CREATE VIEW v_persons_male AS
SELECT * FROM person pn
WHERE pn.gender = 'male';

SELECT * FROM v_persons_female;
SELECT * FROM v_persons_male;
