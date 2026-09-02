
USE gestion_depot;

DROP TABLE IF EXISTS `gd_contenant`;
CREATE TABLE IF NOT EXISTS `gd_contenant` (
  `cont_id_contenant` int NOT NULL AUTO_INCREMENT,
  `cont_type_contenant` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cont_code_barres` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`cont_id_contenant`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `gd_stock`;
CREATE TABLE IF NOT EXISTS `gd_stock` (
  `st_id_article` int NOT NULL,
  `st_id_emplacement` int NOT NULL,
  `st_id_contenant` int NOT NULL,
  `st_quantite` smallint NOT NULL,
  PRIMARY KEY (`st_id_article`,`st_id_emplacement`),
  KEY `st_id_emplacement` (`st_id_emplacement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Contraintes pour la table `gd_stock`
--
ALTER TABLE `gd_stock`
  ADD CONSTRAINT `fk_stock_article` FOREIGN KEY (`st_id_article`) REFERENCES `gd_article` (`ar_id_article`),
  ADD CONSTRAINT `fk_stock_contenant` FOREIGN KEY (`st_id_contenant`) REFERENCES `gd_contenant` (`cont_id_contenant`),
  ADD CONSTRAINT `fk_stock_emplacement` FOREIGN KEY (`st_id_emplacement`) REFERENCES `gd_emplacement` (`em_id_emplacement`);
COMMIT;
