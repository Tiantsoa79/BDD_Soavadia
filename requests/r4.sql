/* Liste des passagers qui sont partis de jour / de nuit à une date donnée*/

select c.id_client, nom, prenom, telephone, cin 
from client c, reservation r, voyage v
where date_depart='xxxx-xx-xx' and v.id_voyage=r.id_voyage and c.id_client=r.id_client;