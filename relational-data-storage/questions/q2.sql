-- format werkt niet
-- moest zowel safe update uitzetten als de volgende code gebruiken

UPDATE mhl_suppliers 
   SET joindate=CAST(CONCAT(2000+membertype,\'-\',(id%12)+1, \'-\',(id%28)+1) AS DATE)

UPDATE mhl_suppliers 
   SET joindate=CAST(CONCAT(2000+membertype,'-',(id%12)+1, '\',(id%28)+1) AS DATE)