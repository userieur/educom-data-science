select 
-- 	P.id,
    S.name as "supplier",
    PT.name,
    IFNULL(P.content, "NOT SET") as "value"
--  P.propertytype_ID
from mhl_suppliers as S
cross join mhl_propertytypes PT
left join mhl_yn_properties as P on S.id=P.supplier_ID and PT.id=P.propertytype_ID
where S.city_ID=104 and PT.proptype="A"