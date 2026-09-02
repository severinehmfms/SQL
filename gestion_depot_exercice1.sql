CREATE DATABASE gestion_entrepot
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE gestion_entrepot;

CREATE TABLE article(
ar_id_article INT AUTO_INCREMENT PRIMARY KEY,
ar_reference VARCHAR(30),
ar_gencod VARCHAR(30),
ar_libelle VARCHAR(30),
ar_prix_unitaire DECIMAL(10,2),
ar_seuil_alerte SMALLINT
) ENGINE = InnoDB;

CREATE TABLE fournisseur(
fo_id_fournisseur INT AUTO_INCREMENT PRIMARY KEY,
fo_nom_entreprise VARCHAR(30),
fo_contact VARCHAR(30),
fo_adresse VARCHAR(100),
fo_code_postal VARCHAR(5)
) ENGINE = InnoDB;

CREATE TABLE fournir(
fr_id_article INT,
fr_id_fournisseur INT,
fr_prix_achat DECIMAL(10,2),
PRIMARY KEY(fr_id_article, fr_id_fournisseur),
FOREIGN KEY(fr_id_article) REFERENCES article(ar_id_article),
FOREIGN KEY(fr_id_fournisseur) REFERENCES fournisseur(fo_id_fournisseur)
) ENGINE = InnoDB;


