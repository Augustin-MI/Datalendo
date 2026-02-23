--PARTIE 1: EXPLORATION DES DONNEES

-- Etape 1: Compter les lignes ---------------------------

--Compter le nombre de clients: 5000
SELECT 
	COUNT(*) AS NB_TOTAL_CLIENTS
FROM
	clients;

--Compter le nombre de ventes: 15000
SELECT 
	COUNT(*) AS NB_TOTAL_VENTES
FROM
	ventes;

--Compter le nombre de produits: 200
SELECT 
	COUNT(*) AS NB_TOTAL_PRODUITS
FROM
	produits;

--Compter le nombre de paiements: 15000
SELECT 
	COUNT(*) AS NB_TOTAL_PAIEMENTS
FROM
	paiements;


--Etape 2:  exploration des donnees ---------------------------

--Affichage de tous les clients
SELECT * 
FROM
	clients
LIMIT 5;

--Affichage de tous les paiements
SELECT * 
FROM
	paiements
LIMIT 5;

--Affichage de tous les produits
SELECT * 
FROM
	produits
LIMIT 5;

--Affichage de tous les ventes
SELECT * 
FROM
	ventes
LIMIT 5;


--Etape 3: Verifier les colonnes importantes
SELECT DISTINCT
	pays
FROM
	clients;

--Verifer les cathegories de produits
SELECT DISTINCT
	categorie
FROM
	produits;

--Verifier le methode de paiement
SELECT DISTINCT
	methode,
	statut
FROM
	paiements;


--Etape 4: statistiques simple

--montant total de vente: 27231220
SELECT 
	SUM(montant_total) AS chiffre_affaire_total
FROM
	ventes;

--moyenne du montant de vente: 1815.41
SELECT 
	ROUND(AVG(montant_total),2) AS panier_moyenne
FROM
	ventes;

--Ventes maximal: 7305
SELECT 
	MAX(montant_total) AS vente_max
FROM
	ventes;

--Ventes minimal: 22
SELECT 
	MIN(montant_total) AS vente_min
FROM
	ventes;


--PARTIE 2: NETTOYAGE DES DONNEES

--Etape 1: Filtrer les paiement reussi
--Garder uniquement les ventes qui ont des paiements reussis
SELECT v.*
FROM
	ventes v
JOIN
	paiements p ON v.id_client = p.id_vente
WHERE
	p.statut = 'Success';

--Etape 2: verifier les doublons

--verifier les doublons dans le ventes
SELECT
	id_vente,
	COUNT(*) AS nombre_occurences
FROM
	ventes
GROUP BY
	id_vente
HAVING 
	COUNT(*) > 1;

--Etape 3: Verifier les valeur null ou maquantes
-- verifier les clients sans pays
SELECT *
FROM
	clients
WHERE 
	pays IS NULL;

--Etape 4: preparer les colonne importantes

--Totla ventes par pays
SELECT
	c.pays,
	COUNT(v.id_vente) AS nb_ventes
FROM
	ventes v
JOIN
	clients c ON v.id_client = c.id_client
GROUP BY
	c.pays
ORDER BY nb_ventes DESC;
	

--PARTIE 5: KPI: QUESTION BUSSINESS

--Etape 1: chiffre d'affaire total : 23152245
SELECT
	SUM(v.montant_total) AS chiffre_affaire_total
FROM
	ventes v
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success';

--Etape 2 chiffre d'affaire par mois
SELECT
	EXTRACT('month' FROM v.date_vente) AS mois,
	SUM(v.montant_total) AS chiffre_affaire
FROM
	ventes v
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY 
	mois
ORDER BY
	mois;

--Etape 3: chiffre d'affaire par jour de la semaine
SELECT
	TO_CHAR(v.date_vente, 'Day') AS jour,
	SUM(v.montant_total) AS chiffre_affaire
FROM
	ventes v
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY 
	jour
ORDER BY
	chiffre_affaire DESC;

--Etape 4: methode de paiement et le chiffre d'affaire
SELECT
	p.methode,
	COUNT(v.id_vente) AS nb_vente,
	SUM(v.montant_total) AS chiffre_affaires
FROM
	ventes v
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE 
	p.statut = 'Success'
GROUP BY
	p.methode
ORDER BY
	chiffre_affaires DESC;



-- PARTIE 6: Analyse Produits: best sellers, top revenu, panier moyen, produits faible

--Etapes 1: produit le plus vendu en volume
SELECT
	pr.nom_produit,
	SUM(v.quantite) AS total_vendu
FROM
	ventes v
JOIN
	produits pr ON v.id_produit = pr.id_produit
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	pr.nom_produit
ORDER BY
	total_vendu DESC
LIMIT 10;

--panier moyen par produit
SELECT
	pr.nom_produit,
	ROUND(AVG(v.montant_total),2) AS panier_moyen
FROM
	ventes v
JOIN
	produits pr ON v.id_produit = pr.id_produit
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	pr.nom_produit
ORDER BY
	panier_moyen DESC
LIMIT 10;

--produit avec faible vente
SELECT
	pr.nom_produit,
	SUM(v.quantite) AS total_vendu
FROM
	ventes v
JOIN
	produits pr ON v.id_produit = pr.id_produit
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	pr.nom_produit
ORDER BY
	total_vendu ASC
LIMIT 10;


--PARTIE 7: ANALYSE CLIENTS

--Etape 1: Chiffre d'affaire par client
SELECT
	c.nom,
	SUM(v.montant_total) AS chiffre_affaire_client
FROM
	ventes v
JOIN 
	clients c ON v.id_client = c.id_client
JOIN 
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	c.nom
ORDER BY
	chiffre_affaire_client DESC
LIMIT 10;

