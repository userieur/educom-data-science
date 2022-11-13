SELECT 
	CI.name as Stad,
    COUNT( IF (MT.name='Gold', 1, NULL)) as Gold,
	COUNT( IF (MT.name='Silver', 1, NULL)) as Silver,
    COUNT( IF (MT.name='Bronze', 1, NULL)) as Bronze,
    COUNT( IF (MT.name NOT IN ('Gold', 'Silver', 'Bronze'), 1, NULL)) as Other
FROM mhl_suppliers AS S
LEFT JOIN mhl_cities AS CI ON CI.id=S.city_ID
LEFT JOIN mhl_membertypes AS MT ON MT.id=S.membertype

GROUP BY CI.name
ORDER BY Gold DESC, Silver DESC, Bronze DESC, Other DESC


-- 5.2.2 Selecteer het aantal Gold, Silver, Bronze en Overige Suppliers per stad, aflopend gesorteerd op Gold, Silver, Bronze, Other.