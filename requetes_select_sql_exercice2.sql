1.
SELECT count(cocl_id_commande) AS nombre_commandes, cl_nom_client
FROM gd_commande_client JOIN gd_client
ON cocl_id_client = cl_id_client
GROUP BY cl_nom_client;

2.
SELECT ar_libelle, lccl_quantite_commandee, lccl_prix_vente
FROM gd_article JOIN gd_ligne_commande_client
ON ar_id_article = lccl_id_article
WHERE lccl_id_commande = 1

3.
SELECT re_date_reception, fo_nom_entreprise
FROM gd_fournisseur JOIN gd_reception
ON fo_id_fournisseur = re_id_fournisseur

4.
SELECT ar_reference, ar_libelle, co_id_emplacement, st_quantite
FROM gd_stock 
JOIN gd_article ON st_id_article = ar_id_article 
JOIN gd_contenant ON st_id_contenant = co_id_contenant;

4 bis
SELECT ar_reference, ar_libelle, st_quantite,
CONCAT(em_zone, '-', em_allee, '-', em_travee) AS emplacement
FROM gd_stock 
JOIN gd_article ON st_id_article = ar_id_article 
JOIN gd_contenant ON st_id_contenant = co_id_contenant
JOIN gd_emplacement ON co_id_emplacement = em_id_emplacement;


