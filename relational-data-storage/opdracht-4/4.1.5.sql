select mhl.mhl_suppliers.name AS "HANS KLOK", mhl.mhl_suppliers.straat, mhl.mhl_suppliers.huisnr, mhl.mhl_suppliers.postcode, mhl.pc_lat_long.lat, mhl.pc_lat_long.lng
from mhl.mhl_suppliers, mhl.pc_lat_long
where mhl.mhl_suppliers.postcode=pc_lat_long.pc6
order by mhl.pc_lat_long.lat desc
limit 5;