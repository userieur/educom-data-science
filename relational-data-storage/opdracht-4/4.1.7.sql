select mhl.mhl_cities.name AS stad, C2.name AS stad2, mhl.mhl_cities.id, C2.id AS id_2, mhl.mhl_cities.commune_ID AS gemeente_id, C2.commune_ID AS gemeente2_id
from mhl.mhl_cities
join mhl.mhl_cities AS C2 on mhl.mhl_cities.name=C2.name
where mhl.mhl_cities.id < C2.id
order by mhl.mhl_cities.name;