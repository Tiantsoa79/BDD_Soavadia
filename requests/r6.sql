/* Afficher TOUS les détails d'un voyage (y compris le prix avec OU sans coefficient) */

select date_depart, horaire_depart, depense_regulier, description_incident,
frais_de_base, nom_ville, evenement, immatriculation, nom_chauffeur
from voyage v, incident i, ville l, saison s, trajet t, voiture o, chauffeur c 
where v.id_voyage=1 and v.id_incident=i.id_incident and v.id_trajet=t.id_trajet
and v.id_saison=s.id_saison and v.id_voiture=o.id_voiture and v.id_chauffeur=c.id_chauffeur 
and id_ville=id_ville_depart;