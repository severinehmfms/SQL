
USE gestion_depot;

CREATE TABLE gd_reception(
re_id_reception INT AUTO_INCREMENT PRIMARY KEY,
re_date_reception DATETIME,
re_id_statut INT,
re_id_fournisseur INT,
FOREIGN KEY(re_id_statut) REFERENCES gd_statut(sta_id_statut),
FOREIGN KEY(re_id_fournisseur) REFERENCES gd_fournisseur(fo_id_fournisseur)
) ENGINE = InnoDB;

CREATE TABLE gd_ligne_reception(
lr_id_ligne INT AUTO_INCREMENT PRIMARY KEY,
lr_quantite_recue INT,
lr_id_reception INT,
lr_id_article INT,
FOREIGN KEY(lr_id_reception) REFERENCES gd_reception(re_id_reception),
FOREIGN KEY(lr_id_article) REFERENCES gd_article(ar_id_article)
) ENGINE = InnoDB;



TABLE gd_statut?

