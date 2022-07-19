SELECT id_ville_depart, id_ville_arrivee
FROM trajet
INNER JOIN voyage ON date_depart=date1;