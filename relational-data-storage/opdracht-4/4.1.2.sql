select mhl.mhl_suppliers.name, mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode, mhl.mhl_cities.name AS "plaatsnaam" 
from mhl.mhl_suppliers
inner join mhl.mhl_cities on mhl.mhl_suppliers.city_ID=mhl_cities.ID
inner join mhl.mhl_communes on mhl.mhl_cities.commune_ID=mhl_communes.ID and mhl.mhl_communes.name="steenwijkerland";