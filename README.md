# 🚀 DataLendo - Analyse Retail Stratégique Avancée

**DataLendo** est un projet complet d’**analyse de données retail** qui consiste à transformer **15 000 transactions** brutes en une base de données propre, exploitable et riche en insights stratégiques pour optimiser la performance commerciale d’une entreprise.

## 🎯 Contexte et Objectifs du Projet

- **Problématique** : Une entreprise retail dispose d’un volume important de données transactionnelles non structurées et mal organisées.
- **Mission** : Nettoyer, structurer, analyser et valoriser ces données pour prendre des décisions data-driven.

### Objectifs principaux :
- Nettoyer et préparer les données brutes
- Concevoir un schéma de base de données relationnelle
- Peupler la base avec les 15 000 transactions
- Réaliser des analyses SQL avancées (KPIs, tendances, segmentation)
- Produire un rapport professionnel avec recommandations actionnables
- Préparer les données pour des outils de Business Intelligence (Power BI, Tableau, etc.)

## 🛠️ Solutions Mises en Oeuvre

### 1. Création et Peuplement de la Base de Données
- Conception d’un **schéma relationnel** optimisé (tables clients, produits, transactions, catégories, etc.)
- Scripts SQL complets pour :
  - Création des tables avec contraintes (clés primaires, étrangères, index)
  - Nettoyage des données (gestion des doublons, valeurs manquantes, formats)
  - Insertion massive des **15 000 transactions**

**Fichier principal** : `BaseDeDonnee.sql`

### 2. Analyses Avancées SQL
- Calcul de **KPIs business** essentiels :
  - Chiffre d’affaires total et par période
  - Panier moyen
  - Produits et catégories les plus rentables
  - Performance par région / client
- Analyses temporelles (évolution mensuelle, saisonnalité)
- Segmentation clients et produits
- Requêtes avancées utilisant :
  - `JOIN`, `GROUP BY`
  - **CTE** (Common Table Expressions)
  - **Window Functions** (RANK, ROW_NUMBER, etc.)
  - Sous-requêtes et agrégations complexes

**Fichier principal** : `Requetes_De_Resolutions.sql`

### 3. Documentation et Restitution
- Rapport final détaillé avec visualisations et recommandations stratégiques
- Cahier des charges et consignes du projet

## 📁 Structure du Projet

| Fichier / Dossier              | Description |
|-------------------------------|-------------|
| `donnees/`                    | Données brutes et versions nettoyées |
| `BaseDeDonnee.sql`            | Script complet de création + peuplement de la BDD |
| `Requetes_De_Resolutions.sql` | Ensemble des requêtes analytiques avancées |
| `Consigne_Et_Analyse.pdf`     | Cahier des charges du projet |
| `RapportLendo.pdf`            | Rapport final d’analyse et recommandations |

## 🔗 Liens Rapides (comme des boutons)

[![Voir le Script de Base de Données](https://img.shields.io/badge/-BaseDeDonnee.sql-447CFF?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Augustin-MI/Datalendo/blob/main/BaseDeDonnee.sql)

[![Voir les Requêtes Analytiques](https://img.shields.io/badge/-Requetes_De_Resolutions.sql-447CFF?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Augustin-MI/Datalendo/blob/main/Requetes_De_Resolutions.sql)

[![Lire le Rapport Final](https://img.shields.io/badge/-RapportLendo.pdf-FF6B6B?style=for-the-badge&logo=adobeacrobatreader&logoColor=white)](https://github.com/Augustin-MI/Datalendo/blob/main/RapportLendo.pdf)

[![Consignes du Projet](https://img.shields.io/badge/-Consigne_Et_Analyse.pdf-4CAF50?style=for-the-badge&logo=adobeacrobatreader&logoColor=white)](https://github.com/Augustin-MI/Datalendo/blob/main/Consigne_Et_Analyse.pdf)

## 📊 Principaux Résultats Obtenus
- Transformation réussie de **15 000 lignes** de données brutes en une base relationnelle propre et performante
- Identification claire des **produits phares**, catégories rentables et périodes de pic d’activité
- Segmentation clients permettant de cibler les actions marketing
- Recommandations concrètes : optimisation des stocks, stratégie promotionnelle, focus sur les meilleurs canaux

## 🛠️ Technologies Utilisées
- **SQL** (compatible PostgreSQL / MySQL)
- Analyse de données avancée
- Préparation pour **Power BI** / Excel / Tableau

---

**Auteur** : Augustin MI (Koffivi Augustin)  
**Date de réalisation** : Février 2026  
**Domaine** : Data Analysis • SQL • Retail Analytics • Business Intelligence

---

*Ce projet fait partie de mon portfolio Data Science. Voir aussi [DataLab](https://github.com/Augustin-MI/DataLab) pour mes attestations de formation.*
