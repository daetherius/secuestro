-- Adminer 3.6.1 MySQL dump

SET NAMES utf8;
SET foreign_key_checks = 0;
SET time_zone = 'SYSTEM';
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `albumimgs`;
CREATE TABLE `albumimgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `album_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(255) NOT NULL,
  `portada` tinyint(1) DEFAULT '0',
  `descripcion` text,
  `orden` int(10) unsigned DEFAULT '0',
  -- `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `albumimgs` (`id`, `album_id`, `src`, `portada`, `descripcion`, `orden`, `created`) VALUES
(1,	2,	'upload/img06.jpg',	1,	NULL,	1,	'2012-09-25 00:14:43'),
(2,	2,	'upload/img26.jpg',	0,	NULL,	2,	'2012-09-25 00:14:43'),
(3,	2,	'upload/img31.jpg',	0,	NULL,	3,	'2012-09-25 00:14:43'),
(4,	2,	'upload/img38.jpg',	0,	NULL,	4,	'2012-09-25 00:14:43'),
(5,	3,	'upload/img0113485502651.jpg',	1,	'<p>fish con <a href=\"google.com\">enlace</a></p>',	5,	'2012-09-25 00:17:45'),
(6,	3,	'upload/img61.jpg',	0,	'<p>sunset</p>',	6,	'2012-09-25 00:17:45'),
(7,	3,	'upload/img36.jpg',	0,	'<p>avalanche</p>',	7,	'2012-09-25 00:17:45'),
(8,	3,	'upload/img48.jpg',	0,	'<p>rails</p>',	8,	'2012-09-25 00:17:45');

-- DROP TABLE IF EXISTS `albums`;
CREATE TABLE `albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tipo` enum('album','video') NOT NULL DEFAULT 'album',
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descripcion` text,
  `url` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `comment_count` int(11) DEFAULT '0',
  `albumimg_count` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `albums` (`id`, `tipo`, `nombre`, `slug`, `descripcion`, `url`, `activo`, `comment_count`, `albumimg_count`, `created`) VALUES
(1,	'video',	'Pellentesque habitant morbi tristique senectus et netus et malesuada',	'1_pellentesque-habitant-morbi-tristique-senectus-et-netus-et-malesuada',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	'http://www.youtube.com/watch?v=Lc-vINJmhNk',	1,	0,	NULL,	'2012-09-25 00:11:10'),
(2,	'album',	'Duis lacinia, metus eget tincidunt varius',	'2_duis-lacinia-metus-eget-tincidunt-varius',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	'',	1,	0,	4,	'2012-09-25 00:14:43'),
(3,	'album',	'Mauris dictum feugiat tristique. Aliquam aliquet',	'3_mauris-dictum-feugiat-tristique-aliquam-aliquet',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	'',	1,	0,	4,	'2012-09-25 00:17:45'),
(4,	'video',	'Proin sagittis mauris sed lorem rutrum interdum',	'4_proin-sagittis-mauris-sed-lorem-rutrum-interdum',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	'http://www.youtube.com/watch?v=4ZYVogCYsdA',	1,	0,	NULL,	'2012-09-25 00:18:03');

DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `votos` int(10) unsigned NOT NULL DEFAULT '0',
  `orden` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `answers` (`id`, `poll_id`, `question_id`, `nombre`, `votos`, `orden`) VALUES
(1,	0,	7,	'Nam condimentum; mi ac sed.',	0,	2),
(17,	0,	10,	'Donec iaculis, mi id metus.',	0,	2),
(3,	0,	7,	'Nam blandit metus at metus.',	0,	0),
(4,	0,	8,	'Sed rutrum, odio a posuere.',	0,	2),
(5,	0,	8,	'Praesent faucibus volutpat.',	0,	1),
(6,	0,	8,	'Nunc adipiscing auctor sed.',	0,	0),
(19,	0,	10,	'In vitae nisl sem volutpat.',	0,	0),
(18,	0,	10,	'Praesent euismod cras amet.',	0,	1),
(10,	0,	9,	'Integer venenatis purus id.',	0,	1),
(16,	0,	9,	'Donec convallis elit metus.',	0,	0),
(20,	0,	11,	'Donec iaculis, mi id metus.',	0,	3),
(21,	0,	11,	'Morbi nec felis est! metus nunc eu nisl non erat amet.',	0,	2),
(22,	0,	11,	'Mauris interdum massa nunc.',	0,	1),
(23,	0,	11,	'Nunc eu nisl non erat amet praesent hendrerit posuere',	0,	0);

DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `src` varchar(255) NOT NULL,
  `enlace` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  `caducidad` date DEFAULT NULL,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `lft` int(10) unsigned DEFAULT NULL,
  `rght` int(10) unsigned DEFAULT NULL,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `categories` (`id`, `parent_id`, `nombre`, `slug`, `lft`, `rght`, `orden`, `created`) VALUES
(1,	NULL,	'Donec a mauris quis nullam.',	'1_donec-a-mauris-quis-nullam',	1,	2,	3,	'2012-09-21 19:20:12'),
(2,	NULL,	'Ut cursus elit a nulla sed.',	'2_ut-cursus-elit-a-nulla-sed',	3,	4,	2,	'2012-09-21 19:20:12'),
(3,	NULL,	'Pellentesque eget arcu sed.',	'3_pellentesque-eget-arcu-sed',	5,	6,	1,	'2012-09-21 19:20:12'),
(4,	NULL,	'Sed elementum, nisl nullam.',	'4_sed-elementum-nisl-nullam',	7,	8,	0,	'2012-09-21 19:20:12');

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent` varchar(255) NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `autor` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `web` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `eventimgs`;
CREATE TABLE `eventimgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(255) NOT NULL,
  `portada` tinyint(1) DEFAULT '0',
  `descripcion` text,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `eventimgs` (`id`, `event_id`, `src`, `portada`, `descripcion`, `orden`, `created`) VALUES
(1,	1,	'upload/img49.jpg',	1,	NULL,	1,	'2012-09-25 02:53:57'),
(2,	1,	'upload/img3113485596371.jpg',	0,	NULL,	2,	'2012-09-25 02:53:57'),
(3,	1,	'upload/img0213485596371.jpg',	0,	NULL,	3,	'2012-09-25 02:53:57'),
(4,	2,	'upload/img5413485596541.jpg',	1,	NULL,	4,	'2012-09-25 02:54:14'),
(5,	2,	'upload/img2513485596541.jpg',	0,	NULL,	5,	'2012-09-25 02:54:14');

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `descripcion` text,
  `activo` tinyint(1) DEFAULT '1',
  `comment_count` int(11) DEFAULT '0',
  `albumimg_count` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `events` (`id`, `nombre`, `slug`, `descripcion`, `activo`, `comment_count`, `albumimg_count`, `created`) VALUES
(1,	'Integer feugiat egestas pellentesque',	'1_integer-feugiat-egestas-pellentesque',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	0,	NULL,	'2012-09-25 02:53:57'),
(2,	'Phasellus ut enim sed lorem aliquam',	'2_phasellus-ut-enim-sed-lorem-aliquam',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	0,	NULL,	'2012-09-25 02:54:14');

