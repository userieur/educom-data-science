SELECT 
	HC.year as "jaar",
    M.name as "maand",
    count(HC.supplier_ID) as "aantal leveranciers",
    sum(hitcount) as "totaal aantal hits"
FROM mhl_hitcount as HC
JOIN months as M ON HC.month=M.id
GROUP BY year, month
ORDER BY year, month

-- 6.1.1 Selecteer uit de hitcount-tabel het aantal records, de minimale, maximale, gemiddelde en totale hitcount.
-- De vraag klopt niet met het antwoord (gemiddelde e.d.) | Plus de hint van 'maak een view met maanden' was welkom geweest
-- Is het niet ontzettend raar maanden op naam de sorteren? 