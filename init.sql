DROP TABLE IF EXISTS `meta_database`;

CREATE TABLE `meta_database` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `latest_version` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `meta_database` WRITE;
/*!40000 ALTER TABLE `meta_database` DISABLE KEYS */;

INSERT INTO `meta_database` (`id`, `latest_version`)
VALUES
	(1,1);

/*!40000 ALTER TABLE `meta_database` ENABLE KEYS */;
UNLOCK TABLES;
