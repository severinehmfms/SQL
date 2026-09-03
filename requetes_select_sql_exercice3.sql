
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




