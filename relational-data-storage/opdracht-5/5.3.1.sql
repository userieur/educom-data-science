CREATE VIEW v_DIRECTIE
AS
SELECT
	C.supplier_ID as "ID",
    C.name as "contact",
    C.contacttype as "functie",
    D.name as "department"
FROM mhl_contacts as C
JOIN mhl_departments as D on D.id=C.department
WHERE IF(D.name="Directie", TRUE, C.contacttype LIKE '%directeur%')