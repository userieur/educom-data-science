SELECT
	S.name as "name",
    ifnull(D.contact, 'tav de directie') AS "contact",
	V.adres,
    V.postcode,
    V.stad
FROM mhl_suppliers as S
JOIN v_verzendlijst as V on S.id=V.ID
LEFT JOIN v_directie as D on S.id=D.ID

-- views toch niet meer ID noemen maar supplier_id