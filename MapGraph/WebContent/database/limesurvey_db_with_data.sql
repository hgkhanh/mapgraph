-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.27 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4053
-- Date/time:                    2013-03-22 17:41:35
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for limesurvey
DROP DATABASE IF EXISTS `limesurvey`;
CREATE DATABASE IF NOT EXISTS `limesurvey` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `limesurvey`;


-- Dumping structure for table limesurvey.district
DROP TABLE IF EXISTS `district`;
CREATE TABLE IF NOT EXISTS `district` (
  `district_id` int(11) NOT NULL,
  `name` varchar(90) COLLATE utf8_unicode_ci NOT NULL,
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.district: ~17 rows (approximately)
/*!40000 ALTER TABLE `district` DISABLE KEYS */;
REPLACE INTO `district` (`district_id`, `name`, `latitude`, `longitude`) VALUES
	(1, 'Quận Hoàn Kiếm', 21.028999, 105.852402),
	(2, 'Quận Ba Đình', 21.035700, 105.826103),
	(3, 'Quận Đống Đa', 21.013800, 105.826797),
	(4, 'Quận Cầu Giấy', 21.037201, 105.792198),
	(5, 'Quận Thanh Xuân', 20.995800, 105.815201),
	(6, 'Quận Hai Bà Trưng', 21.004200, 105.854202),
	(7, 'Quận Tây Hồ', 21.068001, 105.818001),
	(8, 'Quận Long Biên', 21.020000, 105.883003),
	(9, 'Quận Hoàng Mai', 20.974001, 105.862000),
	(10, 'Quận Hà Đông', 20.955999, 105.755997),
	(11, 'Huyện Đông Anh', 21.128000, 105.849998),
	(12, 'Huyện Sóc Sơn', 21.268000, 105.830002),
	(13, 'Huyện Thanh Trì', 20.927999, 105.839996),
	(14, 'Huyện Từ Liêm', 21.054001, 105.749001),
	(15, 'Huyện Gia Lâm', 21.051001, 105.968002),
	(16, 'Các huyện,thị xã khác thuộc Hà Nội', NULL, NULL),
	(17, 'Không ở Hà Nội', NULL, NULL);
/*!40000 ALTER TABLE `district` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_answers
DROP TABLE IF EXISTS `lime_answers`;
CREATE TABLE IF NOT EXISTS `lime_answers` (
  `qid` int(11) NOT NULL DEFAULT '0',
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `answer` text COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL,
  `assessment_value` int(11) NOT NULL DEFAULT '0',
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`qid`,`code`,`language`,`scale_id`),
  KEY `answers_idx2` (`sortorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_answers: 35 rows
/*!40000 ALTER TABLE `lime_answers` DISABLE KEYS */;
REPLACE INTO `lime_answers` (`qid`, `code`, `answer`, `sortorder`, `assessment_value`, `language`, `scale_id`) VALUES
	(3, '2', 'Công chức', 2, 1, 'vi', 0),
	(3, '1', 'Sinh viên, học sinh', 1, 1, 'vi', 0),
	(4, '1', 'Dưới 20', 1, 1, 'vi', 0),
	(4, '2', 'Từ 20 – 29', 2, 1, 'vi', 0),
	(4, '3', 'Từ 30 – 39', 3, 1, 'vi', 0),
	(4, '4', 'Từ 40 – 49', 4, 1, 'vi', 0),
	(4, '5', 'Từ 50 – 59', 5, 1, 'vi', 0),
	(4, '6', 'Trên 60', 6, 1, 'vi', 0),
	(5, '1', 'Nam', 1, 0, 'vi', 0),
	(5, '2', 'Nữ', 2, 1, 'vi', 0),
	(6, '1', 'Quận Hoàn Kiếm', 1, 1, 'vi', 0),
	(6, '2', 'Quận Ba Đình', 2, 1, 'vi', 0),
	(6, '3', 'Quận Đống Đa', 3, 1, 'vi', 0),
	(6, '4', 'Quận Cầu Giấy', 4, 1, 'vi', 0),
	(6, '5', 'Quận Thanh Xuân', 5, 1, 'vi', 0),
	(6, '6', 'Quận Hai Bà Trưng', 6, 1, 'vi', 0),
	(6, '7', 'Quận Tây Hồ', 7, 1, 'vi', 0),
	(6, '8', 'Quận Long Biên', 8, 1, 'vi', 0),
	(6, '9', 'Quận Hoàng Mai', 9, 1, 'vi', 0),
	(6, '10', 'Quận Hà Đông', 10, 1, 'vi', 0),
	(6, '11', 'Huyện Đông Anh', 11, 1, 'vi', 0),
	(6, '12', 'Huyện Sóc Sơn', 12, 1, 'vi', 0),
	(6, '13', 'Huyện Thanh Trì', 13, 1, 'vi', 0),
	(6, '14', 'Huyện Từ Liêm', 14, 1, 'vi', 0),
	(6, '15', 'Huyện Gia Lâm', 15, 1, 'vi', 0),
	(6, '16', 'Các huyện,thị xã khác thuộc Hà Nội', 16, 1, 'vi', 0),
	(6, '17', 'Không ở Hà Nội', 17, 1, 'vi', 0),
	(9, '1', 'Có', 1, 1, 'vi', 0),
	(9, '2', 'Không', 2, 1, 'vi', 0),
	(10, '1', 'Không phụ thuộc', 1, 1, 'vi', 0),
	(10, '2', 'Thỉnh thoảng qua email', 2, 1, 'vi', 0),
	(10, '3', 'Thường xuyên', 3, 1, 'vi', 0),
	(10, '4', 'Phụ thuộc tuyệt đối', 4, 1, 'vi', 0),
	(3, '4', 'Tự do', 4, 1, 'vi', 0),
	(3, '3', 'Doanh nghiệp', 3, 1, 'vi', 0);
/*!40000 ALTER TABLE `lime_answers` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_assessments
DROP TABLE IF EXISTS `lime_assessments`;
CREATE TABLE IF NOT EXISTS `lime_assessments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `scope` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gid` int(11) NOT NULL DEFAULT '0',
  `name` text COLLATE utf8_unicode_ci NOT NULL,
  `minimum` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maximum` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`,`language`),
  KEY `assessments_idx2` (`sid`),
  KEY `assessments_idx3` (`gid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_assessments: 0 rows
/*!40000 ALTER TABLE `lime_assessments` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_assessments` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_conditions
DROP TABLE IF EXISTS `lime_conditions`;
CREATE TABLE IF NOT EXISTS `lime_conditions` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `cqid` int(11) NOT NULL DEFAULT '0',
  `cfieldname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scenario` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`cid`),
  KEY `conditions_idx2` (`qid`),
  KEY `conditions_idx3` (`cqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_conditions: 0 rows
/*!40000 ALTER TABLE `lime_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_conditions` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_defaultvalues
DROP TABLE IF EXISTS `lime_defaultvalues`;
CREATE TABLE IF NOT EXISTS `lime_defaultvalues` (
  `qid` int(11) NOT NULL DEFAULT '0',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  `sqid` int(11) NOT NULL DEFAULT '0',
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `specialtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultvalue` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qid`,`specialtype`,`language`,`scale_id`,`sqid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_defaultvalues: 0 rows
/*!40000 ALTER TABLE `lime_defaultvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_defaultvalues` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_expression_errors
DROP TABLE IF EXISTS `lime_expression_errors`;
CREATE TABLE IF NOT EXISTS `lime_expression_errors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `errortime` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sid` int(11) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `gseq` int(11) DEFAULT NULL,
  `qseq` int(11) DEFAULT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `eqn` text COLLATE utf8_unicode_ci,
  `prettyprint` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_expression_errors: 0 rows
/*!40000 ALTER TABLE `lime_expression_errors` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_expression_errors` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_failed_login_attempts
DROP TABLE IF EXISTS `lime_failed_login_attempts`;
CREATE TABLE IF NOT EXISTS `lime_failed_login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `last_attempt` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `number_attempts` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_failed_login_attempts: 0 rows
/*!40000 ALTER TABLE `lime_failed_login_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_failed_login_attempts` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_groups
DROP TABLE IF EXISTS `lime_groups`;
CREATE TABLE IF NOT EXISTS `lime_groups` (
  `gid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `group_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `group_order` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `randomization_group` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `grelevance` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`gid`,`language`),
  KEY `groups_idx2` (`sid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_groups: 2 rows
/*!40000 ALTER TABLE `lime_groups` DISABLE KEYS */;
REPLACE INTO `lime_groups` (`gid`, `sid`, `group_name`, `group_order`, `description`, `language`, `randomization_group`, `grelevance`) VALUES
	(1, 863796, 'Thời gian sử dụng internet trong ngày của bạn', 0, '', 'vi', '', ''),
	(2, 863796, 'Thông tin về bạn', 1, 'Không bắt buộc', 'vi', '', '');
/*!40000 ALTER TABLE `lime_groups` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_labels
DROP TABLE IF EXISTS `lime_labels`;
CREATE TABLE IF NOT EXISTS `lime_labels` (
  `lid` int(11) NOT NULL DEFAULT '0',
  `code` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `assessment_value` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`lid`,`sortorder`,`language`),
  KEY `labels_code_idx` (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_labels: 0 rows
/*!40000 ALTER TABLE `lime_labels` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_labels` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_labelsets
DROP TABLE IF EXISTS `lime_labelsets`;
CREATE TABLE IF NOT EXISTS `lime_labelsets` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `label_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `languages` varchar(200) COLLATE utf8_unicode_ci DEFAULT 'en',
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_labelsets: 0 rows
/*!40000 ALTER TABLE `lime_labelsets` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_labelsets` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_old_survey_863796_20121108024113
DROP TABLE IF EXISTS `lime_old_survey_863796_20121108024113`;
CREATE TABLE IF NOT EXISTS `lime_old_survey_863796_20121108024113` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitdate` datetime DEFAULT NULL,
  `lastpage` int(11) DEFAULT NULL,
  `startlanguage` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `startdate` datetime NOT NULL,
  `datestamp` datetime NOT NULL,
  `ipaddr` text COLLATE utf8_unicode_ci,
  `refurl` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X71` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X72` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X73` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X74` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X75` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X76` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X77` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X78` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X79` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X710` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X711` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X7other` text COLLATE utf8_unicode_ci,
  `863796X1X6` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X2` text COLLATE utf8_unicode_ci,
  `863796X2X5` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X3` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X3other` text COLLATE utf8_unicode_ci,
  `863796X2X4` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X81` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X82` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X83` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X84` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X8other` text COLLATE utf8_unicode_ci,
  `863796X2X9` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X10` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_old_survey_863796_20121108024113: 89 rows
/*!40000 ALTER TABLE `lime_old_survey_863796_20121108024113` DISABLE KEYS */;
REPLACE INTO `lime_old_survey_863796_20121108024113` (`id`, `submitdate`, `lastpage`, `startlanguage`, `startdate`, `datestamp`, `ipaddr`, `refurl`, `863796X1X1SQ001_SQ001`, `863796X1X1SQ001_SQ002`, `863796X1X1SQ001_SQ003`, `863796X1X1SQ001_SQ004`, `863796X1X1SQ001_SQ005`, `863796X1X1SQ001_SQ006`, `863796X1X1SQ001_SQ007`, `863796X1X1SQ001_SQ008`, `863796X1X1SQ001_SQ009`, `863796X1X1SQ001_SQ010`, `863796X1X1SQ001_SQ011`, `863796X1X1SQ002_SQ001`, `863796X1X1SQ002_SQ002`, `863796X1X1SQ002_SQ003`, `863796X1X1SQ002_SQ004`, `863796X1X1SQ002_SQ005`, `863796X1X1SQ002_SQ006`, `863796X1X1SQ002_SQ007`, `863796X1X1SQ002_SQ008`, `863796X1X1SQ002_SQ009`, `863796X1X1SQ002_SQ010`, `863796X1X1SQ002_SQ011`, `863796X1X1SQ003_SQ001`, `863796X1X1SQ003_SQ002`, `863796X1X1SQ003_SQ003`, `863796X1X1SQ003_SQ004`, `863796X1X1SQ003_SQ005`, `863796X1X1SQ003_SQ006`, `863796X1X1SQ003_SQ007`, `863796X1X1SQ003_SQ008`, `863796X1X1SQ003_SQ009`, `863796X1X1SQ003_SQ010`, `863796X1X1SQ003_SQ011`, `863796X1X1SQ004_SQ001`, `863796X1X1SQ004_SQ002`, `863796X1X1SQ004_SQ003`, `863796X1X1SQ004_SQ004`, `863796X1X1SQ004_SQ005`, `863796X1X1SQ004_SQ006`, `863796X1X1SQ004_SQ007`, `863796X1X1SQ004_SQ008`, `863796X1X1SQ004_SQ009`, `863796X1X1SQ004_SQ010`, `863796X1X1SQ004_SQ011`, `863796X1X71`, `863796X1X72`, `863796X1X73`, `863796X1X74`, `863796X1X75`, `863796X1X76`, `863796X1X77`, `863796X1X78`, `863796X1X79`, `863796X1X710`, `863796X1X711`, `863796X1X7other`, `863796X1X6`, `863796X2X2`, `863796X2X5`, `863796X2X3`, `863796X2X3other`, `863796X2X4`, `863796X2X81`, `863796X2X82`, `863796X2X83`, `863796X2X84`, `863796X2X8other`, `863796X2X9`, `863796X2X10`) VALUES
	(24, NULL, 1, 'vi', '2012-11-06 08:33:25', '2012-11-06 08:33:25', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, '2012-11-06 08:36:37', 1, 'vi', '2012-11-06 08:33:00', '2012-11-06 08:36:37', '113.190.49.90', NULL, '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '1', '1', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', 'Y', '', '', '', '', 'Y', '', '1', 'Chuong Duong', '', '1', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(14, NULL, NULL, 'vi', '2012-11-06 03:17:20', '2012-11-06 03:17:20', '74.125.16.210', 'http://www.google.com/search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, NULL, 'vi', '2012-11-06 03:17:53', '2012-11-06 03:17:53', '69.63.190.247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, '2012-11-06 03:05:30', 2, 'vi', '2012-11-06 03:03:50', '2012-11-06 03:05:30', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/survey/index/sid/863796/newtest/Y/lang/vi', '', '', '', '', '1', '1', '1', '', '', '', '', '', '1', '1', '', '1', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', '', 'Y', '', '', '', 'Y', '', '', '', '4', '', '2', '1', '', '2', '', 'Y', '', '', '', '', ''),
	(13, '2012-11-06 03:16:55', 1, 'vi', '2012-11-06 03:12:58', '2012-11-06 03:16:55', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/admin/quotas/index/surveyid/863796', '', '1', '', '', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', '5', '', '2', '2', '', '2', '', 'Y', 'Y', '', '', '2', '2'),
	(11, '2012-11-06 03:00:54', 2, 'vi', '2012-11-06 02:59:51', '2012-11-06 03:00:54', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/survey/index/sid/863796/newtest/Y/lang/vi', '0', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', 'Y', 'Y', '', '', 'Y', 'Y', '', '3', 'La Thành', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '1', '4'),
	(22, NULL, 1, 'vi', '2012-11-06 08:24:05', '2012-11-06 08:24:05', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, NULL, NULL, 'vi', '2012-11-06 08:23:02', '2012-11-06 08:23:02', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, '2012-11-06 07:40:15', 1, 'vi', '2012-11-06 07:34:57', '2012-11-06 07:40:15', '222.252.109.171', NULL, '', '1', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', '', '', '', 'Y', '', 'Y', '', '', '3', '', '2', '2', '', '4', 'Y', 'Y', '', '', '', '2', '2'),
	(25, NULL, 1, 'vi', '2012-11-06 08:34:19', '2012-11-06 08:34:19', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, NULL, 1, 'vi', '2012-11-06 08:36:52', '2012-11-06 08:36:52', '113.190.49.90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, NULL, 'vi', '2012-11-06 08:57:30', '2012-11-06 08:57:30', '69.63.190.247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, NULL, 1, 'vi', '2012-11-06 08:57:46', '2012-11-06 08:57:46', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, NULL, NULL, 'vi', '2012-11-06 08:58:13', '2012-11-06 08:58:13', '42.113.89.136', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, NULL, NULL, 'vi', '2012-11-06 09:01:19', '2012-11-06 09:01:19', '123.16.133.180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, NULL, NULL, 'vi', '2012-11-06 09:01:23', '2012-11-06 09:01:23', '1.55.91.117', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, NULL, NULL, 'vi', '2012-11-06 09:01:31', '2012-11-06 09:01:31', '118.71.217.167', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, NULL, NULL, 'vi', '2012-11-06 09:01:33', '2012-11-06 09:01:33', '42.114.70.142', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=VAQGpKEG-AQHrmWTcWCvVgVMDo7US5ZpjbZH_aTiNxafhWg&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, '2012-11-06 09:06:33', 1, 'vi', '2012-11-06 09:01:36', '2012-11-06 09:06:33', '113.190.201.88', 'http://www.facebook.com/', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', '', '', '', '', '', '', 'Y', '', '3', 'Nguyễn Trãi', '1', '1', '', '2', 'Y', '', '', '', '', '2', '4'),
	(35, NULL, NULL, 'vi', '2012-11-06 09:02:00', '2012-11-06 09:02:00', '222.252.107.128', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, NULL, NULL, 'vi', '2012-11-06 09:02:35', '2012-11-06 09:02:35', '222.254.11.238', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, 1, 'vi', '2012-11-06 09:04:07', '2012-11-06 09:04:07', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, '2012-11-06 09:12:43', 1, 'vi', '2012-11-06 09:11:06', '2012-11-06 09:12:43', '65.49.14.89', 'https://www.facebook.com/', '', '', '1', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', '', '', 'Y', '', '', '', 'Y', '', '9', '', '1', '1', '', '2', 'Y', '', '', '', '', '1', '3'),
	(39, NULL, NULL, 'vi', '2012-11-06 09:14:45', '2012-11-06 09:14:45', '113.181.38.37', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, '2012-11-06 09:16:56', 1, 'vi', '2012-11-06 09:14:51', '2012-11-06 09:16:56', '183.81.17.91', NULL, '1', '', '', '', '', '', '1', '1', '1', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '', '1', '', '', '', 'Y', 'Y', '', '', '', 'Y', '', 'Y', '', '', 'Y', '', '4', '', '1', '1', '', '2', 'Y', '', '', '', '', '1', ''),
	(41, NULL, NULL, 'vi', '2012-11-06 09:15:32', '2012-11-06 09:15:32', '183.81.61.234', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, '2012-11-06 09:30:28', 1, 'vi', '2012-11-06 09:28:52', '2012-11-06 09:30:28', '58.187.65.184', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=ZAQH2q-6QAQFmfFaKtQ9-lEoUnHlRmfBfd1GDKfFT4OprUQ&s=1', '', '1', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', 'Y', 'Y', '', '', '', '', 'Y', '', '5', '', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(43, NULL, NULL, 'vi', '2012-11-06 09:32:06', '2012-11-06 09:32:06', '183.81.19.26', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, NULL, NULL, 'vi', '2012-11-06 09:32:08', '2012-11-06 09:32:08', '183.81.19.26', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, NULL, NULL, 'vi', '2012-11-06 09:35:44', '2012-11-06 09:35:44', '113.190.191.31', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=WAQECta_IAQGx7VdtFr_KcExewZ4vGb5fgy37QXNAESTeRw&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, NULL, NULL, 'vi', '2012-11-06 09:37:47', '2012-11-06 09:37:47', '183.81.10.173', 'http://www.facebook.com/groups/khoacntt/419019958153722/?ref=notif&notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, NULL, 1, 'vi', '2012-11-06 09:46:08', '2012-11-06 09:46:08', '113.190.201.88', 'http://www.facebook.com/groups/khoacntt/419019958153722/?comment_id=419032864819098&notif_t=group_comment_reply', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, '2012-11-06 09:53:09', 1, 'vi', '2012-11-06 09:51:28', '2012-11-06 09:53:09', '183.81.19.26', 'http://www.facebook.com/', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', '', 'Y', 'Y', '', '', '', 'Y', '', '14', 'Phú Đô', '1', '1', '', '2', '', 'Y', 'Y', '', '', '2', '2'),
	(49, NULL, 1, 'vi', '2012-11-06 09:52:14', '2012-11-06 09:52:14', '113.190.201.88', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, NULL, NULL, 'vi', '2012-11-06 10:01:04', '2012-11-06 10:01:04', '183.81.56.200', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, NULL, NULL, 'vi', '2012-11-06 10:07:18', '2012-11-06 10:07:18', '1.55.8.162', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, NULL, NULL, 'vi', '2012-11-06 10:14:30', '2012-11-06 10:14:30', '117.6.99.24', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, '2012-11-06 10:24:23', 1, 'vi', '2012-11-06 10:22:38', '2012-11-06 10:24:23', '123.24.197.109', 'https://www.facebook.com/', '1', '1', '1', '', '', '1', '1', '1', '1', '', '', '1', '1', '1', '', '', '1', '1', '1', '1', '', '', '1', '1', '1', '', '', '1', '1', '1', '1', '', '', '0', '', '', '', '', '1', '1', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '5', '', '1', '1', '', '1', '', 'Y', 'Y', '', '', '1', '3'),
	(54, NULL, NULL, 'vi', '2012-11-06 10:57:15', '2012-11-06 10:57:15', '42.113.67.173', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, NULL, NULL, 'vi', '2012-11-06 11:05:03', '2012-11-06 11:05:03', '183.81.115.229', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=bAQEBkLZAAQGUPLR5_HdUtqrkFdpK0e0PyO65q6LWh7ke8Q&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, NULL, NULL, 'vi', '2012-11-06 11:15:21', '2012-11-06 11:15:21', '123.24.164.78', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, '2012-11-06 11:31:08', 1, 'vi', '2012-11-06 11:28:42', '2012-11-06 11:31:08', '113.185.1.180', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=dAQFFkzqH&s=1', '', '', '0', '', '', '', '', '', '1', '', '', '', '', '0', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '', 'Y', '', '', '2', 'P. Vạn Phúc', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(58, NULL, 1, 'vi', '2012-11-06 12:05:20', '2012-11-06 12:05:20', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, NULL, NULL, 'vi', '2012-11-06 12:07:04', '2012-11-06 12:07:04', '1.55.91.78', 'http://www.facebook.com/groups/khoacntt/419019958153722/?ref=notif&notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, NULL, 1, 'vi', '2012-11-06 12:31:38', '2012-11-06 12:31:38', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, NULL, NULL, 'vi', '2012-11-06 12:32:16', '2012-11-06 12:32:16', '65.52.0.56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, NULL, NULL, 'vi', '2012-11-06 12:33:43', '2012-11-06 12:33:43', '42.114.1.124', 'http://www.facebook.com/neonguyen.uet/posts/463187590390734?notif_t=close_friend_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, NULL, NULL, 'vi', '2012-11-06 12:34:03', '2012-11-06 12:34:03', '1.55.109.53', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, NULL, NULL, 'vi', '2012-11-06 12:34:33', '2012-11-06 12:34:33', '1.55.92.110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, NULL, NULL, 'vi', '2012-11-06 12:43:59', '2012-11-06 12:43:59', '58.187.119.35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, NULL, 1, 'vi', '2012-11-06 14:10:47', '2012-11-06 14:10:47', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(67, NULL, NULL, 'vi', '2012-11-06 22:07:11', '2012-11-06 22:07:11', '42.118.255.15', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(68, NULL, NULL, 'vi', '2012-11-06 22:12:38', '2012-11-06 22:12:38', '74.125.16.219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, NULL, NULL, 'vi', '2012-11-06 22:28:37', '2012-11-06 22:28:37', '82.145.208.15', 'http://m.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=GAQGXm7GM&enc=AZMEDNCr7SEcZAz50xWCXh2plWy-w01Q4SbDC34Sd6pofoYbvWEodE_A-Bi_rNhR_f356VrWSNsI0dwNkuNyovBNFgWdT4nuKfDUX0gHpg4NkUpyuCEaWCTk-HHSHeSdZmjZdqzOxlY3__TLu8G5-ZTLLra3HIGqO6m3jEBbDC35FTiqavxtuCRcwJ34sfdUHNmqGJLBLWHqUjSpyD9gGFTbqDSwl4zaDXOhSfjfZuo1cFxtqu6Rf_dU-6SV0W9kd_QUXssa-emJfII2Tc1tVb5HGOY8ClTkAy0gW2ZBgkzcD-7J1rYK0TB2wIWEXoC6eylC527ga-u3jbC7dRNLxRaF&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, '2012-11-06 23:56:45', 1, 'vi', '2012-11-06 23:53:33', '2012-11-06 23:56:45', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=IAQFUaCa7', '', '1', '1', '1', '1', '1', '0', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', '14', 'Đường 32', '1', '1', '', '', 'Y', 'Y', '', '', '', '2', '3'),
	(71, '2012-11-06 23:56:34', 1, 'vi', '2012-11-06 23:53:45', '2012-11-06 23:56:34', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=6AQHs5ACU', '', '', '', '', '1', '1', '1', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '', '1', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', '', 'Y', 'Y', '', 'Y', '', '14', 'Cổ Nhuế', '2', '1', '', '5', 'Y', 'Y', 'Y', '', '', '1', '3'),
	(72, NULL, NULL, 'vi', '2012-11-07 06:40:51', '2012-11-07 06:40:51', '58.187.172.201', 'http://www.facebook.com/groups/khoacntt/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, NULL, 1, 'vi', '2012-11-07 07:26:23', '2012-11-07 07:28:42', '183.81.34.21', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', 'Y', 'Y', '', '4', 'Phạm Văn Đồng', '1', '1', '', '2', 'Y', '', '', '', '', '1', '1'),
	(74, NULL, NULL, 'vi', '2012-11-07 08:46:55', '2012-11-07 08:46:55', '69.171.248.5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, NULL, NULL, 'vi', '2012-11-07 08:47:08', '2012-11-07 08:47:08', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, NULL, 1, 'vi', '2012-11-07 08:49:28', '2012-11-07 08:49:28', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, NULL, NULL, 'vi', '2012-11-07 08:49:35', '2012-11-07 08:49:35', '69.63.190.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, NULL, 1, 'vi', '2012-11-07 08:51:46', '2012-11-07 08:51:46', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, '2012-11-07 08:56:47', 1, 'vi', '2012-11-07 08:52:20', '2012-11-07 08:56:47', '58.187.78.192', 'http://www.facebook.com/', '', '', '', '', '', '', '', '1', '', '0', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '0', '0', '', '', '', '', '', '1', '', '', 'Y', '', '', '', 'Y', '', '', '', 'Y', '', 'Y', '', '3', '', '2', '-oth-', 'Kinh doanh', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(80, NULL, 1, 'vi', '2012-11-07 08:53:09', '2012-11-07 08:53:09', '222.252.101.246', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=_AQEq_Ji-&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, NULL, NULL, 'vi', '2012-11-07 08:57:36', '2012-11-07 08:57:36', '69.63.190.251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, NULL, 1, 'vi', '2012-11-07 08:57:38', '2012-11-07 08:57:38', '222.252.101.246', 'http://www.facebook.com/l.php?u=http%3A%2F%2Ftinyurl.com%2Fapg6xh3&h=RAQH6sf3g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(83, NULL, NULL, 'vi', '2012-11-07 09:37:30', '2012-11-07 09:37:30', '1.55.90.87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(84, '2012-11-07 09:58:24', 1, 'vi', '2012-11-07 09:56:32', '2012-11-07 09:58:24', '222.252.101.246', NULL, '', '1', '1', '', '1', '1', '', '1', '0', '', '', '', '1', '1', '', '1', '1', '', '1', '0', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '', 'Phong Thuỷ', '3', 'Tây Sơn', '1', '3', '', '4', 'Y', 'Y', 'Y', '', '', '1', '2'),
	(85, '2012-11-07 10:02:59', 1, 'vi', '2012-11-07 10:00:10', '2012-11-07 10:02:59', '113.178.36.183', NULL, '0', '0', '', '', '', '', '', '1', '1', '', '', '', '1', '1', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '7', '', '', '', '', '', 'Y', 'Y', 'Y', '', '', '1', '3'),
	(86, '2012-11-07 10:09:12', 1, 'vi', '2012-11-07 10:02:48', '2012-11-07 10:09:12', '113.190.223.5', NULL, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '1', '1', '1', '1', '1', '', '', '', 'Y', '', '', '', '', '', '', '', '', '', '', '4', 'Dich Vong', '1', '1', '', '2', 'Y', 'Y', 'Y', 'Y', '', '1', '3'),
	(87, NULL, 1, 'vi', '2012-11-07 10:09:56', '2012-11-07 10:09:56', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, NULL, 1, 'vi', '2012-11-07 10:10:02', '2012-11-07 10:10:02', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, NULL, 1, 'vi', '2012-11-07 10:11:21', '2012-11-07 10:11:21', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, NULL, NULL, 'vi', '2012-11-07 10:11:34', '2012-11-07 10:11:34', '67.159.56.165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, NULL, 1, 'vi', '2012-11-07 10:15:13', '2012-11-07 10:15:13', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, '2012-11-07 10:20:30', 1, 'vi', '2012-11-07 10:16:28', '2012-11-07 10:20:30', '113.190.62.10', NULL, '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '1', 'Y', 'Y', '', 'Y', '', 'Y', '', '', '', '', 'Y', '', '6', 'Bạch Mai', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(93, NULL, 1, 'vi', '2012-11-07 10:32:12', '2012-11-07 10:32:12', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(94, NULL, NULL, 'vi', '2012-11-07 10:37:00', '2012-11-07 10:37:00', '118.71.146.187', 'http://www.facebook.com/neonguyen.uet?fref=ts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, '2012-11-07 10:42:47', 1, 'vi', '2012-11-07 10:37:11', '2012-11-07 10:42:47', '118.71.146.187', NULL, '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', '', 'Y', '', 'Y', '', '', 'Y', '', '', '', '3', '', '2', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(96, '2012-11-07 10:46:27', 1, 'vi', '2012-11-07 10:44:36', '2012-11-07 10:46:27', '117.4.43.235', NULL, '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '5', 'Hoàng Văn Thái', '1', '1', '', '2', 'Y', '', '', '', '', '2', '1'),
	(97, NULL, NULL, 'vi', '2012-11-07 10:45:20', '2012-11-07 10:45:20', '113.22.90.147', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(98, NULL, NULL, 'vi', '2012-11-07 10:57:00', '2012-11-07 10:57:00', '123.24.130.211', 'http://www.facebook.com/groups/khoacntt/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(99, NULL, 1, 'vi', '2012-11-07 11:25:53', '2012-11-07 11:25:53', '1.55.91.46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, NULL, NULL, 'vi', '2012-11-07 11:31:08', '2012-11-07 11:31:08', '183.81.17.235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, '2012-11-07 21:07:52', 1, 'vi', '2012-11-07 21:05:08', '2012-11-07 21:07:52', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=JAQHjUQ4rAQESh--m_09lxiW20YjUO_Hs-i-nHbcGCgK1LQ&s=1', '1', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', 'Y', '', '', '', '', 'Y', '', '14', 'Đức Diễn', '1', '1', '', '2', '', 'Y', 'Y', 'Y', '', '1', '3'),
	(102, NULL, 1, 'vi', '2012-11-07 21:08:03', '2012-11-07 21:08:03', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=JAQHjUQ4rAQESh--m_09lxiW20YjUO_Hs-i-nHbcGCgK1LQ&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, NULL, NULL, 'vi', '2012-11-08 02:25:13', '2012-11-08 02:25:13', '123.16.133.180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `lime_old_survey_863796_20121108024113` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_old_survey_863796_timings_20121108024113
DROP TABLE IF EXISTS `lime_old_survey_863796_timings_20121108024113`;
CREATE TABLE IF NOT EXISTS `lime_old_survey_863796_timings_20121108024113` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interviewtime` float DEFAULT NULL,
  `863796X1time` float DEFAULT NULL,
  `863796X1X1time` float DEFAULT NULL,
  `863796X1X7time` float DEFAULT NULL,
  `863796X1X6time` float DEFAULT NULL,
  `863796X2time` float DEFAULT NULL,
  `863796X2X2time` float DEFAULT NULL,
  `863796X2X5time` float DEFAULT NULL,
  `863796X2X3time` float DEFAULT NULL,
  `863796X2X4time` float DEFAULT NULL,
  `863796X2X8time` float DEFAULT NULL,
  `863796X2X9time` float DEFAULT NULL,
  `863796X2X10time` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_old_survey_863796_timings_20121108024113: 89 rows
/*!40000 ALTER TABLE `lime_old_survey_863796_timings_20121108024113` DISABLE KEYS */;
REPLACE INTO `lime_old_survey_863796_timings_20121108024113` (`id`, `interviewtime`, `863796X1time`, `863796X1X1time`, `863796X1X7time`, `863796X1X6time`, `863796X2time`, `863796X2X2time`, `863796X2X5time`, `863796X2X3time`, `863796X2X4time`, `863796X2X8time`, `863796X2X9time`, `863796X2X10time`) VALUES
	(15, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, 237.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, 100.27, 29.77, NULL, NULL, NULL, 70.5, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, 63.82, 39.37, NULL, NULL, NULL, 24.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, 217.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, 317.89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(32, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, 296.73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(36, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(38, 97.37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 125.35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, 96.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(46, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, 100.47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(51, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, 104.74, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(54, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(55, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, 145.46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(58, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(67, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(68, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, 191.49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(71, 169.37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(72, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, 136.89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, 266.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(83, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(84, 111.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(85, 168.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, 384.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(87, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(90, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, 241.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(93, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(94, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, 63.58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, 110.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(97, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(98, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(99, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, 163.19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(102, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `lime_old_survey_863796_timings_20121108024113` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participants
DROP TABLE IF EXISTS `lime_participants`;
CREATE TABLE IF NOT EXISTS `lime_participants` (
  `participant_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `firstname` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL,
  `language` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blacklisted` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `owner_uid` int(11) NOT NULL,
  PRIMARY KEY (`participant_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participants: 0 rows
/*!40000 ALTER TABLE `lime_participants` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participants` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participant_attribute
DROP TABLE IF EXISTS `lime_participant_attribute`;
CREATE TABLE IF NOT EXISTS `lime_participant_attribute` (
  `participant_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`participant_id`,`attribute_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participant_attribute: 0 rows
/*!40000 ALTER TABLE `lime_participant_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participant_attribute` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participant_attribute_names
DROP TABLE IF EXISTS `lime_participant_attribute_names`;
CREATE TABLE IF NOT EXISTS `lime_participant_attribute_names` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_type` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `visible` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`attribute_id`,`attribute_type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participant_attribute_names: 0 rows
/*!40000 ALTER TABLE `lime_participant_attribute_names` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participant_attribute_names` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participant_attribute_names_lang
DROP TABLE IF EXISTS `lime_participant_attribute_names_lang`;
CREATE TABLE IF NOT EXISTS `lime_participant_attribute_names_lang` (
  `attribute_id` int(11) NOT NULL,
  `attribute_name` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `lang` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`attribute_id`,`lang`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participant_attribute_names_lang: 0 rows
/*!40000 ALTER TABLE `lime_participant_attribute_names_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participant_attribute_names_lang` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participant_attribute_values
DROP TABLE IF EXISTS `lime_participant_attribute_values`;
CREATE TABLE IF NOT EXISTS `lime_participant_attribute_values` (
  `value_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_id` int(11) NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participant_attribute_values: 0 rows
/*!40000 ALTER TABLE `lime_participant_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participant_attribute_values` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_participant_shares
DROP TABLE IF EXISTS `lime_participant_shares`;
CREATE TABLE IF NOT EXISTS `lime_participant_shares` (
  `participant_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `share_uid` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `can_edit` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`participant_id`,`share_uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_participant_shares: 0 rows
/*!40000 ALTER TABLE `lime_participant_shares` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_participant_shares` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_questions
DROP TABLE IF EXISTS `lime_questions`;
CREATE TABLE IF NOT EXISTS `lime_questions` (
  `qid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_qid` int(11) NOT NULL DEFAULT '0',
  `sid` int(11) NOT NULL DEFAULT '0',
  `gid` int(11) NOT NULL DEFAULT '0',
  `type` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'T',
  `title` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `question` text COLLATE utf8_unicode_ci NOT NULL,
  `preg` text COLLATE utf8_unicode_ci,
  `help` text COLLATE utf8_unicode_ci,
  `other` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `mandatory` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `question_order` int(11) NOT NULL,
  `language` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `scale_id` int(11) NOT NULL DEFAULT '0',
  `same_default` int(11) NOT NULL DEFAULT '0' COMMENT 'Saves if user set to use the same default value across languages in default options dialog',
  `relevance` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`qid`,`language`),
  KEY `questions_idx2` (`sid`),
  KEY `questions_idx3` (`gid`),
  KEY `questions_idx4` (`type`),
  KEY `parent_qid_idx` (`parent_qid`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_questions: 40 rows
/*!40000 ALTER TABLE `lime_questions` DISABLE KEYS */;
REPLACE INTO `lime_questions` (`qid`, `parent_qid`, `sid`, `gid`, `type`, `title`, `question`, `preg`, `help`, `other`, `mandatory`, `question_order`, `language`, `scale_id`, `same_default`, `relevance`) VALUES
	(1, 0, 863796, 1, ':', 'G1_Q0001', 'Bạn hay vào mạng vào giờ nào và thường xem loại thông tin gì ?', '', 'Chọn thời gian và loại thông tin tương ứng mà bạn hay tương tác', 'N', 'N', 0, 'vi', 0, 0, '1'),
	(2, 0, 863796, 2, 'S', 'G2_Q0001', 'Bạn đang sống ở đường, phố nào ?', '', 'ví dụ : Tôn Đức Thắng', 'N', 'N', 0, 'vi', 0, 0, '1'),
	(3, 0, 863796, 2, 'L', 'G2_Q0003', 'Nghề nghiệp của bạn ?', '', '', 'Y', 'N', 2, 'vi', 0, 0, '1'),
	(4, 0, 863796, 2, 'L', 'G2_Q0004', 'Bạn bao nhiêu tuổi ?', '', '', 'N', 'N', 3, 'vi', 0, 0, '1'),
	(5, 0, 863796, 2, 'L', 'G2_Q0002', 'Giới tính của bạn ?', '', '', 'N', 'N', 1, 'vi', 0, 0, '1'),
	(6, 0, 863796, 1, '!', 'G1_Q0003', 'Bạn đang sống ở quận nào ? <span style="font-size:11px;"><span style="color: rgb(128, 128, 128);"><em>( khu vực Hà Nội )</em></span></span>', '', 'Chọn quận nơi bạn đang sinh sống', 'N', 'Y', 2, 'vi', 0, 0, '1'),
	(7, 0, 863796, 1, 'M', 'G1_Q0002', 'Bạn thường xem thể loại tin tức gì ? ', '', '', 'Y', 'Y', 1, 'vi', 0, 0, '1'),
	(8, 0, 863796, 2, 'M', 'G2_Q0005', 'Bạn sử dụng thiết bị gì để truy cập mạng ?', '', '', 'Y', 'N', 4, 'vi', 0, 0, '1'),
	(9, 0, 863796, 2, 'L', 'G2_Q0006', 'Bạn có hay truy cập mạng mọi nơi không?', '', '', 'N', 'N', 5, 'vi', 0, 0, '1'),
	(10, 0, 863796, 2, '!', 'G2_Q0007', 'Công việc của bạn có phụ thuộc hoàn toàn vào mạng không ?', '', '', 'N', 'N', 6, 'vi', 0, 0, '1'),
	(11, 1, 863796, 1, 'T', 'SQ001', 'Văn bản (báo, truyện, ...)', NULL, NULL, 'N', 'N', 1, 'vi', 0, 0, NULL),
	(12, 1, 863796, 1, 'T', 'SQ001', '6h-8h', NULL, NULL, 'N', 'N', 1, 'vi', 1, 0, NULL),
	(13, 1, 863796, 1, 'T', 'SQ002', 'Hình ảnh ', NULL, NULL, 'N', 'N', 2, 'vi', 0, 0, NULL),
	(14, 1, 863796, 1, 'T', 'SQ003', 'Audio (nhạc,radio...)', NULL, NULL, 'N', 'N', 3, 'vi', 0, 0, NULL),
	(15, 1, 863796, 1, 'T', 'SQ004', 'Video (Clip, phim,...)', NULL, NULL, 'N', 'N', 4, 'vi', 0, 0, NULL),
	(16, 1, 863796, 1, 'T', 'SQ002', '8h-10h', NULL, NULL, 'N', 'N', 2, 'vi', 1, 0, NULL),
	(17, 1, 863796, 1, 'T', 'SQ003', '10h-12h', NULL, NULL, 'N', 'N', 3, 'vi', 1, 0, NULL),
	(18, 1, 863796, 1, 'T', 'SQ004', '12h-13h', NULL, NULL, 'N', 'N', 4, 'vi', 1, 0, NULL),
	(19, 1, 863796, 1, 'T', 'SQ005', '13h-15h', NULL, NULL, 'N', 'N', 5, 'vi', 1, 0, NULL),
	(20, 1, 863796, 1, 'T', 'SQ006', '15h-17h', NULL, NULL, 'N', 'N', 6, 'vi', 1, 0, NULL),
	(21, 1, 863796, 1, 'T', 'SQ007', '17h-20h', NULL, NULL, 'N', 'N', 7, 'vi', 1, 0, NULL),
	(22, 1, 863796, 1, 'T', 'SQ008', '20h-22h', NULL, NULL, 'N', 'N', 8, 'vi', 1, 0, NULL),
	(23, 1, 863796, 1, 'T', 'SQ009', '22h-24h', NULL, NULL, 'N', 'N', 9, 'vi', 1, 0, NULL),
	(24, 1, 863796, 1, 'T', 'SQ010', '0h-3h', NULL, NULL, 'N', 'N', 10, 'vi', 1, 0, NULL),
	(25, 1, 863796, 1, 'T', 'SQ011', '3h-6h', NULL, NULL, 'N', 'N', 11, 'vi', 1, 0, NULL),
	(26, 7, 863796, 1, 'T', '1', 'Xã Hội', NULL, NULL, 'N', 'N', 1, 'vi', 0, 0, NULL),
	(27, 7, 863796, 1, 'T', '2', 'Thể Thao', NULL, NULL, 'N', 'N', 2, 'vi', 0, 0, NULL),
	(28, 7, 863796, 1, 'T', '3', 'Văn Hóa', NULL, NULL, 'N', 'N', 3, 'vi', 0, 0, NULL),
	(29, 7, 863796, 1, 'T', '4', 'Giải trí', NULL, NULL, 'N', 'N', 4, 'vi', 0, 0, NULL),
	(30, 7, 863796, 1, 'T', '5', 'Chính trị', NULL, NULL, 'N', 'N', 5, 'vi', 0, 0, NULL),
	(31, 7, 863796, 1, 'T', '6', 'Quốc tế', NULL, NULL, 'N', 'N', 6, 'vi', 0, 0, NULL),
	(32, 7, 863796, 1, 'T', '7', 'Khoa Học', NULL, NULL, 'N', 'N', 7, 'vi', 0, 0, NULL),
	(33, 7, 863796, 1, 'T', '8', 'Giáo Dục', NULL, NULL, 'N', 'N', 8, 'vi', 0, 0, NULL),
	(34, 7, 863796, 1, 'T', '9', 'Kinh Tế', NULL, NULL, 'N', 'N', 9, 'vi', 0, 0, NULL),
	(35, 7, 863796, 1, 'T', '10', 'Sức Khỏe', NULL, NULL, 'N', 'N', 10, 'vi', 0, 0, NULL),
	(36, 7, 863796, 1, 'T', '11', 'Công Nghệ', NULL, NULL, 'N', 'N', 11, 'vi', 0, 0, NULL),
	(37, 8, 863796, 2, 'T', '1', 'Máy tính để bàn (desktop)', NULL, NULL, 'N', 'N', 1, 'vi', 0, 0, NULL),
	(38, 8, 863796, 2, 'T', '2', 'Máy tính xách tay (laptop)', NULL, NULL, 'N', 'N', 2, 'vi', 0, 0, NULL),
	(39, 8, 863796, 2, 'T', '3', 'Điện thoại di động', NULL, NULL, 'N', 'N', 3, 'vi', 0, 0, NULL),
	(40, 8, 863796, 2, 'T', '4', 'Máy tính bảng', NULL, NULL, 'N', 'N', 4, 'vi', 0, 0, NULL);
/*!40000 ALTER TABLE `lime_questions` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_question_attributes
DROP TABLE IF EXISTS `lime_question_attributes`;
CREATE TABLE IF NOT EXISTS `lime_question_attributes` (
  `qaid` int(11) NOT NULL AUTO_INCREMENT,
  `qid` int(11) NOT NULL DEFAULT '0',
  `attribute` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `language` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`qaid`),
  KEY `question_attributes_idx2` (`qid`),
  KEY `question_attributes_idx3` (`attribute`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_question_attributes: 3 rows
/*!40000 ALTER TABLE `lime_question_attributes` DISABLE KEYS */;
REPLACE INTO `lime_question_attributes` (`qaid`, `qid`, `attribute`, `value`, `language`) VALUES
	(1, 1, 'min_answers', '1', NULL),
	(2, 1, 'multiflexible_checkbox', '1', NULL),
	(4, 7, 'display_columns', '3', NULL);
/*!40000 ALTER TABLE `lime_question_attributes` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_quota
DROP TABLE IF EXISTS `lime_quota`;
CREATE TABLE IF NOT EXISTS `lime_quota` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `qlimit` int(11) DEFAULT NULL,
  `action` int(11) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `autoload_url` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `quota_idx2` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_quota: 0 rows
/*!40000 ALTER TABLE `lime_quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_quota` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_quota_languagesettings
DROP TABLE IF EXISTS `lime_quota_languagesettings`;
CREATE TABLE IF NOT EXISTS `lime_quota_languagesettings` (
  `quotals_id` int(11) NOT NULL AUTO_INCREMENT,
  `quotals_quota_id` int(11) NOT NULL DEFAULT '0',
  `quotals_language` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `quotals_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quotals_message` text COLLATE utf8_unicode_ci NOT NULL,
  `quotals_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quotals_urldescrip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`quotals_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_quota_languagesettings: 0 rows
/*!40000 ALTER TABLE `lime_quota_languagesettings` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_quota_languagesettings` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_quota_members
DROP TABLE IF EXISTS `lime_quota_members`;
CREATE TABLE IF NOT EXISTS `lime_quota_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) DEFAULT NULL,
  `qid` int(11) DEFAULT NULL,
  `quota_id` int(11) DEFAULT NULL,
  `code` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sid` (`sid`,`qid`,`quota_id`,`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_quota_members: 0 rows
/*!40000 ALTER TABLE `lime_quota_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_quota_members` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_saved_control
DROP TABLE IF EXISTS `lime_saved_control`;
CREATE TABLE IF NOT EXISTS `lime_saved_control` (
  `scid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL DEFAULT '0',
  `srid` int(11) NOT NULL DEFAULT '0',
  `identifier` text COLLATE utf8_unicode_ci NOT NULL,
  `access_code` text COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip` text COLLATE utf8_unicode_ci NOT NULL,
  `saved_thisstep` text COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `saved_date` datetime NOT NULL,
  `refurl` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`scid`),
  KEY `saved_control_idx2` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_saved_control: 0 rows
/*!40000 ALTER TABLE `lime_saved_control` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_saved_control` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_sessions
DROP TABLE IF EXISTS `lime_sessions`;
CREATE TABLE IF NOT EXISTS `lime_sessions` (
  `id` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_sessions: 0 rows
/*!40000 ALTER TABLE `lime_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_sessions` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_settings_global
DROP TABLE IF EXISTS `lime_settings_global`;
CREATE TABLE IF NOT EXISTS `lime_settings_global` (
  `stg_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `stg_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`stg_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_settings_global: 47 rows
/*!40000 ALTER TABLE `lime_settings_global` DISABLE KEYS */;
REPLACE INTO `lime_settings_global` (`stg_name`, `stg_value`) VALUES
	('DBVersion', '163'),
	('SessionName', 'ls996857612254276'),
	('sitename', 'Khảo sát sử dụng internet '),
	('siteadminname', 'Administrator'),
	('siteadminemail', 'hgkhanh@outlook.com'),
	('siteadminbounce', 'hgkhanh@outlook.com'),
	('defaultlang', 'vi'),
	('updateavailable', '0'),
	('updatelastcheck', '2013-02-24 22:20:03'),
	('restrictToLanguages', ''),
	('updatecheckperiod', '7'),
	('defaulthtmleditormode', 'inline'),
	('defaultquestionselectormode', 'default'),
	('defaulttemplateeditormode', 'default'),
	('defaulttemplate', 'default'),
	('admintheme', 'gringegreen'),
	('adminthemeiconsize', '32'),
	('emailmethod', 'mail'),
	('emailsmtphost', ''),
	('emailsmtppassword', ''),
	('bounceaccounthost', ''),
	('bounceaccounttype', 'off'),
	('bounceencryption', ''),
	('bounceaccountuser', ''),
	('bounceaccountpass', ''),
	('emailsmtpssl', ''),
	('emailsmtpdebug', '0'),
	('emailsmtpuser', ''),
	('filterxsshtml', '1'),
	('shownoanswer', '1'),
	('showxquestions', 'choose'),
	('showgroupinfo', 'choose'),
	('showqnumcode', 'choose'),
	('repeatheadings', '25'),
	('maxemails', '50'),
	('iSessionExpirationTime', '28800'),
	('ipInfoDbAPIKey', ''),
	('googleMapsAPIKey', ''),
	('googleanalyticsapikey', ''),
	('googletranslateapikey', ''),
	('force_ssl', 'neither'),
	('surveyPreview_require_Auth', '1'),
	('RPCInterface', 'off'),
	('timeadjust', '+0 hours'),
	('usercontrolSameGroupPolicy', '1'),
	('updatebuild', '121117'),
	('updateversion', '2.00+');
/*!40000 ALTER TABLE `lime_settings_global` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_surveys
DROP TABLE IF EXISTS `lime_surveys`;
CREATE TABLE IF NOT EXISTS `lime_surveys` (
  `sid` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `admin` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `active` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `expires` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `adminemail` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `anonymized` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `faxto` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `savetimings` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `template` varchar(100) COLLATE utf8_unicode_ci DEFAULT 'default',
  `language` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `additional_languages` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `datestamp` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `usecookie` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `allowregister` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `allowsave` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `autonumber_start` int(11) NOT NULL DEFAULT '0',
  `autoredirect` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `allowprev` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `printanswers` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ipaddr` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `refurl` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `datecreated` date DEFAULT NULL,
  `publicstatistics` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `publicgraphs` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `listpublic` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `htmlemail` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `sendconfirmation` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `tokenanswerspersistence` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `assessments` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `usecaptcha` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `usetokens` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `bounce_email` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attributedescriptions` text COLLATE utf8_unicode_ci,
  `emailresponseto` text COLLATE utf8_unicode_ci,
  `emailnotificationto` text COLLATE utf8_unicode_ci,
  `tokenlength` int(11) NOT NULL DEFAULT '15',
  `showxquestions` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `showgroupinfo` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'B',
  `shownoanswer` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `showqnumcode` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'X',
  `bouncetime` int(11) DEFAULT NULL,
  `bounceprocessing` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `bounceaccounttype` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounceaccounthost` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounceaccountpass` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounceaccountencryption` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bounceaccountuser` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `showwelcome` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `showprogress` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `allowjumps` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `navigationdelay` int(11) NOT NULL DEFAULT '0',
  `nokeyboard` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `alloweditaftercompletion` varchar(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `googleanalyticsstyle` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `googleanalyticsapikey` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_surveys: 1 rows
/*!40000 ALTER TABLE `lime_surveys` DISABLE KEYS */;
REPLACE INTO `lime_surveys` (`sid`, `owner_id`, `admin`, `active`, `expires`, `startdate`, `adminemail`, `anonymized`, `faxto`, `format`, `savetimings`, `template`, `language`, `additional_languages`, `datestamp`, `usecookie`, `allowregister`, `allowsave`, `autonumber_start`, `autoredirect`, `allowprev`, `printanswers`, `ipaddr`, `refurl`, `datecreated`, `publicstatistics`, `publicgraphs`, `listpublic`, `htmlemail`, `sendconfirmation`, `tokenanswerspersistence`, `assessments`, `usecaptcha`, `usetokens`, `bounce_email`, `attributedescriptions`, `emailresponseto`, `emailnotificationto`, `tokenlength`, `showxquestions`, `showgroupinfo`, `shownoanswer`, `showqnumcode`, `bouncetime`, `bounceprocessing`, `bounceaccounttype`, `bounceaccounthost`, `bounceaccountpass`, `bounceaccountencryption`, `bounceaccountuser`, `showwelcome`, `showprogress`, `allowjumps`, `navigationdelay`, `nokeyboard`, `alloweditaftercompletion`, `googleanalyticsstyle`, `googleanalyticsapikey`) VALUES
	(863796, 1, 'Nguyễn Hoàng Khanh', 'Y', NULL, NULL, 'hgkhanh@outlook.com', 'Y', '', 'A', 'Y', 'default', 'vi', '', 'Y', 'N', 'N', 'N', 12, 'N', 'N', 'N', 'Y', 'Y', '2012-11-06', 'N', 'N', 'N', 'Y', 'Y', 'N', 'N', 'D', 'N', '', 'a:0:{}', '', '', 15, 'Y', 'B', 'Y', 'X', NULL, 'N', NULL, NULL, NULL, NULL, NULL, 'Y', 'N', 'N', 0, 'N', 'N', '1', '');
/*!40000 ALTER TABLE `lime_surveys` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_surveys_languagesettings
DROP TABLE IF EXISTS `lime_surveys_languagesettings`;
CREATE TABLE IF NOT EXISTS `lime_surveys_languagesettings` (
  `surveyls_survey_id` int(11) NOT NULL,
  `surveyls_language` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `surveyls_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `surveyls_description` text COLLATE utf8_unicode_ci,
  `surveyls_welcometext` text COLLATE utf8_unicode_ci,
  `surveyls_endtext` text COLLATE utf8_unicode_ci,
  `surveyls_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_urldescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_email_invite_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_email_invite` text COLLATE utf8_unicode_ci,
  `surveyls_email_remind_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_email_remind` text COLLATE utf8_unicode_ci,
  `surveyls_email_register_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_email_register` text COLLATE utf8_unicode_ci,
  `surveyls_email_confirm_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `surveyls_email_confirm` text COLLATE utf8_unicode_ci,
  `surveyls_dateformat` int(11) NOT NULL DEFAULT '1',
  `surveyls_attributecaptions` text COLLATE utf8_unicode_ci,
  `email_admin_notification_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_admin_notification` text COLLATE utf8_unicode_ci,
  `email_admin_responses_subj` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_admin_responses` text COLLATE utf8_unicode_ci,
  `surveyls_numberformat` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`surveyls_survey_id`,`surveyls_language`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_surveys_languagesettings: 1 rows
/*!40000 ALTER TABLE `lime_surveys_languagesettings` DISABLE KEYS */;
REPLACE INTO `lime_surveys_languagesettings` (`surveyls_survey_id`, `surveyls_language`, `surveyls_title`, `surveyls_description`, `surveyls_welcometext`, `surveyls_endtext`, `surveyls_url`, `surveyls_urldescription`, `surveyls_email_invite_subj`, `surveyls_email_invite`, `surveyls_email_remind_subj`, `surveyls_email_remind`, `surveyls_email_register_subj`, `surveyls_email_register`, `surveyls_email_confirm_subj`, `surveyls_email_confirm`, `surveyls_dateformat`, `surveyls_attributecaptions`, `email_admin_notification_subj`, `email_admin_notification`, `email_admin_responses_subj`, `email_admin_responses`, `surveyls_numberformat`) VALUES
	(863796, 'vi', 'Thời lượng sử dụng internet', 'Khảo sát về thời gian bạn sử dụng internet và các loại thông tin bạn quan tâm', '<p>\r\n\n	Nhóm nghiên cứu chúng tôi đến từ Toshiba Lab thuộc Đại Học Công Nghệ - Đại Học Quốc Gia Hà Nội. Chúng tôi đang thực hiện một cuộc khảo sát về thời lượng sử dụng internet và các loại thông tin quan tâm ở các lứa tuổi khác nhau. Chúng tôi rất mong nhận được sự hợp tác và giúp đỡ nhiệt tình của quý vị bằng cách trả lời những câu hỏi trong bảng hỏi dưới đây. Mọi thông tin cá nhân của quý vị sẽ được giữ kín và chỉ phục vụ cho mục đích học tập. Xin chân thành cảm ơn!</p>\r\n\n', 'Cám ơn bạn đã dành thời gian.', '', '', 'Invitation to participate in a survey', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Chào {FIRSTNAME}, mời bạn tham gia trả lời khảo sát "{SURVEYNAME}" "{SURVEYDESCRIPTION}" Để tham gia, click vào link phía dưới, Thân, {ADMINNAME} ({ADMINEMAIL}) ---------------------------------------------- Click here to do the survey: {SURVEYURL} Nếu bạn không muốn tham gia khảo sát này nữa và không muốn nhận bất kì thư mời nào, vui lòng click liên kết sau: {OPTOUTURL} If you are blacklisted but want to participate in this survey and want to receive invitations please click the following link: {OPTINURL}</body>\n</html>\n', 'Reminder to participate in a survey', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Chào {FIRSTNAME}, Hiện tại, chúng tôi đã mời bạn tham gia vào một khảo sát. Chúng tôi lưu ý rằng bạn chưa hoàn thành cuộc khảo sát, và muốn nhắc nhở bạn rằng cuộc khảo sát vẫn tồn tại nếu bạn muốn tham gia. Tiêu đề của khảo sát: "{SURVEYNAME}" "{SURVEYDESCRIPTION}" Để tham gia, vui lòng click liên kết bên dưới. Trân trọng, {ADMINNAME} ({ADMINEMAIL}) ---------------------------------------------- Click vào đây để làm khảo sát: {SURVEYURL} Nếu bạn không muốn tham gia khảo sát này nữa và không muốn nhận bất kì thư mời nào, vui lòng click liên kết sau: {OPTOUTURL}</body>\n</html>\n', 'Xác nhận đang kí khảo sát', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Chào {FIRSTNAME}, Bạn, hoặc ai đó sử dụng địa chỉ email của bạn để đăng kí tham gia vào khảo sát có tiêu đề {SURVEYNAME}. Để hoàn thành khảo sát này, click vào URL bên dưới: {SURVEYURL} Nếu bạn có bất kì câu hỏi nào về khảo sát này, hoặc nếu bạn không đăng kí tham gia và nghĩ rằng có lỗi, vui lòng liên hệ {ADMINNAME} qua email ƠADMINEMAIL}.</body>\n</html>\n', 'Confirmation of your participation in our survey', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Dear {FIRSTNAME}, this email is to confirm that you have completed the survey titled {SURVEYNAME} and your response has been saved. Thank you for participating. If you have any further questions about this email, please contact {ADMINNAME} on {ADMINEMAIL}. Sincerely, {ADMINNAME}</body>\n</html>\n', 1, 'a:0:{}', 'Response submission for survey {SURVEYNAME}', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Hello, A new response was submitted for your survey \'{SURVEYNAME}\'. Click the following link to reload the survey: {RELOADURL} Click the following link to see the individual response: {VIEWRESPONSEURL} Click the following link to edit the individual response: {EDITRESPONSEURL} View statistics by clicking here: {STATISTICSURL}</body>\n</html>\n', 'Response submission for survey {SURVEYNAME} with results', '<html>\n	<head>\n		<title></title>\n	</head>\n	<body>\n		Hello, A new response was submitted for your survey \'{SURVEYNAME}\'. Click the following link to reload the survey: {RELOADURL} Click the following link to see the individual response: {VIEWRESPONSEURL} Click the following link to edit the individual response: {EDITRESPONSEURL} View statistics by clicking here: {STATISTICSURL} The following answers were given by the participant: {ANSWERTABLE}</body>\n</html>\n', 0);
/*!40000 ALTER TABLE `lime_surveys_languagesettings` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_survey_863796
DROP TABLE IF EXISTS `lime_survey_863796`;
CREATE TABLE IF NOT EXISTS `lime_survey_863796` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submitdate` datetime DEFAULT NULL,
  `lastpage` int(11) DEFAULT NULL,
  `startlanguage` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `startdate` datetime NOT NULL,
  `datestamp` datetime NOT NULL,
  `ipaddr` text COLLATE utf8_unicode_ci,
  `refurl` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ001_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ002_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ003_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ001` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ002` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ003` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ004` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ005` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ006` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ007` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ008` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ009` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ010` text COLLATE utf8_unicode_ci,
  `863796X1X1SQ004_SQ011` text COLLATE utf8_unicode_ci,
  `863796X1X71` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X72` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X73` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X74` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X75` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X76` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X77` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X78` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X79` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X710` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X711` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X1X7other` text COLLATE utf8_unicode_ci,
  `863796X1X6` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X2` text COLLATE utf8_unicode_ci,
  `863796X2X5` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X3` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X3other` text COLLATE utf8_unicode_ci,
  `863796X2X4` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X81` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X82` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X83` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X84` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X8other` text COLLATE utf8_unicode_ci,
  `863796X2X9` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `863796X2X10` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_survey_863796: 376 rows
/*!40000 ALTER TABLE `lime_survey_863796` DISABLE KEYS */;
REPLACE INTO `lime_survey_863796` (`id`, `submitdate`, `lastpage`, `startlanguage`, `startdate`, `datestamp`, `ipaddr`, `refurl`, `863796X1X1SQ001_SQ001`, `863796X1X1SQ001_SQ002`, `863796X1X1SQ001_SQ003`, `863796X1X1SQ001_SQ004`, `863796X1X1SQ001_SQ005`, `863796X1X1SQ001_SQ006`, `863796X1X1SQ001_SQ007`, `863796X1X1SQ001_SQ008`, `863796X1X1SQ001_SQ009`, `863796X1X1SQ001_SQ010`, `863796X1X1SQ001_SQ011`, `863796X1X1SQ002_SQ001`, `863796X1X1SQ002_SQ002`, `863796X1X1SQ002_SQ003`, `863796X1X1SQ002_SQ004`, `863796X1X1SQ002_SQ005`, `863796X1X1SQ002_SQ006`, `863796X1X1SQ002_SQ007`, `863796X1X1SQ002_SQ008`, `863796X1X1SQ002_SQ009`, `863796X1X1SQ002_SQ010`, `863796X1X1SQ002_SQ011`, `863796X1X1SQ003_SQ001`, `863796X1X1SQ003_SQ002`, `863796X1X1SQ003_SQ003`, `863796X1X1SQ003_SQ004`, `863796X1X1SQ003_SQ005`, `863796X1X1SQ003_SQ006`, `863796X1X1SQ003_SQ007`, `863796X1X1SQ003_SQ008`, `863796X1X1SQ003_SQ009`, `863796X1X1SQ003_SQ010`, `863796X1X1SQ003_SQ011`, `863796X1X1SQ004_SQ001`, `863796X1X1SQ004_SQ002`, `863796X1X1SQ004_SQ003`, `863796X1X1SQ004_SQ004`, `863796X1X1SQ004_SQ005`, `863796X1X1SQ004_SQ006`, `863796X1X1SQ004_SQ007`, `863796X1X1SQ004_SQ008`, `863796X1X1SQ004_SQ009`, `863796X1X1SQ004_SQ010`, `863796X1X1SQ004_SQ011`, `863796X1X71`, `863796X1X72`, `863796X1X73`, `863796X1X74`, `863796X1X75`, `863796X1X76`, `863796X1X77`, `863796X1X78`, `863796X1X79`, `863796X1X710`, `863796X1X711`, `863796X1X7other`, `863796X1X6`, `863796X2X2`, `863796X2X5`, `863796X2X3`, `863796X2X3other`, `863796X2X4`, `863796X2X81`, `863796X2X82`, `863796X2X83`, `863796X2X84`, `863796X2X8other`, `863796X2X9`, `863796X2X10`) VALUES
	(12, NULL, 1, 'vi', '2012-11-06 08:33:25', '2012-11-06 08:33:25', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, '2012-11-06 08:36:37', 1, 'vi', '2012-11-06 08:33:00', '2012-11-06 08:36:37', '113.190.49.90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, 'Y', 'Y', NULL, 'Y', NULL, 'Y', NULL, NULL, NULL, NULL, 'Y', NULL, '1', 'Chuong Duong', NULL, '1', NULL, '2', NULL, 'Y', 'Y', NULL, NULL, '1', '2'),
	(14, NULL, NULL, 'vi', '2012-11-06 03:17:20', '2012-11-06 03:17:20', '74.125.16.210', 'http://www.google.com/search', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, NULL, 'vi', '2012-11-06 03:17:53', '2012-11-06 03:17:53', '69.63.190.247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2012-11-06 03:05:30', 2, 'vi', '2012-11-06 03:03:50', '2012-11-06 03:05:30', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/survey/index/sid/863796/newtest/Y/lang/vi', NULL, NULL, NULL, NULL, '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, '4', NULL, '2', '1', NULL, '2', NULL, 'Y', NULL, NULL, NULL, NULL, NULL),
	(17, '2012-11-06 03:16:55', 1, 'vi', '2012-11-06 03:12:58', '2012-11-06 03:16:55', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/admin/quotas/index/surveyid/863796', NULL, '1', NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', NULL, NULL, NULL, 'Y', 'Y', 'Y', NULL, 'Y', 'Y', 'Y', 'Y', 'Y', NULL, '5', NULL, '2', '2', NULL, '2', NULL, 'Y', 'Y', NULL, NULL, '2', '2'),
	(18, '2012-11-06 03:00:54', 2, 'vi', '2012-11-06 02:59:51', '2012-11-06 03:00:54', '222.252.109.171', 'http://limesurvey.freevnn.com/ls/index.php/survey/index/sid/863796/newtest/Y/lang/vi', '0', '1', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, '1', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, 'Y', 'Y', NULL, 'Y', NULL, 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, '3', 'La Thành', '1', '1', NULL, '2', 'Y', 'Y', 'Y', NULL, NULL, '1', '4'),
	(19, NULL, 1, 'vi', '2012-11-06 08:24:05', '2012-11-06 08:24:05', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(20, NULL, NULL, 'vi', '2012-11-06 08:23:02', '2012-11-06 08:23:02', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(21, '2012-11-06 07:40:15', 1, 'vi', '2012-11-06 07:34:57', '2012-11-06 07:40:15', '222.252.109.171', NULL, NULL, '1', '1', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, 'Y', 'Y', NULL, NULL, NULL, 'Y', NULL, 'Y', NULL, NULL, '3', NULL, '2', '2', NULL, '4', 'Y', 'Y', NULL, NULL, NULL, '2', '2'),
	(22, NULL, 1, 'vi', '2012-11-06 08:34:19', '2012-11-06 08:34:19', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, NULL, 1, 'vi', '2012-11-06 08:36:52', '2012-11-06 08:36:52', '113.190.49.90', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, NULL, NULL, 'vi', '2012-11-06 08:57:30', '2012-11-06 08:57:30', '69.63.190.247', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, NULL, 1, 'vi', '2012-11-06 08:57:46', '2012-11-06 08:57:46', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, NULL, NULL, 'vi', '2012-11-06 08:58:13', '2012-11-06 08:58:13', '42.113.89.136', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, NULL, 'vi', '2012-11-06 09:01:19', '2012-11-06 09:01:19', '123.16.133.180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, NULL, NULL, 'vi', '2012-11-06 09:01:23', '2012-11-06 09:01:23', '1.55.91.117', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, NULL, NULL, 'vi', '2012-11-06 09:01:31', '2012-11-06 09:01:31', '118.71.217.167', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, NULL, NULL, 'vi', '2012-11-06 09:01:33', '2012-11-06 09:01:33', '42.114.70.142', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=VAQGpKEG-AQHrmWTcWCvVgVMDo7US5ZpjbZH_aTiNxafhWg&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(31, '2012-11-06 09:06:33', 1, 'vi', '2012-11-06 09:01:36', '2012-11-06 09:06:33', '113.190.201.88', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, '3', 'Nguyễn Trãi', '1', '1', NULL, '2', 'Y', NULL, NULL, NULL, NULL, '2', '4'),
	(32, NULL, NULL, 'vi', '2012-11-06 09:02:00', '2012-11-06 09:02:00', '222.252.107.128', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(33, NULL, NULL, 'vi', '2012-11-06 09:02:35', '2012-11-06 09:02:35', '222.254.11.238', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(34, NULL, 1, 'vi', '2012-11-06 09:04:07', '2012-11-06 09:04:07', '222.252.109.171', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(35, '2012-11-06 09:12:43', 1, 'vi', '2012-11-06 09:11:06', '2012-11-06 09:12:43', '65.49.14.89', 'https://www.facebook.com/', NULL, NULL, '1', NULL, NULL, '1', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, '1', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Y', NULL, '9', NULL, '1', '1', NULL, '2', 'Y', NULL, NULL, NULL, NULL, '1', '3'),
	(36, NULL, NULL, 'vi', '2012-11-06 09:14:45', '2012-11-06 09:14:45', '113.181.38.37', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, '2012-11-06 09:16:56', 1, 'vi', '2012-11-06 09:14:51', '2012-11-06 09:16:56', '183.81.17.91', NULL, '1', NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 'Y', NULL, 'Y', NULL, NULL, 'Y', NULL, '4', NULL, '1', '1', NULL, '2', 'Y', NULL, NULL, NULL, NULL, '1', NULL),
	(38, NULL, NULL, 'vi', '2012-11-06 09:15:32', '2012-11-06 09:15:32', '183.81.61.234', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(39, '2012-11-06 09:30:28', 1, 'vi', '2012-11-06 09:28:52', '2012-11-06 09:30:28', '58.187.65.184', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=ZAQH2q-6QAQFmfFaKtQ9-lEoUnHlRmfBfd1GDKfFT4OprUQ&s=1', NULL, '1', NULL, NULL, '1', '1', NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, NULL, 'Y', NULL, '5', NULL, '1', '1', NULL, '2', NULL, 'Y', NULL, NULL, NULL, '1', '3'),
	(40, NULL, NULL, 'vi', '2012-11-06 09:32:06', '2012-11-06 09:32:06', '183.81.19.26', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(41, NULL, NULL, 'vi', '2012-11-06 09:32:08', '2012-11-06 09:32:08', '183.81.19.26', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(42, NULL, NULL, 'vi', '2012-11-06 09:35:44', '2012-11-06 09:35:44', '113.190.191.31', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=WAQECta_IAQGx7VdtFr_KcExewZ4vGb5fgy37QXNAESTeRw&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(43, NULL, NULL, 'vi', '2012-11-06 09:37:47', '2012-11-06 09:37:47', '183.81.10.173', 'http://www.facebook.com/groups/khoacntt/419019958153722/?ref=notif&notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, NULL, 1, 'vi', '2012-11-06 09:46:08', '2012-11-06 09:46:08', '113.190.201.88', 'http://www.facebook.com/groups/khoacntt/419019958153722/?comment_id=419032864819098&notif_t=group_comment_reply', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(45, '2012-11-06 09:53:09', 1, 'vi', '2012-11-06 09:51:28', '2012-11-06 09:53:09', '183.81.19.26', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 'Y', NULL, '14', 'Phú Đô', '1', '1', NULL, '2', NULL, 'Y', 'Y', NULL, NULL, '2', '2'),
	(46, NULL, 1, 'vi', '2012-11-06 09:52:14', '2012-11-06 09:52:14', '113.190.201.88', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(47, NULL, NULL, 'vi', '2012-11-06 10:01:04', '2012-11-06 10:01:04', '183.81.56.200', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(48, NULL, NULL, 'vi', '2012-11-06 10:07:18', '2012-11-06 10:07:18', '1.55.8.162', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(49, NULL, NULL, 'vi', '2012-11-06 10:14:30', '2012-11-06 10:14:30', '117.6.99.24', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(50, '2012-11-06 10:24:23', 1, 'vi', '2012-11-06 10:22:38', '2012-11-06 10:24:23', '123.24.197.109', 'https://www.facebook.com/', '1', '1', '1', NULL, NULL, '1', '1', '1', '1', NULL, NULL, '1', '1', '1', NULL, NULL, '1', '1', '1', '1', NULL, NULL, '1', '1', '1', NULL, NULL, '1', '1', '1', '1', NULL, NULL, '0', NULL, NULL, NULL, NULL, '1', '1', '1', '1', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, '5', NULL, '1', '1', NULL, '1', NULL, 'Y', 'Y', NULL, NULL, '1', '3'),
	(51, NULL, NULL, 'vi', '2012-11-06 10:57:15', '2012-11-06 10:57:15', '42.113.67.173', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, NULL, NULL, 'vi', '2012-11-06 11:05:03', '2012-11-06 11:05:03', '183.81.115.229', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=bAQEBkLZAAQGUPLR5_HdUtqrkFdpK0e0PyO65q6LWh7ke8Q&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, NULL, NULL, 'vi', '2012-11-06 11:15:21', '2012-11-06 11:15:21', '123.24.164.78', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(54, '2012-11-06 11:31:08', 1, 'vi', '2012-11-06 11:28:42', '2012-11-06 11:31:08', '113.185.1.180', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=dAQFFkzqH&s=1', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '', 'Y', '', '', '2', 'Vạn Phúc', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(55, NULL, 1, 'vi', '2012-11-06 12:05:20', '2012-11-06 12:05:20', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(56, NULL, NULL, 'vi', '2012-11-06 12:07:04', '2012-11-06 12:07:04', '1.55.91.78', 'http://www.facebook.com/groups/khoacntt/419019958153722/?ref=notif&notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, NULL, 1, 'vi', '2012-11-06 12:31:38', '2012-11-06 12:31:38', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(58, NULL, NULL, 'vi', '2012-11-06 12:32:16', '2012-11-06 12:32:16', '65.52.0.56', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, NULL, NULL, 'vi', '2012-11-06 12:33:43', '2012-11-06 12:33:43', '42.114.1.124', 'http://www.facebook.com/neonguyen.uet/posts/463187590390734?notif_t=close_friend_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, NULL, NULL, 'vi', '2012-11-06 12:34:03', '2012-11-06 12:34:03', '1.55.109.53', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(61, NULL, NULL, 'vi', '2012-11-06 12:34:33', '2012-11-06 12:34:33', '1.55.92.110', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, NULL, NULL, 'vi', '2012-11-06 12:43:59', '2012-11-06 12:43:59', '58.187.119.35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(63, NULL, 1, 'vi', '2012-11-06 14:10:47', '2012-11-06 14:10:47', '1.55.90.72', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(64, NULL, NULL, 'vi', '2012-11-06 22:07:11', '2012-11-06 22:07:11', '42.118.255.15', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(65, NULL, NULL, 'vi', '2012-11-06 22:12:38', '2012-11-06 22:12:38', '74.125.16.219', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(66, NULL, NULL, 'vi', '2012-11-06 22:28:37', '2012-11-06 22:28:37', '82.145.208.15', 'http://m.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=GAQGXm7GM&enc=AZMEDNCr7SEcZAz50xWCXh2plWy-w01Q4SbDC34Sd6pofoYbvWEodE_A-Bi_rNhR_f356VrWSNsI0dwNkuNyovBNFgWdT4nuKfDUX0gHpg4NkUpyuCEaWCTk-HHSHeSdZmjZdqzOxlY3__TLu8G5-ZTLLra3HIGqO6m3jEBbDC35FTiqavxtuCRcwJ34sfdUHNmqGJLBLWHqUjSpyD9gGFTbqDSwl4zaDXOhSfjfZuo1cFxtqu6Rf_dU-6SV0W9kd_QUXssa-emJfII2Tc1tVb5HGOY8ClTkAy0gW2ZBgkzcD-7J1rYK0TB2wIWEXoC6eylC527ga-u3jbC7dRNLxRaF&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(67, '2012-11-06 23:56:45', 1, 'vi', '2012-11-06 23:53:33', '2012-11-06 23:56:45', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=IAQFUaCa7', NULL, '1', '1', '1', '1', '1', '0', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', 'Y', NULL, 'Y', 'Y', 'Y', NULL, 'Y', 'Y', NULL, '14', 'Đường 32', '1', '1', NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, '2', '3'),
	(68, '2012-11-06 23:56:34', 1, 'vi', '2012-11-06 23:53:45', '2012-11-06 23:56:34', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=6AQHs5ACU', NULL, NULL, NULL, NULL, '1', '1', '1', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', NULL, NULL, NULL, 'Y', 'Y', NULL, 'Y', NULL, '14', 'Cổ Nhuế', '2', '1', NULL, '5', 'Y', 'Y', 'Y', NULL, NULL, '1', '3'),
	(69, NULL, NULL, 'vi', '2012-11-07 06:40:51', '2012-11-07 06:40:51', '58.187.172.201', 'http://www.facebook.com/groups/khoacntt/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(70, NULL, 1, 'vi', '2012-11-07 07:26:23', '2012-11-07 07:28:42', '183.81.34.21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', NULL, 'Y', 'Y', NULL, 'Y', 'Y', NULL, '4', 'Phạm Văn Đồng', '1', '1', NULL, '2', 'Y', NULL, NULL, NULL, NULL, '1', '1'),
	(71, NULL, NULL, 'vi', '2012-11-07 08:46:55', '2012-11-07 08:46:55', '69.171.248.5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(72, NULL, NULL, 'vi', '2012-11-07 08:47:08', '2012-11-07 08:47:08', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(73, NULL, 1, 'vi', '2012-11-07 08:49:28', '2012-11-07 08:49:28', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(74, NULL, NULL, 'vi', '2012-11-07 08:49:35', '2012-11-07 08:49:35', '69.63.190.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, NULL, 1, 'vi', '2012-11-07 08:51:46', '2012-11-07 08:51:46', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(76, '2012-11-07 08:56:47', 1, 'vi', '2012-11-07 08:52:20', '2012-11-07 08:56:47', '58.187.78.192', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 'Y', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, 'Y', NULL, 'Y', NULL, '3', NULL, '2', '-oth-', 'Kinh doanh', '2', NULL, 'Y', 'Y', NULL, NULL, '1', '4'),
	(77, NULL, 1, 'vi', '2012-11-07 08:53:09', '2012-11-07 08:53:09', '222.252.101.246', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=_AQEq_Ji-&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(78, NULL, NULL, 'vi', '2012-11-07 08:57:36', '2012-11-07 08:57:36', '69.63.190.251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, NULL, 1, 'vi', '2012-11-07 08:57:38', '2012-11-07 08:57:38', '222.252.101.246', 'http://www.facebook.com/l.php?u=http%3A%2F%2Ftinyurl.com%2Fapg6xh3&h=RAQH6sf3g', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(80, NULL, NULL, 'vi', '2012-11-07 09:37:30', '2012-11-07 09:37:30', '1.55.90.87', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(81, '2012-11-07 09:58:24', 1, 'vi', '2012-11-07 09:56:32', '2012-11-07 09:58:24', '222.252.101.246', NULL, NULL, '1', '1', NULL, '1', '1', NULL, '1', '0', NULL, NULL, NULL, '1', '1', NULL, '1', '1', NULL, '1', '0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, 'Y', NULL, 'Y', NULL, 'Y', 'Y', NULL, NULL, 'Y', NULL, NULL, 'Phong Thuỷ', '3', 'Tây Sơn', '1', '3', NULL, '4', 'Y', 'Y', 'Y', NULL, NULL, '1', '2'),
	(82, '2012-11-07 10:02:59', 1, 'vi', '2012-11-07 10:00:10', '2012-11-07 10:02:59', '113.178.36.183', NULL, '0', '0', NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', NULL, '7', NULL, NULL, NULL, NULL, NULL, 'Y', 'Y', 'Y', NULL, NULL, '1', '3'),
	(83, '2012-11-07 10:09:12', 1, 'vi', '2012-11-07 10:02:48', '2012-11-07 10:09:12', '113.190.223.5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '0', '1', '1', '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, '1', '1', '1', '1', '1', NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '4', 'Dich Vong', '1', '1', NULL, '2', 'Y', 'Y', 'Y', 'Y', NULL, '1', '3'),
	(84, NULL, 1, 'vi', '2012-11-07 10:09:56', '2012-11-07 10:09:56', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(85, NULL, 1, 'vi', '2012-11-07 10:10:02', '2012-11-07 10:10:02', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, NULL, 1, 'vi', '2012-11-07 10:11:21', '2012-11-07 10:11:21', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(87, NULL, NULL, 'vi', '2012-11-07 10:11:34', '2012-11-07 10:11:34', '67.159.56.165', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, NULL, 1, 'vi', '2012-11-07 10:15:13', '2012-11-07 10:15:13', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(89, '2012-11-07 10:20:30', 1, 'vi', '2012-11-07 10:16:28', '2012-11-07 10:20:30', '113.190.62.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', 'Y', 'Y', NULL, 'Y', NULL, 'Y', NULL, NULL, NULL, NULL, 'Y', NULL, '6', 'Bạch Mai', '2', '1', NULL, '2', NULL, 'Y', NULL, NULL, NULL, '1', '3'),
	(90, NULL, 1, 'vi', '2012-11-07 10:32:12', '2012-11-07 10:32:12', '222.252.101.246', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(91, NULL, NULL, 'vi', '2012-11-07 10:37:00', '2012-11-07 10:37:00', '118.71.146.187', 'http://www.facebook.com/neonguyen.uet?fref=ts', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(92, '2012-11-07 10:42:47', 1, 'vi', '2012-11-07 10:37:11', '2012-11-07 10:42:47', '118.71.146.187', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, 'Y', NULL, NULL, 'Y', NULL, 'Y', NULL, NULL, 'Y', NULL, NULL, NULL, '3', NULL, '2', '1', NULL, '2', NULL, 'Y', NULL, NULL, NULL, '2', '3'),
	(93, '2012-11-07 10:46:27', 1, 'vi', '2012-11-07 10:44:36', '2012-11-07 10:46:27', '117.4.43.235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, 'Y', NULL, 'Y', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '5', 'Hoàng Văn Thái', '1', '1', NULL, '2', 'Y', NULL, NULL, NULL, NULL, '2', '1'),
	(94, NULL, NULL, 'vi', '2012-11-07 10:45:20', '2012-11-07 10:45:20', '113.22.90.147', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(95, NULL, NULL, 'vi', '2012-11-07 10:57:00', '2012-11-07 10:57:00', '123.24.130.211', 'http://www.facebook.com/groups/khoacntt/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, NULL, 1, 'vi', '2012-11-07 11:25:53', '2012-11-07 11:25:53', '1.55.91.46', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(97, NULL, NULL, 'vi', '2012-11-07 11:31:08', '2012-11-07 11:31:08', '183.81.17.235', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(98, '2012-11-07 21:07:52', 1, 'vi', '2012-11-07 21:05:08', '2012-11-07 21:07:52', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=JAQHjUQ4rAQESh--m_09lxiW20YjUO_Hs-i-nHbcGCgK1LQ&s=1', '1', NULL, NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', NULL, NULL, '1', NULL, NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Y', NULL, NULL, NULL, NULL, 'Y', NULL, '14', 'Đức Diễn', '1', '1', NULL, '2', NULL, 'Y', 'Y', 'Y', NULL, '1', '3'),
	(99, NULL, 1, 'vi', '2012-11-07 21:08:03', '2012-11-07 21:08:03', '203.113.130.216', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=JAQHjUQ4rAQESh--m_09lxiW20YjUO_Hs-i-nHbcGCgK1LQ&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(100, NULL, NULL, 'vi', '2012-11-08 02:25:13', '2012-11-08 02:25:13', '123.16.133.180', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(101, '2012-11-08 02:45:57', 1, 'vi', '2012-11-08 02:45:03', '2012-11-08 02:45:57', '222.252.107.251', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=YAQFmgjDwAQGapGc3sZ1ofp5qvDy8ZCFp_4wvQAn6yClrVw&s=1', '', '1', '1', '1', '', '1', '1', '', '', '', '', '', '1', '1', '1', '', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', 'Y', '', '', '', '', '', '', 'Y', '', '4', '', '1', '1', '', '2', '', 'Y', '', '', '', '2', '1'),
	(102, NULL, NULL, 'vi', '2012-11-08 05:26:24', '2012-11-08 05:26:24', '183.81.115.128', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, NULL, NULL, 'vi', '2012-11-08 06:21:26', '2012-11-08 06:21:26', '123.16.52.3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(104, NULL, NULL, 'vi', '2012-11-08 08:17:31', '2012-11-08 08:17:31', '1.55.104.39', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(105, NULL, 1, 'vi', '2012-11-08 08:23:34', '2012-11-08 08:23:34', '222.252.107.251', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(106, NULL, NULL, 'vi', '2012-11-08 09:34:52', '2012-11-08 09:34:52', '113.190.220.163', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=DAQFJDx0eAQGnZfr82Rlsp8nWcCxA0pFRWwJ_yggpH13p1Q&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(107, '2012-11-08 10:45:10', 1, 'vi', '2012-11-08 10:41:32', '2012-11-08 10:45:10', '123.16.85.198', NULL, '0', '1', '1', '', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '1', '', '', '1', '1', '1', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', '', '', 'Y', '', '', 'Y', 'Y', '', '9', '', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(108, NULL, NULL, 'vi', '2012-11-08 10:49:33', '2012-11-08 10:49:33', '183.81.58.112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(109, NULL, NULL, 'vi', '2012-11-08 10:57:32', '2012-11-08 10:57:32', '113.190.26.65', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=JAQF0yP00AQFgIwPB4Tv8_10MUtuoqXhM3R6dKwQi6eUChw&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(110, NULL, NULL, 'vi', '2012-11-08 12:45:05', '2012-11-08 12:45:05', '208.80.194.149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(111, NULL, NULL, 'vi', '2012-11-08 12:59:12', '2012-11-08 12:59:12', '1.55.91.190', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(112, NULL, NULL, 'vi', '2012-11-08 20:50:07', '2012-11-08 20:50:07', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(113, NULL, NULL, 'vi', '2012-11-08 20:56:25', '2012-11-08 20:56:25', '113.190.91.17', 'http://www.facebook.com/groups/khoacntt/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(114, '2012-11-08 21:00:00', 1, 'vi', '2012-11-08 20:56:43', '2012-11-08 21:00:00', '203.113.130.216', NULL, '', '1', '1', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', 'Y', '', '', '', '', '2', '3'),
	(115, NULL, 1, 'vi', '2012-11-08 21:00:53', '2012-11-08 21:00:53', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(116, NULL, 1, 'vi', '2012-11-08 21:17:03', '2012-11-08 21:17:03', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(117, NULL, 1, 'vi', '2012-11-08 21:18:21', '2012-11-08 21:18:21', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(118, NULL, 1, 'vi', '2012-11-08 21:19:18', '2012-11-08 21:19:18', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(119, '2012-11-08 21:42:58', 1, 'vi', '2012-11-08 21:39:12', '2012-11-08 21:42:58', '203.113.130.216', NULL, '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '', 'Y', '', '4', 'Mai Dịch', '1', '1', '', '2', 'Y', 'Y', '', '', '', '', '4'),
	(120, '2012-11-08 21:45:17', 1, 'vi', '2012-11-08 21:43:09', '2012-11-08 21:45:17', '203.113.130.216', NULL, '1', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '1', '', '', '', '1', '1', '', '', '', '', '', '1', '', '', '', '1', '1', '1', '', 'Y', 'Y', '', 'Y', 'Y', '', '', '', '', '', 'Y', '', '10', 'Ngô Thì Nhậm', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(121, '2012-11-08 21:48:07', 1, 'vi', '2012-11-08 21:45:25', '2012-11-08 21:48:07', '203.113.130.216', NULL, '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', 'Y', '', '', 'Y', 'Y', '', '', '', '', '', 'Y', '', '14', 'Cổ Nhuế', '1', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(122, '2012-11-08 21:49:40', 1, 'vi', '2012-11-08 21:48:11', '2012-11-08 21:49:40', '203.113.130.216', NULL, '', '', '', '', '0', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', 'Y', '', '', '', '', '', '', '', '', '', '', '14', 'Phạm Hùng', '1', '1', '', '2', '', 'Y', '', '', '', '', ''),
	(123, '2012-11-08 21:52:02', 1, 'vi', '2012-11-08 21:49:50', '2012-11-08 21:52:02', '203.113.130.216', NULL, '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', 'Y', '', 'Y', '', 'Y', '', '', '', '4', 'Phạm văn đồng', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '2', '3'),
	(124, '2012-11-08 21:55:34', 1, 'vi', '2012-11-08 21:52:29', '2012-11-08 21:55:34', '203.113.130.216', NULL, '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '', 'Y', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(125, NULL, 1, 'vi', '2012-11-08 21:57:03', '2012-11-08 21:57:03', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(126, NULL, 1, 'vi', '2012-11-08 21:57:32', '2012-11-08 21:57:32', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(127, NULL, 1, 'vi', '2012-11-08 21:57:36', '2012-11-08 21:57:36', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(128, NULL, 1, 'vi', '2012-11-08 21:57:49', '2012-11-08 21:57:49', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, NULL, 1, 'vi', '2012-11-08 22:01:30', '2012-11-08 22:01:30', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(130, NULL, 1, 'vi', '2012-11-08 22:52:02', '2012-11-08 22:52:02', '222.252.111.241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(131, NULL, 1, 'vi', '2012-11-08 23:02:01', '2012-11-08 23:02:01', '222.252.111.241', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(132, NULL, 1, 'vi', '2012-11-08 23:48:33', '2012-11-08 23:48:33', '101.99.15.98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(133, NULL, NULL, 'vi', '2012-11-09 03:27:40', '2012-11-09 03:27:40', '1.55.91.190', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(134, NULL, NULL, 'vi', '2012-11-09 04:12:36', '2012-11-09 04:12:36', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(135, '2012-11-09 04:21:30', 1, 'vi', '2012-11-09 04:13:03', '2012-11-09 04:21:30', '203.113.130.216', NULL, '1', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', 'Y', 'Thiên văn, quân sự', '4', 'Trần Thái Tông', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(136, NULL, NULL, 'vi', '2012-11-09 07:04:04', '2012-11-09 07:04:04', '208.80.194.149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(137, '2012-11-09 07:42:59', 1, 'vi', '2012-11-09 07:37:46', '2012-11-09 07:42:59', '222.252.108.200', '', '1', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '', '', 'Y', 'Y', '', '', '', '', '', '', '', 'Nhạc, Phim', '4', 'Doãn Kế Thiện', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '4'),
	(138, '2012-11-09 07:46:30', 1, 'vi', '2012-11-09 07:44:26', '2012-11-09 07:46:30', '222.252.108.200', NULL, '', '1', '1', '', '', '', '0', '1', '', '', '', '', '1', '1', '', '', '', '0', '1', '1', '', '', '', '1', '1', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', 'Y', 'Y', '', '', '', '', '', '', '', 'Nhạc, Phim', '14', 'Trần Cung', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '4'),
	(139, '2012-11-09 07:49:44', 1, 'vi', '2012-11-09 07:46:40', '2012-11-09 07:49:44', '222.252.108.200', NULL, '', '1', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '1', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '16', '', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '2'),
	(140, '2012-11-09 07:53:18', 1, 'vi', '2012-11-09 07:49:51', '2012-11-09 07:53:18', '222.252.108.200', NULL, '', '1', '1', '1', '1', '1', '', '', '', '1', '', '', '1', '1', '1', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '1', '1', '', '1', '1', '', '', '', '1', '1', '1', '1', '1', '', '', '', '', '', 'Y', '', 'Y', 'Y', '', '', '', '', '', '', '', 'Nhạc, Phim', '10', 'Đường 70', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '1', '3'),
	(141, '2012-11-09 07:56:26', 1, 'vi', '2012-11-09 07:54:01', '2012-11-09 07:56:26', '222.252.108.200', NULL, '1', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '1', '', '1', '1', '', '', '1', '', '0', '1', '1', '', '1', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Xuân Thuỷ', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '', '3'),
	(142, '2012-11-09 07:59:06', 1, 'vi', '2012-11-09 07:57:11', '2012-11-09 07:59:06', '222.252.108.200', NULL, '', '', '', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '', '', '1', '1', '', '1', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', 'Y', 'Y', '', '', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(143, '2012-11-09 08:14:36', 1, 'vi', '2012-11-09 07:59:14', '2012-11-09 08:14:36', '222.252.108.200', NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Xuân Thuỷ', '1', '1', '', '1', 'Y', '', '', '', '', '2', '2'),
	(144, NULL, NULL, 'vi', '2012-11-09 08:00:42', '2012-11-09 08:00:42', '208.80.194.149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(145, '2012-11-09 08:17:16', 1, 'vi', '2012-11-09 08:14:45', '2012-11-09 08:17:16', '222.252.108.200', NULL, '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '1', '1', '', '1', 'Y', 'Y', 'Y', '', '', '', '3'),
	(146, '2012-11-09 08:18:55', 1, 'vi', '2012-11-09 08:17:22', '2012-11-09 08:18:55', '222.252.108.200', NULL, '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', 'Y', '', '', '', '', '', '', '', '', '16', '', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(147, '2012-11-09 08:21:42', 1, 'vi', '2012-11-09 08:19:58', '2012-11-09 08:21:42', '222.252.108.200', NULL, '', '1', '1', '', '1', '1', '1', '1', '1', '', '', '', '0', '0', '', '1', '1', '1', '1', '1', '', '', '', '1', '1', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', '', '', '', '', '', '', '', '', '', '16', '', '1', '1', '', '2', 'Y', 'Y', '', '', '', '1', '2'),
	(148, NULL, NULL, 'vi', '2012-11-09 08:54:40', '2012-11-09 08:54:40', '69.171.229.115', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(149, '2012-11-09 08:56:35', 1, 'vi', '2012-11-09 08:54:45', '2012-11-09 08:56:35', '42.113.89.136', 'http://www.facebook.com/', '1', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', '', 'Y', '', 'Y', 'Y', '', '', '', 'Y', '', '4', 'Doãn Kế Thiện', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(150, NULL, NULL, 'vi', '2012-11-09 08:54:58', '2012-11-09 08:54:58', '69.171.237.10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(151, NULL, NULL, 'vi', '2012-11-09 08:55:12', '2012-11-09 08:55:12', '42.113.109.143', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(152, NULL, NULL, 'vi', '2012-11-09 08:55:45', '2012-11-09 08:55:45', '123.16.162.192', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(153, NULL, NULL, 'vi', '2012-11-09 08:57:26', '2012-11-09 08:57:26', '65.49.68.190', 'http://www.facebook.com/groups/154982627895457/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(154, '2012-11-09 09:03:01', 1, 'vi', '2012-11-09 08:59:18', '2012-11-09 09:03:01', '85.214.224.23', 'http://www.facebook.com/', '', '', '', '', '1', '', '', '1', '1', '', '', '', '', '', '1', '', '', '0', '1', '0', '', '', '', '', '', '', '1', '', '', '1', '1', '', '', '', '', '', '1', '1', '', '', '', '', '', '', 'Y', '', '', '', '', '', 'Y', 'Y', 'Y', '', '', '', '7', '', '', '', '', '', '', 'Y', '', '', '', '', '3'),
	(155, NULL, NULL, 'vi', '2012-11-09 09:01:50', '2012-11-09 09:01:50', '183.81.18.158', 'http://www.facebook.com/groups/154982627895457/435252276535156/?ref=notif&notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(156, '2012-11-09 09:06:55', 1, 'vi', '2012-11-09 09:03:46', '2012-11-09 09:06:55', '14.160.75.210', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=AAQGv4f5x', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '10', 'Quang Trung', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(157, NULL, NULL, 'vi', '2012-11-09 09:16:09', '2012-11-09 09:16:09', '123.16.250.245', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(158, NULL, NULL, 'vi', '2012-11-09 09:35:56', '2012-11-09 09:35:56', '113.190.154.212', 'http://www.facebook.com/groups/154982627895457/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(159, NULL, NULL, 'vi', '2012-11-09 10:15:07', '2012-11-09 10:15:07', '183.81.16.20', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(160, '2012-11-09 10:18:35', 1, 'vi', '2012-11-09 10:15:54', '2012-11-09 10:18:35', '27.69.39.189', 'https://www.facebook.com/', '', '', '', '', '', '', '', '1', '', '', '', '0', '', '', '', '', '1', '', '', '1', '', '', '', '', '0', '1', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '', '', '', '4', '', '2', '1', '', '1', '', 'Y', 'Y', '', '', '1', '3'),
	(161, NULL, NULL, 'vi', '2012-11-09 11:30:27', '2012-11-09 11:30:27', '208.80.194.142', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(162, NULL, 1, 'vi', '2012-11-09 12:21:35', '2012-11-09 12:21:35', '1.55.91.103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(163, NULL, 1, 'vi', '2012-11-09 13:03:16', '2012-11-09 13:03:16', '222.252.108.200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(164, NULL, 1, 'vi', '2012-11-09 13:24:03', '2012-11-09 13:24:03', '222.252.108.200', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(165, NULL, NULL, 'vi', '2012-11-09 14:42:50', '2012-11-09 14:42:50', '1.55.91.103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(166, NULL, 1, 'vi', '2012-11-09 15:49:22', '2012-11-09 15:49:22', '1.55.91.103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(167, NULL, NULL, 'vi', '2012-11-09 16:26:18', '2012-11-09 16:26:18', '183.81.114.89', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(168, NULL, NULL, 'vi', '2012-11-09 20:33:57', '2012-11-09 20:33:57', '183.81.114.78', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=EAQHmDf6LAQFwa_K4OTTv9qbbRAjFQDfbF_P3h4C0T3cYGw&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(169, '2012-11-09 23:34:17', 1, 'vi', '2012-11-09 23:31:43', '2012-11-09 23:34:17', '203.113.130.216', NULL, '1', '', '', '', '', '1', '', '', '1', '1', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', 'Y', 'Y', '', '', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '2', 'Hoang Hoa Tham', '1', '2', '', '3', '', 'Y', 'Y', 'Y', '', '1', '3'),
	(170, NULL, 1, 'vi', '2012-11-09 23:35:03', '2012-11-09 23:35:03', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(171, NULL, NULL, 'vi', '2012-11-09 23:36:00', '2012-11-09 23:36:00', '203.113.130.216', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(172, NULL, 1, 'vi', '2012-11-09 23:57:33', '2012-11-09 23:57:33', '1.55.91.103', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(173, NULL, NULL, 'vi', '2012-11-10 00:14:32', '2012-11-10 00:14:32', '183.81.54.138', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(174, NULL, 1, 'vi', '2012-11-10 00:24:21', '2012-11-10 00:24:21', '222.252.100.227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(175, NULL, 1, 'vi', '2012-11-10 00:27:17', '2012-11-10 00:27:17', '222.252.100.227', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=nAQHaqZhU&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(176, NULL, NULL, 'vi', '2012-11-10 00:27:35', '2012-11-10 00:27:35', '113.190.201.88', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=VAQFojP_u&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(177, NULL, NULL, 'vi', '2012-11-10 00:28:15', '2012-11-10 00:28:15', '113.190.177.252', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(178, '2012-11-10 00:31:42', 1, 'vi', '2012-11-10 00:28:20', '2012-11-10 00:31:42', '183.91.12.67', 'http://www.facebook.com/', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '0', '0', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', 'Y', '', '', '', '', '', 'Y', '', '7', 'Thụy Khuê', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '3'),
	(179, '2012-11-10 00:32:51', 1, 'vi', '2012-11-10 00:29:24', '2012-11-10 00:32:51', '58.187.174.102', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=PAQHUAujO&s=1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '1', '1', '', '', '1', '1', '1', '1', '', '', '', '', '1', '', '', '1', '1', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '14', 'Lê Đức Thọ', '1', '1', '', '2', '', 'Y', '', '', '', '1', '4'),
	(180, '2012-11-10 00:32:59', 1, 'vi', '2012-11-10 00:30:01', '2012-11-10 00:32:59', '117.5.45.186', 'http://www.facebook.com/', '1', '', '', '1', '', '1', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', '', '', '1', '', '', '1', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '14', 'Cổ Nhuế - Từ Liêm - Hà nội', '1', '1', '', '2', 'Y', '', '', '', '', '1', '4'),
	(181, NULL, NULL, 'vi', '2012-11-10 00:30:17', '2012-11-10 00:30:17', '42.113.46.57', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(182, NULL, 1, 'vi', '2012-11-10 00:30:23', '2012-11-10 00:30:23', '42.113.46.57', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(183, NULL, NULL, 'vi', '2012-11-10 00:33:10', '2012-11-10 00:33:10', '123.16.246.152', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=HAQGNgdZj&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(184, NULL, NULL, 'vi', '2012-11-10 00:44:34', '2012-11-10 00:44:34', '113.23.10.7', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(185, NULL, NULL, 'vi', '2012-11-10 02:14:54', '2012-11-10 02:14:54', '183.81.55.56', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(186, NULL, NULL, 'vi', '2012-11-10 02:28:05', '2012-11-10 02:28:05', '65.49.14.84', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(187, NULL, NULL, 'vi', '2012-11-10 03:06:05', '2012-11-10 03:06:05', '222.252.100.227', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(188, '2012-11-10 04:04:56', 1, 'vi', '2012-11-10 03:56:19', '2012-11-10 04:04:56', '117.5.41.255', 'https://www.facebook.com/', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', '', '', 'Y', 'Y', '', 'Y', '', 'Y', 'Y', 'Y', '', '2', 'Đội Cấn', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(189, NULL, NULL, 'vi', '2012-11-10 06:28:39', '2012-11-10 06:28:39', '1.55.91.117', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=ZAQHLD60W&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(190, NULL, NULL, 'vi', '2012-11-10 07:44:39', '2012-11-10 07:44:39', '123.16.143.198', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(191, NULL, 1, 'vi', '2012-11-11 00:04:11', '2012-11-11 00:04:11', '222.252.112.196', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(192, '2012-11-11 00:07:13', 1, 'vi', '2012-11-11 00:05:11', '2012-11-11 00:07:13', '1.55.90.165', NULL, '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', '4', 'Láng', '1', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(193, NULL, NULL, 'vi', '2012-11-11 21:16:29', '2012-11-11 21:16:29', '1.55.109.42', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(194, NULL, NULL, 'vi', '2012-11-12 22:03:00', '2012-11-12 22:03:00', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(195, '2012-11-13 09:20:28', 1, 'vi', '2012-11-13 09:19:34', '2012-11-13 09:20:28', '222.252.105.232', NULL, '', '', '', '', '', '', '0', '1', '1', '', '', '', '', '', '', '', '', '0', '1', '1', '', '', '', '', '', '', '', '', '0', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', 'Y', '', '', '', 'Y', '', '', 'Y', '', '3', 'Chùa Bộc', '1', '1', '', '1', 'Y', '', '', '', '', '2', '1'),
	(196, NULL, NULL, 'vi', '2012-11-14 02:57:52', '2012-11-14 02:57:52', '69.171.228.248', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(197, NULL, NULL, 'vi', '2012-11-14 08:59:47', '2012-11-14 08:59:47', '208.80.194.145', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(198, NULL, NULL, 'vi', '2012-11-14 10:36:15', '2012-11-14 10:36:15', '222.252.100.12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(199, NULL, 1, 'vi', '2012-11-14 10:37:40', '2012-11-14 10:37:40', '222.252.100.12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(200, '2012-11-14 10:42:18', 1, 'vi', '2012-11-14 10:37:48', '2012-11-14 10:42:18', '117.4.37.43', NULL, '1', '', '1', '', '', '1', '', '', '', '1', '', '1', '', '0', '', '', '1', '', '', '', '1', '', '1', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', 'Y', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', 'Y', '', '6', 'Minh Khai', '1', '1', '', '2', 'Y', 'Y', '', '', '', '1', '4'),
	(201, NULL, NULL, 'vi', '2012-11-14 11:32:21', '2012-11-14 11:32:21', '208.80.194.149', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(202, '2012-11-15 21:48:51', 1, 'vi', '2012-11-15 21:46:32', '2012-11-15 21:48:51', '222.252.102.164', NULL, '', '1', '', '', '', '0', '0', '1', '1', '', '', '', '', '1', '', '', '', '0', '0', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '1', '', '', '', '', '', '1', '', '', 'Y', '', 'Y', '', '', 'Y', '', '', '', '', '', '7', 'Văn Cao', '', '2', '', '3', 'Y', 'Y', '', '', '', '2', '2'),
	(203, '2012-11-16 09:48:24', 1, 'vi', '2012-11-16 09:46:45', '2012-11-16 09:48:24', '222.252.110.210', NULL, '', '1', '1', '', '1', '1', '', '1', '1', '', '', '', '1', '1', '0', '1', '1', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '3', 'Đông Các', '1', '2', '', '2', 'Y', 'Y', 'Y', 'Y', '', '1', '2'),
	(204, NULL, 1, 'vi', '2012-11-16 09:57:10', '2012-11-16 09:57:10', '222.252.110.210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(205, NULL, 1, 'vi', '2012-11-16 09:57:52', '2012-11-16 09:57:52', '222.252.110.210', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(206, NULL, 1, 'vi', '2012-11-16 10:00:49', '2012-11-16 10:00:49', '222.252.110.210', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/deactivate/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(207, NULL, 1, 'vi', '2012-11-16 10:08:34', '2012-11-16 10:08:34', '222.252.110.210', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/deactivate/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(208, NULL, 1, 'vi', '2012-11-16 10:11:36', '2012-11-16 10:11:36', '222.252.110.210', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/deactivate/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(209, '2012-11-16 10:16:19', 1, 'vi', '2012-11-16 10:14:42', '2012-11-16 10:16:19', '117.0.215.159', NULL, '', '', '', '', '', '', '', '0', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '2', 'Kim Mã', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '3'),
	(210, NULL, 1, 'vi', '2012-11-16 10:15:36', '2012-11-16 10:15:36', '222.252.110.210', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Fnewtest%2FY%2Flang%2Fvi&h=qAQHpR20M', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(211, NULL, NULL, 'vi', '2012-11-16 10:19:45', '2012-11-16 10:19:45', '27.64.202.193', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(212, NULL, NULL, 'vi', '2012-11-16 10:35:09', '2012-11-16 10:35:09', '123.27.4.39', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(213, NULL, NULL, 'vi', '2012-11-16 10:35:18', '2012-11-16 10:35:18', '113.190.214.213', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(214, NULL, NULL, 'vi', '2012-11-16 10:54:04', '2012-11-16 10:54:04', '113.190.23.170', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(215, NULL, NULL, 'vi', '2012-11-16 11:12:55', '2012-11-16 11:12:55', '42.113.90.11', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(216, '2012-11-16 11:42:26', 1, 'vi', '2012-11-16 11:37:17', '2012-11-16 11:42:26', '171.230.185.84', 'http://www.facebook.com/', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '0', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '3', 'Pháo Đài Láng', '2', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(217, '2012-11-16 12:34:12', 1, 'vi', '2012-11-16 12:16:00', '2012-11-16 12:34:12', '123.24.220.241', 'https://www.facebook.com/', '', '', '', '', '', '1', '', '0', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', 'Y', '', '4', '', '2', '1', '', '2', '', 'Y', '', '', '', '2', '2'),
	(218, NULL, NULL, 'vi', '2012-11-16 19:57:33', '2012-11-16 19:57:33', '50.16.44.80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(219, NULL, NULL, 'vi', '2012-11-16 23:17:27', '2012-11-16 23:17:27', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(220, NULL, 1, 'vi', '2012-11-16 23:27:47', '2012-11-16 23:27:47', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(221, '2012-11-17 03:29:53', 1, 'vi', '2012-11-17 03:26:27', '2012-11-17 03:29:53', '203.113.130.216', NULL, '', '1', '1', '1', '1', '1', '', '1', '1', '', '', '', '', '', '1', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '3', 'Vũ Ngọc Phan', '1', '2', '', '2', 'Y', 'Y', 'Y', '', '', '1', '4'),
	(222, '2012-11-17 03:32:32', 1, 'vi', '2012-11-17 03:30:01', '2012-11-17 03:32:32', '203.113.130.216', NULL, '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', 'Y', 'Y', 'Y', '', '', '', '', '', '', 'Y', '', '14', 'Đông Lâm', '1', '2', '', '2', '', 'Y', '', '', '', '1', '4'),
	(223, '2012-11-17 03:35:10', 1, 'vi', '2012-11-17 03:32:37', '2012-11-17 03:35:10', '203.113.130.216', NULL, '0', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '0', '1', '0', '0', '1', '1', '', '', '', '', '', '1', '1', '1', '1', '1', '1', '', '', '', '', 'Y', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '3', 'Láng', '1', '2', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(224, NULL, 1, 'vi', '2012-11-17 03:35:28', '2012-11-17 03:35:28', '203.113.130.216', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(225, '2012-11-17 06:38:23', 1, 'vi', '2012-11-17 06:33:04', '2012-11-17 06:38:23', '113.190.231.31', NULL, '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '0', '0', '0', '0', '0', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', 'Y', 'Y', 'Y', '', '', '', '', '', 'Y', '', '3', 'Chùa Bộc', '1', '3', '', '2', 'Y', 'Y', '', '', '', '2', '3'),
	(226, NULL, NULL, 'vi', '2012-11-19 01:12:52', '2012-11-19 01:12:52', '222.252.108.49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(227, NULL, 1, 'vi', '2012-11-19 01:14:38', '2012-11-19 01:14:38', '222.252.108.49', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(228, '2012-11-19 04:01:34', 1, 'vi', '2012-11-19 03:53:24', '2012-11-19 04:01:34', '222.252.108.49', NULL, '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', '', 'Y', 'Y', '', 'Y', '', 'Y', '', '', '6', 'Bạch Mai', '2', '2', '', '5', 'Y', '', '', '', '', '2', '1'),
	(229, NULL, NULL, 'vi', '2012-11-20 03:49:39', '2012-11-20 03:49:39', '222.252.109.81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(230, NULL, NULL, 'vi', '2012-11-20 03:54:49', '2012-11-20 03:54:49', '222.252.109.81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(231, '2012-11-20 04:00:05', 1, 'vi', '2012-11-20 03:59:23', '2012-11-20 04:00:05', '222.252.109.81', NULL, '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', 'Y', '', '1', 'Hàng Đậu', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '1', '2'),
	(232, '2012-11-21 04:32:37', 1, 'vi', '2012-11-21 04:29:44', '2012-11-21 04:32:37', '222.252.107.246', NULL, '', '1', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '1', '1', '1', '1', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '5', 'Lê Trọng Tấn', '2', '1', '', '2', '', 'Y', '', '', '', '2', '1'),
	(233, '2012-11-21 21:04:11', 1, 'vi', '2012-11-21 20:51:12', '2012-11-21 21:04:11', '203.113.130.216', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '', '', '', '1', '1', '1', '', '', '', '1', '1', '', '', '', '1', '1', '1', '', '', '', '1', '1', '', '', '', '1', '1', '1', '', '', '', '1', '1', '', '', '', '1', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Trần Cung', '1', '', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(234, '2012-11-21 21:14:16', 1, 'vi', '2012-11-21 21:07:25', '2012-11-21 21:14:16', '203.113.130.216', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '1', '', '', '', '1', '', '1', '1', '1', '', '1', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(235, '2012-11-21 21:26:06', 1, 'vi', '2012-11-21 21:15:50', '2012-11-21 21:26:06', '203.113.130.216', NULL, '1', '1', '1', '1', '', '', '1', '', '1', '1', '', '', '1', '1', '1', '', '', '1', '1', '', '', '', '', '1', '1', '1', '', '', '1', '', '', '', '', '', '1', '1', '1', '', '', '1', '', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '10', 'Phan Trọng Tuệ', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(236, '2012-11-21 21:33:33', 1, 'vi', '2012-11-21 21:26:18', '2012-11-21 21:33:33', '203.113.130.216', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '1', '1', '', '', '1', '', '', '1', '1', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(237, '2012-11-22 09:06:49', 1, 'vi', '2012-11-22 09:04:02', '2012-11-22 09:06:49', '222.252.104.253', NULL, '', '1', '1', '', '1', '1', '', '1', '1', '', '', '', '1', '1', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '', '', '0', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '1', 'Hàng Đậu', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '1', '2'),
	(238, '2012-11-22 09:11:26', 1, 'vi', '2012-11-22 09:07:33', '2012-11-22 09:11:26', '222.252.104.253', NULL, '', '', '1', '1', '1', '', '', '', '1', '0', '', '', '', '1', '1', '1', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '0', '', '', '', '', '', '', '', '', '', '', '1', '', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', 'Y', 'Y', '', '', '1', 'Lý Nam Đế', '2', '1', '', '2', '', 'Y', '', '', '', '2', '1'),
	(239, '2012-11-22 21:42:26', 1, 'vi', '2012-11-22 21:37:22', '2012-11-22 21:42:26', '112.137.129.240', NULL, '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', 'Y', 'Y', '', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', '', 'Y', '', '', '', '2', '2'),
	(240, '2012-11-22 21:45:15', 1, 'vi', '2012-11-22 21:42:34', '2012-11-22 21:45:15', '112.137.129.240', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '1', '1', '', '1', '', 'Y', 'Y', '', '', '1', '3'),
	(241, NULL, 1, 'vi', '2012-11-22 21:45:54', '2012-11-22 21:45:54', '112.137.129.240', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(242, NULL, NULL, 'vi', '2012-11-23 06:25:32', '2012-11-23 06:25:32', '222.252.105.98', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(243, '2012-11-23 08:42:58', 1, 'vi', '2012-11-23 08:41:12', '2012-11-23 08:42:58', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', 'Y', '', '', '', '', '', '', '', '', '16', 'xã An Khánh', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(244, '2012-11-23 08:47:46', 1, 'vi', '2012-11-23 08:43:11', '2012-11-23 08:47:46', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '1', '', '1', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', '', '', '', '', '', '', '', '', '', '16', 'xã An Thượng', '1', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(245, '2012-11-23 08:50:39', 1, 'vi', '2012-11-23 08:47:54', '2012-11-23 08:50:39', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '1', '', '', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '1', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', '', '', '', '', '', '', '14', 'Phạm Hùng', '2', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(246, '2012-11-23 08:53:36', 1, 'vi', '2012-11-23 08:50:51', '2012-11-23 08:53:36', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '16', 'xã Vân Đình', '2', '1', '', '2', '', 'Y', 'Y', '', '', '', '3'),
	(247, '2012-11-23 08:56:48', 1, 'vi', '2012-11-23 08:53:55', '2012-11-23 08:56:48', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '1', '', '', '1', '1', '1', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Trần Cung', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(248, '2012-11-23 08:59:54', 1, 'vi', '2012-11-23 08:57:08', '2012-11-23 08:59:54', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '0', '1', '1', '0', '0', '1', '1', '1', '1', '', '1', '0', '1', '1', '0', '0', '1', '1', '1', '1', '', '1', '0', '1', '1', '0', '0', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', 'Y', '', '4', 'Hồ Tùng Mậu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(249, '2012-11-23 09:02:28', 1, 'vi', '2012-11-23 09:00:13', '2012-11-23 09:02:28', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', 'Y', '', 'Y', 'Y', '', '', '', '', '', '', '', '', '5', 'Nguyễn Trãi', '1', '1', '', '2', '', 'Y', 'Y', 'Y', '', '1', '3'),
	(250, '2012-11-23 09:05:34', 1, 'vi', '2012-11-23 09:02:37', '2012-11-23 09:05:34', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '1', '', '1', '1', '1', '1', '', '1', '', '', '1', '1', '', '1', '1', '1', '', '', '1', '', '', '1', '1', '', '1', '1', '1', '1', '', '1', '', '', '1', '1', '', '1', '1', '1', '1', '', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', '', '', '', '', '4', 'Hồ Tùng Mậu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(251, '2012-11-23 09:07:36', 1, 'vi', '2012-11-23 09:05:51', '2012-11-23 09:07:36', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', '', '', '', '', '', '', '4', 'Hoàng Quốc VIệt', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(252, '2012-11-23 09:12:10', 1, 'vi', '2012-11-23 09:07:44', '2012-11-23 09:12:10', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '0', '1', '0', '1', '1', '1', '', '', '', '', '', '1', '0', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Xuân Thủy', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(253, '2012-11-23 09:14:59', 1, 'vi', '2012-11-23 09:12:16', '2012-11-23 09:14:59', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '', '1', '1', '0', '0', '', '', '', '', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '1', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '', '', '16', 'Xã An Khánh', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(254, '2012-11-23 09:17:17', 1, 'vi', '2012-11-23 09:15:12', '2012-11-23 09:17:17', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '1', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '16', 'Thị trấn Chi Đông', '1', '1', '', '1', '', 'Y', '', '', '', '1', '2'),
	(255, '2012-11-23 09:43:26', 1, 'vi', '2012-11-23 09:17:25', '2012-11-23 09:43:26', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '1', '1', '1', '1', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '16', 'xã An Khánh', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(256, '2012-11-23 09:45:31', 1, 'vi', '2012-11-23 09:43:39', '2012-11-23 09:45:31', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '', '', '', '1', '', '1', '1', '', '', '', '1', '', '', '', '1', '', '1', '1', '', '', '', '1', '', '', '', '1', '', '1', '1', '', '', '', '1', '', '', '', '1', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '', '', '4', 'Hoàng Quốc Việt', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(257, '2012-11-23 09:47:41', 1, 'vi', '2012-11-23 09:46:05', '2012-11-23 09:47:41', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Tân Phong', '1', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(258, '2012-11-23 09:49:52', 1, 'vi', '2012-11-23 09:47:49', '2012-11-23 09:49:52', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '1', '1', '', '', '', '1', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '1', '1', '1', '1', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '3', 'Tôn Thất Tùng', '1', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(259, '2012-11-23 09:52:39', 1, 'vi', '2012-11-23 09:50:16', '2012-11-23 09:52:39', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '', '', '', '1', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '1', '1', '1', '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', '', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(260, '2012-11-23 09:54:29', 1, 'vi', '2012-11-23 09:52:52', '2012-11-23 09:54:29', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '2', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(261, '2012-11-23 09:56:55', 1, 'vi', '2012-11-23 09:54:47', '2012-11-23 09:56:55', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '1', '', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '14', 'Mễ Trì', '2', '1', '', '2', '', 'Y', '', '', '', '1', '4'),
	(262, '2012-11-23 09:58:58', 1, 'vi', '2012-11-23 09:57:01', '2012-11-23 09:58:58', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Mỹ Đình', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(263, '2012-11-23 10:00:41', 1, 'vi', '2012-11-23 09:59:09', '2012-11-23 10:00:41', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '1', '1', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Phạm Hùng', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(264, '2012-11-23 10:02:34', 1, 'vi', '2012-11-23 10:01:18', '2012-11-23 10:02:34', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Phạm Thận Duật', '1', '1', '', '2', '', 'Y', 'Y', 'Y', '', '1', '4'),
	(265, '2012-11-23 10:04:18', 1, 'vi', '2012-11-23 10:02:48', '2012-11-23 10:04:18', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '1', '', '1', '1', '1', '1', '', '1', '', '1', '1', '1', '', '1', '1', '1', '1', '', '1', '', '1', '1', '1', '', '1', '1', '1', '1', '', '1', '', '1', '1', '1', '', '1', '1', '1', '1', '', 'Y', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '4', 'Xuân Thủy', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(266, '2012-11-23 10:05:42', 1, 'vi', '2012-11-23 10:04:31', '2012-11-23 10:05:42', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '7', 'Nghi Tàm', '1', '1', '', '2', '', 'Y', '', '', '', '2', '2'),
	(267, '2012-11-23 10:07:22', 1, 'vi', '2012-11-23 10:05:51', '2012-11-23 10:07:22', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Hồ Tùng Mậu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '1'),
	(268, '2012-11-23 10:10:49', 1, 'vi', '2012-11-23 10:07:29', '2012-11-23 10:10:49', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '', '1', '1', '1', '0', '', '', '1', '', '', '1', '', '1', '1', '', '', '', '', '1', '', '', '1', '', '1', '1', '0', '1', '', '', '1', '', '', '1', '', '1', '1', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '6', 'Tạ Quang Bửu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '1'),
	(269, '2012-11-23 10:12:53', 1, 'vi', '2012-11-23 10:11:00', '2012-11-23 10:12:53', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '9', 'Nguyễn Chính', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(270, '2012-11-23 10:14:32', 1, 'vi', '2012-11-23 10:13:06', '2012-11-23 10:14:32', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '1', '', '', '', '1', '1', '1', '', '', '', '', '1', '', '', '', '1', '1', '1', '', '', '', '', '1', '', '', '', '1', '1', '1', '', '', '', '', '1', '', '', '', '1', '1', '1', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '4', 'Lê Đức Thọ', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(271, '2012-11-23 10:17:21', 1, 'vi', '2012-11-23 10:15:51', '2012-11-23 10:17:21', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '1', '1', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '14', '', '1', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(272, '2012-11-23 10:19:01', 1, 'vi', '2012-11-23 10:17:42', '2012-11-23 10:19:01', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '', '', '1', '', '1', '', '', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '', '1', '1', '', '', '1', '', '', '1', '', '', '', '1', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Phạm Văn Đồng', '1', '1', '', '1', '', 'Y', 'Y', '', '', '1', '3'),
	(273, '2012-11-23 10:21:40', 1, 'vi', '2012-11-23 10:19:15', '2012-11-23 10:21:40', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '1', '1', '', '', '1', '1', '', '1', '0', '', '', '', '', '', '', '', '1', '1', '', '1', '', '', '', '', '', '', '', '1', '', '', '1', '', '', '', '', '1', '1', '', '', '', '', '1', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '14', '', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(274, '2012-11-23 10:25:14', 1, 'vi', '2012-11-23 10:22:07', '2012-11-23 10:25:14', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '', '4', 'Trần Cung', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(275, '2012-11-23 10:31:46', 1, 'vi', '2012-11-23 10:25:23', '2012-11-23 10:31:46', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '1', '', '1', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '14', 'Hồ Tùng Mậu', '2', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(276, '2012-11-23 10:33:36', 1, 'vi', '2012-11-23 10:31:58', '2012-11-23 10:33:36', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '1', '1', '1', '', '', '1', '', '', '1', '', '', '1', '1', '1', '', '', '0', '', '', '', '', '', '1', '1', '0', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '7', 'An Dương Vương', '', '1', '', '1', '', 'Y', '', '', '', '2', '3'),
	(277, '2012-11-23 10:35:33', 1, 'vi', '2012-11-23 10:33:53', '2012-11-23 10:35:33', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '1', '1', '', '1', '1', '1', '1', '', '', '1', '', '1', '1', '', '1', '1', '1', '1', '', '', '1', '', '1', '1', '', '1', '1', '1', '1', '', '', '1', '', '1', '1', '', '1', '1', '', '', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Trần Bình', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(278, '2012-11-23 10:37:11', 1, 'vi', '2012-11-23 10:35:54', '2012-11-23 10:37:11', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Phạm Văn Đồng', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(279, '2012-11-23 10:39:23', 1, 'vi', '2012-11-23 10:37:18', '2012-11-23 10:39:23', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Xuân Đỉnh', '1', '1', '', '1', '', 'Y', '', '', '', '1', '3'),
	(280, '2012-11-23 10:41:29', 1, 'vi', '2012-11-23 10:39:36', '2012-11-23 10:41:29', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '1', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', '', '', '', '', '', '', '', '', '14', 'Đỗ Đức Dục', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(281, '2012-11-23 10:43:38', 1, 'vi', '2012-11-23 10:41:50', '2012-11-23 10:43:38', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '1', '', '1', '', '1', '1', '1', '1', '1', '', '1', '1', '', '1', '', '1', '1', '1', '1', '1', '', '1', '1', '', '1', '', '1', '1', '', '1', '', '', '1', '0', '', '1', '', '1', '1', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', '', '1', '1', '', '2', '', 'Y', 'Y', 'Y', '', '1', '4'),
	(282, '2012-11-23 10:45:39', 1, 'vi', '2012-11-23 10:43:52', '2012-11-23 10:45:39', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '1', '1', '1', '0', '0', '1', '1', '1', '1', '', '', '', '', '', '', '', '0', '0', '', '', '', '', '', '1', '1', '', '0', '1', '1', '1', '1', '', '', '', '1', '1', '', '0', '1', '1', '1', '1', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '14', 'Đông Ngạc', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '2'),
	(283, '2012-11-23 10:49:17', 1, 'vi', '2012-11-23 10:45:59', '2012-11-23 10:49:17', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '', '1', '', '', '', '0', '', '', '', '', '0', '', '1', '', '', '', '1', '1', '', '', '', '0', '', '1', '', '', '', '', '', '', '', '', '0', '', '1', '', '', '', '', '', '', '', 'Y', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '8', 'Ngọc lâm', '2', '1', '', '1', '', 'Y', 'Y', '', '', '1', '3'),
	(284, '2012-11-23 10:51:28', 1, 'vi', '2012-11-23 10:49:48', '2012-11-23 10:51:28', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '6', 'Lê Thanh Nghị', '2', '1', '', '1', '', 'Y', 'Y', '', '', '1', '2'),
	(285, '2012-11-23 10:53:23', 1, 'vi', '2012-11-23 10:51:44', '2012-11-23 10:53:23', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '1', '1', '1', '1', '1', '1', '', '', '', '1', '1', '', '1', '1', '1', '1', '1', '', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '5', 'Khương Đình', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(286, '2012-11-23 10:56:27', 1, 'vi', '2012-11-23 10:53:40', '2012-11-23 10:56:27', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '', '', '1', '1', '0', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '0', '1', '', '', '', '', '', '', '', '0', '1', '1', '', '', 'Y', '', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Hồ Tùng Mậu', '2', '1', '', '2', '', 'Y', 'Y', '', '', '1', '4'),
	(287, '2012-11-23 10:58:40', 1, 'vi', '2012-11-23 10:56:42', '2012-11-23 10:58:40', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '1', '1', '0', '', '1', '1', '1', '1', '', '1', '', '1', '1', '', '', '1', '1', '1', '1', '', '1', '', '1', '1', '', '', '1', '1', '1', '1', '', '1', '', '1', '1', '', '', '1', '1', '1', '1', '', 'Y', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '14', 'Lê Văn Hiến', '2', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(288, '2012-11-23 11:00:36', 1, 'vi', '2012-11-23 10:58:58', '2012-11-23 11:00:36', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', '', '', 'Y', '', '', '', '', '', '', '5', 'Khương Đình', '2', '1', '', '2', '', 'Y', '', '', '', '1', '1'),
	(289, '2012-11-23 11:03:38', 1, 'vi', '2012-11-23 11:00:51', '2012-11-23 11:03:38', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '14', 'Nhổn', '2', '1', '', '2', '', 'Y', '', '', '', '1', '1'),
	(290, '2012-11-23 11:05:04', 1, 'vi', '2012-11-23 11:03:54', '2012-11-23 11:05:04', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', 'Y', 'Y', '', '', '', '', '', '', '4', 'Lê Văn Lương', '2', '1', '', '2', '', 'Y', 'Y', '', '', '2', '3'),
	(291, '2012-11-23 11:06:49', 1, 'vi', '2012-11-23 11:05:17', '2012-11-23 11:06:49', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '1', '', '1', '1', '', '', '1', '1', '1', '0', '', '1', '', '1', '1', '', '', '1', '1', '1', '', '', '1', '', '1', '1', '', '', '1', '1', '1', '', '', '1', '', '1', '1', '', '', '1', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '4', 'Doãn Kế Thiện', '1', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(292, '2012-11-23 11:09:13', 1, 'vi', '2012-11-23 11:06:58', '2012-11-23 11:09:13', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '1', '1', '', '', '', '1', '0', '1', '1', '', '1', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '1', '1', '1', '1', '', '', '', '', '1', '1', '1', '1', '', '1', '1', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '1', '', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(293, '2012-11-23 11:12:19', 1, 'vi', '2012-11-23 11:10:51', '2012-11-23 11:12:19', '183.81.59.194', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', 'Y', '', '', '', '', '', '', '4', 'Cầu Giấy', '2', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(294, '2012-11-25 05:16:16', 1, 'vi', '2012-11-25 05:14:40', '2012-11-25 05:16:16', '222.252.101.181', NULL, '', '1', '0', '', '1', '1', '', '1', '', '', '', '', '', '', '', '1', '1', '', '1', '1', '', '', '', '', '', '', '1', '1', '', '1', '', '', '', '', '', '', '', '1', '1', '', '1', '1', '1', '1', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', 'Y', '', '', '', '1', 'Trần Phú', '1', '1', '', '2', 'Y', '', 'Y', '', '', '2', '1'),
	(295, NULL, NULL, 'vi', '2012-11-25 08:00:27', '2012-11-25 08:00:27', '69.171.237.8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(296, '2012-11-26 09:21:04', 1, 'vi', '2012-11-26 09:19:06', '2012-11-26 09:21:04', '222.252.107.104', NULL, '', '1', '', '', '0', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', 'Y', '', 'Y', '', 'Y', '', 'Y', 'Y', '', '6', 'Trần Đại Nghĩa', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '2', '2'),
	(297, NULL, NULL, 'vi', '2012-11-29 10:10:13', '2012-11-29 10:10:13', '222.252.106.116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(298, NULL, NULL, 'vi', '2012-12-05 06:04:44', '2012-12-05 06:04:44', '69.171.237.13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(299, NULL, NULL, 'vi', '2012-12-16 02:55:52', '2012-12-16 02:55:52', '173.252.110.117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(300, NULL, NULL, 'vi', '2013-01-25 22:26:31', '2013-01-25 22:26:31', '203.113.130.216', 'http://limesurvey.freevnn.com/ls/index.php/admin/survey/view/surveyid/863796', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(301, NULL, NULL, 'vi', '2013-01-26 01:37:21', '2013-01-26 01:37:21', '69.171.242.119', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(302, '2013-01-26 01:47:33', 1, 'vi', '2013-01-26 01:37:41', '2013-01-26 01:47:33', '1.55.82.53', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=_AQFB-IR4', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', '6', 'Tạ Quang Bửu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '4'),
	(303, NULL, NULL, 'vi', '2013-01-26 01:40:38', '2013-01-26 01:40:38', '58.187.115.83', 'http://www.facebook.com/groups/167940869914126/494748403900036/?notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(304, NULL, NULL, 'vi', '2013-01-26 01:41:42', '2013-01-26 01:41:42', '118.71.51.10', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(305, '2013-01-26 01:44:11', 1, 'vi', '2013-01-26 01:42:05', '2013-01-26 01:44:11', '222.252.48.162', 'https://www.facebook.com/', '0', '', '1', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', '', 'Y', 'Y', 'Y', '', '', '', '', '', '9', '', '1', '1', '', '2', 'Y', 'Y', '', '', '', '2', '4'),
	(306, NULL, NULL, 'vi', '2013-01-26 01:42:42', '2013-01-26 01:42:42', '123.16.59.136', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(307, '2013-01-26 01:44:40', 1, 'vi', '2013-01-26 01:43:04', '2013-01-26 01:44:40', '113.190.230.216', 'http://www.facebook.com/', '', '', '1', '0', '', '', '', '1', '1', '1', '', '', '', '1', '', '', '', '', '1', '1', '1', '', '', '', '1', '', '', '', '', '1', '1', '1', '', '', '', '1', '', '', '', '', '1', '1', '1', '', '', '', '', 'Y', '', '', 'Y', '', '', 'Y', '', '', '3', 'láng', '1', '2', '', '2', '', 'Y', '', '', '', '1', '3'),
	(308, NULL, NULL, 'vi', '2013-01-26 01:44:19', '2013-01-26 01:44:19', '74.125.187.208', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(309, '2013-01-26 01:46:24', 1, 'vi', '2013-01-26 01:44:25', '2013-01-26 01:46:24', '123.24.48.23', NULL, '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', '', '', '', '1', '1', '1', '', '', '', '', '', 'Y', '', 'Y', '', '', '', 'Y', '', '9', 'Minh Khai', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(310, NULL, NULL, 'vi', '2013-01-26 01:44:51', '2013-01-26 01:44:51', '123.16.237.32', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(311, '2013-01-26 01:49:15', 1, 'vi', '2013-01-26 01:48:01', '2013-01-26 01:49:15', '1.55.82.53', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=UAQEL5jai', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', 'Y', '', '', 'Y', 'Y', '', '', '', '', '6', 'Ha Noi', '1', '1', '', '2', '', 'Y', '', '', '', '2', '1'),
	(312, NULL, NULL, 'vi', '2013-01-26 01:51:50', '2013-01-26 01:51:50', '118.71.84.12', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(313, NULL, NULL, 'vi', '2013-01-26 01:52:29', '2013-01-26 01:52:29', '65.49.14.80', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(314, '2013-01-26 01:54:06', 1, 'vi', '2013-01-26 01:52:32', '2013-01-26 01:54:06', '1.55.82.53', 'https://www.facebook.com/', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', '', '', 'Y', 'Y', '', '', 'Y', '', '6', '', '1', '1', '', '2', '', 'Y', '', '', '', '1', '1'),
	(315, '2013-01-26 01:55:41', 1, 'vi', '2013-01-26 01:52:36', '2013-01-26 01:55:41', '1.55.82.53', NULL, '', '', '', '', '1', '', '', '1', '1', '1', '', '', '', '', '', '1', '', '', '1', '', '', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', '', '', '1', '1', '1', '', '', '1', '1', '1', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', 'Y', 'Y', '', 'Y', '', '6', 'tạ quang bửu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(316, '2013-01-26 01:58:20', 1, 'vi', '2013-01-26 01:52:46', '2013-01-26 01:58:20', '58.187.172.137', 'http://www.facebook.com/', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '', 'Y', '', '14', 'Co Nhue', '1', '1', '', '2', '', 'Y', '', '', '', '2', '2'),
	(317, '2013-01-26 01:56:25', 1, 'vi', '2013-01-26 01:54:39', '2013-01-26 01:56:25', '42.113.253.81', 'https://www.facebook.com/', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', 'Y', '', 'Y', 'Y', '', '9', '', '', '1', '', '2', '', 'Y', 'Y', '', '', '2', '3'),
	(318, NULL, NULL, 'vi', '2013-01-26 01:56:06', '2013-01-26 01:56:06', '27.69.226.120', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(319, '2013-01-26 02:11:05', 1, 'vi', '2013-01-26 02:03:41', '2013-01-26 02:11:05', '58.187.114.113', 'https://www.facebook.com/', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '0', '1', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', '', '', 'Y', '', '', '', 'Y', '', '9', '', '1', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(320, NULL, NULL, 'vi', '2013-01-26 02:09:35', '2013-01-26 02:09:35', '58.187.46.252', 'http://www.facebook.com/groups/106641102735491/452046061528325/?notif_t=group_activity', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(321, NULL, NULL, 'vi', '2013-01-26 02:14:37', '2013-01-26 02:14:37', '222.252.105.226', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=ZAQFMXeLV&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(322, NULL, NULL, 'vi', '2013-01-26 02:28:42', '2013-01-26 02:28:42', '117.7.113.53', 'http://www.facebook.com/groups/soict/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(323, '2013-01-26 02:33:17', 1, 'vi', '2013-01-26 02:31:16', '2013-01-26 02:33:17', '117.6.99.112', 'https://www.facebook.com/', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '0', '1', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', 'Y', '', '', '', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '6', 'Hong Mai', '1', '1', '', '2', '', 'Y', '', '', '', '2', '3'),
	(324, NULL, NULL, 'vi', '2013-01-26 02:39:06', '2013-01-26 02:39:06', '222.252.50.32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(325, '2013-01-26 02:41:16', 1, 'vi', '2013-01-26 02:40:03', '2013-01-26 02:41:16', '118.71.98.140', 'https://www.facebook.com/', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', 'Y', 'Y', 'Y', 'Y', '', '', '', '', '', '', '', '', '6', 'Hồng Mai', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(326, NULL, NULL, 'vi', '2013-01-26 02:51:13', '2013-01-26 02:51:13', '123.17.138.138', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=ZAQE49xEnAQHgGqWebpOu-SYcXg_RXYxZ-Bz7djg8K1yXdg&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(327, NULL, NULL, 'vi', '2013-01-26 03:01:30', '2013-01-26 03:01:30', '1.55.56.7', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(328, NULL, NULL, 'vi', '2013-01-26 03:11:15', '2013-01-26 03:11:15', '1.55.82.53', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=tAQHcFTOl', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(329, NULL, NULL, 'vi', '2013-01-26 03:21:59', '2013-01-26 03:21:59', '1.55.56.7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(330, NULL, NULL, 'vi', '2013-01-26 03:22:07', '2013-01-26 03:22:07', '1.55.56.7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(331, NULL, 1, 'vi', '2013-01-26 03:45:34', '2013-01-26 03:46:30', '113.190.188.67', 'https://www.facebook.com/', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', '', 'Y', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', ''),
	(332, NULL, NULL, 'vi', '2013-01-26 03:47:22', '2013-01-26 03:47:22', '58.187.61.110', 'http://www.facebook.com/groups/soict/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(333, NULL, NULL, 'vi', '2013-01-26 04:00:19', '2013-01-26 04:00:19', '113.190.156.113', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(334, NULL, NULL, 'vi', '2013-01-26 04:04:55', '2013-01-26 04:04:55', '171.228.207.222', 'http://www.facebook.com/groups/soict/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(335, NULL, NULL, 'vi', '2013-01-26 04:09:34', '2013-01-26 04:09:34', '118.71.98.85', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=EAQHWU2-lAQFYmQKmJxfcX0rSX_M1CHNrlkyhCHzYYv3P_w&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(336, '2013-01-26 05:05:50', 1, 'vi', '2013-01-26 05:02:35', '2013-01-26 05:05:50', '58.187.172.137', 'https://www.facebook.com/', '', '', '1', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '', '', 'Y', '', '14', '', '1', '1', '', '2', '', 'Y', '', '', '', '1', '3'),
	(337, NULL, NULL, 'vi', '2013-01-26 05:04:44', '2013-01-26 05:04:44', '123.16.204.45', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(338, NULL, NULL, 'vi', '2013-01-26 05:08:21', '2013-01-26 05:08:21', '42.115.17.82', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=FAQGnDswCAQEaGe4xGuZgNo66S2qtHPJT2gRvr9ahwNygnQ&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(339, '2013-01-26 05:20:42', 1, 'vi', '2013-01-26 05:18:22', '2013-01-26 05:20:42', '101.99.17.16', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=FAQE2EW8b', '', '', '', '', '1', '', '', '0', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', 'Y', '', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', '', '', '6', 'Tạ Quang Bửu', '1', '1', '', '2', '', 'Y', '', '', '', '1', '2'),
	(340, NULL, NULL, 'vi', '2013-01-26 05:40:23', '2013-01-26 05:40:23', '118.71.58.66', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(341, '2013-01-26 05:43:56', 1, 'vi', '2013-01-26 05:41:03', '2013-01-26 05:43:56', '222.252.54.85', 'http://www.facebook.com/', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', 'Y', 'Y', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', '6', '', '1', '1', '', '2', '', 'Y', '', '', '', '2', ''),
	(342, '2013-01-26 06:09:23', 1, 'vi', '2013-01-26 06:03:51', '2013-01-26 06:09:23', '101.99.10.53', 'http://www.facebook.com/home.php', '0', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '', '1', '', '', '', '', '', '', '', '', '1', '', '1', '', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', '6', '', '1', '1', '', '2', 'Y', '', 'Y', '', '', '1', '3'),
	(343, NULL, NULL, 'vi', '2013-01-26 06:42:18', '2013-01-26 06:42:18', '117.5.186.71', 'http://m.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(344, '2013-01-26 06:56:48', 1, 'vi', '2013-01-26 06:53:25', '2013-01-26 06:56:48', '58.187.73.244', 'https://www.facebook.com/', '1', '0', '1', '', '', '', '1', '', '', '', '', '1', '0', '1', '', '', '', '1', '1', '1', '', '', '1', '0', '1', '', '', '', '0', '1', '', '', '', '1', '', '1', '', '', '', '', '1', '1', '', '', 'Y', 'Y', '', 'Y', '', '', '', '', '', '', '', '', '6', '', '1', '1', '', '2', 'Y', 'Y', 'Y', '', '', '1', ''),
	(345, NULL, NULL, 'vi', '2013-01-26 07:34:41', '2013-01-26 07:34:41', '27.66.171.66', 'http://www.facebook.com/photo.php?fbid=249825235149585&set=at.231598836972225.63696.100003663312271.100001884834562.100002941342182&type=1&theater', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(346, NULL, NULL, 'vi', '2013-01-26 08:55:10', '2013-01-26 08:55:10', '58.187.102.244', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(347, NULL, NULL, 'vi', '2013-01-26 09:27:18', '2013-01-26 09:27:18', '113.23.8.65', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(348, NULL, NULL, 'vi', '2013-01-26 10:04:59', '2013-01-26 10:04:59', '113.190.124.120', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(349, NULL, NULL, 'vi', '2013-01-26 11:37:00', '2013-01-26 11:37:00', '125.192.87.14', 'http://www.facebook.com/groups/106641102735491/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(350, NULL, NULL, 'vi', '2013-01-26 23:44:00', '2013-01-26 23:44:00', '222.252.84.57', 'http://www.facebook.com/groups/106641102735491/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(351, NULL, NULL, 'vi', '2013-01-26 23:48:30', '2013-01-26 23:48:30', '58.187.64.61', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(352, NULL, NULL, 'vi', '2013-01-27 02:02:39', '2013-01-27 02:02:39', '113.23.8.65', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(353, NULL, NULL, 'vi', '2013-01-27 03:40:23', '2013-01-27 03:40:23', '183.81.112.53', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(354, NULL, NULL, 'vi', '2013-01-27 03:40:26', '2013-01-27 03:40:26', '183.81.112.53', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(355, NULL, NULL, 'vi', '2013-01-27 05:25:04', '2013-01-27 05:25:04', '118.71.26.55', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=FAQF2EUp4AQG5IG7Pa1MuYlXZH51w-QVTjv4lBRxTvyQVZA&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(356, NULL, NULL, 'vi', '2013-01-27 06:16:05', '2013-01-27 06:16:05', '117.7.114.126', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(357, '2013-01-27 07:03:38', 1, 'vi', '2013-01-27 06:57:49', '2013-01-27 07:03:38', '42.113.181.135', 'http://www.facebook.com/', '1', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', 'Y', '', 'Y', '', 'Y', '', '3', 'Chùa Bộc', '1', '1', '', '2', '', 'Y', 'Y', '', '', '1', '3'),
	(358, '2013-01-27 09:23:25', 1, 'vi', '2013-01-27 09:19:46', '2013-01-27 09:23:25', '141.0.9.77', NULL, '', '1', '', '1', '', '1', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', 'Y', '', 'Y', 'Y', '', 'Y', 'Y', '', '', 'Y', '', '10', '', '1', '1', '', '2', '', 'Y', 'Y', '', '', '2', '3'),
	(359, NULL, NULL, 'vi', '2013-01-27 09:26:32', '2013-01-27 09:26:32', '58.187.60.105', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(360, NULL, NULL, 'vi', '2013-01-27 09:26:34', '2013-01-27 09:26:34', '58.187.60.105', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(361, NULL, NULL, 'vi', '2013-01-27 09:55:32', '2013-01-27 09:55:32', '203.210.128.130', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(362, NULL, NULL, 'vi', '2013-01-27 23:16:54', '2013-01-27 23:16:54', '27.65.241.4', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(363, NULL, NULL, 'vi', '2013-01-29 00:05:37', '2013-01-29 00:05:37', '58.187.64.172', 'http://www.0.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(364, NULL, NULL, 'vi', '2013-01-29 08:30:55', '2013-01-29 08:30:55', '58.187.58.2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(365, NULL, NULL, 'vi', '2013-01-29 10:09:53', '2013-01-29 10:09:53', '222.254.26.27', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=GAQG_KQFQAQGbVA4mFHkaFs12uXh144oxf_5E3e01AswuYA&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(366, NULL, NULL, 'vi', '2013-01-29 10:46:58', '2013-01-29 10:46:58', '123.24.154.142', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(367, '2013-01-29 10:52:15', 1, 'vi', '2013-01-29 10:50:00', '2013-01-29 10:52:15', '123.16.60.109', 'https://www.facebook.com/', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '1', '1', '', '', '', 'Y', '', 'Y', '', '', 'Y', '', '', 'Y', '', '', '9', '', '1', '1', '', '2', 'Y', '', '', '', '', '1', '4'),
	(368, NULL, NULL, 'vi', '2013-01-30 09:12:08', '2013-01-30 09:12:08', '118.71.20.74', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=VAQELrlZzAQHDzG-4w1rkgRmsHt707HMju0waGazchzLZ-g&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(369, NULL, NULL, 'vi', '2013-01-30 12:34:01', '2013-01-30 12:34:01', '113.190.190.244', 'http://www.facebook.com/l.php?u=http%3A%2F%2Flimesurvey.freevnn.com%2Fls%2Findex.php%2Fsurvey%2Findex%2Fsid%2F863796%2Flang%2Fvi&h=2AQHi36VZ&s=1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(370, NULL, NULL, 'vi', '2013-01-31 02:53:39', '2013-01-31 02:53:39', '113.190.40.130', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(371, NULL, NULL, 'vi', '2013-01-31 10:15:24', '2013-01-31 10:15:24', '113.178.36.213', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(372, NULL, NULL, 'vi', '2013-02-03 05:49:38', '2013-02-03 05:49:38', '66.220.158.114', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(373, NULL, NULL, 'vi', '2013-02-03 05:49:38', '2013-02-03 05:49:38', '117.5.236.229', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(374, NULL, NULL, 'vi', '2013-02-06 08:55:33', '2013-02-06 08:55:33', '117.5.180.194', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(375, NULL, NULL, 'vi', '2013-02-13 10:28:30', '2013-02-13 10:28:30', '69.171.247.116', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(376, NULL, NULL, 'vi', '2013-02-13 10:48:38', '2013-02-13 10:48:38', '27.70.210.43', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(377, NULL, NULL, 'vi', '2013-02-13 20:18:53', '2013-02-13 20:18:53', '113.168.213.143', 'https://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(378, NULL, NULL, 'vi', '2013-02-16 10:34:41', '2013-02-16 10:34:41', '123.18.167.185', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(379, NULL, NULL, 'vi', '2013-02-19 11:01:56', '2013-02-19 11:01:56', '58.187.228.168', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(380, NULL, NULL, 'vi', '2013-02-23 10:18:13', '2013-02-23 10:18:13', '173.252.73.117', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(381, '2013-02-23 10:23:25', 1, 'vi', '2013-02-23 10:21:09', '2013-02-23 10:23:25', '171.226.116.72', NULL, '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', 'Y', '', '', 'Y', '', '', 'Y', '', '', '', 'Y', '', '10', '', '', '1', '', '2', '', 'Y', '', '', '', '', '2'),
	(382, '2013-02-23 10:55:41', 1, 'vi', '2013-02-23 10:50:46', '2013-02-23 10:55:41', '118.68.13.220', 'http://www.facebook.com/groups/vietpet/', '', '', '', '', '', '', '1', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Y', '', '', 'Y', '', 'Y', '', 'Y', '', 'Y', '', '', '17', '', '2', '1', '', '1', 'Y', '', '', '', '', '2', '1'),
	(383, NULL, NULL, 'vi', '2013-02-23 10:52:44', '2013-02-23 10:52:44', '23.22.170.240', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(384, NULL, NULL, 'vi', '2013-02-23 10:57:00', '2013-02-23 10:57:00', '113.190.72.214', 'http://www.facebook.com/groups/vietpet/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(385, NULL, NULL, 'vi', '2013-02-23 10:57:24', '2013-02-23 10:57:24', '113.190.72.214', 'http://www.facebook.com/groups/vietpet/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(386, NULL, NULL, 'vi', '2013-02-23 11:57:10', '2013-02-23 11:57:10', '42.113.91.159', 'http://www.facebook.com/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(387, NULL, NULL, 'vi', '2013-02-24 22:20:04', '2013-02-24 22:20:04', '222.252.105.81', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `lime_survey_863796` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_survey_863796_timings
DROP TABLE IF EXISTS `lime_survey_863796_timings`;
CREATE TABLE IF NOT EXISTS `lime_survey_863796_timings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `interviewtime` float DEFAULT NULL,
  `863796X1time` float DEFAULT NULL,
  `863796X1X1time` float DEFAULT NULL,
  `863796X1X7time` float DEFAULT NULL,
  `863796X1X6time` float DEFAULT NULL,
  `863796X2time` float DEFAULT NULL,
  `863796X2X2time` float DEFAULT NULL,
  `863796X2X5time` float DEFAULT NULL,
  `863796X2X3time` float DEFAULT NULL,
  `863796X2X4time` float DEFAULT NULL,
  `863796X2X8time` float DEFAULT NULL,
  `863796X2X9time` float DEFAULT NULL,
  `863796X2X10time` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=388 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_survey_863796_timings: 287 rows
/*!40000 ALTER TABLE `lime_survey_863796_timings` DISABLE KEYS */;
REPLACE INTO `lime_survey_863796_timings` (`id`, `interviewtime`, `863796X1time`, `863796X1X1time`, `863796X1X7time`, `863796X1X6time`, `863796X2time`, `863796X2X2time`, `863796X2X5time`, `863796X2X3time`, `863796X2X4time`, `863796X2X8time`, `863796X2X9time`, `863796X2X10time`) VALUES
	(101, 54.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(102, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(103, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(104, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(105, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(106, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(107, 218.97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(108, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(109, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(110, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(111, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(112, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(113, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(114, 196.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(115, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(116, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(117, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(118, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(119, 225.77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(120, 128.49, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(121, 161.61, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(122, 89.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(123, 132.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(124, 184.15, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(125, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(126, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(127, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(128, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(129, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(130, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(131, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(132, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(133, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(134, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(135, 506.16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(136, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(137, 312.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(138, 123.23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(139, 183.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(140, 205.86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(141, 144.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(142, 115.96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(143, 921.04, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(144, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(145, 150.58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(146, 92.54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(147, 103.94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(148, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(149, 109.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(150, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(151, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(152, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(153, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(154, 222.02, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(155, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(156, 188.72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(157, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(158, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(159, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(160, 160.77, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(161, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(162, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(163, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(164, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(165, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(166, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(167, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(168, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(169, 153.59, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(170, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(171, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(172, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(173, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(174, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(175, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(176, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(177, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(178, 200.26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(179, 206.24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(180, 177.85, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(181, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(182, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(183, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(184, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(185, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(186, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(187, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(188, 516.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(189, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(190, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(191, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(192, 121.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(193, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(194, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(195, 53.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(196, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(197, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(198, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(199, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(200, 269.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(201, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(202, 138.73, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(203, 98.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(204, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(205, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(206, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(207, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(208, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(209, 96.91, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(210, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(211, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(212, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(213, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(214, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(215, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(216, 309.47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(217, 1091.84, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(218, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(219, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(220, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(221, 205.28, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(222, 151.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(223, 152.37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(224, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(225, 318.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(226, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(227, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(228, 489.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(229, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(230, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(231, 41.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(232, 172.06, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(233, 778.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(234, 411.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(235, 616.56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(236, 434.97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(237, 166.36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(238, 233.97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(239, 303.24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(240, 160.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(241, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(242, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(243, 105.35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(244, 274.26, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(245, 164.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(246, 164.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(247, 172.51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(248, 165.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(249, 134.97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(250, 176.87, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(251, 104.89, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(252, 266.58, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(253, 162.14, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(254, 124.97, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(255, 1560.46, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(256, 111, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(257, 95.12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(258, 122.13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(259, 142.22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(260, 97.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(261, 127.01, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(262, 116.31, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(263, 91.53, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(264, 75.99, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(265, 89.57, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(266, 71.6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(267, 90.29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(268, 200.78, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(269, 112.93, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(270, 86.33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(271, 89.67, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(272, 78.82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(273, 144.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(274, 186.24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(275, 382.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(276, 98.55, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(277, 99.4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(278, 76.18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(279, 125.45, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(280, 112.2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(281, 107.48, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(282, 106.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(283, 197.76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(284, 99.29, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(285, 98.06, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(286, 166.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(287, 117.11, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(288, 97.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(289, 166.69, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(290, 69.43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(291, 92.98, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(292, 135.83, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(293, 88.94, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(294, 95.34, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(295, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(296, 117.72, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(297, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(298, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(299, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(300, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(301, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(302, 591.79, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(303, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(304, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(305, 125.47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(306, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(307, 95.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(308, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(309, 119.76, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(310, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(311, 74.7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(312, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(313, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(314, 94.23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(315, 184.96, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(316, 333.1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(317, 106.8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(318, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(319, 443.47, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(320, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(321, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(322, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(323, 120.18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(324, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(325, 72.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(326, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(327, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(328, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(329, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(330, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(331, 56.62, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(332, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(333, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(334, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(335, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(336, 195.68, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(337, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(338, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(339, 138.43, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(340, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(341, 173.9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(342, 331.05, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(343, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(344, 203.82, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(345, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(346, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(347, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(348, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(349, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(350, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(351, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(352, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(353, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(354, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(355, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(356, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(357, 348.03, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(358, 218.51, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(359, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(360, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(361, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(362, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(363, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(364, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(365, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(366, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(367, 135.86, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(368, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(369, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(370, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(371, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(372, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(373, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(374, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(375, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(376, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(377, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(378, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(379, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(380, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(381, 136.42, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(382, 295.3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(383, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(384, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(385, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(386, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(387, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `lime_survey_863796_timings` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_survey_links
DROP TABLE IF EXISTS `lime_survey_links`;
CREATE TABLE IF NOT EXISTS `lime_survey_links` (
  `participant_id` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `token_id` int(11) NOT NULL,
  `survey_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_invited` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  PRIMARY KEY (`participant_id`,`token_id`,`survey_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_survey_links: 0 rows
/*!40000 ALTER TABLE `lime_survey_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_survey_links` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_survey_permissions
DROP TABLE IF EXISTS `lime_survey_permissions`;
CREATE TABLE IF NOT EXISTS `lime_survey_permissions` (
  `sid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `permission` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `create_p` int(11) NOT NULL DEFAULT '0',
  `read_p` int(11) NOT NULL DEFAULT '0',
  `update_p` int(11) NOT NULL DEFAULT '0',
  `delete_p` int(11) NOT NULL DEFAULT '0',
  `import_p` int(11) NOT NULL DEFAULT '0',
  `export_p` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sid`,`uid`,`permission`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_survey_permissions: 12 rows
/*!40000 ALTER TABLE `lime_survey_permissions` DISABLE KEYS */;
REPLACE INTO `lime_survey_permissions` (`sid`, `uid`, `permission`, `create_p`, `read_p`, `update_p`, `delete_p`, `import_p`, `export_p`) VALUES
	(863796, 1, 'assessments', 1, 1, 1, 1, 0, 0),
	(863796, 1, 'translations', 0, 1, 1, 0, 0, 0),
	(863796, 1, 'quotas', 1, 1, 1, 1, 0, 0),
	(863796, 1, 'responses', 1, 1, 1, 1, 1, 1),
	(863796, 1, 'statistics', 0, 1, 0, 0, 0, 0),
	(863796, 1, 'surveyactivation', 0, 0, 1, 0, 0, 0),
	(863796, 1, 'surveycontent', 1, 1, 1, 1, 1, 1),
	(863796, 1, 'survey', 0, 1, 0, 1, 0, 0),
	(863796, 1, 'surveylocale', 0, 1, 1, 0, 0, 0),
	(863796, 1, 'surveysecurity', 1, 1, 1, 1, 0, 0),
	(863796, 1, 'surveysettings', 0, 1, 1, 0, 0, 0),
	(863796, 1, 'tokens', 1, 1, 1, 1, 1, 1);
/*!40000 ALTER TABLE `lime_survey_permissions` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_survey_url_parameters
DROP TABLE IF EXISTS `lime_survey_url_parameters`;
CREATE TABLE IF NOT EXISTS `lime_survey_url_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `parameter` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `targetqid` int(11) DEFAULT NULL,
  `targetsqid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_survey_url_parameters: 0 rows
/*!40000 ALTER TABLE `lime_survey_url_parameters` DISABLE KEYS */;
/*!40000 ALTER TABLE `lime_survey_url_parameters` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_templates
DROP TABLE IF EXISTS `lime_templates`;
CREATE TABLE IF NOT EXISTS `lime_templates` (
  `folder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `creator` int(11) NOT NULL,
  PRIMARY KEY (`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_templates: 14 rows
/*!40000 ALTER TABLE `lime_templates` DISABLE KEYS */;
REPLACE INTO `lime_templates` (`folder`, `creator`) VALUES
	('basic', 1),
	('blue_heaven', 1),
	('bluengrey', 1),
	('citronade', 1),
	('clean', 1),
	('clear_logo', 1),
	('default', 1),
	('easy_green', 1),
	('eirenicon', 1),
	('limespired', 1),
	('mint_idea', 1),
	('mint_idea_white', 1),
	('sherpa', 1),
	('vallendar', 1);
/*!40000 ALTER TABLE `lime_templates` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_templates_rights
DROP TABLE IF EXISTS `lime_templates_rights`;
CREATE TABLE IF NOT EXISTS `lime_templates_rights` (
  `uid` int(11) NOT NULL,
  `folder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `use` int(11) NOT NULL,
  PRIMARY KEY (`uid`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_templates_rights: 2 rows
/*!40000 ALTER TABLE `lime_templates_rights` DISABLE KEYS */;
REPLACE INTO `lime_templates_rights` (`uid`, `folder`, `use`) VALUES
	(2, 'default', 1),
	(3, 'default', 1);
/*!40000 ALTER TABLE `lime_templates_rights` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_users
DROP TABLE IF EXISTS `lime_users`;
CREATE TABLE IF NOT EXISTS `lime_users` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `users_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` blob NOT NULL,
  `full_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `parent_id` int(11) NOT NULL,
  `lang` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(320) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_survey` int(11) NOT NULL DEFAULT '0',
  `create_user` int(11) NOT NULL DEFAULT '0',
  `participant_panel` int(11) NOT NULL DEFAULT '0',
  `delete_user` int(11) NOT NULL DEFAULT '0',
  `superadmin` int(11) NOT NULL DEFAULT '0',
  `configurator` int(11) NOT NULL DEFAULT '0',
  `manage_template` int(11) NOT NULL DEFAULT '0',
  `manage_label` int(11) NOT NULL DEFAULT '0',
  `htmleditormode` varchar(7) COLLATE utf8_unicode_ci DEFAULT 'default',
  `templateeditormode` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `questionselectormode` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `one_time_pw` blob,
  `dateformat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `users_name` (`users_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_users: 3 rows
/*!40000 ALTER TABLE `lime_users` DISABLE KEYS */;
REPLACE INTO `lime_users` (`uid`, `users_name`, `password`, `full_name`, `parent_id`, `lang`, `email`, `create_survey`, `create_user`, `participant_panel`, `delete_user`, `superadmin`, `configurator`, `manage_template`, `manage_label`, `htmleditormode`, `templateeditormode`, `questionselectormode`, `one_time_pw`, `dateformat`) VALUES
	(1, 'hgkhanh', _binary 0x65323966363336356133373765346239313863633563326430656464643239306335323731616137333336333438626137663738343261393636643963333232, 'Administrator', 0, 'en', 'hgkhanh@outlook.com', 1, 1, 1, 1, 1, 1, 1, 1, 'default', 'default', 'default', NULL, 1),
	(2, 'trungnt', _binary 0x36636131336435326361373063383833653066306262313031653432356138396538363234646535316462326432333932353933616636613834313138303930, 'Nguyen Tien Trung', 1, 'auto', 'tientrung92@gmail.com', 1, 1, 1, 1, 1, 1, 1, 1, 'default', 'default', 'default', NULL, 1),
	(3, 'admin', _binary 0x36636131336435326361373063383833653066306262313031653432356138396538363234646535316462326432333932353933616636613834313138303930, 'Administrator', 1, 'auto', 'admin@example.com', 1, 1, 1, 1, 1, 1, 1, 1, 'default', 'default', 'default', NULL, 1);
/*!40000 ALTER TABLE `lime_users` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_user_groups
DROP TABLE IF EXISTS `lime_user_groups`;
CREATE TABLE IF NOT EXISTS `lime_user_groups` (
  `ugid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `owner_id` int(11) NOT NULL,
  PRIMARY KEY (`ugid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_user_groups: 2 rows
/*!40000 ALTER TABLE `lime_user_groups` DISABLE KEYS */;
REPLACE INTO `lime_user_groups` (`ugid`, `name`, `description`, `owner_id`) VALUES
	(1, 'Administrator', '', 1),
	(3, 'UG1', '', 1);
/*!40000 ALTER TABLE `lime_user_groups` ENABLE KEYS */;


-- Dumping structure for table limesurvey.lime_user_in_groups
DROP TABLE IF EXISTS `lime_user_in_groups`;
CREATE TABLE IF NOT EXISTS `lime_user_in_groups` (
  `ugid` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`ugid`,`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table limesurvey.lime_user_in_groups: 4 rows
/*!40000 ALTER TABLE `lime_user_in_groups` DISABLE KEYS */;
REPLACE INTO `lime_user_in_groups` (`ugid`, `uid`) VALUES
	(1, 1),
	(1, 2),
	(2, 1),
	(3, 1);
/*!40000 ALTER TABLE `lime_user_in_groups` ENABLE KEYS */;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
