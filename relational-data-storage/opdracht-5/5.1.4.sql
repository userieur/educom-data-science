SELECT
    S.name,
	SUM(hitcount),
	COUNT(month),
	AVG(hitcount)
FROM mhl_hitcount HC
left join mhl_suppliers as S on S.id=HC.supplier_ID
GROUP by supplier_ID
order by SUM(hitcount) desc
-- 5.1.4 Selecteer uit de hitcount-tabel de leveranciersnaam, het totaal aantal hits, het aantal maanden en de gemiddelde hitcount.