select mhl.mhl_suppliers.name AS "leveranciersnaam", mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode, mhl.mhl_rubrieken.name AS "rubrieknaam"
from mhl.mhl_suppliers_mhl_rubriek_view
inner join mhl.mhl_suppliers on mhl.mhl_suppliers_mhl_rubriek_view.mhl_suppliers_ID=mhl_suppliers.ID and mhl.mhl_suppliers.city_ID=104
inner join mhl.mhl_rubrieken on mhl.mhl_suppliers_mhl_rubriek_view.mhl_rubriek_view_ID=mhl_rubrieken.ID and (mhl.mhl_rubrieken.name="drank" or mhl.mhl_rubrieken.parent=235)
order by mhl.mhl_rubrieken.name, mhl.mhl_suppliers.name;