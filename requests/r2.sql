/*Afficher toutes les depenses relatives à une voiture donnée */

select depense_maintenance from voiture v, maintenance m, faire_maintenance f 
where v.id_voiture=f.id_voiture and m.id_maintenance=f.id_maintenance
and v.id_voiture=1;