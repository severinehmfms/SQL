
USE gestion_depot;

CREATE TABLE gd_commande(
com_id_commande INT AUTO_INCREMENT PRIMARY KEY,
com_date_de_commande DATETIME,
com_statut VARCHAR(50),
FOREIGN KEY(com_id_client) REFERENCES CLIENT(cli_id_client)
) ENGINE = InnoDB;

CREATE TABLE gd_client(
cli_id_client INT AUTO_INCREMENT PRIMARY KEY,
cli_nom VARCHAR(50),
cli_adresse VARCHAR(50)
) ENGINE = InnoDB;

CREATE TABLE gd_commande_article(
ca_id_commande INT,
ca_id_article INT,
quantite_commandee INT,
prix_unitaire_vente DECIMAL(10,2),
PRIMARY KEY(ca_id_commande, ca_id_article),
FOREIGN KEY(ca_id_commande) REFERENCES gd_commande(com_id_commande),
FOREIGN KEY(ca_id_article) REFERENCES gd_article(ar_id_article)
) ENGINE = InnoDB;