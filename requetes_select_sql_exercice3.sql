
--1.
SELECT lccl_id_ligne, ar_libelle, ar_reference, lccl_quantite_commandee, 
lccl_prix_vente, (lccl_quantite_commandee * lccl_prix_vente) as montant_total
FROM gd_ligne_commande_client JOIN gd_article
ON lccl_id_article = ar_id_article
WHERE lccl_id_commande = 1

--2.
SELECT cl_nom_client, COUNT(cocl_id_commande)
FROM gd_commande_client JOIN gd_client
ON cocl_id_client = cl_id_client
GROUP BY cl_nom_client 

-- affiche aussi les clients qui n'ont rien commandé : (le LEFT JOIN fait la différence!)
SELECT cl_nom_client, count(cocl_id_commande) AS nombre_commandes
FROM gd_client LEFT JOIN gd_commande_client 
ON cocl_id_client = cl_id_client
GROUP BY cl_id_client;

--3.
SELECT ar_libelle, SUM(lr_quantite_recue) AS quantite_totale_recue
FROM gd_ligne_reception JOIN gd_article
ON lr_id_article = ar_id_article
GROUP BY ar_libelle

--4.
SELECT ar_libelle, st_quantite, ar_seuil_alerte
FROM gd_stock JOIN gd_article
ON st_id_article = ar_id_article
WHERE (st_quantite <= ar_seuil_alerte)

--5. Requête récursive
--sans récursif
SELECT `co_id_contenant_parent` as niveau, `ar_reference`,  `ar_libelle`, `co_type`, `co_code_barres`, `st_quantite`, `em_zone`, `em_allee`, `em_travee`, `em_niveau`
FROM gd_stock 
JOIN gd_article ON st_id_article = ar_id_article 
JOIN gd_contenant ON st_id_contenant = co_id_contenant
JOIN gd_emplacement ON co_id_emplacement = em_id_emplacement
WHERE ar_id_article=1;

--avec récursif (ne fonctionne pas encore)
WITH RECURSIVE container_hierarchy AS (
   -- Étape de base 
    SELECT co_id_contenant, co_id_contenant_parent, `ar_reference`,  `ar_libelle`, `co_type`, `co_code_barres`, `st_quantite`, 
	`em_zone`, `em_allee`, `em_travee`, `em_niveau`
	FROM gd_stock 
	JOIN gd_article ON st_id_article = ar_id_article 
	JOIN gd_contenant ON st_id_contenant = co_id_contenant
	JOIN gd_emplacement ON co_id_emplacement = em_id_emplacement
	WHERE ar_id_article=1
 
   UNION ALL
 
   -- Étape récursive : on remonte au contenant parent (ex: du colis vers le bac, puis du bac vers la palette)
  SELECT  co_id_contenant, co_id_contenant_parent, `ar_reference`,  `ar_libelle`, `co_type`, `co_code_barres`, `st_quantite`, `em_zone`, `em_allee`, `em_travee`, `em_niveau`
    FROM container_hierarchy
    JOIN gd_stock ON co_id_contenant = co_id_contenant_parent
	JOIN gd_article ON st_id_article = ar_id_article 
	JOIN gd_contenant ON st_id_contenant = co_id_contenant
	JOIN gd_emplacement ON co_id_emplacement = em_id_emplacement        
)

SELECT *
FROM container_hierarchy;
