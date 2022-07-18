/*Afficher TOUS les détails sur les paiements d'un client*/
select nom, date_payement, payement_complet, montant_paye, type_payement *
from client c, payement p, type_payement t, reservation r 
where c.id_client=r.id_reservation and r.id_reservation=p.id_reservation and p.id_type_payement=t.id_type_payement;