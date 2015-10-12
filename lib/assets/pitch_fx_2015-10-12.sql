# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.27)
# Database: pitch_fx
# Generation Time: 2015-10-12 16:45:40 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table at_bats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `at_bats`;

CREATE TABLE `at_bats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table atbats
# ------------------------------------------------------------

DROP TABLE IF EXISTS `atbats`;

CREATE TABLE `atbats` (
  `ab_id` mediumint(9) unsigned NOT NULL AUTO_INCREMENT,
  `game_id` smallint(6) unsigned NOT NULL,
  `inning` enum('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24') NOT NULL,
  `num` tinyint(3) unsigned NOT NULL,
  `ball` enum('0','1','2','3','4') NOT NULL,
  `strike` enum('0','1','2','3') NOT NULL,
  `outs` enum('0','1','2','3') NOT NULL,
  `batter` mediumint(6) unsigned NOT NULL,
  `pitcher` mediumint(6) unsigned NOT NULL,
  `stand` enum('L','R') NOT NULL,
  `des` varchar(400) NOT NULL,
  `event` varchar(50) NOT NULL,
  `hit_x` float DEFAULT NULL,
  `hit_y` float DEFAULT NULL,
  `hit_type` enum('E','H','O') DEFAULT NULL,
  PRIMARY KEY (`ab_id`) KEY_BLOCK_SIZE=1024,
  KEY `game_id` (`game_id`) KEY_BLOCK_SIZE=1024
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4 COMMENT='Play-by-play data'
/*!50100 PARTITION BY KEY ()
PARTITIONS 4 */;



# Dump of table averages
# ------------------------------------------------------------

DROP TABLE IF EXISTS `averages`;

CREATE TABLE `averages` (
  `type` varchar(10) NOT NULL DEFAULT '',
  `phand` varchar(50) NOT NULL,
  `scale` int(11) NOT NULL DEFAULT '0',
  `avg` float DEFAULT NULL,
  `x1` decimal(5,1) NOT NULL DEFAULT '0.0',
  `x2` decimal(5,1) NOT NULL DEFAULT '0.0',
  `y1` decimal(5,1) NOT NULL DEFAULT '0.0',
  `y2` decimal(5,1) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`type`,`phand`,`scale`,`x1`,`x2`,`y1`,`y2`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table delete_4Bill
# ------------------------------------------------------------

DROP TABLE IF EXISTS `delete_4Bill`;

CREATE TABLE `delete_4Bill` (
  `pitchid` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table event_list
# ------------------------------------------------------------

DROP VIEW IF EXISTS `event_list`;

CREATE TABLE `event_list` (
   `pitch_id` MEDIUMINT(8) UNSIGNED NULL DEFAULT '0',
   `pitch_des` VARCHAR(50) NULL DEFAULT NULL,
   `pitch_type` ENUM('B','S','X') NULL DEFAULT NULL,
   `event_des` VARCHAR(50) NULL DEFAULT NULL,
   `pitch_id_two` SMALLINT(5) UNSIGNED NULL DEFAULT NULL,
   `x` FLOAT UNSIGNED NULL DEFAULT NULL,
   `y` FLOAT UNSIGNED NULL DEFAULT NULL,
   `start_speed` FLOAT UNSIGNED NULL DEFAULT NULL,
   `end_speed` FLOAT UNSIGNED NULL DEFAULT NULL,
   `sz_top` FLOAT UNSIGNED NULL DEFAULT NULL,
   `sz_bot` FLOAT UNSIGNED NULL DEFAULT NULL,
   `pfx_x` FLOAT NULL DEFAULT NULL,
   `pfx_z` FLOAT NULL DEFAULT NULL,
   `px` FLOAT NULL DEFAULT NULL,
   `pz` FLOAT NULL DEFAULT NULL,
   `x0` FLOAT NULL DEFAULT NULL,
   `y0` FLOAT NULL DEFAULT NULL,
   `z0` FLOAT NULL DEFAULT NULL,
   `vx0` FLOAT NULL DEFAULT NULL,
   `vy0` FLOAT NULL DEFAULT NULL,
   `vz0` FLOAT NULL DEFAULT NULL,
   `ax` FLOAT NULL DEFAULT NULL,
   `ay` FLOAT NULL DEFAULT NULL,
   `az` FLOAT NULL DEFAULT NULL,
   `break_y` FLOAT NULL DEFAULT NULL,
   `break_angle` FLOAT NULL DEFAULT NULL,
   `break_length` FLOAT NULL DEFAULT NULL,
   `ball` VARCHAR(4) NULL DEFAULT NULL,
   `strike` VARCHAR(4) NULL DEFAULT NULL,
   `on_1b` MEDIUMINT(8) UNSIGNED NULL DEFAULT NULL,
   `on_2b` MEDIUMINT(8) UNSIGNED NULL DEFAULT NULL,
   `on_3b` MEDIUMINT(8) UNSIGNED NULL DEFAULT NULL,
   `sv_id` VARCHAR(13) NULL DEFAULT NULL,
   `pitch_type_str` VARCHAR(3) NULL DEFAULT NULL,
   `type_confidence` DOUBLE NULL DEFAULT NULL,
   `game_id` SMALLINT(6) UNSIGNED NOT NULL DEFAULT '0',
   `game_date` DATE NOT NULL,
   `game_year` INT(4) NULL DEFAULT NULL,
   `game_month` INT(2) NULL DEFAULT NULL,
   `game_day` INT(2) NULL DEFAULT NULL,
   `home_team` VARCHAR(7) NOT NULL,
   `away_team` VARCHAR(7) NOT NULL,
   `game_num` TINYINT(3) UNSIGNED NOT NULL,
   `umpire` SMALLINT(5) NULL DEFAULT NULL,
   `wind` TINYINT(4) UNSIGNED NULL DEFAULT NULL,
   `wind_dir` VARCHAR(20) NULL DEFAULT NULL,
   `temp` TINYINT(4) NULL DEFAULT NULL,
   `game_type` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1',
   `runs_home` TINYINT(3) UNSIGNED NULL DEFAULT NULL,
   `runs_away` TINYINT(3) UNSIGNED NULL DEFAULT NULL,
   `local_time` TIME NULL DEFAULT NULL,
   `away_starting_pitcher` MEDIUMINT(6) NULL DEFAULT NULL,
   `home_starting_pitcher` MEDIUMINT(6) NULL DEFAULT NULL,
   `ab_id` MEDIUMINT(9) UNSIGNED NULL DEFAULT '0',
   `ab_inning` ENUM('1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24') NULL DEFAULT NULL,
   `ab_num` TINYINT(3) UNSIGNED NULL DEFAULT NULL,
   `ab_ball` ENUM('0','1','2','3','4') NULL DEFAULT NULL,
   `ab_strike` ENUM('0','1','2','3') NULL DEFAULT NULL,
   `ab_outs` ENUM('0','1','2','3') NULL DEFAULT NULL,
   `batter` MEDIUMINT(6) UNSIGNED NULL DEFAULT NULL,
   `pitcher` MEDIUMINT(6) UNSIGNED NULL DEFAULT NULL,
   `stand` ENUM('L','R') NULL DEFAULT NULL,
   `ab_des` VARCHAR(400) NULL DEFAULT NULL,
   `ab_event` VARCHAR(50) NULL DEFAULT NULL,
   `hit_x` FLOAT NULL DEFAULT NULL,
   `hit_y` FLOAT NULL DEFAULT NULL,
   `hit_type` ENUM('E','H','O') NULL DEFAULT NULL,
   `home_team_city` VARCHAR(50) NULL DEFAULT NULL,
   `home_team_name` VARCHAR(50) NULL DEFAULT NULL,
   `away_team_city` VARCHAR(50) NULL DEFAULT NULL,
   `away_team_name` VARCHAR(50) NULL DEFAULT NULL,
   `batter_first` VARCHAR(20) NULL DEFAULT NULL,
   `batter_last` VARCHAR(20) NULL DEFAULT NULL,
   `batter_throws` ENUM('L','R') NULL DEFAULT NULL,
   `batter_height` TINYINT(3) NULL DEFAULT NULL,
   `pitcher_first` VARCHAR(20) NULL DEFAULT NULL,
   `pitcher_last` VARCHAR(20) NULL DEFAULT NULL,
   `pitcher_throws` ENUM('L','R') NULL DEFAULT NULL,
   `pitcher_height` TINYINT(3) NULL DEFAULT NULL
) ENGINE=MyISAM;



# Dump of table game_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `game_types`;

CREATE TABLE `game_types` (
  `id` tinyint(3) unsigned NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 771072 kB';



# Dump of table games
# ------------------------------------------------------------

DROP TABLE IF EXISTS `games`;

CREATE TABLE `games` (
  `game_id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `home` varchar(7) NOT NULL,
  `away` varchar(7) NOT NULL,
  `game` tinyint(3) unsigned NOT NULL,
  `umpire` smallint(5) DEFAULT NULL,
  `wind` tinyint(4) unsigned DEFAULT NULL,
  `wind_dir` varchar(20) DEFAULT NULL,
  `temp` tinyint(4) DEFAULT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `runs_home` tinyint(3) unsigned DEFAULT NULL,
  `runs_away` tinyint(3) unsigned DEFAULT NULL,
  `local_time` time DEFAULT NULL,
  `away_starting_pitcher` mediumint(6) DEFAULT NULL,
  `home_starting_pitcher` mediumint(6) DEFAULT NULL,
  PRIMARY KEY (`game_id`),
  KEY `date` (`date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='InnoDB free: 784384 kB';



# Dump of table height
# ------------------------------------------------------------

DROP TABLE IF EXISTS `height`;

CREATE TABLE `height` (
  `eliasid` mediumint(6) NOT NULL,
  `height2` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`eliasid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table pitch_types
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pitch_types`;

CREATE TABLE `pitch_types` (
  `id` varchar(3) NOT NULL,
  `pitch` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='list of pitch types';



# Dump of table pitches
# ------------------------------------------------------------

DROP TABLE IF EXISTS `pitches`;

CREATE TABLE `pitches` (
  `pitch_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ab_id` mediumint(9) unsigned NOT NULL,
  `des` varchar(50) NOT NULL,
  `type` enum('B','S','X') NOT NULL,
  `id` smallint(5) unsigned NOT NULL,
  `x` float unsigned NOT NULL,
  `y` float unsigned NOT NULL,
  `start_speed` float unsigned DEFAULT NULL,
  `end_speed` float unsigned DEFAULT NULL,
  `sz_top` float unsigned DEFAULT NULL,
  `sz_bot` float unsigned DEFAULT NULL,
  `pfx_x` float DEFAULT NULL,
  `pfx_z` float DEFAULT NULL,
  `px` float DEFAULT NULL,
  `pz` float DEFAULT NULL,
  `x0` float DEFAULT NULL,
  `y0` float DEFAULT NULL,
  `z0` float DEFAULT NULL,
  `vx0` float DEFAULT NULL,
  `vy0` float DEFAULT NULL,
  `vz0` float DEFAULT NULL,
  `ax` float DEFAULT NULL,
  `ay` float DEFAULT NULL,
  `az` float DEFAULT NULL,
  `break_y` float DEFAULT NULL,
  `break_angle` float DEFAULT NULL,
  `break_length` float DEFAULT NULL,
  `ball` varchar(4) DEFAULT NULL,
  `strike` varchar(4) DEFAULT NULL,
  `on_1b` mediumint(8) unsigned DEFAULT NULL,
  `on_2b` mediumint(8) unsigned DEFAULT NULL,
  `on_3b` mediumint(8) unsigned DEFAULT NULL,
  `sv_id` varchar(13) DEFAULT NULL,
  `pitch_type` varchar(3) DEFAULT NULL,
  `type_confidence` double DEFAULT NULL,
  `my_pitch_type` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`pitch_id`) KEY_BLOCK_SIZE=1024,
  KEY `ab_id` (`ab_id`) KEY_BLOCK_SIZE=1024
) ENGINE=MyISAM DEFAULT CHARSET=latin1 ROW_FORMAT=COMPRESSED KEY_BLOCK_SIZE=4 COMMENT='InnoDB free: 771072 kB'
/*!50100 PARTITION BY KEY ()
PARTITIONS 4 */;



# Dump of table players
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players`;

CREATE TABLE `players` (
  `eliasid` mediumint(6) unsigned NOT NULL,
  `first` varchar(20) NOT NULL,
  `last` varchar(20) NOT NULL,
  `lahmanid` varchar(10) DEFAULT NULL,
  `throws` enum('L','R') DEFAULT NULL,
  `height` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`eliasid`),
  KEY `throws` (`throws`),
  KEY `first_last` (`first`,`last`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='MLB Player IDs and names';



# Dump of table players_copy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `players_copy`;

CREATE TABLE `players_copy` (
  `eliasid` mediumint(6) unsigned NOT NULL,
  `first` varchar(20) NOT NULL,
  `last` varchar(20) NOT NULL,
  `lahmanid` varchar(10) DEFAULT NULL,
  `throws` enum('L','R') DEFAULT NULL,
  `height` tinyint(3) DEFAULT NULL,
  PRIMARY KEY (`eliasid`),
  KEY `throws` (`throws`),
  KEY `first_last` (`first`,`last`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='MLB Player IDs and names';



# Dump of table schema_migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `schema_migrations`;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table teams
# ------------------------------------------------------------

DROP TABLE IF EXISTS `teams`;

CREATE TABLE `teams` (
  `team` varchar(7) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`team`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table umpires
# ------------------------------------------------------------

DROP TABLE IF EXISTS `umpires`;

CREATE TABLE `umpires` (
  `ump_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `first` varchar(20) NOT NULL,
  `last` varchar(20) NOT NULL,
  PRIMARY KEY (`ump_id`),
  UNIQUE KEY `first` (`first`,`last`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC COMMENT='Home plate umpire names';



# Dump of table UMPIRETMP2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UMPIRETMP2`;

CREATE TABLE `UMPIRETMP2` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `throws` enum('L','R') DEFAULT NULL,
  `stand` enum('L','R') NOT NULL,
  `ball` enum('0','1','2','3','4') NOT NULL,
  `strike` enum('0','1','2','3') NOT NULL,
  `px` float DEFAULT NULL,
  `pz` float DEFAULT NULL,
  `sz_top` float DEFAULT NULL,
  `sz_bot` float DEFAULT NULL,
  `type` enum('B','S','X') NOT NULL,
  `des` enum('Ball','Ball In Dirt','Called Strike','Foul','Foul (Runner Going)','Foul Bunt','Foul Tip','Hit By Pitch','In play, no out','In play, out(s)','In play, run(s)','Intent Ball','Missed Bunt','Pitchout','Swinging Strike','Swinging Strike (Blocked)','Unknown Strike') NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;





# Replace placeholder table for event_list with correct view syntax
# ------------------------------------------------------------

DROP TABLE `event_list`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `event_list`
AS SELECT
   `p`.`pitch_id` AS `pitch_id`,
   `p`.`des` AS `pitch_des`,
   `p`.`type` AS `pitch_type`,(case when (lcase(trim(`p`.`type`)) = 'x') then `a`.`event` else `p`.`des` end) AS `event_des`,
   `p`.`id` AS `pitch_id_two`,
   `p`.`x` AS `x`,
   `p`.`y` AS `y`,
   `p`.`start_speed` AS `start_speed`,
   `p`.`end_speed` AS `end_speed`,
   `p`.`sz_top` AS `sz_top`,
   `p`.`sz_bot` AS `sz_bot`,
   `p`.`pfx_x` AS `pfx_x`,
   `p`.`pfx_z` AS `pfx_z`,
   `p`.`px` AS `px`,
   `p`.`pz` AS `pz`,
   `p`.`x0` AS `x0`,
   `p`.`y0` AS `y0`,
   `p`.`z0` AS `z0`,
   `p`.`vx0` AS `vx0`,
   `p`.`vy0` AS `vy0`,
   `p`.`vz0` AS `vz0`,
   `p`.`ax` AS `ax`,
   `p`.`ay` AS `ay`,
   `p`.`az` AS `az`,
   `p`.`break_y` AS `break_y`,
   `p`.`break_angle` AS `break_angle`,
   `p`.`break_length` AS `break_length`,
   `p`.`ball` AS `ball`,
   `p`.`strike` AS `strike`,
   `p`.`on_1b` AS `on_1b`,
   `p`.`on_2b` AS `on_2b`,
   `p`.`on_3b` AS `on_3b`,
   `p`.`sv_id` AS `sv_id`,
   `p`.`pitch_type` AS `pitch_type_str`,
   `p`.`type_confidence` AS `type_confidence`,
   `g`.`game_id` AS `game_id`,
   `g`.`date` AS `game_date`,year(`g`.`date`) AS `game_year`,month(`g`.`date`) AS `game_month`,dayofmonth(`g`.`date`) AS `game_day`,
   `g`.`home` AS `home_team`,
   `g`.`away` AS `away_team`,
   `g`.`game` AS `game_num`,
   `g`.`umpire` AS `umpire`,
   `g`.`wind` AS `wind`,
   `g`.`wind_dir` AS `wind_dir`,
   `g`.`temp` AS `temp`,
   `g`.`type` AS `game_type`,
   `g`.`runs_home` AS `runs_home`,
   `g`.`runs_away` AS `runs_away`,
   `g`.`local_time` AS `local_time`,
   `g`.`away_starting_pitcher` AS `away_starting_pitcher`,
   `g`.`home_starting_pitcher` AS `home_starting_pitcher`,
   `a`.`ab_id` AS `ab_id`,
   `a`.`inning` AS `ab_inning`,
   `a`.`num` AS `ab_num`,
   `a`.`ball` AS `ab_ball`,
   `a`.`strike` AS `ab_strike`,
   `a`.`outs` AS `ab_outs`,
   `a`.`batter` AS `batter`,
   `a`.`pitcher` AS `pitcher`,
   `a`.`stand` AS `stand`,
   `a`.`des` AS `ab_des`,
   `a`.`event` AS `ab_event`,
   `a`.`hit_x` AS `hit_x`,
   `a`.`hit_y` AS `hit_y`,
   `a`.`hit_type` AS `hit_type`,
   `t`.`city` AS `home_team_city`,
   `t`.`name` AS `home_team_name`,
   `t2`.`city` AS `away_team_city`,
   `t2`.`name` AS `away_team_name`,
   `b`.`first` AS `batter_first`,
   `b`.`last` AS `batter_last`,
   `b`.`throws` AS `batter_throws`,
   `b`.`height` AS `batter_height`,
   `p2`.`first` AS `pitcher_first`,
   `p2`.`last` AS `pitcher_last`,
   `p2`.`throws` AS `pitcher_throws`,
   `p2`.`height` AS `pitcher_height`
FROM ((((((`games` `g` left join `atbats` `a` on((`g`.`game_id` = `a`.`game_id`))) left join `pitches` `p` on((`p`.`ab_id` = `a`.`ab_id`))) left join `teams` `t` on((`t`.`team` = `g`.`home`))) left join `teams` `t2` on((`t2`.`team` = `g`.`away`))) left join `players` `b` on((`b`.`eliasid` = `a`.`batter`))) left join `players` `p2` on((`p2`.`eliasid` = `a`.`pitcher`)));

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
