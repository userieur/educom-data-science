CREATE OR REPLACE VIEW rubrieken AS
    SELECT
        IFNULL(rc.id, rp.id) as id,
        IF(ISNULL(rp.name), rc.name, CONCAT(rp.name, ' - ', rc.name)) AS rubriek,
        IFNULL(rp.name, rc.name) AS hoofdrubriek,
        IF(ISNULL(rp.name), ' ', rc.name) AS subrubriek
    FROM mhl_rubrieken rp
    RIGHT OUTER JOIN mhl_rubrieken rc ON rc.parent = rp.id
    ORDER BY rubriek


SELECT
	R.rubriek,
    count(SRV.mhl_suppliers_ID) as total
FROM mhl_suppliers_mhl_rubriek_view AS SRV
INNER JOIN v_rubrieken AS R ON R.id=SRV.mhl_rubriek_view_ID
GROUP BY R.rubriek

SELECT
    rubrieken.rubriek,
    (SELECT 
        COUNT(mhl_suppliers_ID)
     FROM mhl_suppliers_mhl_rubriek_view
     WHERE mhl_rubriek_view_ID = rubrieken.id
    ) AS numsup
FROM rubrieken
ORDER BY rubriek