DROP TABLE IF EXISTS `links`;
CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `enlace` varchar(255) NOT NULL,
  `descripcion` text,
  `activo` tinyint(1) DEFAULT '1',
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `links` (`id`, `nombre`, `enlace`, `descripcion`, `activo`, `orden`, `created`) VALUES
(1,	'Lorem ipsum dolor sit amet, consectetur',	'http://test.com/?1',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>',	1,	1,	'2012-09-24 21:52:38'),
(2,	'Morbi sit amet ante quis leo varius',	'http://test.com/?2',	'<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	2,	'2012-09-24 21:52:54'),
(3,	'Ut vitae lacus libero. Quisque vulputate malesuada',	'http://test.com/?3',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	3,	'2012-09-24 21:53:17'),
(4,	'Congue non eget tortor. Aliquam porttitor velit at tellus adipiscing facilisis.',	'http://test.com/?4',	'<p>ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>',	1,	4,	'2012-09-24 21:54:01');

DROP TABLE IF EXISTS `nodeimgs`;
CREATE TABLE `nodeimgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `node_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(255) NOT NULL,
  `portada` tinyint(1) DEFAULT '0',
  `descripcion` text,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `nodeimgs` (`id`, `node_id`, `src`, `portada`, `descripcion`, `orden`, `created`) VALUES
(1,	1,	'upload/img0213482647501.jpg',	1,	NULL,	1,	'2012-09-21 16:59:10'),
(2,	1,	'upload/img59.jpg',	0,	NULL,	2,	'2012-09-21 16:59:10'),
(3,	1,	'upload/img44.jpg',	0,	NULL,	3,	'2012-09-21 16:59:10'),
(4,	2,	'upload/img32.jpg',	1,	NULL,	4,	'2012-09-21 17:00:30'),
(5,	2,	'upload/img54.jpg',	0,	NULL,	5,	'2012-09-21 17:00:30'),
(6,	2,	'upload/img41.jpg',	0,	NULL,	6,	'2012-09-21 17:00:30'),
(7,	3,	'upload/img20.jpg',	1,	NULL,	7,	'2012-09-21 17:00:50'),
(8,	3,	'upload/img4713482648501.jpg',	0,	NULL,	8,	'2012-09-21 17:00:50'),
(9,	3,	'upload/img28.jpg',	0,	NULL,	9,	'2012-09-21 17:00:50'),
(10,	4,	'upload/img35.jpg',	1,	NULL,	10,	'2012-09-21 17:28:48'),
(11,	4,	'upload/img40.jpg',	0,	NULL,	11,	'2012-09-21 17:28:48'),
(12,	4,	'upload/img27.jpg',	0,	NULL,	12,	'2012-09-21 17:28:48');

DROP TABLE IF EXISTS `nodes`;
CREATE TABLE `nodes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `nombre` varchar(120) NOT NULL,
  `slug` varchar(120) NOT NULL,
  `externo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `enlace` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `lft` int(10) unsigned DEFAULT NULL,
  `rght` int(10) unsigned DEFAULT NULL,
  `orden` int(10) unsigned DEFAULT '0',
  `master` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `layout` enum('Izquierda','Derecha','Centro') DEFAULT 'Derecha',
  PRIMARY KEY (`id`),
  FULLTEXT KEY `nombre` (`nombre`,`descripcion`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `nodes` (`id`, `parent_id`, `nombre`, `slug`, `externo`, `enlace`, `descripcion`, `lft`, `rght`, `orden`, `master`, `created`, `layout`) VALUES
(1,	NULL,	'Fusce a odio molestie amet.',	'1_fusce-a-odio-molestie-amet',	0,	'',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	8,	2,	0,	'2012-09-21 11:11:43',	'Derecha'),
(2,	NULL,	'Maecenas mi risus volutpat.',	'2_maecenas-mi-risus-volutpat',	0,	'',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	9,	10,	3,	0,	'2012-09-21 11:11:43',	'Izquierda'),
(3,	NULL,	'In commodo, velit volutpat.',	'3_in-commodo-velit-volutpat',	0,	'',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	11,	12,	1,	0,	'2012-09-21 11:11:43',	'Derecha'),
(4,	NULL,	'Morbi a sollicitudin metus.',	'4_morbi-a-sollicitudin-metus',	0,	'',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	13,	14,	0,	0,	'2012-09-21 11:11:43',	'Derecha'),
(5,	1,	'Pellentesque eleifend amet.',	'5_pellentesque-eleifend-amet',	0,	NULL,	NULL,	2,	3,	2,	0,	'2012-09-21 16:58:31',	'Derecha'),
(6,	1,	'Etiam tristique diam metus.',	'6_etiam-tristique-diam-metus',	0,	NULL,	NULL,	4,	5,	1,	0,	'2012-09-21 16:58:31',	'Derecha'),
(7,	1,	'Sed eget risus dui, ac sed.',	'7_sed-eget-risus-dui-ac-sed',	0,	NULL,	NULL,	6,	7,	0,	0,	'2012-09-21 16:58:31',	'Derecha');

DROP TABLE IF EXISTS `polls`;
CREATE TABLE `polls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `activo` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `polls` (`id`, `nombre`, `activo`, `created`) VALUES
(1,	'Morbi euismod rutrum sapien at fermentum dictum est',	1,	'2012-09-20 12:27:45'),
(2,	'Fusce et velit in libero viverra lacinia',	1,	'2012-09-20 13:09:08');

DROP TABLE IF EXISTS `postimgs`;
CREATE TABLE `postimgs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned DEFAULT NULL,
  `src` varchar(255) NOT NULL,
  `portada` tinyint(1) DEFAULT '0',
  `descripcion` text,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `postimgs` (`id`, `post_id`, `src`, `portada`, `descripcion`, `orden`, `created`) VALUES
(1,	2,	'upload/img45.jpg',	1,	NULL,	1,	'2012-09-21 19:50:35'),
(2,	2,	'upload/img25.jpg',	0,	NULL,	2,	'2012-09-21 19:50:35'),
(3,	2,	'upload/img5413482750351.jpg',	0,	NULL,	3,	'2012-09-21 19:50:35'),
(7,	4,	'upload/img1213482751451.jpg',	1,	NULL,	7,	'2012-09-21 19:52:25');

DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `layout` enum('Izquierda','Derecha','Centro') DEFAULT 'Derecha',
  `descripcion` text,
  `activo` tinyint(1) DEFAULT '1',
  `comment_count` int(11) DEFAULT '0',
  `postimg_count` int(11) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `posts` (`id`, `nombre`, `slug`, `layout`, `descripcion`, `activo`, `comment_count`, `postimg_count`, `created`) VALUES
(2,	'Sed quis nisl at erat dignissim suscipit non id augue',	'2_sed-quis-nisl-at-erat-dignissim-suscipit-non-id-augue',	'Izquierda',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>',	1,	0,	3,	'2012-09-21 19:50:35'),
(4,	'Ut diam augue, gravida non dictum non; luctus et tellus',	'4_ut-diam-augue-gravida-non-dictum-non-luctus-et-tellus',	'Izquierda',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	0,	1,	'2012-09-21 19:52:25');

DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(10) unsigned NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `orden` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `questions` (`id`, `poll_id`, `nombre`, `orden`) VALUES
(1,	1,	'Duis ullamcorper, neque id.',	2),
(2,	1,	'Nam molestie, erat posuere.',	1),
(3,	1,	'Duis ac ligula non posuere.',	0),
(4,	1,	'Fusce ut arcu est volutpat.',	3),
(5,	1,	'Pellentesque quis volutpat.',	2),
(6,	1,	'Donec non nisi diam nullam.',	1),
(7,	2,	'Vestibulum eu urna posuere.',	4),
(8,	2,	'Fusce id dolor augue metus.',	3),
(9,	2,	'Aliquam adipiscing posuere.',	2),
(10,	2,	'Duis eu eros nulla posuere.',	1),
(11,	2,	'Curabitur eget lacus metus.',	0);

DROP TABLE IF EXISTS `tips`;
CREATE TABLE `tips` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text,
  `orden` int(10) unsigned DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `activo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `tips` (`id`, `category_id`, `nombre`, `descripcion`, `orden`, `created`, `activo`) VALUES
(1,	1,	'Nam faucibus varius velit, vitae rutrum velit sagittis at',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	1,	'2012-09-21 19:21:17',	1),
(2,	1,	'Nam et cursus nisl. Sed in felis sit amet ante',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	2,	'2012-09-21 19:21:30',	1),
(3,	2,	'Quisque condimentum erat a ligula commodo auct',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	3,	'2012-09-21 19:21:45',	1),
(4,	4,	'Suspendisse at dolor nec massa tempor consectetur',	'<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Expetenda tincidunt in sed, ex partem placerat sea, porro commodo ex eam. His putant aeterno interesset at. Usu ea mundi tincidunt, omnium virtute aliquando ius ex.</p>\r\n<p>Ea aperiri sententiae duo. Usu nullam dolorum quaestio ei, sit vidit facilisis ea. Per ne impedit iracundia neglegentur. Consetetur neglegentur eum ut, vis animal legimus inimicus id.</p>\r\n<p>His audiam deserunt in, eum ubique voluptatibus te. In reque dicta usu. Ne rebum dissentiet eam, vim omnis deseruisse id. Ullum deleniti vituperata at quo, insolens complectitur te eos, ea pri dico munere propriae. Vel ferri facilis ut, qui paulo ridens praesent ad. Possim alterum qui cu. Accusamus consulatu ius te, cu decore soleat appareat usu. Est ei erat mucius quaeque. Ei his quas phaedrum, efficiantur mediocritatem ne sed, hinc oratio blandit ei sed. Blandit gloriatur eam et.</p>\r\n<p>Brute noluisse per et, verear disputando neglegentur at quo. Sea quem legere ei, unum soluta ne duo. Ludus complectitur quo te, ut vide autem homero pro.</p>',	4,	'2012-09-21 19:21:59',	1);

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellidos` varchar(255) DEFAULT NULL,
  `master` tinyint(1) DEFAULT '0',
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

INSERT INTO `users` (`id`, `username`, `password`, `nombre`, `apellidos`, `master`, `created`) VALUES
(1,	'pulsem',	'327d3429df2c4512edc07ed9e948aa75f5d14f50',	'Master',	NULL,	1,	'2010-01-01 00:00:00'),
(2,	'admin',	'd033e22ae348aeb5660fc2140aec35850c4da997',	'Master',	NULL,	1,	'2010-01-01 00:00:00');

DROP TABLE IF EXISTS `visitors`;
CREATE TABLE `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` decimal(39,0) unsigned DEFAULT NULL,
  `item` enum('Question','Poll') DEFAULT 'Question',
  `item_id` int(10) unsigned DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- 2012-09-25 03:06:28
