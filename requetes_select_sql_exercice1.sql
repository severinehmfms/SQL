
SELECT * FROM gd_client;

SELECT * FROM gd_article WHERE ar_prix_unitaire > 8.5;

SELECT * FROM gd_fournisseur WHERE fo_code_postal LIKE "40%";

SELECT sta_libelle FROM gd_statut, gd_reception 
WHERE re_id_reception = 1
AND re_id_statut = sta_id_statut;
=>Ancienne version, comme inner join mais façon de faire abandonnée

Correction plus actuelle : 
SELECT `sta_libelle` 
FROM `gd_statut` JOIN gd_reception ON sta_id_statut = re_id_statut 
WHERE re_id_reception = 1;

