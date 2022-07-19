/* Afficher les détails des reservations qui ne sont pas encore payées  */
select r.id_reservation, date_reservation, en_ligne, numero_place, nom, id_voyage, e.nom_receptionniste
from reservation r,client c,receptionniste e, payement p 
where p.payement_complet=false and p.id_reservation=r.id_reservation 
and c.id_client=r.id_client and e.id_receptionniste=r.id_receptionniste;