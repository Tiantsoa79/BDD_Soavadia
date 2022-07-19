/* les clients qui ont participe a un voyage */

select nom from client c, reservation r, voyage v where r.id_voyage=v.id_voyage and c.id_client=r.id_client and v.id_voyage='x';