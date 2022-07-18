/*afficher les details sur les voitures fonctionnels */

select * from voiture where fonctionnel=true;

/*Afficher toutes les depenses relatives à une voiture donnée */

select depense_maintenance from voiture v, maintenance m, faire_maintenance f 
where v.id_voiture=f.id_voiture and m.id_maintenance=f.id_maintenance
and v.id_voiture=1;

/* Afficher les détails des reservations qui ne sont pas encore payées  */
select r.id_reservation, date_reservation, en_ligne, numero_place, nom, id_voyage, e.nom_receptionniste
from reservation r,client c,receptionniste e, payement p 
where p.payement_complet=false and p.id_reservation=r.id_reservation 
and c.id_client=r.id_client and e.id_receptionniste=r.id_receptionniste;

 /* Liste des passagers qui sont partis de jour / de nuit à une date donnée*/

select c.id_client, nom, prenom, telephone, cin 
from client c, reservation r, voyage v
where date_depart='xxxx-xx-xx' and v.id_voyage=r.id_voyage and c.id_client=r.id_client;

/* Afficher les listes des voyages à une horaire précise, à une date précise */

select id_voyage from voyage where date_depart='xxxx-xx-xx' 
or horaire_depart='xx:xx:xx';

/* Afficher TOUS les détails d'un voyage (y compris le prix avec OU sans coefficient) */

select date_depart, horaire_depart, depense_regulier, description_incident,
frais_de_base, nom_ville, evenement, immatriculation, nom_chauffeur
from voyage v, incident i, ville l, saison s, trajet t, voiture o, chauffeur c 
where v.id_voyage=1 and v.id_incident=i.id_incident and v.id_trajet=t.id_trajet
and v.id_saison=s.id_saison and v.id_voiture=o.id_voiture and v.id_chauffeur=c.id_chauffeur 
and id_ville=id_ville_depart;

/*Afficher TOUS les détails sur les paiements d'un client*/
select nom, date_payement, payement_complet, montant_paye, type_payement *
from client c, payement p, type_payement t, reservation r 
where c.id_client=r.id_reservation and r.id_reservation=p.id_reservation and p.id_type_payement=t.id_type_payement;

/* liste des client qui n'ont pas payer la totalite des frais */
select nom from client c, reservation r, payement p 
where c.id_client=r.id_client and p.id_reservation=r.id_reservation 
and payement_complet=false;

/* les clients qui ont participe a un voyage */

select nom from client c, reservation r, voyage v where r.id_voyage=v.id_voyage and c.id_client=r.id_client and v.id_voyage='x';