--Etape 2: nombre de vente par ville
SELECT
	c.ville,
	COUNT(v.id_vente) AS nb_vente,
	SUM(v.montant_total) AS chiffre_affaire_ville
FROM
	ventes v
JOIN 
	clients c ON v.id_client = c.id_client
JOIN 
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	c.ville
ORDER BY
	chiffre_affaire_ville DESC
LIMIT 10;

--Etape 4: RFM(Récence, Fréquence, Montant) simplifié

-- Etape 1 : R – Récence (clients les plus récents)
-- Clients les plus récents
SELECT
	c.nom,
	MAX(v.date_vente) AS dernier_achat
FROM
	ventes v
JOIN
	clients c ON v.id_client = c.id_client
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE
	p.statut = 'Success'
GROUP BY
	c.nom
ORDER BY
	dernier_achat DESC
LIMIT 10;

-- Etape 2 : F – Fréquence (clients qui achètent le plus souvent)
-- Clients les plus fréquents
SELECT
	c.nom,
	COUNT(v.id_vente) AS nb_achat
FROM
	ventes v
JOIN
	clients c ON v.id_client = c.id_client
JOIN
	paiements p ON v.id_vente = p.id_vente
WHERE 
	p.statut = 'Success'
GROUP BY
	c.nom
ORDER BY
	nb_achat DESC
LIMIT 10;

-- Etape  3 : M – Montant (clients qui dépensent le plus)
-- Clients qui dépensent le plus
SELECT 
	c.nom, SUM(v.montant_total) AS total_depense
FROM 
	ventes v
JOIN 
	clients c ON v.id_client = c.id_client
JOIN 
	paiements p ON v.id_vente = p.id_vente
WHERE 
	p.statut = 'Success'
GROUP BY 
	c.nom
ORDER BY 
	total_depense DESC
LIMIT 10;


--BUSSINESS ET STRATEGIES--

--1. Analyse de la Rentabilité (Marge par Catégorie)
--Objectif : Identifier quelles catégories de produits génèrent réellement du profit,
--et non seulement du chiffre d'affaires.
SELECT 
    p.categorie,
    SUM(v.quantite * p.marge) AS profit_total,
    ROUND(SUM(v.quantite * p.marge) / SUM(v.montant_total) * 100, 2) AS taux_de_marge_pct
FROM 
    ventes v
JOIN 
    produits p ON v.id_produit = p.id_produit
JOIN 
    paiements pay ON v.id_vente = pay.id_vente
WHERE 
    pay.statut = 'Success'
GROUP BY 
    p.categorie
ORDER BY 
    profit_total DESC;


--2. Analyse du Tunnel de Conversion (Santé des Paiements)
--Objectif : Détecter les méthodes de paiement défaillantes qui causent des pertes de ventes.
SELECT 
    methode,
    COUNT(*) AS total_tentatives,
    SUM(CASE WHEN statut = 'Success' THEN 1 ELSE 0 END) AS nb_succes,
    ROUND(SUM(CASE WHEN statut = 'Success' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS taux_succes_pct
FROM 
    paiements
GROUP BY 
    methode
ORDER BY 
    taux_succes_pct DESC;


--3. Analyse de la Rétention (Fidélité réelle)
--Objectif : Segmenter les clients selon leur habitude d'achat pour adapter la stratégie marketing.
WITH stats_clients AS (
    SELECT 
		id_client, COUNT(v.id_vente) as nb_achats
    FROM 
		ventes v
    JOIN 
		paiements p ON v.id_vente = p.id_vente
    WHERE 
		p.statut = 'Success'
    GROUP BY 
		id_client
)
SELECT 
    CASE 
        WHEN nb_achats = 1 THEN 'Nouveau / One-shot'
        WHEN nb_achats BETWEEN 2 AND 4 THEN 'Client Fidèle'
        ELSE 'Ambassadeur / VIP'
    END AS segment_fidelite,
    COUNT(*) AS nombre_de_clients,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM stats_clients), 2) AS part_pct
FROM 
    stats_clients
GROUP BY 
    segment_fidelite;


--4. Analyse du Stock Critique (Risque de rupture)
--Objectif : Anticiper le besoin de réapprovisionnement pour les produits qui se vendent le mieux.
SELECT 
    p.nom_produit,
    p.stock_initial,
    SUM(v.quantite) AS total_vendu,
    (p.stock_initial - SUM(v.quantite)) AS stock_restant,
    ROUND(SUM(v.quantite) * 100.0 / p.stock_initial, 2) AS taux_ecoulement_pct
FROM 
    produits p
JOIN 
    ventes v ON p.id_produit = v.id_produit
GROUP BY 
    p.id_produit, p.nom_produit, p.stock_initial
HAVING 
    SUM(v.quantite) > (p.stock_initial * 0.7) -- Alerte si plus de 70% du stock est vendu
ORDER BY 
    taux_ecoulement_pct DESC;

--5. Analyse de l'Efficacité des Canaux d'Acquisition
--Objectif : Savoir quel canal (Ads, Referral, Organic) apporte les clients les plus dépensiers.
SELECT 
    c.canal_acquisition,
    COUNT(DISTINCT c.id_client) AS nb_clients,
    SUM(v.montant_total) AS CA_total,
    ROUND(SUM(v.montant_total) / COUNT(DISTINCT c.id_client), 2) AS valeur_vie_client_moyenne
FROM 
    clients c
JOIN 
    ventes v ON c.id_client = v.id_client
JOIN 
    paiements p ON v.id_vente = p.id_vente
WHERE 
    p.statut = 'Success'
GROUP BY 
    c.canal_acquisition
ORDER BY 
    valeur_vie_client_moyenne DESC;