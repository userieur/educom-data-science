select mhl.mhl_cities.name AS stad, mhl.mhl_cities.id, C2.id as id2, mhl.mhl_cities.commune_ID AS gemeente_id, C2.commune_ID AS gemeente2_id, mhl.mhl_communes.name as gemeente, G2.name as gemeente2
from mhl.mhl_cities
join mhl.mhl_cities as C2 on mhl_cities.name=C2.name
join mhl.mhl_communes on mhl.mhl_cities.commune_ID=mhl_communes.id
join mhl.mhl_communes as G2 on C2.commune_ID=G2.id
where mhl.mhl_cities.id < C2.id
order by mhl.mhl_cities.name;