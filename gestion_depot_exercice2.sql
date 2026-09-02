
USE gestion_depot;

CREATE TABLE gd_emplacement(
em_id_emplacement INT AUTO_INCREMENT PRIMARY KEY,
em_zone VARCHAR(10),
em_allee VARCHAR(10),
em_travee VARCHAR(10),
em_niveau INT,
em_capacite_maximale INT
) ENGINE = InnoDB;


CREATE TABLE gd_stocker(
st_id_emplacement INT,
st_id_article INT,
quantite INT,
PRIMARY KEY(st_id_emplacement, st_id_article),
FOREIGN KEY(st_id_emplacement) REFERENCES gd_emplacement(em_id_emplacement),
FOREIGN KEY(st_id_article) REFERENCES gd_article(ar_id_article)
) ENGINE = InnoDB;