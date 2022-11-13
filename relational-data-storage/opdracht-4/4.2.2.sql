select mhl_cities.name, ifnull(mhl_communes.name, "Invalid") as "community"
from mhl_cities
left join mhl_communes on mhl_communes.id=mhl_cities.commune_ID
