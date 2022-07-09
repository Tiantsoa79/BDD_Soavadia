CREATE DATABASE soavadia; 

\c soavadia;

CREATE TABLE receptionniste(
    id_receptionniste serial primary key, 
    nom_receptionniste varchar(100) not null,
    prenom_receptionniste varchar(100),
    adresse_receptionniste text, 
    cin_receptionniste varchar(15) unique,
    telephone_receptionniste varchar(15) not null,
    salaire_receptionniste int check(salaire_receptionniste >= 0)
);

CREATE TABLE chauffeur(
    id_chauffeur serial primary key, 
    nom_chauffeur varchar(100) not null,
    prenom_chauffeur varchar(100),
    adresse_chauffeur text, 
    cin_chauffeur varchar(15) unique,
    telephone_chauffeur varchar(15) not null,
    salaire_chauffeur int check(salaire_chauffeur >= 0)
);

CREATE TABLE type_payement(
    id_type_payement serial primary key, 
    type_payement varchar(50)
);

CREATE TABLE client(
    id_client serial primary key,
    nom varchar(100) not null,
    prenom varchar(100),
    telephone varchar(15),
    cin varchar(15) unique
);

CREATE TABLE incident(
    id_incident serial primary key,
    description_incident text,
    depense_incident float
);

CREATE TABLE ville(
    id_ville serial primary key,
    nom_ville varchar(50) not null
);

CREATE TABLE trajet(
    id_trajet serial primary key,
    frais_de_base int not null, 
    prix_carburant int, -- this is questionnable
    id_ville_depart int references ville(id_ville) not null,
    id_ville_arrivee int references ville(id_ville) not null
);

CREATE TABLE saison(
    id_saison serial primary key,
    evenement varchar(50),
    coef_saison float check(coef_saison > 0)
);

CREATE TABLE offre(
    id_offre serial primary key,
    nombre_place int check(nombre_place > 0),
    coef_offre float check(coef_offre > 0)
);

CREATE TABLE maintenance(
    id_maintenance serial primary key,
    description text not null,
    depense_maintenance int check(depense_maintenance >= 0),
    date_maintenance date not null
);

CREATE TABLE voiture(
    id_voiture serial primary key,
    immatriculation varchar(8) not null unique,
    fonctionnel boolean,
    id_offre int references offre(id_offre)
);

CREATE TABLE voyage(
    id_voyage serial primary key, 
    date_depart date not null,
    horaire_depart time not null, 
    depense_regulier float,
    id_incident int references incident(id_incident),
    id_trajet int references trajet(id_trajet) not null,
    id_saison int references saison(id_saison),
    id_voiture int references voiture(id_voiture),
    id_chauffeur int references chauffeur(id_chauffeur)
);

CREATE TABLE reservation(
    id_reservation serial primary key,
    date_reservation date not null,
    en_ligne boolean,
    numero_place int,
    id_client int references client(id_client) not null,
    id_voyage int references voyage(id_voyage) not null,
    id_receptionniste int references receptionniste(id_receptionniste)
);

CREATE TABLE payement(
    id_payement serial primary key,
    date_payement date not null,
    payement_complet boolean, 
    montant_paye int check(montant_paye >= 0),
    id_type_payement int references type_payement(id_type_payement),
    id_reservation int references reservation(id_reservation)
);

CREATE TABLE faire_maintenance(
    id_voiture int references voiture(id_voiture) not null,
    id_maintenance int references maintenance(id_maintenance) not null
);