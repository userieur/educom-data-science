-- Het gegeven antwoord duurt ontzettend lang
SELECT
    rubrieken.rubriek,
    IFNULL(
        (SELECT 
            SUM(hitcount) AS total
        FROM mhl_hitcount
        WHERE supplier_id IN (
            SELECT mhl_suppliers_ID
            FROM mhl_suppliers_mhl_rubriek_view
            WHERE mhl_rubriek_view_ID = rubrieken.id
            )
        )
        , 'Geen hits') AS total
FROM rubrieken

-- Dit geeft blob terug
SELECT
	R.rubriek,
    ifnull(sum(HC.hitcount), "Geen hits") as total
FROM v_rubrieken as R
LEFT JOIN mhl_suppliers_mhl_rubriek_view AS SRV ON R.id=SRV.mhl_rubriek_view_ID
LEFT JOIN mhl_hitcount AS HC ON HC.supplier_ID=SRV.mhl_suppliers_ID
GROUP BY R.rubriek

-- Dit geeft normaal terug, maar met NULL waarden
SELECT
	R.rubriek,
    sum(HC.hitcount) as total
FROM v_rubrieken as R
LEFT JOIN mhl_suppliers_mhl_rubriek_view AS SRV ON R.id=SRV.mhl_rubriek_view_ID
LEFT JOIN mhl_hitcount AS HC ON HC.supplier_ID=SRV.mhl_suppliers_ID
GROUP BY R.rubriek