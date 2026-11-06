-- Projet Tifosi - Les 10 requetes SQL

-- 1. Focaccias par ordre alphabetique
SELECT nom_focaccia FROM focaccia ORDER BY nom_focaccia ASC;

-- 2. Nombre total d'ingredients
SELECT COUNT(*) AS nombre_ingredients FROM ingredient;

-- 3. Prix moyen des focaccias
SELECT ROUND(AVG(prix), 2) AS prix_moyen FROM focaccia;

-- 4. Boissons et leurs marques
SELECT b.nom_boisson, m.nom_marque FROM boisson b JOIN marque m ON b.id_marque = m.id_marque ORDER BY b.nom_boisson ASC;

-- 5. Ingredients de la Raclaccia
SELECT i.nom_ingredient FROM ingredient i JOIN comprend c ON i.id_ingredient = c.id_ingredient JOIN focaccia f ON c.id_focaccia = f.id_focaccia WHERE f.nom_focaccia = 'Raclaccia' ORDER BY i.nom_ingredient ASC;

-- 6. Nombre d'ingredients par focaccia
SELECT f.nom_focaccia, COUNT(c.id_ingredient) AS nombre_ingredients FROM focaccia f JOIN comprend c ON f.id_focaccia = c.id_focaccia GROUP BY f.id_focaccia, f.nom_focaccia ORDER BY f.nom_focaccia ASC;

-- 7. Focaccia avec le plus d'ingredients
SELECT f.nom_focaccia, COUNT(c.id_ingredient) AS nombre_ingredients FROM focaccia f JOIN comprend c ON f.id_focaccia = c.id_focaccia GROUP BY f.id_focaccia, f.nom_focaccia ORDER BY nombre_ingredients DESC LIMIT 1;

-- 8. Focaccias contenant de l'ail
SELECT f.nom_focaccia FROM focaccia f JOIN comprend c ON f.id_focaccia = c.id_focaccia JOIN ingredient i ON c.id_ingredient = i.id_ingredient WHERE i.nom_ingredient = 'Ail' ORDER BY f.nom_focaccia ASC;

-- 9. Ingredients inutilises
SELECT i.nom_ingredient FROM ingredient i LEFT JOIN comprend c ON i.id_ingredient = c.id_ingredient WHERE c.id_ingredient IS NULL ORDER BY i.nom_ingredient ASC;

-- 10. Focaccias sans champignons
SELECT f.nom_focaccia FROM focaccia f WHERE NOT EXISTS (SELECT 1 FROM comprend c JOIN ingredient i ON c.id_ingredient = i.id_ingredient WHERE c.id_focaccia = f.id_focaccia AND i.nom_ingredient = 'Champignon') ORDER BY f.nom_focaccia ASC;
