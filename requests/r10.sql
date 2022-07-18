/*afficher tout les clients qui ont payer en lignes*/
select * from client INNER JOIN reservation ON en_ligne= 't';