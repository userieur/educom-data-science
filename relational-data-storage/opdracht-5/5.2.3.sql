SELECT 
	HC.year as Jaar,
    SUM(IF (month IN ('1','2','3'),HC.hitcount,0)) as "Eerste Kwartaal",
    SUM(IF (month IN ('4','5','6'),HC.hitcount,0)) as "Tweede Kwartaal",
    SUM(IF (month IN ('7','8','9'),HC.hitcount,0)) as "Derde Kwartaal",
    SUM(IF (month IN ('10','11','12'),HC.hitcount,0)) as "Vierde Kwartaal",
	SUM(hitcount) as "Totaal"
FROM mhl_hitcount AS HC

GROUP BY year
ORDER BY year


-- 5.2.3 Selecteer een overzicht van de totale hitcount per jaar.