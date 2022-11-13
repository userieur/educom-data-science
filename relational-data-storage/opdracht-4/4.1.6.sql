-- 4.1.6 Selecteer de hitcount in januari 2014, leveranciersnaam, plaatsnaam, gemeentenaam, provincienaam van de leveranciers uit de provincies 'beneden de grote rivieren'.
SELECT mhl_hitcount.hitcount, mhl_suppliers.name AS leverancier, mhl_cities.name AS stad, mhl_communes.name AS gemeente, mhl_districts.name AS provincie
FROM mhl_suppliers
INNER JOIN mhl_cities ON mhl_suppliers.city_ID=mhl_cities.id
INNER JOIN mhl_communes ON mhl_cities.commune_ID=mhl_communes.id
INNER JOIN mhl_districts ON mhl_communes.district_ID=mhl_districts.id
INNER JOIN mhl_hitcount ON mhl_suppliers.id=mhl_hitcount.supplier_id AND mhl_hitcount.year="2014" AND mhl_hitcount.month="1"
WHERE ( mhl_districts.name="Brabant" OR mhl_districts.name="Limburg" OR mhl_districts.name="Zeeland");