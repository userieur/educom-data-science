select 
-- 	RC.id, 
--    if(RC.parent=0, RC.name, RP.name) as "Hoofdrubriek", 
--    if(RC.parent=0, "", RC.name) as "Subrubriek" 
	RC.id, 
    ifnull(RP.name, RC.name) as "Hoofdrubriek", 
    if(isnull(RP.name), "", RC.name) as "Subrubriek" 
from mhl_rubrieken as RP
right join mhl_rubrieken as RC on RC.parent=RP.id
order by Hoofdrubriek, Subrubriek


-- waarom krijg ik een ander resultaat bij mijn eerste optie?

/* Selecteer alle hoofdrubrieken met hun subrubrieken, alfabetisch gesorteerd op hoofdrubriek en daarbinnen op subrubriek. */