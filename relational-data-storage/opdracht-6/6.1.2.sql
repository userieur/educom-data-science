SELECT 
	A.gemeente as "gemeente",
    T.leverancier as "leverancier",
    T.total_hitcount as "total_hitcount",
    A.average_hitcount as "average_hitcount"
    
-- stukje dat totaal berekend per leverancier
FROM (
	SELECT 
		G.id,
        S.name as "leverancier",
        SUM(HC.hitcount) as "total_hitcount"
	FROM mhl_suppliers S
	JOIN mhl_cities C ON C.id=S.city_ID
	JOIN mhl_communes G ON G.id=C.commune_ID
	JOIN mhl_districts P ON P.id=G.district_ID
    JOIN mhl_hitcount HC ON HC.supplier_ID=S.id
    WHERE P.country_ID="151"
    GROUP BY G.id, S.name
    ) AS T

-- stukje dat gemiddelde berekend per gemeente
INNER JOIN (
	SELECT
		G.id,
        G.name as "gemeente",
        AVG(HC.hitcount) as "average_hitcount"
	FROM mhl_suppliers S
	JOIN mhl_cities C ON C.id=S.city_ID
	JOIN mhl_communes G ON G.id=C.commune_ID
	JOIN mhl_districts P ON P.id=G.district_ID
    JOIN mhl_hitcount HC ON HC.supplier_ID=S.id
    WHERE P.country_ID="151"
    GROUP BY G.id
	) AS A ON T.id=A.id

GROUP BY A.id, T.leverancier
HAVING T.total_hitcount > A.average_hitcount
ORDER BY A.gemeente, (T.total_hitcount-A.average_hitcount) DESC