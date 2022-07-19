/* liste des client qui n'ont pas payer la totalite des frais */
select nom from client c, reservation r, payement p 
where c.id_client=r.id_client and p.id_reservation=r.id_reservation 
and payement_complet=false;