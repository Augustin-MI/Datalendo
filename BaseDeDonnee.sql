CREATE DATABASE DataLendo;
USE DataLendo;

-- NETTOYAGE (On efface tout pour éviter les conflits)
DROP TABLE IF EXISTS paiements CASCADE;
DROP TABLE IF EXISTS ventes CASCADE;
DROP TABLE IF EXISTS produits CASCADE;
DROP TABLE IF EXISTS clients CASCADE;

-- 1. TABLE CLIENTS
CREATE TABLE clients (
    id_client INT PRIMARY KEY,
    nom TEXT,
    pays TEXT,
    ville TEXT,
    date_inscription DATE,
    canal_acquisition TEXT
);
select * from clients;

-- 2. TABLE PRODUITS
CREATE TABLE produits (
    id_produit INT PRIMARY KEY,
    nom_produit TEXT,
    categorie TEXT,
    prix NUMERIC,
    marge NUMERIC,
    stock_initial INT
);
select * from produits;

-- 3. TABLE VENTES
CREATE TABLE ventes (
    id_vente INT,
    id_client INT,
    id_produit INT,
    date_vente DATE,
    quantite INT, 
    montant_total NUMERIC,
    channel TEXT
);
select * from ventes;

-- 4. TABLE PAIEMENTS
CREATE TABLE paiements (
    id_paiement INT PRIMARY KEY,
    id_vente INT,
    methode TEXT,
    statut TEXT
);

select * from paiements;

