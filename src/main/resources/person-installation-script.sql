CREATE TABLE `PERSON` (
    `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(50) NOT NULL DEFAULT '',
    `email` varchar(50) NOT NULL DEFAULT'',
    `reason` varchar(250) NULL DEFAULT'',
    `points` int(11) NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;