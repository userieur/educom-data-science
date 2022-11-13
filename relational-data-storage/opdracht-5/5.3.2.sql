CREATE VIEW v_verzendlijst
AS
SELECT
	S.id as "ID",
	IF (p_address<>'', p_address, CONCAT(straat, ' ', huisnr)) as "adres",
    IF (p_address<>'', p_postcode, postcode) AS postcode,
    IF (p_address<>'', CP.name, CA.name) AS stad
FROM mhl_suppliers as S
LEFT JOIN mhl_cities as CP on CP.id=S.p_city_ID
LEFT JOIN mhl_cities as CA on CA.id=S.city_ID

-- Waarom niet inner join? Verzendlijst wil je toch alleen mensen met een adres?