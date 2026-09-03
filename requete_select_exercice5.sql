SELECT 	gd_article.ar_reference, gd_article.ar_libelle, 
		gd_emplacement.em_niveau, 
		gd_contenant.cont_type_contenant, gd_contenant.cont_code_barres, 
		gd_stock.st_quantite, 
		gd_emplacement.em_zone, gd_emplacement.em_allee, gd_emplacement.em_travee, gd_emplacement.em_niveau
FROM gd_article, gd_emplacement, gd_stock, gd_contenant
WHERE gd_stock.st_id_article = gd_article.ar_id_article
AND gd_stock.st_id_emplacement = gd_emplacement.em_id_emplacement
AND gd_stock.st_id_contenant = gd_contenant.cont_id_contenant