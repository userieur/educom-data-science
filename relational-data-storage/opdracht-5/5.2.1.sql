SELECT
	S.name,
    IFNULL(C.name, 'tav de directie') AS aanhef,
	IF (p_address<>'', p_address, CONCAT(straat, ' ', huisnr)) AS adres,
    IF (p_address<>'', p_postcode, postcode) AS postcode,
    IF (p_address<>'', CI.name, CI2.name) AS stad,
    IF (p_address<>'', D.name, D.name) AS provincie
FROM mhl_suppliers as S
left join mhl_contacts as C on S.ID=C.supplier_ID and C.department=3

-- adres van postbus
left join mhl_cities as CI on CI.id=S.p_city_ID
left join mhl_communes as CO on CO.id=CI.commune_ID
left join mhl_districts as D on D.id=CO.district_ID

-- adres normaal
left join mhl_cities as CI2 on CI2.id=S.city_ID
left join mhl_communes as CO2 on CO2.id=CI2.commune_ID
left join mhl_districts as D2 on D2.id=CO2.district_ID

where postcode <> ''
order by provincie, stad, S.name




-- 5.2.1 Maak een verzendlijst voor alle directieleden van alle leveranciers, gesorteerd per provincie, plaatsnaam en naam: wanneer een postbusadres ingevuld dan dit gebruiken, anders vestigingsadres, wanneer contactpersoon aanwezig dan die naam in aanhef, anders 't.a.v. de directie'.