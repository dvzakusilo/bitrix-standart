-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.2.11-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица bitrix_standart.b_admin_notify
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE IF NOT EXISTS `b_admin_notify` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_admin_notify: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify`;
/*!40000 ALTER TABLE `b_admin_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_admin_notify_lang
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE IF NOT EXISTS `b_admin_notify_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(18) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_admin_notify_lang: ~0 rows (приблизительно)
DELETE FROM `b_admin_notify_lang`;
/*!40000 ALTER TABLE `b_admin_notify_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_admin_notify_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_agent
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE IF NOT EXISTS `b_agent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT 100,
  `NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(18) DEFAULT 86400,
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(18) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100))
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_agent: ~21 rows (приблизительно)
DELETE FROM `b_agent`;
/*!40000 ALTER TABLE `b_agent` DISABLE KEYS */;
INSERT INTO `b_agent` (`ID`, `MODULE_ID`, `SORT`, `NAME`, `ACTIVE`, `LAST_EXEC`, `NEXT_EXEC`, `DATE_CHECK`, `AGENT_INTERVAL`, `IS_PERIOD`, `USER_ID`, `RUNNING`) VALUES
	(1, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(2, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(3, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2018-11-26 17:36:06', '2018-11-26 18:36:06', NULL, 3600, 'N', NULL, 'N'),
	(4, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(5, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(6, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', NULL, '2018-11-27 03:00:00', NULL, 86400, 'N', NULL, 'N'),
	(7, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2018-11-26 17:36:06', '2018-11-26 17:37:06', NULL, 60, 'N', NULL, 'N'),
	(8, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(9, 'forum', 100, 'CForumStat::CleanUp();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(10, 'forum', 100, 'CForumFiles::CleanUp();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(11, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 00:00:00', NULL, 86400, 'Y', NULL, 'N'),
	(12, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(13, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(14, 'search', 10, 'CSearchSuggest::CleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(15, 'search', 10, 'CSearchStatistic::CleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(16, 'security', 100, 'CSecuritySession::CleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-26 18:06:06', NULL, 1800, 'N', NULL, 'N'),
	(17, 'security', 100, 'CSecurityIPRule::CleanUpAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-26 18:36:06', NULL, 3600, 'N', NULL, 'N'),
	(18, 'seo', 100, 'Bitrix\\Seo\\Engine\\YandexDirect::updateAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-26 18:36:06', NULL, 3600, 'N', NULL, 'N'),
	(19, 'seo', 100, 'Bitrix\\Seo\\Adv\\LogTable::clean();', 'Y', '2018-11-26 17:36:06', '2018-11-27 17:36:06', NULL, 86400, 'N', NULL, 'N'),
	(20, 'seo', 100, 'Bitrix\\Seo\\Adv\\Auto::checkQuantityAgent();', 'Y', '2018-11-26 17:36:06', '2018-11-26 18:36:06', NULL, 3600, 'N', NULL, 'N'),
	(21, 'subscribe', 100, 'CSubscription::CleanUp();', 'Y', NULL, '2018-11-27 03:00:00', NULL, 86400, 'Y', NULL, 'N');
/*!40000 ALTER TABLE `b_agent` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_app_password
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE IF NOT EXISTS `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_app_password: ~0 rows (приблизительно)
DELETE FROM `b_app_password`;
/*!40000 ALTER TABLE `b_app_password` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_app_password` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_b24connector_buttons
DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE IF NOT EXISTS `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_b24connector_buttons: ~0 rows (приблизительно)
DELETE FROM `b_b24connector_buttons`;
/*!40000 ALTER TABLE `b_b24connector_buttons` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_b24connector_buttons` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_bitrixcloud_option
DROP TABLE IF EXISTS `b_bitrixcloud_option`;
CREATE TABLE IF NOT EXISTS `b_bitrixcloud_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL,
  `PARAM_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM_VALUE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_bitrixcloud_option_1` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_bitrixcloud_option: ~3 rows (приблизительно)
DELETE FROM `b_bitrixcloud_option`;
/*!40000 ALTER TABLE `b_bitrixcloud_option` DISABLE KEYS */;
INSERT INTO `b_bitrixcloud_option` (`ID`, `NAME`, `SORT`, `PARAM_KEY`, `PARAM_VALUE`) VALUES
	(1, 'backup_quota', 0, '0', '0'),
	(2, 'backup_total_size', 0, '0', '0'),
	(3, 'backup_last_backup_time', 0, '0', '1543242974');
/*!40000 ALTER TABLE `b_bitrixcloud_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog
DROP TABLE IF EXISTS `b_blog`;
CREATE TABLE IF NOT EXISTS `b_blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` int(11) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REAL_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_IMG_VERIF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENABLE_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_POST_ID` int(11) DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `AUTO_GROUPS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SEARCH_INDEX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_SOCNET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EDITOR_USE_FONT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_LINK` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_VIDEO` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `EDITOR_USE_FORMAT` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_BLOG_4` (`URL`),
  KEY `IX_BLOG_BLOG_1` (`GROUP_ID`,`ACTIVE`),
  KEY `IX_BLOG_BLOG_2` (`OWNER_ID`),
  KEY `IX_BLOG_BLOG_5` (`LAST_POST_DATE`),
  KEY `IX_BLOG_BLOG_6` (`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog: ~0 rows (приблизительно)
DELETE FROM `b_blog`;
/*!40000 ALTER TABLE `b_blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_category
DROP TABLE IF EXISTS `b_blog_category`;
CREATE TABLE IF NOT EXISTS `b_blog_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_CAT_1` (`BLOG_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_category`;
/*!40000 ALTER TABLE `b_blog_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_category` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_comment
DROP TABLE IF EXISTS `b_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(11) DEFAULT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP1` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHARE_DEST` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_COMM_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_COMM_2` (`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_3` (`DATE_CREATE`,`AUTHOR_ID`),
  KEY `IX_BLOG_COMM_4` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_blog_comment`;
/*!40000 ALTER TABLE `b_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_group
DROP TABLE IF EXISTS `b_blog_group`;
CREATE TABLE IF NOT EXISTS `b_blog_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_GROUP_1` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_group`;
/*!40000 ALTER TABLE `b_blog_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_image
DROP TABLE IF EXISTS `b_blog_image`;
CREATE TABLE IF NOT EXISTS `b_blog_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL DEFAULT 0,
  `BLOG_ID` int(11) NOT NULL DEFAULT 0,
  `POST_ID` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '1970-01-01 00:00:01',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_SIZE` int(11) NOT NULL DEFAULT 0,
  `IS_COMMENT` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMMENT_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_IMAGE_1` (`POST_ID`,`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_image: ~0 rows (приблизительно)
DELETE FROM `b_blog_image`;
/*!40000 ALTER TABLE `b_blog_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_image` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_post
DROP TABLE IF EXISTS `b_blog_post`;
CREATE TABLE IF NOT EXISTS `b_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `AUTHOR_ID` int(11) NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_TEXT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DETAIL_TEXT_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DATE_CREATE` datetime NOT NULL,
  `DATE_PUBLISH` datetime NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PUBLISH_STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `CATEGORY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATRIBUTE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENABLE_TRACKBACK` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ENABLE_COMMENTS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `NUM_COMMENTS` int(11) NOT NULL DEFAULT 0,
  `NUM_COMMENTS_ALL` int(11) NOT NULL DEFAULT 0,
  `NUM_TRACKBACKS` int(11) NOT NULL DEFAULT 0,
  `VIEWS` int(11) DEFAULT NULL,
  `FAVORITE_SORT` int(11) DEFAULT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MICRO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HAS_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_PROPS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_TAGS` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_COMMENT_IMAGES` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_SOCNET_ALL` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEO_DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_POST_1` (`BLOG_ID`,`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_2` (`BLOG_ID`,`DATE_PUBLISH`,`PUBLISH_STATUS`),
  KEY `IX_BLOG_POST_3` (`BLOG_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_4` (`PUBLISH_STATUS`,`DATE_PUBLISH`),
  KEY `IX_BLOG_POST_5` (`DATE_PUBLISH`,`AUTHOR_ID`),
  KEY `IX_BLOG_POST_CODE` (`BLOG_ID`,`CODE`),
  KEY `IX_BLOG_POST_6` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_blog_post`;
/*!40000 ALTER TABLE `b_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_post_category
DROP TABLE IF EXISTS `b_blog_post_category`;
CREATE TABLE IF NOT EXISTS `b_blog_post_category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  `CATEGORY_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_POST_CATEGORY` (`POST_ID`,`CATEGORY_ID`),
  KEY `IX_BLOG_POST_CATEGORY_CAT_ID` (`CATEGORY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_post_category: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_category`;
/*!40000 ALTER TABLE `b_blog_post_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_category` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_post_param
DROP TABLE IF EXISTS `b_blog_post_param`;
CREATE TABLE IF NOT EXISTS `b_blog_post_param` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_PP_1` (`POST_ID`,`USER_ID`),
  KEY `IX_BLOG_PP_2` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_post_param: ~0 rows (приблизительно)
DELETE FROM `b_blog_post_param`;
/*!40000 ALTER TABLE `b_blog_post_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_post_param` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_site_path
DROP TABLE IF EXISTS `b_blog_site_path`;
CREATE TABLE IF NOT EXISTS `b_blog_site_path` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SITE_PATH_2` (`SITE_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_site_path: ~0 rows (приблизительно)
DELETE FROM `b_blog_site_path`;
/*!40000 ALTER TABLE `b_blog_site_path` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_site_path` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_socnet
DROP TABLE IF EXISTS `b_blog_socnet`;
CREATE TABLE IF NOT EXISTS `b_blog_socnet` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_SOCNET` (`BLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_socnet: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet`;
/*!40000 ALTER TABLE `b_blog_socnet` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_socnet_rights
DROP TABLE IF EXISTS `b_blog_socnet_rights`;
CREATE TABLE IF NOT EXISTS `b_blog_socnet_rights` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POST_ID` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_SR_1` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_socnet_rights: ~0 rows (приблизительно)
DELETE FROM `b_blog_socnet_rights`;
/*!40000 ALTER TABLE `b_blog_socnet_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_socnet_rights` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_trackback
DROP TABLE IF EXISTS `b_blog_trackback`;
CREATE TABLE IF NOT EXISTS `b_blog_trackback` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci NOT NULL,
  `BLOG_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_DATE` datetime NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `POST_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_TRBK_1` (`BLOG_ID`,`POST_ID`),
  KEY `IX_BLOG_TRBK_2` (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_trackback: ~0 rows (приблизительно)
DELETE FROM `b_blog_trackback`;
/*!40000 ALTER TABLE `b_blog_trackback` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_trackback` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_user
DROP TABLE IF EXISTS `b_blog_user`;
CREATE TABLE IF NOT EXISTS `b_blog_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ALIAS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(11) DEFAULT NULL,
  `INTERESTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DATE_REG` datetime NOT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER_1` (`USER_ID`),
  KEY `IX_BLOG_USER_2` (`ALIAS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_user: ~0 rows (приблизительно)
DELETE FROM `b_blog_user`;
/*!40000 ALTER TABLE `b_blog_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_user2blog
DROP TABLE IF EXISTS `b_blog_user2blog`;
CREATE TABLE IF NOT EXISTS `b_blog_user2blog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`BLOG_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_user2blog: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2blog`;
/*!40000 ALTER TABLE `b_blog_user2blog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2blog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_user2user_group
DROP TABLE IF EXISTS `b_blog_user2user_group`;
CREATE TABLE IF NOT EXISTS `b_blog_user2user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_USER2GROUP_1` (`USER_ID`,`BLOG_ID`,`USER_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_user2user_group: ~0 rows (приблизительно)
DELETE FROM `b_blog_user2user_group`;
/*!40000 ALTER TABLE `b_blog_user2user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user2user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_user_group
DROP TABLE IF EXISTS `b_blog_user_group`;
CREATE TABLE IF NOT EXISTS `b_blog_user_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BLOG_USER_GROUP_1` (`BLOG_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_user_group: ~2 rows (приблизительно)
DELETE FROM `b_blog_user_group`;
/*!40000 ALTER TABLE `b_blog_user_group` DISABLE KEYS */;
INSERT INTO `b_blog_user_group` (`ID`, `BLOG_ID`, `NAME`) VALUES
	(1, NULL, 'all'),
	(2, NULL, 'registered');
/*!40000 ALTER TABLE `b_blog_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_blog_user_group_perms
DROP TABLE IF EXISTS `b_blog_user_group_perms`;
CREATE TABLE IF NOT EXISTS `b_blog_user_group_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BLOG_ID` int(11) NOT NULL,
  `USER_GROUP_ID` int(11) NOT NULL,
  `PERMS_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `POST_ID` int(11) DEFAULT NULL,
  `PERMS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `AUTOSET` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_BLOG_UG_PERMS_1` (`BLOG_ID`,`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_2` (`USER_GROUP_ID`,`PERMS_TYPE`,`POST_ID`),
  KEY `IX_BLOG_UG_PERMS_3` (`POST_ID`,`USER_GROUP_ID`,`PERMS_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_blog_user_group_perms: ~0 rows (приблизительно)
DELETE FROM `b_blog_user_group_perms`;
/*!40000 ALTER TABLE `b_blog_user_group_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_blog_user_group_perms` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_cache_tag
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE IF NOT EXISTS `b_cache_tag` (
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_cache_tag: ~0 rows (приблизительно)
DELETE FROM `b_cache_tag`;
/*!40000 ALTER TABLE `b_cache_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_cache_tag` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_captcha
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE IF NOT EXISTS `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_captcha: ~0 rows (приблизительно)
DELETE FROM `b_captcha`;
/*!40000 ALTER TABLE `b_captcha` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_captcha` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_checklist
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE IF NOT EXISTS `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_checklist: ~0 rows (приблизительно)
DELETE FROM `b_checklist`;
/*!40000 ALTER TABLE `b_checklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_checklist` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_clouds_file_bucket
DROP TABLE IF EXISTS `b_clouds_file_bucket`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_bucket` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(11) DEFAULT 500,
  `READ_ONLY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SERVICE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET` varchar(63) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOCATION` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CNAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_COUNT` int(11) DEFAULT 0,
  `FILE_SIZE` float DEFAULT 0,
  `LAST_FILE_ID` int(11) DEFAULT NULL,
  `PREFIX` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_RULES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_clouds_file_bucket: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_bucket`;
/*!40000 ALTER TABLE `b_clouds_file_bucket` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_bucket` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_clouds_file_resize
DROP TABLE IF EXISTS `b_clouds_file_resize`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_resize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ERROR_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `FILE_ID` int(11) DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_PATH` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_file_resize_ts` (`TIMESTAMP_X`),
  KEY `ix_b_file_resize_path` (`TO_PATH`(100)),
  KEY `ix_b_file_resize_file` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_clouds_file_resize: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_resize`;
/*!40000 ALTER TABLE `b_clouds_file_resize` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_resize` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_clouds_file_upload
DROP TABLE IF EXISTS `b_clouds_file_upload`;
CREATE TABLE IF NOT EXISTS `b_clouds_file_upload` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FILE_PATH` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) DEFAULT NULL,
  `TMP_FILE` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BUCKET_ID` int(11) NOT NULL,
  `PART_SIZE` int(11) NOT NULL,
  `PART_NO` int(11) NOT NULL,
  `PART_FAIL_COUNTER` int(11) NOT NULL,
  `NEXT_STEP` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_clouds_file_upload: ~0 rows (приблизительно)
DELETE FROM `b_clouds_file_upload`;
/*!40000 ALTER TABLE `b_clouds_file_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_clouds_file_upload` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_component_params
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE IF NOT EXISTS `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_component_params: ~0 rows (приблизительно)
DELETE FROM `b_component_params`;
/*!40000 ALTER TABLE `b_component_params` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_component_params` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_composite_log
DROP TABLE IF EXISTS `b_composite_log`;
CREATE TABLE IF NOT EXISTS `b_composite_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(18) NOT NULL DEFAULT 0,
  `PAGE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_composite_log: ~0 rows (приблизительно)
DELETE FROM `b_composite_log`;
/*!40000 ALTER TABLE `b_composite_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_composite_page
DROP TABLE IF EXISTS `b_composite_page`;
CREATE TABLE IF NOT EXISTS `b_composite_page` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(18) NOT NULL DEFAULT 0,
  `REWRITES` int(18) NOT NULL DEFAULT 0,
  `SIZE` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_composite_page: ~0 rows (приблизительно)
DELETE FROM `b_composite_page`;
/*!40000 ALTER TABLE `b_composite_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_composite_page` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_consent_agreement
DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE IF NOT EXISTS `b_consent_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_consent_agreement: ~0 rows (приблизительно)
DELETE FROM `b_consent_agreement`;
/*!40000 ALTER TABLE `b_consent_agreement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_agreement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_consent_field
DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE IF NOT EXISTS `b_consent_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(18) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_consent_field: ~0 rows (приблизительно)
DELETE FROM `b_consent_field`;
/*!40000 ALTER TABLE `b_consent_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_consent_user_consent
DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE IF NOT EXISTS `b_consent_user_consent` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_consent_user_consent: ~0 rows (приблизительно)
DELETE FROM `b_consent_user_consent`;
/*!40000 ALTER TABLE `b_consent_user_consent` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_consent_user_consent` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_counter_data
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE IF NOT EXISTS `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_counter_data: ~0 rows (приблизительно)
DELETE FROM `b_counter_data`;
/*!40000 ALTER TABLE `b_counter_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_counter_data` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_culture
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE IF NOT EXISTS `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(1) DEFAULT 1,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_culture: ~2 rows (приблизительно)
DELETE FROM `b_culture`;
/*!40000 ALTER TABLE `b_culture` DISABLE KEYS */;
INSERT INTO `b_culture` (`ID`, `CODE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`) VALUES
	(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y'),
	(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y');
/*!40000 ALTER TABLE `b_culture` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE IF NOT EXISTS `b_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(18) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event: ~0 rows (приблизительно)
DELETE FROM `b_event`;
/*!40000 ALTER TABLE `b_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_attachment
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE IF NOT EXISTS `b_event_attachment` (
  `EVENT_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_attachment`;
/*!40000 ALTER TABLE `b_event_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_log
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE IF NOT EXISTS `b_event_log` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `GUEST_ID` int(18) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type` (`AUDIT_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_log: ~0 rows (приблизительно)
DELETE FROM `b_event_log`;
/*!40000 ALTER TABLE `b_event_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_message
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE IF NOT EXISTS `b_event_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_message: ~26 rows (приблизительно)
DELETE FROM `b_event_message`;
/*!40000 ALTER TABLE `b_event_message` DISABLE KEYS */;
INSERT INTO `b_event_message` (`ID`, `TIMESTAMP_X`, `EVENT_NAME`, `LID`, `ACTIVE`, `EMAIL_FROM`, `EMAIL_TO`, `SUBJECT`, `MESSAGE`, `MESSAGE_PHP`, `BODY_TYPE`, `BCC`, `REPLY_TO`, `CC`, `IN_REPLY_TO`, `PRIORITY`, `FIELD1_NAME`, `FIELD1_VALUE`, `FIELD2_NAME`, `FIELD2_VALUE`, `SITE_TEMPLATE_ID`, `ADDITIONAL_FIELD`, `LANGUAGE_ID`) VALUES
	(1, '2018-11-26 17:23:23', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams["SERVER_NAME"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams["USER_ID"];?>\n\n\nИмя: <?=$arParams["NAME"];?>\n\nФамилия: <?=$arParams["LAST_NAME"];?>\n\nE-Mail: <?=$arParams["EMAIL"];?>\n\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(2, '2018-11-26 17:23:23', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(3, '2018-11-26 17:23:23', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(4, '2018-11-26 17:23:23', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n<?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>,\n\n<?=$arParams["MESSAGE"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["USER_ID"];?>\n\nСтатус профиля: <?=$arParams["STATUS"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(5, '2018-11-26 17:23:23', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams["SERVER_NAME"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>&confirm_code=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams["USER_ID"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(6, '2018-11-26 17:23:23', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams["NAME"];?> <?=$arParams["LAST_NAME"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams["ID"];?>\n\nLogin: <?=$arParams["LOGIN"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams["URL_LOGIN"];?>&USER_CHECKWORD=<?=$arParams["CHECKWORD"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(7, '2018-11-26 17:23:23', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: #AUTHOR#\nE-mail автора: #AUTHOR_EMAIL#\n\nТекст сообщения:\n#TEXT#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВам было отправлено сообщение через форму обратной связи\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nE-mail автора: <?=$arParams["AUTHOR_EMAIL"];?>\n\n\nТекст сообщения:\n<?=$arParams["TEXT"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
	(8, '2018-11-26 17:23:23', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
	(9, '2018-11-26 17:24:42', 'NEW_BLOG_MESSAGE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #BLOG_NAME# : #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение в блоге "#BLOG_NAME#"\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\nДата: #MESSAGE_DATE#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение в блоге "<?=$arParams["BLOG_NAME"];?>"\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(10, '2018-11-26 17:24:42', 'NEW_BLOG_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(11, '2018-11-26 17:24:42', 'NEW_BLOG_COMMENT2COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE# : #COMMENT_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nТема:\n#COMMENT_TITLE#\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nТема:\n<?=$arParams["COMMENT_TITLE"];?>\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(12, '2018-11-26 17:24:42', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#"\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>"\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(13, '2018-11-26 17:24:42', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "#BLOG_NAME#" на сообщение "#MESSAGE_TITLE#".\n\nАвтор: #AUTHOR#\nДата: #COMMENT_DATE#\n\nТекст сообщения:\n#COMMENT_TEXT#\n\nАдрес сообщения:\n#COMMENT_PATH#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовый комментарий на ваш комментарий в блоге "<?=$arParams["BLOG_NAME"];?>" на сообщение "<?=$arParams["MESSAGE_TITLE"];?>".\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата: <?=$arParams["COMMENT_DATE"];?>\n\n\nТекст сообщения:\n<?=$arParams["COMMENT_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["COMMENT_PATH"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(14, '2018-11-26 17:24:42', 'BLOG_YOUR_BLOG_TO_USER', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Ваш блог "#BLOG_NAME#" был добавлен в друзья к #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВаш блог "#BLOG_NAME#" был добавлен в друзья к #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВаш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен в друзья к <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, '2018-11-26 17:24:42', 'BLOG_YOU_TO_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] Вы были добавлены в друзья блога "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы были добавлены в друзья блога "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы были добавлены в друзья блога "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(16, '2018-11-26 17:24:42', 'BLOG_BLOG_TO_YOU', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] К вам в друзья был добавлен блог "#BLOG_NAME#"', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nК вам в друзья был добавлен блог "#BLOG_NAME#".\n\nАдрес блога: #BLOG_ADR#\n\nВаш профиль: #USER_URL#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nК вам в друзья был добавлен блог "<?=$arParams["BLOG_NAME"];?>".\n\nАдрес блога: <?=$arParams["BLOG_ADR"];?>\n\n\nВаш профиль: <?=$arParams["USER_URL"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(17, '2018-11-26 17:24:42', 'BLOG_USER_TO_YOUR_BLOG', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [B] В ваш блог "#BLOG_NAME#" был добавлен друг #USER#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВ ваш блог "#BLOG_NAME#" был добавлен друг #USER#.\n\nПрофиль пользователя: #USER_URL#\n\nАдрес вашего блога: #BLOG_ADR#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВ ваш блог "<?=$arParams["BLOG_NAME"];?>" был добавлен друг <?=$arParams["USER"];?>.\n\nПрофиль пользователя: <?=$arParams["USER_URL"];?>\n\n\nАдрес вашего блога: <?=$arParams["BLOG_ADR"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(18, '2018-11-26 17:24:42', 'BLOG_SONET_NEW_POST', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(19, '2018-11-26 17:24:42', 'BLOG_SONET_NEW_COMMENT', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', 'Re: #POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{#COMMENT_ID#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","EMAIL_TO" => "{#EMAIL_TO#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post.comment.mail","",Array("COMMENT_ID" => "{$arParams[\'COMMENT_ID\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(20, '2018-11-26 17:24:42', 'BLOG_SONET_POST_SHARE', 's1', 'Y', '#EMAIL_FROM#', '#EMAIL_TO#', '#POST_TITLE#', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{#EMAIL_TO#}","RECIPIENT_ID" => "{#RECIPIENT_ID#}","POST_ID" => "{#POST_ID#}","URL" => "{#URL#}"));?>', '<?EventMessageThemeCompiler::includeComponent("bitrix:socialnetwork.blog.post_share.mail","",Array("EMAIL_TO" => "{$arParams[\'EMAIL_TO\']}","RECIPIENT_ID" => "{$arParams[\'RECIPIENT_ID\']}","POST_ID" => "{$arParams[\'POST_ID\']}","URL" => "{$arParams[\'URL\']}"));?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_user', NULL, NULL),
	(21, '2018-11-26 17:24:42', 'BLOG_POST_BROADCAST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: #MESSAGE_TITLE#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n#MESSAGE_TITLE#\n\nАвтор: #AUTHOR#\n\nТекст сообщения:\n#MESSAGE_TEXT#\n\nАдрес сообщения:\n#MESSAGE_PATH#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНа сайте добавлено новое сообщение.\n\nТема:\n<?=$arParams["MESSAGE_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\n\nТекст сообщения:\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\n<?=$arParams["MESSAGE_PATH"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(22, '2018-11-26 17:25:43', 'NEW_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНовое сообщение на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nНовое сообщение на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(23, '2018-11-26 17:25:43', 'NEW_FORUM_PRIV', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME# #FROM_EMAIL#\nДата : #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?> <?=$arParams["FROM_EMAIL"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(24, '2018-11-26 17:25:43', 'NEW_FORUM_PRIVATE_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#TO_EMAIL#', '#SITE_NAME#: [private] #SUBJECT#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте #SERVER_NAME#.\n\nТема: #SUBJECT#\n\nАвтор: #FROM_NAME#\nДата: #MESSAGE_DATE#\nСообщение:\n\n#MESSAGE#\n\nСсылка на сообщение: #MESSAGE_LINK#Сообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nВы получили персональное сообщение с форума на сайте <?=$arParams["SERVER_NAME"];?>.\n\nТема: <?=$arParams["SUBJECT"];?>\n\n\nАвтор: <?=$arParams["FROM_NAME"];?>\n\nДата: <?=$arParams["MESSAGE_DATE"];?>\n\nСообщение:\n\n<?=$arParams["MESSAGE"];?>\n\n\nСсылка на сообщение: <?=$arParams["MESSAGE_LINK"];?>Сообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, '2018-11-26 17:25:43', 'EDIT_FORUM_MESSAGE', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#SITE_NAME#: [F] #TOPIC_TITLE# : #FORUM_NAME#', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nИзменение сообщения на форуме #SERVER_NAME#.\n\nТема:\n#TOPIC_TITLE#\n\nАвтор: #AUTHOR#\nДата : #MESSAGE_DATE#\nТекст сообщения:\n\n#MESSAGE_TEXT#\n\nАдрес сообщения:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nИзменение сообщения на форуме <?=$arParams["SERVER_NAME"];?>.\n\nТема:\n<?=$arParams["TOPIC_TITLE"];?>\n\n\nАвтор: <?=$arParams["AUTHOR"];?>\n\nДата : <?=$arParams["MESSAGE_DATE"];?>\n\nТекст сообщения:\n\n<?=$arParams["MESSAGE_TEXT"];?>\n\n\nАдрес сообщения:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nСообщение сгенерировано автоматически.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(26, '2018-11-26 17:25:43', 'FORUM_NEW_MESSAGE_MAIL', 's1', 'Y', '#FROM_EMAIL#', '#RECIPIENT#', '#TOPIC_TITLE#', '#MESSAGE_TEXT#\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум #FORUM_NAME#.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://#SERVER_NAME##PATH2FORUM#\n\nНаписать новое сообщение: #FORUM_EMAIL#\n\nАвтор сообщения: #AUTHOR#\n\nСообщение сгенерировано автоматически на сайте #SITE_NAME#.\n', '<?=$arParams["MESSAGE_TEXT"];?>\n\n\n------------------------------------------  \nВы получили это сообщение, так как выподписаны на форум <?=$arParams["FORUM_NAME"];?>.\n\nОтветить на сообщение можно по электронной почте или через форму на сайте:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["PATH2FORUM"];?>\n\n\nНаписать новое сообщение: <?=$arParams["FORUM_EMAIL"];?>\n\n\nАвтор сообщения: <?=$arParams["AUTHOR"];?>\n\n\nСообщение сгенерировано автоматически на сайте <?=$arParams["SITE_NAME"];?>.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, '2018-11-26 17:28:23', 'VIRUS_DETECTED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Обнаружен вирус', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера #SERVER_NAME# обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://#SERVER_NAME#/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте!\n\nВы получили это сообщение, так как модуль проактивной защиты сервера <?=$arParams["SERVER_NAME"];?> обнаружил код, похожий на вирус.\n\n1. Подозрительный код был вырезан из html.\n2. Проверьте журнал вторжений и убедитесь, что код действительно вредоносный, а не является кодом какого-либо счетчика или фреймворка.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/event_log.php?lang=ru&set_filter=Y&find_type=audit_type_id&find_audit_type[]=SECURITY_VIRUS )\n3. В случае, если код не является опасным, добавьте его в исключения на странице настройки антивируса.\n (ссылка: http://<?=$arParams["SERVER_NAME"];?>/bitrix/admin/security_antivirus.php?lang=ru&tabControl_active_tab=exceptions )\n4. Если код является вирусным, то необходимо выполнить следующие действия:\n\n а) Смените пароли доступа к сайту у администраторов и ответственных сотрудников.\n б) Смените пароли доступа по ssh и ftp.\n в) Проверьте и вылечите компьютеры администраторов, имевших доступ к сайту по ssh или ftp.\n г) В программах доступа к сайту по ssh и ftp отключите сохранение паролей.\n д) Удалите вредоносный код из зараженных файлов. Например, восстановите поврежденные файлы из самой свежей резервной копии.\n\n---------------------------------------------------------------------\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(28, '2018-11-26 17:28:43', 'SUBSCRIBE_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение подписки', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера #SERVER_NAME#.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ #EMAIL#\nДата добавления/редактирования .... #DATE_SUBSCR#\n\nВаш код для подтверждения подписки: #CONFIRM_CODE#\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#\n\nОтписаться:\nhttp://#SERVER_NAME##SUBSCR_SECTION#subscr_edit.php?ID=#ID#&CONFIRM_CODE=#CONFIRM_CODE#&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'Информационное сообщение сайта <?=$arParams["SITE_NAME"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был подписан\nна список рассылки сервера <?=$arParams["SERVER_NAME"];?>.\n\nДополнительная информация о подписке:\n\nАдрес подписки (email) ............ <?=$arParams["EMAIL"];?>\n\nДата добавления/редактирования .... <?=$arParams["DATE_SUBSCR"];?>\n\n\nВаш код для подтверждения подписки: <?=$arParams["CONFIRM_CODE"];?>\n\n\nДля подтверждения подписки перейдите по следующей ссылке:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nВы также можете ввести код для подтверждения подписки на странице:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>\n\n\nВнимание! Вы не будете получать сообщения рассылки, пока не подтвердите\nсвою подписку.\n\n---------------------------------------------------------------------\nСохраните это письмо, так как оно содержит информацию для авторизации.\nИспользуя код подтверждения подписки, вы cможете изменить параметры\nподписки или отписаться от рассылки.\n\nИзменить параметры:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>\n\n\nОтписаться:\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["SUBSCR_SECTION"];?>subscr_edit.php?ID=<?=$arParams["ID"];?>&CONFIRM_CODE=<?=$arParams["CONFIRM_CODE"];?>&action=unsubscribe\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.\n', 'text', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(29, '2018-11-26 17:28:54', 'VOTE_FOR', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: [V] #VOTE_TITLE#', '#USER_NAME# принял участие в опросе "#VOTE_TITLE#":\n#VOTE_STATISTIC#\n\nhttp://#SERVER_NAME##URL#\nСообщение сгенерировано автоматически.', '<?=$arParams["USER_NAME"];?> принял участие в опросе "<?=$arParams["VOTE_TITLE"];?>":\n<?=$arParams["VOTE_STATISTIC"];?>\n\n\nhttp://<?=$arParams["SERVER_NAME"];?><?=$arParams["URL"];?>\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_event_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_message_attachment
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE IF NOT EXISTS `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(18) NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_message_attachment: ~0 rows (приблизительно)
DELETE FROM `b_event_message_attachment`;
/*!40000 ALTER TABLE `b_event_message_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_event_message_attachment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_message_site
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE IF NOT EXISTS `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_message_site: ~26 rows (приблизительно)
DELETE FROM `b_event_message_site`;
/*!40000 ALTER TABLE `b_event_message_site` DISABLE KEYS */;
INSERT INTO `b_event_message_site` (`EVENT_MESSAGE_ID`, `SITE_ID`) VALUES
	(1, 's1'),
	(2, 's1'),
	(3, 's1'),
	(4, 's1'),
	(5, 's1'),
	(6, 's1'),
	(7, 's1'),
	(8, 's1'),
	(9, 's1'),
	(10, 's1'),
	(11, 's1'),
	(12, 's1'),
	(13, 's1'),
	(14, 's1'),
	(15, 's1'),
	(16, 's1'),
	(17, 's1'),
	(18, 's1'),
	(19, 's1'),
	(20, 's1'),
	(21, 's1'),
	(22, 's1'),
	(23, 's1'),
	(24, 's1'),
	(25, 's1'),
	(26, 's1'),
	(27, 's1'),
	(28, 's1'),
	(29, 's1');
/*!40000 ALTER TABLE `b_event_message_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_event_type
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE IF NOT EXISTS `b_event_type` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) NOT NULL DEFAULT 150,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_event_type: ~52 rows (приблизительно)
DELETE FROM `b_event_type`;
/*!40000 ALTER TABLE `b_event_type` DISABLE KEYS */;
INSERT INTO `b_event_type` (`ID`, `LID`, `EVENT_NAME`, `NAME`, `DESCRIPTION`, `SORT`) VALUES
	(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1),
	(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2),
	(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3),
	(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4),
	(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5),
	(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6),
	(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 7),
	(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8),
	(9, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1),
	(10, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2),
	(11, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3),
	(12, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4),
	(13, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5),
	(14, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6),
	(15, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address', 7),
	(16, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8),
	(17, 'ru', 'NEW_BLOG_MESSAGE', 'Новое сообщение в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_DATE# - Дата сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
	(18, 'ru', 'NEW_BLOG_COMMENT', 'Новый комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
	(19, 'ru', 'NEW_BLOG_COMMENT2COMMENT', 'Новый комментарий на ваш комментарий в блоге', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
	(20, 'ru', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'Новый комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#MESSAGE_TITLE# - Тема сообщения\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
	(21, 'ru', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'Новый комментарий на ваш комментарий в блоге (без темы)', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#COMMENT_TITLE# - Заголовок комментария\n#COMMENT_TEXT# - Текст комментария\n#COMMENT_DATE# - Текст комментария\n#COMMENT_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма', 100),
	(22, 'ru', 'BLOG_YOUR_BLOG_TO_USER', 'Ваш блог был добавлен в друзья', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
	(23, 'ru', 'BLOG_YOU_TO_BLOG', 'Вы были добавлены в друзья блога', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
	(24, 'ru', 'BLOG_BLOG_TO_YOU', 'К вам в друзья был добавлен блог', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
	(25, 'ru', 'BLOG_USER_TO_YOUR_BLOG', 'В ваш блог был добавлен друг', '#BLOG_ID# - ID блога \n#BLOG_NAME# - Название блога\n#BLOG_URL# - Название блога латиницей\n#BLOG_ADR# - Адрес блога\n#USER_ID# - ID пользователя\n#USER# - Пользователь\n#USER_URL# - Адрес пользователя\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n', 100),
	(26, 'ru', 'BLOG_SONET_NEW_POST', 'Добавлено новое сообщение', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100),
	(27, 'ru', 'BLOG_SONET_NEW_COMMENT', 'Добавлен новый комментарий', '#EMAIL_TO# - Email получателя письма\n#COMMENT_ID# - ID комментария\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100),
	(28, 'ru', 'BLOG_SONET_POST_SHARE', 'Добавлен новый получатель сообщения', '#EMAIL_TO# - Email получателя письма\n#POST_ID# - ID сообщения\n#RECIPIENT_ID# - ID получателя\n#URL_ID# - URL страницы сообщения\n', 100),
	(29, 'ru', 'BLOG_POST_BROADCAST', 'Добавлено новое сообщение', '\n#MESSAGE_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#MESSAGE_PATH# - URL адрес сообщения\n#AUTHOR# - Автор сообщения\n#EMAIL_TO# - Email получателя письма', 100),
	(30, 'en', 'NEW_BLOG_MESSAGE', 'New blog message', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#MESSAGE_TEXT# - Message text\n#MESSAGE_DATE# - Message date\n#MESSAGE_PATH# - URL to message\n#AUTHOR# - Message author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
	(31, 'en', 'NEW_BLOG_COMMENT', 'New comment in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
	(32, 'en', 'NEW_BLOG_COMMENT2COMMENT', 'New comment for your in blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TITLE# - Comment title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
	(33, 'en', 'NEW_BLOG_COMMENT_WITHOUT_TITLE', 'New comment in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
	(34, 'en', 'NEW_BLOG_COMMENT2COMMENT_WITHOUT_TITLE', 'New comment for your in blog (without subject)', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog title\n#BLOG_URL# - Blog url\n#MESSAGE_TITLE# - Message title\n#COMMENT_TEXT# - Comment text\n#COMMENT_DATE# - Comment date\n#COMMENT_PATH# - Comment URL\n#AUTHOR# - Comment author\n#EMAIL_FROM# - Sender email\n#EMAIL_TO# - Recipient email', 100),
	(35, 'en', 'BLOG_YOUR_BLOG_TO_USER', 'Your blog has been added to friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100),
	(36, 'en', 'BLOG_YOU_TO_BLOG', 'You have been added to blog friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100),
	(37, 'en', 'BLOG_BLOG_TO_YOU', 'A blog has been added to your friends', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100),
	(38, 'en', 'BLOG_USER_TO_YOUR_BLOG', 'A friend has been added to your blog', '#BLOG_ID# - Blog ID\n#BLOG_NAME# - Blog name\n#BLOG_URL# - Blog name, Latin letters only\n#BLOG_ADR# - Blog address\n#USER_ID# - User ID\n#USER# - User\n#USER_URL# - User URL\n#EMAIL_FROM# - Sender E-mail\n#EMAIL_TO# - Recipient E-mail', 100),
	(39, 'en', 'BLOG_SONET_NEW_POST', 'New post added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100),
	(40, 'en', 'BLOG_SONET_NEW_COMMENT', 'Comment added', '#EMAIL_TO# - Recipient email\n#COMMENT_ID# - Comment ID\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100),
	(41, 'en', 'BLOG_SONET_POST_SHARE', 'New recipient added', '#EMAIL_TO# - Recipient email\n#POST_ID# - Post ID\n#URL_ID# - Post URL', 100),
	(42, 'en', 'BLOG_POST_BROADCAST', 'New post added', '\n#MESSAGE_TITLE# - Post subject\n#MESSAGE_TEXT# - Post text \n#MESSAGE_PATH# - Post URL\n#AUTHOR# - Post author\n#EMAIL_TO# - E-mail recipient', 100),
	(43, 'ru', 'NEW_FORUM_MESSAGE', 'Новое сообщение на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100),
	(44, 'ru', 'NEW_FORUM_PRIV', 'Приватное письмо посетителю форума', '\n			#FROM_NAME# - Автор сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Тело сообщения\n			#MESSAGE_DATE# - Дата сообщения', 100),
	(45, 'ru', 'NEW_FORUM_PRIVATE_MESSAGE', 'Приватное сообщение', '\n			#FROM_NAME# - Имя автора сообщения\n			#FROM_USER_ID# - ID автора сообщения\n			#FROM_EMAIL# - E-Mail автора сообщения\n			#TO_NAME# - Имя получателя сообщения\n			#TO_USER_ID# - ID получателя сообщения\n			#TO_EMAIL# - E-Mail получателя сообщения\n			#SUBJECT# - Тема сообщения\n			#MESSAGE# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#MESSAGE_LINK# - Ссылка на сообщение', 100),
	(46, 'ru', 'EDIT_FORUM_MESSAGE', 'Изменение сообщения на форуме', '\n			#FORUM_ID# - ID форума\n			#FORUM_NAME# - Название форума\n			#TOPIC_ID# - ID темы\n			#MESSAGE_ID# - ID сообщения\n			#TOPIC_TITLE# - Тема сообщения\n			#MESSAGE_TEXT# - Текст сообщения\n			#MESSAGE_DATE# - Дата сообщения\n			#AUTHOR# - Автор сообщения\n			#RECIPIENT# - Получатель сообщения\n			#TAPPROVED# - Тема сообщения показывается\n			#MAPPROVED# - Тело сообщения показывается\n			#PATH2FORUM# - Адрес сообщения\n			#FROM_EMAIL# - E-Mail для поля From письма', 100),
	(47, 'en', 'NEW_FORUM_MESSAGE', 'New forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100),
	(48, 'en', 'NEW_FORUM_PRIV', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date', 100),
	(49, 'en', 'NEW_FORUM_PRIVATE_MESSAGE', 'Private message for forum user', '\n			#FROM_NAME# - Name of the sender\n			#FROM_USER_ID# - ID of the sender\n			#FROM_EMAIL# - E-Mail of the sender\n			#TO_NAME# - Name of recipient\n			#TO_USER_ID# - ID of recipient\n			#TO_EMAIL# - E-Mail of recipient\n			#SUBJECT# - Topic\n			#MESSAGE# - Message\n			#MESSAGE_DATE# - Date\n			#MESSAGE_LINK# - Link to message', 100),
	(50, 'en', 'EDIT_FORUM_MESSAGE', 'Changing forum message', '\n			#FORUM_ID# - Forum ID\n			#FORUM_NAME# - Forum name\n			#TOPIC_ID# - Topic ID\n			#MESSAGE_ID# - Message ID\n			#TOPIC_TITLE# - Topic title\n			#MESSAGE_TEXT# - Message text\n			#MESSAGE_DATE# - Message date\n			#AUTHOR# - Message author\n			#RECIPIENT# - E-Mail recipient\n			#TAPPROVED# - Message topic is approved\n			#MAPPROVED# - Message is approved\n			#PATH2FORUM# - Message Url\n			#FROM_EMAIL# - E-Mail for From field of the EMail', 100),
	(51, 'ru', 'FORUM_NEW_MESSAGE_MAIL', 'Новое сообщение на форуме в режиме общения по E-Mail', '#FORUM_NAME# - Название форума\n#AUTHOR# - Автор сообщения\n#FROM_EMAIL# - E-Mail для поля From письма\n#RECIPIENT# - Получатель сообщения\n#TOPIC_TITLE# - Тема сообщения\n#MESSAGE_TEXT# - Текст сообщения\n#PATH2FORUM# - Адрес сообщения\n#MESSAGE_DATE# - Дата сообщения\n#FORUM_EMAIL# - Е-Mail адрес для добавления сообщений на форум\n#FORUM_ID# - ID форума\n#TOPIC_ID# - ID темы \n#MESSAGE_ID# - ID сообщения\n#TAPPROVED# - Тема опубликована\n#MAPPROVED# - Сообщение опубликовано\n', 100),
	(52, 'en', 'FORUM_NEW_MESSAGE_MAIL', 'New message at the forum (e-mail messaging mode)', '#FORUM_NAME# - Forum name\n#AUTHOR# - Message author\n#FROM_EMAIL# - E-Mail in the &amp;From&amp; field\n#RECIPIENT# - Message recipient\n#TOPIC_TITLE# - Message subject\n#MESSAGE_TEXT# - Message text\n#PATH2FORUM# - Message URL\n#MESSAGE_DATE# - Message date\n#FORUM_EMAIL# - E-Mail to add messages to the forum \n#FORUM_ID# - Forum ID\n#TOPIC_ID# - Topic ID \n#MESSAGE_ID# - Message ID\n#TAPPROVED# - Topic approved and published\n#MAPPROVED# - Message approved and published\n', 100),
	(53, 'ru', 'VIRUS_DETECTED', 'Обнаружен вирус', '#EMAIL# - E-Mail администратора сайта (из настроек главного модуля)', 100),
	(54, 'en', 'VIRUS_DETECTED', 'Virus detected', '#EMAIL# - Site administrator\'s e-mail address (from the Kernel module settings)', 100),
	(55, 'ru', 'SUBSCRIBE_CONFIRM', 'Подтверждение подписки', '#ID# - идентификатор подписки\n#EMAIL# - адрес подписки\n#CONFIRM_CODE# - код подтверждения\n#SUBSCR_SECTION# - раздел, где находится страница редактирования подписки (задается в настройках)\n#USER_NAME# - имя подписчика (может отсутствовать)\n#DATE_SUBSCR# - дата добавления/изменения адреса\n', 100),
	(56, 'en', 'SUBSCRIBE_CONFIRM', 'Confirmation of subscription', '#ID# - subscription ID\n#EMAIL# - subscription email\n#CONFIRM_CODE# - confirmation code\n#SUBSCR_SECTION# - section with subscription edit page (specifies in the settings)\n#USER_NAME# - subscriber\'s name (optional)\n#DATE_SUBSCR# - date of adding/change of address\n', 100),
	(57, 'ru', 'VOTE_FOR', 'Новый голос', '#ID# - ID результата голосования\n#TIME# - время голосования\n#VOTE_TITLE# - наименование опроса\n#VOTE_DESCRIPTION# - описание опроса\n#VOTE_ID# - ID опроса\n#CHANNEL# - наименование группы опроса\n#CHANNEL_ID# - ID группы опроса\n#VOTER_ID# - ID проголосовавшего посетителя\n#USER_NAME# - ФИО пользователя\n#LOGIN# - логин\n#USER_ID# - ID пользователя\n#STAT_GUEST_ID# - ID посетителя модуля статистики\n#SESSION_ID# - ID сессии модуля статистики\n#IP# - IP адрес\n#VOTE_STATISTIC# - Сводная статистика опроса типа ( - Вопрос - Ответ )\n#URL# - Путь к опросу\n', 100),
	(58, 'en', 'VOTE_FOR', 'New vote', '#ID# - Vote result ID\n#TIME# - Time of vote\n#VOTE_TITLE# - Poll name\n#VOTE_DESCRIPTION# - Poll description\n#VOTE_ID# - Poll ID\n#CHANNEL# - Poll group name\n#CHANNEL_ID# - Poll group ID\n#VOTER_ID# - Voter\'s user ID\n#USER_NAME# - User full name\n#LOGIN# - login\n#USER_ID# - User ID\n#STAT_GUEST_ID# - Visitor ID in web analytics module\n#SESSION_ID# - Session ID in web analytics module\n#IP# - IP address\n#VOTE_STATISTIC# - Summary statistics of this poll type ( - Question - Answer)\n#URL# - Poll URL', 100);
/*!40000 ALTER TABLE `b_event_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_favorite
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE IF NOT EXISTS `b_favorite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(18) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_favorite: ~0 rows (приблизительно)
DELETE FROM `b_favorite`;
/*!40000 ALTER TABLE `b_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_favorite` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_file
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE IF NOT EXISTS `b_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(18) DEFAULT NULL,
  `WIDTH` int(18) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_file: ~0 rows (приблизительно)
DELETE FROM `b_file`;
/*!40000 ALTER TABLE `b_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_file_preview
DROP TABLE IF EXISTS `b_file_preview`;
CREATE TABLE IF NOT EXISTS `b_file_preview` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(18) NOT NULL,
  `PREVIEW_ID` int(18) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(18) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_file_preview: ~0 rows (приблизительно)
DELETE FROM `b_file_preview`;
/*!40000 ALTER TABLE `b_file_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_preview` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_file_search
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE IF NOT EXISTS `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT 0,
  `F_SIZE` int(11) NOT NULL DEFAULT 0,
  `F_TIME` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_file_search: ~0 rows (приблизительно)
DELETE FROM `b_file_search`;
/*!40000 ALTER TABLE `b_file_search` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_file_search` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_filters
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE IF NOT EXISTS `b_filters` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_filters: ~0 rows (приблизительно)
DELETE FROM `b_filters`;
/*!40000 ALTER TABLE `b_filters` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_filters` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_finder_dest
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE IF NOT EXISTS `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_finder_dest: ~0 rows (приблизительно)
DELETE FROM `b_finder_dest`;
/*!40000 ALTER TABLE `b_finder_dest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_finder_dest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form
DROP TABLE IF EXISTS `b_form`;
CREATE TABLE IF NOT EXISTS `b_form` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BUTTON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `FORM_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_DEFAULT_TEMPLATE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHOW_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRINT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_RESULT_TEMPLATE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_RESTRICTIONS` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `RESTRICT_USER` int(5) DEFAULT 0,
  `RESTRICT_TIME` int(10) DEFAULT 0,
  `RESTRICT_STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form: ~0 rows (приблизительно)
DELETE FROM `b_form`;
/*!40000 ALTER TABLE `b_form` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_2_group
DROP TABLE IF EXISTS `b_form_2_group`;
CREATE TABLE IF NOT EXISTS `b_form_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_2_group`;
/*!40000 ALTER TABLE `b_form_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_2_mail_template
DROP TABLE IF EXISTS `b_form_2_mail_template`;
CREATE TABLE IF NOT EXISTS `b_form_2_mail_template` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`FORM_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_2_mail_template`;
/*!40000 ALTER TABLE `b_form_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_2_site
DROP TABLE IF EXISTS `b_form_2_site`;
CREATE TABLE IF NOT EXISTS `b_form_2_site` (
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FORM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_2_site: ~0 rows (приблизительно)
DELETE FROM `b_form_2_site`;
/*!40000 ALTER TABLE `b_form_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_answer
DROP TABLE IF EXISTS `b_form_answer`;
CREATE TABLE IF NOT EXISTS `b_form_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_answer`;
/*!40000 ALTER TABLE `b_form_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_crm
DROP TABLE IF EXISTS `b_form_crm`;
CREATE TABLE IF NOT EXISTS `b_form_crm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `AUTH_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_crm: ~0 rows (приблизительно)
DELETE FROM `b_form_crm`;
/*!40000 ALTER TABLE `b_form_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_crm_field
DROP TABLE IF EXISTS `b_form_crm_field`;
CREATE TABLE IF NOT EXISTS `b_form_crm_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LINK_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) DEFAULT 0,
  `FIELD_ALT` varchar(100) COLLATE utf8_unicode_ci DEFAULT '',
  `CRM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `ix_b_form_crm_field_1` (`LINK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_crm_field: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_field`;
/*!40000 ALTER TABLE `b_form_crm_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_crm_link
DROP TABLE IF EXISTS `b_form_crm_link`;
CREATE TABLE IF NOT EXISTS `b_form_crm_link` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `CRM_ID` int(18) NOT NULL DEFAULT 0,
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_form_crm_link_1` (`FORM_ID`,`CRM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_crm_link: ~0 rows (приблизительно)
DELETE FROM `b_form_crm_link`;
/*!40000 ALTER TABLE `b_form_crm_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_crm_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_field
DROP TABLE IF EXISTS `b_form_field`;
CREATE TABLE IF NOT EXISTS `b_form_field` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ADDITIONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_RESULTS_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IN_EXCEL_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FIELD_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(18) DEFAULT NULL,
  `COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULTS_TABLE_TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_SID` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_field: ~0 rows (приблизительно)
DELETE FROM `b_form_field`;
/*!40000 ALTER TABLE `b_form_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_field_filter
DROP TABLE IF EXISTS `b_form_field_filter`;
CREATE TABLE IF NOT EXISTS `b_form_field_filter` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `PARAMETER_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_field_filter: ~0 rows (приблизительно)
DELETE FROM `b_form_field_filter`;
/*!40000 ALTER TABLE `b_form_field_filter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_filter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_field_validator
DROP TABLE IF EXISTS `b_form_field_validator`;
CREATE TABLE IF NOT EXISTS `b_form_field_validator` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'y',
  `C_SORT` int(18) DEFAULT 100,
  `VALIDATOR_SID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_field_validator: ~0 rows (приблизительно)
DELETE FROM `b_form_field_validator`;
/*!40000 ALTER TABLE `b_form_field_validator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_field_validator` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_menu
DROP TABLE IF EXISTS `b_form_menu`;
CREATE TABLE IF NOT EXISTS `b_form_menu` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_menu: ~0 rows (приблизительно)
DELETE FROM `b_form_menu`;
/*!40000 ALTER TABLE `b_form_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_menu` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_result
DROP TABLE IF EXISTS `b_form_result`;
CREATE TABLE IF NOT EXISTS `b_form_result` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `USER_ID` int(18) DEFAULT NULL,
  `USER_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `SENT_TO_CRM` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`),
  KEY `IX_STATUS_ID` (`STATUS_ID`),
  KEY `IX_SENT_TO_CRM` (`SENT_TO_CRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_result: ~0 rows (приблизительно)
DELETE FROM `b_form_result`;
/*!40000 ALTER TABLE `b_form_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_result_answer
DROP TABLE IF EXISTS `b_form_result_answer`;
CREATE TABLE IF NOT EXISTS `b_form_result_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `RESULT_ID` int(18) NOT NULL DEFAULT 0,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `FIELD_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) DEFAULT NULL,
  `ANSWER_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ANSWER_VALUE_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TEXT_SEARCH` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_DATE` datetime DEFAULT NULL,
  `USER_FILE_ID` int(18) DEFAULT NULL,
  `USER_FILE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_IS_IMAGE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_HASH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SUFFIX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_FILE_SIZE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RESULT_ID` (`RESULT_ID`),
  KEY `IX_FIELD_ID` (`FIELD_ID`),
  KEY `IX_ANSWER_ID` (`ANSWER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_result_answer: ~0 rows (приблизительно)
DELETE FROM `b_form_result_answer`;
/*!40000 ALTER TABLE `b_form_result_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_result_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_status
DROP TABLE IF EXISTS `b_form_status`;
CREATE TABLE IF NOT EXISTS `b_form_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORM_ID` int(18) NOT NULL DEFAULT 0,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CSS` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'statusgreen',
  `HANDLER_OUT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_IN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_EVENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_ID` (`FORM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_status: ~0 rows (приблизительно)
DELETE FROM `b_form_status`;
/*!40000 ALTER TABLE `b_form_status` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_status_2_group
DROP TABLE IF EXISTS `b_form_status_2_group`;
CREATE TABLE IF NOT EXISTS `b_form_status_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORM_STATUS_GROUP` (`STATUS_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_status_2_group: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_group`;
/*!40000 ALTER TABLE `b_form_status_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_form_status_2_mail_template
DROP TABLE IF EXISTS `b_form_status_2_mail_template`;
CREATE TABLE IF NOT EXISTS `b_form_status_2_mail_template` (
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `MAIL_TEMPLATE_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`STATUS_ID`,`MAIL_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_form_status_2_mail_template: ~0 rows (приблизительно)
DELETE FROM `b_form_status_2_mail_template`;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_form_status_2_mail_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum
DROP TABLE IF EXISTS `b_forum`;
CREATE TABLE IF NOT EXISTS `b_forum` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ANCHOR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_BIU` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_IMG` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_VIDEO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_QUOTE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_CODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_FONT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_TABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_ALIGN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_UPLOAD_EXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ALLOW_MOVE_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ALLOW_TOPIC_TITLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_NL2BR` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ALLOW_SIGNATURE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PATH2FORUM_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ASK_GUEST_EMAIL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INDEXATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DEDUPLICATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MODERATION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ORDER_BY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'P',
  `ORDER_DIRECTION` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'DESC',
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `TOPICS` int(11) NOT NULL DEFAULT 0,
  `POSTS` int(11) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(11) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST_DATE` datetime DEFAULT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(11) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'forum',
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'message',
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_SORT` (`SORT`),
  KEY `IX_FORUM_ACTIVE` (`ACTIVE`),
  KEY `IX_FORUM_GROUP_ID` (`FORUM_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum`;
/*!40000 ALTER TABLE `b_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum2site
DROP TABLE IF EXISTS `b_forum2site`;
CREATE TABLE IF NOT EXISTS `b_forum2site` (
  `FORUM_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `PATH2FORUM_MESSAGE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`FORUM_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum2site: ~0 rows (приблизительно)
DELETE FROM `b_forum2site`;
/*!40000 ALTER TABLE `b_forum2site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum2site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_dictionary
DROP TABLE IF EXISTS `b_forum_dictionary`;
CREATE TABLE IF NOT EXISTS `b_forum_dictionary` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_dictionary: ~4 rows (приблизительно)
DELETE FROM `b_forum_dictionary`;
/*!40000 ALTER TABLE `b_forum_dictionary` DISABLE KEYS */;
INSERT INTO `b_forum_dictionary` (`ID`, `TITLE`, `TYPE`) VALUES
	(1, '[ru] Словарь слов', 'W'),
	(2, '[ru] Словарь транслита', 'T'),
	(3, '[en] Bad words', 'W'),
	(4, '[en] Transliteration', 'T');
/*!40000 ALTER TABLE `b_forum_dictionary` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_email
DROP TABLE IF EXISTS `b_forum_email`;
CREATE TABLE IF NOT EXISTS `b_forum_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EMAIL_FORUM_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FORUM_ID` int(11) NOT NULL,
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  `MAIL_FILTER_ID` int(11) NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USE_EMAIL` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_GROUP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT_SUF` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SUBJECT` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TEMPLATES_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NOT_MEMBER_POST` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_EMAIL_FORUM_SOC` (`FORUM_ID`,`SOCNET_GROUP_ID`),
  KEY `IX_B_FORUM_EMAIL_FILTER_ID` (`MAIL_FILTER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_email: ~0 rows (приблизительно)
DELETE FROM `b_forum_email`;
/*!40000 ALTER TABLE `b_forum_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_email` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_file
DROP TABLE IF EXISTS `b_forum_file`;
CREATE TABLE IF NOT EXISTS `b_forum_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(18) DEFAULT NULL,
  `TOPIC_ID` int(20) DEFAULT NULL,
  `MESSAGE_ID` int(20) DEFAULT NULL,
  `FILE_ID` int(18) NOT NULL,
  `USER_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `HITS` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_FILE_FILE` (`FILE_ID`),
  KEY `IX_FORUM_FILE_FORUM` (`FORUM_ID`),
  KEY `IX_FORUM_FILE_TOPIC` (`TOPIC_ID`),
  KEY `IX_FORUM_FILE_MESSAGE` (`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_file: ~0 rows (приблизительно)
DELETE FROM `b_forum_file`;
/*!40000 ALTER TABLE `b_forum_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_filter
DROP TABLE IF EXISTS `b_forum_filter`;
CREATE TABLE IF NOT EXISTS `b_forum_filter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT NULL,
  `WORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_IT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PATTERN_CREATE` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_FILTER_2` (`USE_IT`),
  KEY `IX_B_FORUM_FILTER_3` (`PATTERN_CREATE`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_filter: ~151 rows (приблизительно)
DELETE FROM `b_forum_filter`;
/*!40000 ALTER TABLE `b_forum_filter` DISABLE KEYS */;
INSERT INTO `b_forum_filter` (`ID`, `DICTIONARY_ID`, `WORDS`, `PATTERN`, `REPLACEMENT`, `DESCRIPTION`, `USE_IT`, `PATTERN_CREATE`) VALUES
	(1, 1, '*пизд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(2, 1, '*пизж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(3, 1, '*сра%', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])([^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*([СсCc]+)([РрPpRr]+)([АаAa]+)([[Цц]+([Аа]+|[Оо]+)]+|[[Тт]+([Ьь]+|)[Сс]+[Яя]+]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(4, 1, 'анобляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([АаAa]+)([НнNn]+)([ОоOo]+)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(5, 1, 'взъеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвVv]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(6, 1, 'бля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(7, 1, 'долбоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([ОоOo]+)([ЛлLl]+)([БбBb]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(8, 1, 'дуроеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ДдDd]+)([УуUu]+)([РрPpRr]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(9, 1, 'еби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(10, 1, 'ебисти*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)([ТтTt]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(11, 1, 'ебическ*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([Чч]+)([ЁёЕеEe]+)([СсCc]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(12, 1, 'еблив*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ИиIi]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(13, 1, 'ебло*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([ОоOo]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(14, 1, 'еблыс*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Ыы]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(15, 1, 'ебля', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([ЛлLl]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(16, 1, 'ебс', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([СсCc]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(17, 1, 'ебукент*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([КкKk]+)([ЁёЕеEe]+)([НнNn]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(18, 1, 'ебурген*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([РрPpRr]+)([Гг]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(19, 1, 'коноебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([КкKk]+)([ОоOo]+)([НнNn]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(20, 1, 'мозгоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([ОоOo]+)([ЗзZz3]+)([Гг]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(21, 1, 'мудоеб*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([МмMm]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(22, 1, 'однохуйствен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ДдDd]+)([НнNn]+)([ОоOo]+)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)([СсCc]+)([ТтTt]+)([ВвVv]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(23, 1, 'охуе*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(24, 1, 'охуи*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([ИиIi]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(25, 1, 'охуя*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ОоOo]+)([ХхXx]+)([УуUu]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(26, 1, 'разъеба*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([ЗзZz3]+)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(27, 1, 'распиздон*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ПпPp]+)([ИиIi]+)([ЗзZz3]+)([ДдDd]+)([ОоOo]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(28, 1, 'расхуюж*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([РрPpRr]+)([АаAa]+)([СсCc]+)([ХхXx]+)([УуUu]+)([Юю]+|[[Йй]+[Оо]+]+)([ЖжGg]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(29, 1, 'худоебин*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ДдDd]+)([ОоOo]+)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(30, 1, 'хуе', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(31, 1, 'хуебрат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([БбBb]+)([РрPpRr]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(32, 1, 'хуеглот*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([Гг]+)([ЛлLl]+)([ОоOo]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(33, 1, 'хуеплёт*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ПпPp]+)([ЛлLl]+)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(34, 1, 'хует*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(35, 1, 'хуила', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ИиIi]+)([ЛлLl]+)([АаAa]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(36, 1, 'хул?', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([ЛлLl]+).?)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(37, 1, 'хуя', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ХхXx]+)([УуUu]+)([Яя]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(38, 1, '^бляд*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([БбBb]+)([ЛлLl]+)([Яя]+)([ДдDd]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(39, 1, '^пидор*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ПпPp]+)([ИиIi]+)([ДдDd]+)([ОоOo]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(40, 1, '^хуев*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(41, 1, '^хуем*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЁёЕеEe]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(42, 1, '^хуй*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([ЙйИиYy]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(43, 1, '^хуяк*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([КкKk]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(44, 1, '^хуям*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([МмMm]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(45, 1, '^хуяр*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(46, 1, '^хуяч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ХхXx]+)([УуUu]+)([Яя]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(47, 1, '^ъебал*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ЛлLl]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(48, 1, '^ъебан*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(49, 1, '^ъебар*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([РрPpRr]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(50, 1, '^ъебат*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([АаAa]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(51, 1, '^ъебен*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ЁёЕеEe]+)([НнNn]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(52, 1, '^ъеби', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(53, 1, '^ъебис*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([СсCc]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(54, 1, '^ъебит*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([ИиIi]+)([ТтTt]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(55, 1, '^ъёбля*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([ЛлLl]+)([Яя]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(56, 1, '^ъёбну*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+|[[Йй]+[Оо]+]+)([БбBb]+)([НнNn]+)([УуUu]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(57, 1, '^ъебу', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+))(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(58, 1, '^ъебуч*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([УуUu]+)([Чч]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(59, 1, '^ъебыв*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(([ВвЗзСс]+|[ВвЫы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)+|)([ЪъЬь"\']+|)([ЁёЕеEe]+)([БбBb]+)([Ыы]+)([ВвVv]+)[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(60, 1, '/(?<=[s.,;:!?-#*|[]()])(?![Вв][ЕеЁё][Бб])(([ВвЗзСс]+|[Ввы]+|[ДдОо]+|[ЗзАа]+|[ИиЗзСс]+|[НнАа]+|[НнЕе]+|[ОоТт]+|([Пп]*[Ее]+[Рр]+[Ее]+)|)([ЬьЪъ]+|)([ЁёЕеEe]+|[Йй]+[Оо]+|[Yy]+[Oo]+)([BbБб]+))(?=[s.,;:!?-#*|[]()])/is', '', '', '', 'Y', 'PTTRN'),
	(61, 3, 'angry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+n+g+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(62, 3, 'ass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(63, 3, 'asshole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(a+s+s+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(64, 3, 'banger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+n+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(65, 3, 'bastard', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+s+t+a+r+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(66, 3, 'batter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+a+t+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(67, 3, 'bicho', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+c+h+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(68, 3, 'bisexual', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+s+e+x+u+a+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(69, 3, 'bitch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+i+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(70, 3, 'blumpkin', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+l+u+m+p+k+i+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(71, 3, 'booger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+o+o+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(72, 3, 'bugger*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+g+g+e+r+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(73, 3, 'bukakke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+k+a+k+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(74, 3, 'bull', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(75, 3, 'bulldyke', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+d+y+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(76, 3, 'bullshit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+l+l+s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(77, 3, 'bunny', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(78, 3, 'bunnyfuck', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(b+u+n+n+y+f+u+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(79, 3, 'chocha', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+c+h+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(80, 3, 'chode', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+h+o+d+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(81, 3, 'clap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+l+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(82, 3, 'coconuts', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+c+o+n+u+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(83, 3, 'cohones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+h+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(84, 3, 'cojones', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+j+o+n+e+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(85, 3, 'coon', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+n+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(86, 3, 'cootch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(87, 3, 'cooter', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+o+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(88, 3, 'cornhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+o+r+n+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(89, 3, 'cracka', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+c+k+a+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(90, 3, 'crap', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+r+a+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(91, 3, 'cum', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+m+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(92, 3, 'cunnilingus', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+n+i+l+i+n+g+u+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(93, 3, 'cunt*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(c+u+n+t+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(94, 3, 'damn*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+m+n+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(95, 3, 'dark*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+a+r+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(96, 3, 'dick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(97, 3, 'dickhead', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+c+k+h+e+a+d+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(98, 3, 'diddle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+d+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(99, 3, 'dildo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+d+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(100, 3, 'dilhole', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+l+h+o+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(101, 3, 'dingleberry', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+i+n+g+l+e+b+e+r+r+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(102, 3, 'doodle', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+o+d+l+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(103, 3, 'dork', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+o+r+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(104, 3, 'dumpster', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(d+u+m+p+s+t+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(105, 3, 'faggot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+g+g+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(106, 3, 'fart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(107, 3, 'frig', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+r+i+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(108, 3, 'fuck*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(109, 3, 'fucker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(f+u+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(110, 3, 'giz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+i+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(111, 3, 'goatse', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+a+t+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(112, 3, 'gook', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+o+o+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(113, 3, 'gringo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(g+r+i+n+g+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(114, 3, 'hobo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+b+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(115, 3, 'honky', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(h+o+n+k+y+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(116, 3, 'jackass', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+a+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(117, 3, 'jackoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+a+c+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(118, 3, 'jerkoff', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+e+r+k+o+f+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(119, 3, 'jiggaboo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+g+g+a+b+o+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(120, 3, 'jizz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(j+i+z+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(121, 3, 'kike', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(k+i+k+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(122, 3, 'mayo', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+a+y+o+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(123, 3, 'moose', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(m+o+o+s+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(124, 3, 'nigg*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(n+i+g+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(125, 3, 'paki', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+a+k+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(126, 3, 'pecker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+e+c+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(127, 3, 'piss', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+i+s+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(128, 3, 'poonanni', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+a+n+n+i+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(129, 3, 'poontang', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+o+o+n+t+a+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(130, 3, 'prick', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+r+i+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(131, 3, 'punch', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(p+u+n+c+h+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(132, 3, 'queef', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(q+u+e+e+f+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(133, 3, 'rogue', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(r+o+g+u+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(134, 3, 'sanchez', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+a+n+c+h+e+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(135, 3, 'schlong', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+c+h+l+o+n+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(136, 3, 'shit', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+h+i+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(137, 3, 'skank', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+k+a+n+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(138, 3, 'spaz', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+a+z+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(139, 3, 'spic', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(s+p+i+c+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(140, 3, 'teabag*', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+e+a+b+a+g+[^\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)]*)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(141, 3, 'tits', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+i+t+s+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(142, 3, 'twat', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+a+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(143, 3, 'twot', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(t+w+o+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(144, 3, 'vart', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(v+a+r+t+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(145, 3, 'wanker', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+n+k+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(146, 3, 'waste', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+a+s+t+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(147, 3, 'wetback', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+e+t+b+a+c+k+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(148, 3, 'whore', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+h+o+r+e+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(149, 3, 'wigger', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+i+g+g+e+r+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(150, 3, 'wog', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+g+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL'),
	(151, 3, 'wop', '/(?<=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])(w+o+p+)(?=[\\s.,;:!?\\#\\-\\*\\|\\[\\]\\(\\)])/isu', '', '', 'Y', 'TRNSL');
/*!40000 ALTER TABLE `b_forum_filter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_group
DROP TABLE IF EXISTS `b_forum_group`;
CREATE TABLE IF NOT EXISTS `b_forum_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 150,
  `PARENT_ID` int(11) DEFAULT NULL,
  `LEFT_MARGIN` int(11) DEFAULT NULL,
  `RIGHT_MARGIN` int(11) DEFAULT NULL,
  `DEPTH_LEVEL` int(11) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_group: ~0 rows (приблизительно)
DELETE FROM `b_forum_group`;
/*!40000 ALTER TABLE `b_forum_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_group_lang
DROP TABLE IF EXISTS `b_forum_group_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_group_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_GROUP_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_GROUP` (`FORUM_GROUP_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_group_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_group_lang`;
/*!40000 ALTER TABLE `b_forum_group_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_group_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_letter
DROP TABLE IF EXISTS `b_forum_letter`;
CREATE TABLE IF NOT EXISTS `b_forum_letter` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DICTIONARY_ID` int(11) DEFAULT 0,
  `LETTER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REPLACEMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_letter: ~37 rows (приблизительно)
DELETE FROM `b_forum_letter`;
/*!40000 ALTER TABLE `b_forum_letter` DISABLE KEYS */;
INSERT INTO `b_forum_letter` (`ID`, `DICTIONARY_ID`, `LETTER`, `REPLACEMENT`) VALUES
	(1, 2, 'а', 'АаAa'),
	(2, 2, 'б', 'БбBb'),
	(3, 2, 'в', 'ВвVv'),
	(4, 2, 'г', 'Гг'),
	(5, 2, 'д', 'ДдDd'),
	(6, 2, 'е', 'ЁёЕеEe'),
	(7, 2, 'ё', 'ЁёЕеEe, [Йй]+[Оо]+'),
	(8, 2, 'ж', 'ЖжGg'),
	(9, 2, 'з', 'ЗзZz3'),
	(10, 2, 'и', 'ИиIi'),
	(11, 2, 'й', 'ЙйИиYy'),
	(12, 2, 'к', 'КкKk'),
	(13, 2, 'л', 'ЛлLl'),
	(14, 2, 'м', 'МмMm'),
	(15, 2, 'н', 'НнNn'),
	(16, 2, 'о', 'ОоOo'),
	(17, 2, 'п', 'ПпPp'),
	(18, 2, 'р', 'РрPpRr'),
	(19, 2, 'с', 'СсCc'),
	(20, 2, 'т', 'ТтTt'),
	(21, 2, 'у', 'УуUu'),
	(22, 2, 'ф', 'ФфFf'),
	(23, 2, 'х', 'ХхXx'),
	(24, 2, 'ц', 'ЦцCc'),
	(25, 2, 'ч', 'Чч'),
	(26, 2, 'ш', 'Шш'),
	(27, 2, 'щ', 'Щщ'),
	(28, 2, 'ь', 'ЪъЬь"\','),
	(29, 2, 'ы', 'Ыы'),
	(30, 2, 'ъ', 'ЪъЬь"\','),
	(31, 2, 'э', 'Ээ'),
	(32, 2, 'ю', 'Юю, [Йй]+[Оо]+'),
	(33, 2, 'я', 'Яя'),
	(34, 2, '%', '[Цц]+([Аа]+|[Оо]+), [Тт]+([Ьь]+|)[Сс]+[Яя]+'),
	(35, 2, '^', ',ВвЗзСс,ВвЫы,ДдОо,ЗзАа,ИиЗзСс,НнАа,НнЕе,ОоТт,([Пп]*[Ее]+[Рр]+[Ее]+)'),
	(36, 2, 'тся', '%'),
	(37, 2, 'ться', '%');
/*!40000 ALTER TABLE `b_forum_letter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_message
DROP TABLE IF EXISTS `b_forum_message`;
CREATE TABLE IF NOT EXISTS `b_forum_message` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) NOT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NEW_TOPIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'WEB',
  `POST_DATE` datetime NOT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_FILTER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE_CHECK` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTACH_IMG` int(11) DEFAULT NULL,
  `PARAM1` varchar(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` int(11) DEFAULT NULL,
  `AUTHOR_ID` int(10) DEFAULT NULL,
  `AUTHOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTHOR_REAL_IP` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GUEST_ID` int(10) DEFAULT NULL,
  `EDITOR_ID` int(10) DEFAULT NULL,
  `EDITOR_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDITOR_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_REASON` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_DATE` datetime DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MAIL_HEADER` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_MESSAGE_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_MESSAGE_TOPIC` (`TOPIC_ID`,`APPROVED`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR` (`AUTHOR_ID`,`APPROVED`,`FORUM_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_MESSAGE_PARAM2` (`PARAM2`),
  KEY `IX_FORUM_MESSAGE_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_MESSAGE_DATE_AUTHOR_ID` (`POST_DATE`,`AUTHOR_ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID` (`AUTHOR_ID`,`TOPIC_ID`,`ID`),
  KEY `IX_FORUM_MESSAGE_AUTHOR_FORUM_ID` (`AUTHOR_ID`,`FORUM_ID`,`ID`,`APPROVED`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_message`;
/*!40000 ALTER TABLE `b_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_perms
DROP TABLE IF EXISTS `b_forum_perms`;
CREATE TABLE IF NOT EXISTS `b_forum_perms` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_PERMS_FORUM` (`FORUM_ID`,`GROUP_ID`),
  KEY `IX_FORUM_PERMS_GROUP` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_perms: ~0 rows (приблизительно)
DELETE FROM `b_forum_perms`;
/*!40000 ALTER TABLE `b_forum_perms` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_perms` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_pm_folder
DROP TABLE IF EXISTS `b_forum_pm_folder`;
CREATE TABLE IF NOT EXISTS `b_forum_pm_folder` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `SORT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_FOLDER_USER_IST` (`USER_ID`,`ID`,`SORT`,`TITLE`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_pm_folder: ~4 rows (приблизительно)
DELETE FROM `b_forum_pm_folder`;
/*!40000 ALTER TABLE `b_forum_pm_folder` DISABLE KEYS */;
INSERT INTO `b_forum_pm_folder` (`ID`, `TITLE`, `USER_ID`, `SORT`) VALUES
	(1, 'SYSTEM_FOLDER_1', 0, 0),
	(2, 'SYSTEM_FOLDER_2', 0, 0),
	(3, 'SYSTEM_FOLDER_3', 0, 0),
	(4, 'SYSTEM_FOLDER_4', 0, 0);
/*!40000 ALTER TABLE `b_forum_pm_folder` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_points
DROP TABLE IF EXISTS `b_forum_points`;
CREATE TABLE IF NOT EXISTS `b_forum_points` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_POINTS` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P_MP` (`MIN_POINTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_points`;
/*!40000 ALTER TABLE `b_forum_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_points2post
DROP TABLE IF EXISTS `b_forum_points2post`;
CREATE TABLE IF NOT EXISTS `b_forum_points2post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MIN_NUM_POSTS` int(11) NOT NULL,
  `POINTS_PER_POST` decimal(18,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_P2P_MNP` (`MIN_NUM_POSTS`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_points2post: ~0 rows (приблизительно)
DELETE FROM `b_forum_points2post`;
/*!40000 ALTER TABLE `b_forum_points2post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points2post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_points_lang
DROP TABLE IF EXISTS `b_forum_points_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_points_lang` (
  `POINTS_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`POINTS_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_points_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_points_lang`;
/*!40000 ALTER TABLE `b_forum_points_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_points_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_private_message
DROP TABLE IF EXISTS `b_forum_private_message`;
CREATE TABLE IF NOT EXISTS `b_forum_private_message` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `AUTHOR_ID` int(11) DEFAULT 0,
  `RECIPIENT_ID` int(11) DEFAULT 0,
  `POST_DATE` datetime DEFAULT NULL,
  `POST_SUBJ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `POST_MESSAGE` text COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FOLDER_ID` int(11) NOT NULL,
  `IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_IS_READ` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_SMILES` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_PM_AFR` (`AUTHOR_ID`,`FOLDER_ID`,`IS_READ`),
  KEY `IX_B_FORUM_PM_UFP` (`USER_ID`,`FOLDER_ID`,`POST_DATE`),
  KEY `IX_B_FORUM_PM_POST_DATE` (`POST_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_private_message: ~0 rows (приблизительно)
DELETE FROM `b_forum_private_message`;
/*!40000 ALTER TABLE `b_forum_private_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_private_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_rank
DROP TABLE IF EXISTS `b_forum_rank`;
CREATE TABLE IF NOT EXISTS `b_forum_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MIN_NUM_POSTS` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_rank: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank`;
/*!40000 ALTER TABLE `b_forum_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_rank_lang
DROP TABLE IF EXISTS `b_forum_rank_lang`;
CREATE TABLE IF NOT EXISTS `b_forum_rank_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RANK_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_RANK` (`RANK_ID`,`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_rank_lang: ~0 rows (приблизительно)
DELETE FROM `b_forum_rank_lang`;
/*!40000 ALTER TABLE `b_forum_rank_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_rank_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_stat
DROP TABLE IF EXISTS `b_forum_stat`;
CREATE TABLE IF NOT EXISTS `b_forum_stat` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHPSESSID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORUM_ID` smallint(5) NOT NULL DEFAULT 0,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `SHOW_NAME` varchar(101) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_STAT_SITE_ID` (`SITE_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_TOPIC_ID` (`TOPIC_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_FORUM_ID` (`FORUM_ID`,`LAST_VISIT`),
  KEY `IX_B_FORUM_STAT_PHPSESSID` (`PHPSESSID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_stat: ~0 rows (приблизительно)
DELETE FROM `b_forum_stat`;
/*!40000 ALTER TABLE `b_forum_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_subscribe
DROP TABLE IF EXISTS `b_forum_subscribe`;
CREATE TABLE IF NOT EXISTS `b_forum_subscribe` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` int(10) DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `LAST_SEND` int(10) DEFAULT NULL,
  `NEW_TOPIC_ONLY` char(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'ru',
  `SOCNET_GROUP_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_FORUM_SUBSCRIBE_USER` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`,`SOCNET_GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_subscribe: ~0 rows (приблизительно)
DELETE FROM `b_forum_subscribe`;
/*!40000 ALTER TABLE `b_forum_subscribe` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_subscribe` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_topic
DROP TABLE IF EXISTS `b_forum_topic`;
CREATE TABLE IF NOT EXISTS `b_forum_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `FORUM_ID` int(10) NOT NULL,
  `TOPIC_ID` bigint(20) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE_SEO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ICON` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `APPROVED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(10) NOT NULL DEFAULT 150,
  `VIEWS` int(10) NOT NULL DEFAULT 0,
  `USER_START_ID` int(10) DEFAULT NULL,
  `USER_START_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_DATE` datetime NOT NULL,
  `POSTS` int(10) NOT NULL DEFAULT 0,
  `LAST_POSTER_ID` int(10) DEFAULT NULL,
  `LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_POST_DATE` datetime NOT NULL,
  `LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `POSTS_UNAPPROVED` int(11) DEFAULT 0,
  `ABS_LAST_POSTER_ID` int(10) DEFAULT NULL,
  `ABS_LAST_POSTER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ABS_LAST_POST_DATE` datetime DEFAULT NULL,
  `ABS_LAST_MESSAGE_ID` bigint(20) DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HTML` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOCNET_GROUP_ID` int(10) DEFAULT NULL,
  `OWNER_ID` int(10) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_FORUM_TOPIC_FORUM` (`FORUM_ID`,`APPROVED`),
  KEY `IX_FORUM_TOPIC_APPROVED` (`APPROVED`),
  KEY `IX_FORUM_TOPIC_ABS_L_POST_DATE` (`ABS_LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_LAST_POST_DATE` (`LAST_POST_DATE`),
  KEY `IX_FORUM_TOPIC_USER_START_ID` (`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_DATE_USER_START_ID` (`START_DATE`,`USER_START_ID`),
  KEY `IX_FORUM_TOPIC_XML_ID` (`XML_ID`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO` (`FORUM_ID`,`TITLE_SEO`),
  KEY `IX_FORUM_TOPIC_TITLE_SEO2` (`TITLE_SEO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_topic`;
/*!40000 ALTER TABLE `b_forum_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_topic` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_user
DROP TABLE IF EXISTS `b_forum_user`;
CREATE TABLE IF NOT EXISTS `b_forum_user` (
  `ID` bigint(10) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(10) NOT NULL,
  `ALIAS` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AVATAR` int(10) DEFAULT NULL,
  `NUM_POSTS` int(10) DEFAULT 0,
  `INTERESTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_POST` int(10) DEFAULT NULL,
  `ALLOW_POST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_VISIT` datetime NOT NULL,
  `DATE_REG` date NOT NULL,
  `REAL_IP_ADDRESS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SIGNATURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SHOW_NAME` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RANK_ID` int(11) DEFAULT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `HIDE_FROM_ONLINE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GROUP_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SUBSC_GET_MY_MESSAGE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_FORUM_USER_USER6` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_user: ~0 rows (приблизительно)
DELETE FROM `b_forum_user`;
/*!40000 ALTER TABLE `b_forum_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_user_forum
DROP TABLE IF EXISTS `b_forum_user_forum`;
CREATE TABLE IF NOT EXISTS `b_forum_user_forum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `MAIN_LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID1` (`USER_ID`,`FORUM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_user_forum: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_forum`;
/*!40000 ALTER TABLE `b_forum_user_forum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_forum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_user_points
DROP TABLE IF EXISTS `b_forum_user_points`;
CREATE TABLE IF NOT EXISTS `b_forum_user_points` (
  `FROM_USER_ID` int(11) NOT NULL,
  `TO_USER_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL DEFAULT 0,
  `DATE_UPDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`FROM_USER_ID`,`TO_USER_ID`),
  KEY `IX_B_FORUM_USER_POINTS_TO_USER` (`TO_USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_user_points: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_points`;
/*!40000 ALTER TABLE `b_forum_user_points` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_points` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_forum_user_topic
DROP TABLE IF EXISTS `b_forum_user_topic`;
CREATE TABLE IF NOT EXISTS `b_forum_user_topic` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `TOPIC_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `FORUM_ID` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  PRIMARY KEY (`TOPIC_ID`,`USER_ID`),
  KEY `ID` (`ID`),
  KEY `IX_B_FORUM_USER_FORUM_ID2` (`USER_ID`,`FORUM_ID`,`TOPIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_forum_user_topic: ~0 rows (приблизительно)
DELETE FROM `b_forum_user_topic`;
/*!40000 ALTER TABLE `b_forum_user_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_forum_user_topic` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_geoip_handlers
DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE IF NOT EXISTS `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(10) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_geoip_handlers: ~2 rows (приблизительно)
DELETE FROM `b_geoip_handlers`;
/*!40000 ALTER TABLE `b_geoip_handlers` DISABLE KEYS */;
INSERT INTO `b_geoip_handlers` (`ID`, `SORT`, `ACTIVE`, `CLASS_NAME`, `CONFIG`) VALUES
	(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
	(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL);
/*!40000 ALTER TABLE `b_geoip_handlers` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_group
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE IF NOT EXISTS `b_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(18) NOT NULL DEFAULT 100,
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_group: ~4 rows (приблизительно)
DELETE FROM `b_group`;
/*!40000 ALTER TABLE `b_group` DISABLE KEYS */;
INSERT INTO `b_group` (`ID`, `TIMESTAMP_X`, `ACTIVE`, `C_SORT`, `ANONYMOUS`, `IS_SYSTEM`, `NAME`, `DESCRIPTION`, `SECURITY_POLICY`, `STRING_ID`) VALUES
	(1, '2018-11-26 17:23:23', 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
	(2, '2018-11-26 17:23:23', 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
	(3, '2018-11-26 17:23:23', 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
	(4, '2018-11-26 17:23:23', 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');
/*!40000 ALTER TABLE `b_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_group_collection_task
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE IF NOT EXISTS `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_group_collection_task: ~0 rows (приблизительно)
DELETE FROM `b_group_collection_task`;
/*!40000 ALTER TABLE `b_group_collection_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_collection_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_group_subordinate
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE IF NOT EXISTS `b_group_subordinate` (
  `ID` int(18) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_group_subordinate: ~0 rows (приблизительно)
DELETE FROM `b_group_subordinate`;
/*!40000 ALTER TABLE `b_group_subordinate` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_subordinate` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_group_task
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE IF NOT EXISTS `b_group_task` (
  `GROUP_ID` int(18) NOT NULL,
  `TASK_ID` int(18) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_group_task: ~0 rows (приблизительно)
DELETE FROM `b_group_task`;
/*!40000 ALTER TABLE `b_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_hlblock_entity
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_hlblock_entity: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity`;
/*!40000 ALTER TABLE `b_hlblock_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_hlblock_entity_lang
DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_hlblock_entity_lang: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_lang`;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_hlblock_entity_rights
DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE IF NOT EXISTS `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_hlblock_entity_rights: ~0 rows (приблизительно)
DELETE FROM `b_hlblock_entity_rights`;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_hlblock_entity_rights` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_hot_keys
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE IF NOT EXISTS `b_hot_keys` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_code` (`CODE_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_hot_keys: ~24 rows (приблизительно)
DELETE FROM `b_hot_keys`;
/*!40000 ALTER TABLE `b_hot_keys` DISABLE KEYS */;
INSERT INTO `b_hot_keys` (`ID`, `KEYS_STRING`, `CODE_ID`, `USER_ID`) VALUES
	(1, 'Ctrl+Alt+85', 139, 0),
	(2, 'Ctrl+Alt+80', 17, 0),
	(3, 'Ctrl+Alt+70', 120, 0),
	(4, 'Ctrl+Alt+68', 117, 0),
	(5, 'Ctrl+Alt+81', 3, 0),
	(6, 'Ctrl+Alt+75', 106, 0),
	(7, 'Ctrl+Alt+79', 133, 0),
	(8, 'Ctrl+Alt+70', 121, 0),
	(9, 'Ctrl+Alt+69', 118, 0),
	(10, 'Ctrl+Shift+83', 87, 0),
	(11, 'Ctrl+Shift+88', 88, 0),
	(12, 'Ctrl+Shift+76', 89, 0),
	(13, 'Ctrl+Alt+85', 139, 1),
	(14, 'Ctrl+Alt+80', 17, 1),
	(15, 'Ctrl+Alt+70', 120, 1),
	(16, 'Ctrl+Alt+68', 117, 1),
	(17, 'Ctrl+Alt+81', 3, 1),
	(18, 'Ctrl+Alt+75', 106, 1),
	(19, 'Ctrl+Alt+79', 133, 1),
	(20, 'Ctrl+Alt+70', 121, 1),
	(21, 'Ctrl+Alt+69', 118, 1),
	(22, 'Ctrl+Shift+83', 87, 1),
	(23, 'Ctrl+Shift+88', 88, 1),
	(24, 'Ctrl+Shift+76', 89, 1);
/*!40000 ALTER TABLE `b_hot_keys` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_hot_keys_code
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE IF NOT EXISTS `b_hot_keys_code` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_hot_keys_code: ~79 rows (приблизительно)
DELETE FROM `b_hot_keys_code`;
/*!40000 ALTER TABLE `b_hot_keys_code` DISABLE KEYS */;
INSERT INTO `b_hot_keys_code` (`ID`, `CLASS_NAME`, `CODE`, `NAME`, `COMMENTS`, `TITLE_OBJ`, `URL`, `IS_CUSTOM`) VALUES
	(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
	(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
	(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
	(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
	(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
	(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
	(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
	(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
	(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
	(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
	(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
	(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
	(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
	(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
	(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
	(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
	(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
	(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
	(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
	(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
	(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
	(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
	(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
	(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
	(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
	(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
	(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
	(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
	(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
	(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
	(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
	(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
	(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
	(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
	(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
	(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
	(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
	(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
	(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
	(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
	(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
	(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
	(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
	(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
	(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
	(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
	(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
	(91, 'top_panel_menu', 'var d=BX("bx-panel-menu"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
	(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
	(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
	(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
	(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
	(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
	(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
	(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
	(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
	(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
	(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
	(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
	(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
	(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
	(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
	(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
	(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
	(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
	(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
	(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
	(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
	(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
	(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
	(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
	(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
	(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
	(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
	(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
	(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
	(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
	(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
/*!40000 ALTER TABLE `b_hot_keys_code` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE IF NOT EXISTS `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT 24,
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT 0,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock: ~0 rows (приблизительно)
DELETE FROM `b_iblock`;
/*!40000 ALTER TABLE `b_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_cache
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE IF NOT EXISTS `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_cache: ~0 rows (приблизительно)
DELETE FROM `b_iblock_cache`;
/*!40000 ALTER TABLE `b_iblock_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_cache` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_element
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE IF NOT EXISTS `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT 0,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_STATUS_ID` int(18) DEFAULT 1,
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_element: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element`;
/*!40000 ALTER TABLE `b_iblock_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_element_iprop
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_element_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_iprop`;
/*!40000 ALTER TABLE `b_iblock_element_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_element_lock
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_element_lock: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_lock`;
/*!40000 ALTER TABLE `b_iblock_element_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_lock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_element_property
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_element_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_property`;
/*!40000 ALTER TABLE `b_iblock_element_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_element_right
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_element_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_element_right`;
/*!40000 ALTER TABLE `b_iblock_element_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_element_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_fields
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE IF NOT EXISTS `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_fields: ~0 rows (приблизительно)
DELETE FROM `b_iblock_fields`;
/*!40000 ALTER TABLE `b_iblock_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_fields` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_group
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE IF NOT EXISTS `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_group: ~0 rows (приблизительно)
DELETE FROM `b_iblock_group`;
/*!40000 ALTER TABLE `b_iblock_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_iblock_iprop
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_iblock_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iblock_iprop`;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iblock_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_iproperty
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE IF NOT EXISTS `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_iproperty: ~0 rows (приблизительно)
DELETE FROM `b_iblock_iproperty`;
/*!40000 ALTER TABLE `b_iblock_iproperty` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_iproperty` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_messages
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE IF NOT EXISTS `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_messages: ~0 rows (приблизительно)
DELETE FROM `b_iblock_messages`;
/*!40000 ALTER TABLE `b_iblock_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_messages` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_offers_tmp
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE IF NOT EXISTS `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_offers_tmp: ~0 rows (приблизительно)
DELETE FROM `b_iblock_offers_tmp`;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_offers_tmp` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_property
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT 1,
  `COL_COUNT` int(11) NOT NULL DEFAULT 30,
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT 1,
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property`;
/*!40000 ALTER TABLE `b_iblock_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_property_enum
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE IF NOT EXISTS `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_property_enum: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_enum`;
/*!40000 ALTER TABLE `b_iblock_property_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_enum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_property_feature
DROP TABLE IF EXISTS `b_iblock_property_feature`;
CREATE TABLE IF NOT EXISTS `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_property_feature: ~0 rows (приблизительно)
DELETE FROM `b_iblock_property_feature`;
/*!40000 ALTER TABLE `b_iblock_property_feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_property_feature` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_right
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_right`;
/*!40000 ALTER TABLE `b_iblock_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_rss
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE IF NOT EXISTS `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_rss: ~0 rows (приблизительно)
DELETE FROM `b_iblock_rss`;
/*!40000 ALTER TABLE `b_iblock_rss` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_rss` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_section
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE IF NOT EXISTS `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_left_margin` (`IBLOCK_ID`,`LEFT_MARGIN`,`RIGHT_MARGIN`),
  KEY `ix_iblock_section_right_margin` (`IBLOCK_ID`,`RIGHT_MARGIN`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_section: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section`;
/*!40000 ALTER TABLE `b_iblock_section` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_section_element
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_section_element: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_element`;
/*!40000 ALTER TABLE `b_iblock_section_element` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_element` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_section_iprop
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_section_iprop: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_iprop`;
/*!40000 ALTER TABLE `b_iblock_section_iprop` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_iprop` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_section_property
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_section_property: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_property`;
/*!40000 ALTER TABLE `b_iblock_section_property` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_property` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_section_right
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE IF NOT EXISTS `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_section_right: ~0 rows (приблизительно)
DELETE FROM `b_iblock_section_right`;
/*!40000 ALTER TABLE `b_iblock_section_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_section_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_sequence
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE IF NOT EXISTS `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_sequence: ~0 rows (приблизительно)
DELETE FROM `b_iblock_sequence`;
/*!40000 ALTER TABLE `b_iblock_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_site
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE IF NOT EXISTS `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_site: ~0 rows (приблизительно)
DELETE FROM `b_iblock_site`;
/*!40000 ALTER TABLE `b_iblock_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_iblock_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_type
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE IF NOT EXISTS `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT 500,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_type: ~0 rows (приблизительно)
DELETE FROM `b_iblock_type`;
/*!40000 ALTER TABLE `b_iblock_type` DISABLE KEYS */;
INSERT INTO `b_iblock_type` (`ID`, `SECTIONS`, `EDIT_FILE_BEFORE`, `EDIT_FILE_AFTER`, `IN_RSS`, `SORT`) VALUES
	('rest_entity', 'Y', NULL, NULL, 'N', 1000);
/*!40000 ALTER TABLE `b_iblock_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_iblock_type_lang
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE IF NOT EXISTS `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_iblock_type_lang: ~0 rows (приблизительно)
DELETE FROM `b_iblock_type_lang`;
/*!40000 ALTER TABLE `b_iblock_type_lang` DISABLE KEYS */;
INSERT INTO `b_iblock_type_lang` (`IBLOCK_TYPE_ID`, `LID`, `NAME`, `SECTION_NAME`, `ELEMENT_NAME`) VALUES
	('rest_entity', 'ru', 'Хранилище данных для приложений Маркетплейс24', 'Разделы', 'Элементы');
/*!40000 ALTER TABLE `b_iblock_type_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing
DROP TABLE IF EXISTS `b_landing`;
CREATE TABLE IF NOT EXISTS `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing: ~0 rows (приблизительно)
DELETE FROM `b_landing`;
/*!40000 ALTER TABLE `b_landing` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_block
DROP TABLE IF EXISTS `b_landing_block`;
CREATE TABLE IF NOT EXISTS `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT 500,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_block: ~0 rows (приблизительно)
DELETE FROM `b_landing_block`;
/*!40000 ALTER TABLE `b_landing_block` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_block` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_demo
DROP TABLE IF EXISTS `b_landing_demo`;
CREATE TABLE IF NOT EXISTS `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_demo: ~0 rows (приблизительно)
DELETE FROM `b_landing_demo`;
/*!40000 ALTER TABLE `b_landing_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_demo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_domain
DROP TABLE IF EXISTS `b_landing_domain`;
CREATE TABLE IF NOT EXISTS `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_domain: ~0 rows (приблизительно)
DELETE FROM `b_landing_domain`;
/*!40000 ALTER TABLE `b_landing_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_domain` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_file
DROP TABLE IF EXISTS `b_landing_file`;
CREATE TABLE IF NOT EXISTS `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_file: ~0 rows (приблизительно)
DELETE FROM `b_landing_file`;
/*!40000 ALTER TABLE `b_landing_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_hook_data
DROP TABLE IF EXISTS `b_landing_hook_data`;
CREATE TABLE IF NOT EXISTS `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_hook_data: ~0 rows (приблизительно)
DELETE FROM `b_landing_hook_data`;
/*!40000 ALTER TABLE `b_landing_hook_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_hook_data` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_manifest
DROP TABLE IF EXISTS `b_landing_manifest`;
CREATE TABLE IF NOT EXISTS `b_landing_manifest` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_MANIFEST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_manifest: ~0 rows (приблизительно)
DELETE FROM `b_landing_manifest`;
/*!40000 ALTER TABLE `b_landing_manifest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_manifest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_placement
DROP TABLE IF EXISTS `b_landing_placement`;
CREATE TABLE IF NOT EXISTS `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_placement: ~0 rows (приблизительно)
DELETE FROM `b_landing_placement`;
/*!40000 ALTER TABLE `b_landing_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_placement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_repo
DROP TABLE IF EXISTS `b_landing_repo`;
CREATE TABLE IF NOT EXISTS `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_repo: ~0 rows (приблизительно)
DELETE FROM `b_landing_repo`;
/*!40000 ALTER TABLE `b_landing_repo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_repo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_site
DROP TABLE IF EXISTS `b_landing_site`;
CREATE TABLE IF NOT EXISTS `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_site: ~0 rows (приблизительно)
DELETE FROM `b_landing_site`;
/*!40000 ALTER TABLE `b_landing_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_syspage
DROP TABLE IF EXISTS `b_landing_syspage`;
CREATE TABLE IF NOT EXISTS `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_syspage: ~0 rows (приблизительно)
DELETE FROM `b_landing_syspage`;
/*!40000 ALTER TABLE `b_landing_syspage` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_syspage` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_template
DROP TABLE IF EXISTS `b_landing_template`;
CREATE TABLE IF NOT EXISTS `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT 100,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_template: ~6 rows (приблизительно)
DELETE FROM `b_landing_template`;
/*!40000 ALTER TABLE `b_landing_template` DISABLE KEYS */;
INSERT INTO `b_landing_template` (`ID`, `ACTIVE`, `TITLE`, `SORT`, `XML_ID`, `CONTENT`, `AREA_COUNT`, `CREATED_BY_ID`, `MODIFIED_BY_ID`, `DATE_CREATE`, `DATE_MODIFY`) VALUES
	(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44'),
	(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class="landing-layout-flex">\n								<div class="g-width-25x--lg g-max-width-100x g-overflow-hidden landing-sidebar">#AREA_1#</div> \n								<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div> \n							</div>', 1, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44'),
	(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class="landing-layout-flex sidebar-right">\n								<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_1#</div> \n								<div class="g-width-75x--lg  g-max-width-100x landing-main">#CONTENT#</div> \n							</div>', 1, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44'),
	(4, 'Y', '#HEADER_FOOTER#', 400, 'header_footer', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-main">#CONTENT#</div> \n							<div class="landing-footer">#AREA_2#</div>', 2, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44'),
	(5, 'Y', '#WITHOUT_LEFT#', 500, 'without_left', '<div class="landing-header">#AREA_1#</div> \n								<div class="landing-layout-flex without-left">\n									<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_2#</div>\n									<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div> \n								</div> \n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44'),
	(6, 'Y', '#WITHOUT_RIGHT#', 600, 'without_right', '<div class="landing-header">#AREA_1#</div>\n								<div class="landing-layout-flex">\n									<div class="g-width-25x--lg g-max-width-100x landing-sidebar">#AREA_2#</div>\n									<div class="g-width-75x--lg g-max-width-100x landing-main">#CONTENT#</div>\n								</div>\n							<div class="landing-footer">#AREA_3#</div>', 3, 1, 1, '2018-11-26 17:26:44', '2018-11-26 17:26:44');
/*!40000 ALTER TABLE `b_landing_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_landing_template_ref
DROP TABLE IF EXISTS `b_landing_template_ref`;
CREATE TABLE IF NOT EXISTS `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_landing_template_ref: ~0 rows (приблизительно)
DELETE FROM `b_landing_template_ref`;
/*!40000 ALTER TABLE `b_landing_template_ref` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_landing_template_ref` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_lang
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE IF NOT EXISTS `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_lang: ~0 rows (приблизительно)
DELETE FROM `b_lang`;
/*!40000 ALTER TABLE `b_lang` DISABLE KEYS */;
INSERT INTO `b_lang` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `DIR`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `LANGUAGE_ID`, `DOC_ROOT`, `DOMAIN_LIMITED`, `SERVER_NAME`, `SITE_NAME`, `EMAIL`, `CULTURE_ID`) VALUES
	('s1', 1, 'Y', 'Y', 'Сайт по умолчанию', '/', NULL, NULL, NULL, NULL, NULL, 'ru', NULL, 'N', NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `b_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_language
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE IF NOT EXISTS `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_language: ~2 rows (приблизительно)
DELETE FROM `b_language`;
/*!40000 ALTER TABLE `b_language` DISABLE KEYS */;
INSERT INTO `b_language` (`LID`, `SORT`, `DEF`, `ACTIVE`, `NAME`, `FORMAT_DATE`, `FORMAT_DATETIME`, `FORMAT_NAME`, `WEEK_START`, `CHARSET`, `DIRECTION`, `CULTURE_ID`) VALUES
	('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2),
	('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `b_language` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_lang_domain
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE IF NOT EXISTS `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_lang_domain: ~0 rows (приблизительно)
DELETE FROM `b_lang_domain`;
/*!40000 ALTER TABLE `b_lang_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_lang_domain` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_list_rubric
DROP TABLE IF EXISTS `b_list_rubric`;
CREATE TABLE IF NOT EXISTS `b_list_rubric` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `AUTO` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DAYS_OF_MONTH` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DAYS_OF_WEEK` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMES_OF_DAY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_EXECUTED` datetime DEFAULT NULL,
  `VISIBLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_list_rubric: ~0 rows (приблизительно)
DELETE FROM `b_list_rubric`;
/*!40000 ALTER TABLE `b_list_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_list_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_main_mail_blacklist
DROP TABLE IF EXISTS `b_main_mail_blacklist`;
CREATE TABLE IF NOT EXISTS `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_main_mail_blacklist: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_blacklist`;
/*!40000 ALTER TABLE `b_main_mail_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_blacklist` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_main_mail_sender
DROP TABLE IF EXISTS `b_main_mail_sender`;
CREATE TABLE IF NOT EXISTS `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT 0,
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT 0,
  `OPTIONS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_main_mail_sender: ~0 rows (приблизительно)
DELETE FROM `b_main_mail_sender`;
/*!40000 ALTER TABLE `b_main_mail_sender` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_main_mail_sender` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_medialib_collection
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE IF NOT EXISTS `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_medialib_collection: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection`;
/*!40000 ALTER TABLE `b_medialib_collection` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_medialib_collection_item
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE IF NOT EXISTS `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_medialib_collection_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_collection_item`;
/*!40000 ALTER TABLE `b_medialib_collection_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_collection_item` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_medialib_item
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE IF NOT EXISTS `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_medialib_item: ~0 rows (приблизительно)
DELETE FROM `b_medialib_item`;
/*!40000 ALTER TABLE `b_medialib_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_medialib_item` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_medialib_type
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE IF NOT EXISTS `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_medialib_type: ~3 rows (приблизительно)
DELETE FROM `b_medialib_type`;
/*!40000 ALTER TABLE `b_medialib_type` DISABLE KEYS */;
INSERT INTO `b_medialib_type` (`ID`, `NAME`, `CODE`, `EXT`, `SYSTEM`, `DESCRIPTION`) VALUES
	(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
	(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
	(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
/*!40000 ALTER TABLE `b_medialib_type` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_messageservice_message
DROP TABLE IF EXISTS `b_messageservice_message`;
CREATE TABLE IF NOT EXISTS `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT 0,
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_messageservice_message: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_message`;
/*!40000 ALTER TABLE `b_messageservice_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_messageservice_rest_app
DROP TABLE IF EXISTS `b_messageservice_rest_app`;
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_messageservice_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app`;
/*!40000 ALTER TABLE `b_messageservice_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_messageservice_rest_app_lang
DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
CREATE TABLE IF NOT EXISTS `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_messageservice_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_messageservice_rest_app_lang`;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_messageservice_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_mobileapp_app
DROP TABLE IF EXISTS `b_mobileapp_app`;
CREATE TABLE IF NOT EXISTS `b_mobileapp_app` (
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SHORT_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci NOT NULL,
  `FILES` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_ICONS` text COLLATE utf8_unicode_ci NOT NULL,
  `LAUNCH_SCREENS` text COLLATE utf8_unicode_ci NOT NULL,
  `FOLDER` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_mobileapp_app: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_app`;
/*!40000 ALTER TABLE `b_mobileapp_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_mobileapp_config
DROP TABLE IF EXISTS `b_mobileapp_config`;
CREATE TABLE IF NOT EXISTS `b_mobileapp_config` (
  `APP_CODE` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PLATFORM` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  PRIMARY KEY (`APP_CODE`,`PLATFORM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_mobileapp_config: ~0 rows (приблизительно)
DELETE FROM `b_mobileapp_config`;
/*!40000 ALTER TABLE `b_mobileapp_config` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_mobileapp_config` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_module
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE IF NOT EXISTS `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_module: ~29 rows (приблизительно)
DELETE FROM `b_module`;
/*!40000 ALTER TABLE `b_module` DISABLE KEYS */;
INSERT INTO `b_module` (`ID`, `DATE_ACTIVE`) VALUES
	('b24connector', '2018-11-26 17:24:13'),
	('bitrix.sitecorporate', '2018-11-26 17:24:17'),
	('bitrix.siteinfoportal', '2018-11-26 17:24:25'),
	('bitrix.sitepersonal', '2018-11-26 17:24:29'),
	('bitrixcloud', '2018-11-26 17:24:30'),
	('blog', '2018-11-26 17:24:42'),
	('clouds', '2018-11-26 17:25:09'),
	('compression', '2018-11-26 17:25:10'),
	('fileman', '2018-11-26 17:25:14'),
	('form', '2018-11-26 17:25:29'),
	('forum', '2018-11-26 17:25:42'),
	('highloadblock', '2018-11-26 17:25:55'),
	('iblock', '2018-11-26 17:26:08'),
	('landing', '2018-11-26 17:26:44'),
	('main', '2018-11-26 17:23:23'),
	('messageservice', '2018-11-26 17:27:18'),
	('mobileapp', '2018-11-26 17:27:21'),
	('perfmon', '2018-11-26 17:27:30'),
	('photogallery', '2018-11-26 17:27:34'),
	('rest', '2018-11-26 17:27:59'),
	('scale', '2018-11-26 17:28:06'),
	('search', '2018-11-26 17:28:15'),
	('security', '2018-11-26 17:28:22'),
	('seo', '2018-11-26 17:28:33'),
	('socialservices', '2018-11-26 17:28:38'),
	('subscribe', '2018-11-26 17:28:43'),
	('translate', '2018-11-26 17:28:45'),
	('ui', '2018-11-26 17:28:47'),
	('vote', '2018-11-26 17:28:54');
/*!40000 ALTER TABLE `b_module` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_module_group
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE IF NOT EXISTS `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_module_group: ~0 rows (приблизительно)
DELETE FROM `b_module_group`;
/*!40000 ALTER TABLE `b_module_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_module_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_module_to_module
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE IF NOT EXISTS `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SORT` int(18) NOT NULL DEFAULT 100,
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=276 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_module_to_module: ~270 rows (приблизительно)
DELETE FROM `b_module_to_module`;
/*!40000 ALTER TABLE `b_module_to_module` DISABLE KEYS */;
INSERT INTO `b_module_to_module` (`ID`, `TIMESTAMP_X`, `SORT`, `FROM_MODULE_ID`, `MESSAGE_ID`, `TO_MODULE_ID`, `TO_PATH`, `TO_CLASS`, `TO_METHOD`, `TO_METHOD_ARG`, `VERSION`) VALUES
	(1, '2018-11-26 17:23:23', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1),
	(2, '2018-11-26 17:23:23', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1),
	(3, '2018-11-26 17:23:23', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1),
	(4, '2018-11-26 17:23:23', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1),
	(5, '2018-11-26 17:23:23', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1),
	(6, '2018-11-26 17:23:23', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1),
	(7, '2018-11-26 17:23:23', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1),
	(8, '2018-11-26 17:23:23', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1),
	(9, '2018-11-26 17:23:23', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1),
	(10, '2018-11-26 17:23:23', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1),
	(11, '2018-11-26 17:23:23', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1),
	(12, '2018-11-26 17:23:23', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1),
	(13, '2018-11-26 17:23:23', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1),
	(14, '2018-11-26 17:23:23', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1),
	(15, '2018-11-26 17:23:23', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1),
	(16, '2018-11-26 17:23:23', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1),
	(17, '2018-11-26 17:23:23', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1),
	(18, '2018-11-26 17:23:23', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1),
	(19, '2018-11-26 17:23:23', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1),
	(20, '2018-11-26 17:23:23', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1),
	(21, '2018-11-26 17:23:23', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1),
	(22, '2018-11-26 17:23:23', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1),
	(23, '2018-11-26 17:23:23', 100, 'main', 'OnUserDelete', 'main', '', 'CAccess', 'OnUserDelete', '', 1),
	(24, '2018-11-26 17:23:23', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1),
	(25, '2018-11-26 17:23:23', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1),
	(26, '2018-11-26 17:23:23', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1),
	(27, '2018-11-26 17:23:23', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1),
	(28, '2018-11-26 17:23:23', 100, 'main', 'OnUserLogin', 'main', '', 'CGroupAuthProvider', 'OnUserLogin', '', 1),
	(29, '2018-11-26 17:23:23', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1),
	(30, '2018-11-26 17:23:23', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1),
	(31, '2018-11-26 17:23:23', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1),
	(32, '2018-11-26 17:23:23', 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1),
	(33, '2018-11-26 17:23:23', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1),
	(34, '2018-11-26 17:23:23', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1),
	(35, '2018-11-26 17:23:23', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1),
	(36, '2018-11-26 17:23:23', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1),
	(37, '2018-11-26 17:23:23', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1),
	(38, '2018-11-26 17:23:23', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1),
	(39, '2018-11-26 17:23:23', 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1),
	(40, '2018-11-26 17:23:23', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1),
	(41, '2018-11-26 17:23:23', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1),
	(42, '2018-11-26 17:23:23', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1),
	(43, '2018-11-26 17:23:23', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1),
	(44, '2018-11-26 17:23:23', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1),
	(45, '2018-11-26 17:23:23', 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1),
	(46, '2018-11-26 17:23:23', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1),
	(47, '2018-11-26 17:23:23', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1),
	(48, '2018-11-26 17:23:23', 100, 'disk', 'onAfterAjaxActionCreateFolderWithSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
	(49, '2018-11-26 17:23:23', 100, 'disk', 'onAfterAjaxActionAppendSharing', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
	(50, '2018-11-26 17:23:23', 100, 'disk', 'onAfterAjaxActionChangeSharingAndRights', 'main', '', '\\Bitrix\\Main\\FinderDestTable', 'onAfterDiskAjaxAction', '', 1),
	(51, '2018-11-26 17:23:23', 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1),
	(52, '2018-11-26 17:23:23', 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1),
	(53, '2018-11-26 17:23:23', 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1),
	(54, '2018-11-26 17:23:23', 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1),
	(55, '2018-11-26 17:23:23', 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2),
	(56, '2018-11-26 17:23:23', 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2),
	(57, '2018-11-26 17:23:23', 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2),
	(58, '2018-11-26 17:23:23', 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1),
	(59, '2018-11-26 17:23:23', 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2),
	(60, '2018-11-26 17:24:13', 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1),
	(61, '2018-11-26 17:24:13', 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1),
	(62, '2018-11-26 17:24:17', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1),
	(63, '2018-11-26 17:24:25', 100, 'main', 'OnBeforeProlog', 'bitrix.siteinfoportal', '', 'CSiteInfoportal', 'ShowPanel', '', 1),
	(64, '2018-11-26 17:24:29', 100, 'main', 'OnBeforeProlog', 'bitrix.sitepersonal', '', 'CSitePersonal', 'ShowPanel', '', 1),
	(65, '2018-11-26 17:24:30', 100, 'main', 'OnAdminInformerInsertItems', 'bitrixcloud', '', 'CBitrixCloudBackup', 'OnAdminInformerInsertItems', '', 1),
	(66, '2018-11-26 17:24:30', 100, 'mobileapp', 'OnBeforeAdminMobileMenuBuild', 'bitrixcloud', '', 'CBitrixCloudMobile', 'OnBeforeAdminMobileMenuBuild', '', 1),
	(67, '2018-11-26 17:24:42', 100, 'search', 'OnReindex', 'blog', '', 'CBlogSearch', 'OnSearchReindex', '', 1),
	(68, '2018-11-26 17:24:42', 100, 'main', 'OnUserDelete', 'blog', '', 'CBlogUser', 'Delete', '', 1),
	(69, '2018-11-26 17:24:42', 100, 'main', 'OnSiteDelete', 'blog', '', 'CBlogSitePath', 'DeleteBySiteID', '', 1),
	(70, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'blog', '', 'CBlogSoNetPost', 'OnGroupDelete', '', 1),
	(71, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnSocNetFeaturesAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
	(72, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnSocNetFeaturesUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeatureIndexSearch', '', 1),
	(73, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsAdd', '', 1),
	(74, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnSocNetFeaturesPermsAdd', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
	(75, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnBeforeSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'OnBeforeSocNetFeaturesPermsUpdate', '', 1),
	(76, '2018-11-26 17:24:42', 100, 'socialnetwork', 'OnSocNetFeaturesPermsUpdate', 'blog', '', 'CBlogSearch', 'SetSoNetFeaturePermIndexSearch', '', 1),
	(77, '2018-11-26 17:24:42', 200, 'main', 'OnAfterAddRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterAddRating', '', 1),
	(78, '2018-11-26 17:24:42', 200, 'main', 'OnAfterUpdateRating', 'blog', '', 'CRatingsComponentsBlog', 'OnAfterUpdateRating', '', 1),
	(79, '2018-11-26 17:24:42', 200, 'main', 'OnSetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnSetRatingConfigs', '', 1),
	(80, '2018-11-26 17:24:42', 200, 'main', 'OnGetRatingsConfigs', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingConfigs', '', 1),
	(81, '2018-11-26 17:24:42', 200, 'main', 'OnGetRatingsObjects', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingObject', '', 1),
	(82, '2018-11-26 17:24:42', 200, 'main', 'OnGetRatingContentOwner', 'blog', '', 'CRatingsComponentsBlog', 'OnGetRatingContentOwner', '', 1),
	(83, '2018-11-26 17:24:42', 100, 'im', 'OnGetNotifySchema', 'blog', '', 'CBlogNotifySchema', 'OnGetNotifySchema', '', 1),
	(84, '2018-11-26 17:24:42', 100, 'im', 'OnAnswerNotify', 'blog', '', 'CBlogNotifySchema', 'CBlogEventsIMCallback', '', 1),
	(85, '2018-11-26 17:24:42', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/blog/install/index.php', 'blog', 'installUserFields', '', 1),
	(86, '2018-11-26 17:24:42', 100, 'conversion', 'OnGetCounterTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
	(87, '2018-11-26 17:24:42', 100, 'conversion', 'OnGetRateTypes', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
	(88, '2018-11-26 17:24:42', 100, 'blog', 'OnPostAdd', 'blog', '', '\\Bitrix\\Blog\\Internals\\ConversionHandlers', 'onPostAdd', '', 1),
	(89, '2018-11-26 17:24:42', 100, 'mail', 'onReplyReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleReplyReceivedBlogPost', '', 2),
	(90, '2018-11-26 17:24:42', 100, 'mail', 'onForwardReceivedBLOG_POST', 'blog', '', '\\Bitrix\\Blog\\Internals\\MailHandler', 'handleForwardReceivedBlogPost', '', 2),
	(91, '2018-11-26 17:24:42', 100, 'socialnetwork', 'onLogIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2),
	(92, '2018-11-26 17:24:42', 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2),
	(93, '2018-11-26 17:24:42', 100, 'socialnetwork', 'onContentViewed', 'blog', '', '\\Bitrix\\Blog\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2),
	(94, '2018-11-26 17:25:09', 100, 'main', 'OnEventLogGetAuditTypes', 'clouds', '', 'CCloudStorage', 'GetAuditTypes', '', 1),
	(95, '2018-11-26 17:25:09', 90, 'main', 'OnBeforeProlog', 'clouds', '', 'CCloudStorage', 'OnBeforeProlog', '', 1),
	(96, '2018-11-26 17:25:09', 100, 'main', 'OnAdminListDisplay', 'clouds', '', 'CCloudStorage', 'OnAdminListDisplay', '', 1),
	(97, '2018-11-26 17:25:09', 100, 'main', 'OnBuildGlobalMenu', 'clouds', '', 'CCloudStorage', 'OnBuildGlobalMenu', '', 1),
	(98, '2018-11-26 17:25:09', 100, 'main', 'OnFileSave', 'clouds', '', 'CCloudStorage', 'OnFileSave', '', 1),
	(99, '2018-11-26 17:25:09', 100, 'main', 'OnGetFileSRC', 'clouds', '', 'CCloudStorage', 'OnGetFileSRC', '', 1),
	(100, '2018-11-26 17:25:09', 100, 'main', 'OnFileCopy', 'clouds', '', 'CCloudStorage', 'OnFileCopy', '', 1),
	(101, '2018-11-26 17:25:09', 100, 'main', 'OnFileDelete', 'clouds', '', 'CCloudStorage', 'OnFileDelete', '', 1),
	(102, '2018-11-26 17:25:09', 100, 'main', 'OnMakeFileArray', 'clouds', '', 'CCloudStorage', 'OnMakeFileArray', '', 1),
	(103, '2018-11-26 17:25:09', 100, 'main', 'OnBeforeResizeImage', 'clouds', '', 'CCloudStorage', 'OnBeforeResizeImage', '', 1),
	(104, '2018-11-26 17:25:09', 100, 'main', 'OnAfterResizeImage', 'clouds', '', 'CCloudStorage', 'OnAfterResizeImage', '', 1),
	(105, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_AmazonS3', 'GetObjectInstance', '', 1),
	(106, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_GoogleStorage', 'GetObjectInstance', '', 1),
	(107, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_OpenStackStorage', 'GetObjectInstance', '', 1),
	(108, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_RackSpaceCloudFiles', 'GetObjectInstance', '', 1),
	(109, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_ClodoRU', 'GetObjectInstance', '', 1),
	(110, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_Selectel', 'GetObjectInstance', '', 1),
	(111, '2018-11-26 17:25:09', 100, 'clouds', 'OnGetStorageService', 'clouds', '', 'CCloudStorageService_HotBox', 'GetObjectInstance', '', 1),
	(112, '2018-11-26 17:25:10', 1, 'main', 'OnPageStart', 'compression', '', 'CCompress', 'OnPageStart', '', 1),
	(113, '2018-11-26 17:25:10', 10000, 'main', 'OnAfterEpilog', 'compression', '', 'CCompress', 'OnAfterEpilog', '', 1),
	(114, '2018-11-26 17:25:14', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1),
	(115, '2018-11-26 17:25:14', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1),
	(116, '2018-11-26 17:25:14', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1),
	(117, '2018-11-26 17:25:14', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1),
	(118, '2018-11-26 17:25:14', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1),
	(119, '2018-11-26 17:25:14', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1),
	(120, '2018-11-26 17:25:14', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1),
	(121, '2018-11-26 17:25:14', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1),
	(122, '2018-11-26 17:25:14', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1),
	(123, '2018-11-26 17:25:14', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1),
	(124, '2018-11-26 17:25:14', 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1),
	(125, '2018-11-26 17:25:29', 100, 'sender', 'OnConnectorList', 'form', '', '\\Bitrix\\Form\\SenderEventHandler', 'onConnectorListForm', '', 1),
	(126, '2018-11-26 17:25:42', 100, 'main', 'OnAfterUserUpdate', 'forum', '', 'CForumUser', 'OnAfterUserUpdate', '', 1),
	(127, '2018-11-26 17:25:42', 100, 'main', 'OnGroupDelete', 'forum', '', 'CForumNew', 'OnGroupDelete', '', 1),
	(128, '2018-11-26 17:25:42', 100, 'main', 'OnBeforeLangDelete', 'forum', '', 'CForumNew', 'OnBeforeLangDelete', '', 1),
	(129, '2018-11-26 17:25:42', 100, 'main', 'OnFileDelete', 'forum', '', 'CForumFiles', 'OnFileDelete', '', 1),
	(130, '2018-11-26 17:25:42', 100, 'search', 'OnReindex', 'forum', '', 'CForumNew', 'OnReindex', '', 1),
	(131, '2018-11-26 17:25:42', 100, 'main', 'OnUserDelete', 'forum', '', 'CForumUser', 'OnUserDelete', '', 1),
	(132, '2018-11-26 17:25:42', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/forum/tools/prop_topicid.php', 'CIBlockPropertyTopicID', 'GetUserTypeDescription', '', 1),
	(133, '2018-11-26 17:25:42', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'forum', '', 'CForumTopic', 'OnBeforeIBlockElementDelete', '', 1),
	(134, '2018-11-26 17:25:42', 100, 'main', 'OnEventLogGetAuditTypes', 'forum', '', 'CForumEventLog', 'GetAuditTypes', '', 1),
	(135, '2018-11-26 17:25:42', 100, 'main', 'OnEventLogGetAuditHandlers', 'forum', '', 'CEventForum', 'MakeForumObject', '', 1),
	(136, '2018-11-26 17:25:42', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'forum', '', 'CForumUser', 'OnSocNetGroupDelete', '', 1),
	(137, '2018-11-26 17:25:42', 100, 'socialnetwork', 'OnSocNetLogFormatEvent', 'forum', '', 'CForumMessage', 'OnSocNetLogFormatEvent', '', 1),
	(138, '2018-11-26 17:25:42', 100, 'mail', 'OnGetFilterList', 'forum', '', 'CForumEMail', 'OnGetSocNetFilterList', '', 1),
	(139, '2018-11-26 17:25:42', 100, 'main', 'OnAfterAddRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterAddRating', '', 1),
	(140, '2018-11-26 17:25:42', 100, 'main', 'OnAfterUpdateRating', 'forum', '', 'CRatingsComponentsForum', 'OnAfterUpdateRating', '', 1),
	(141, '2018-11-26 17:25:42', 100, 'main', 'OnSetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnSetRatingConfigs', '', 1),
	(142, '2018-11-26 17:25:42', 100, 'main', 'OnGetRatingsConfigs', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingConfigs', '', 1),
	(143, '2018-11-26 17:25:42', 100, 'main', 'OnGetRatingsObjects', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingObject', '', 1),
	(144, '2018-11-26 17:25:42', 100, 'main', 'OnGetRatingContentOwner', 'forum', '', 'CRatingsComponentsForum', 'OnGetRatingContentOwner', '', 1),
	(145, '2018-11-26 17:25:42', 100, 'im', 'OnGetNotifySchema', 'forum', '', 'CForumNotifySchema', 'OnGetNotifySchema', '', 1),
	(146, '2018-11-26 17:25:42', 100, 'main', 'OnAfterRegisterModule', 'main', '/modules/forum/install/index.php', 'forum', 'InstallUserFields', '', 1),
	(147, '2018-11-26 17:25:42', 100, 'rest', 'OnRestServiceBuildDescription', 'forum', '', 'CForumRestService', 'OnRestServiceBuildDescription', '', 1),
	(148, '2018-11-26 17:25:42', 100, 'conversion', 'OnGetCounterTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetCounterTypes', '', 1),
	(149, '2018-11-26 17:25:42', 100, 'conversion', 'OnGetRateTypes', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onGetRateTypes', '', 1),
	(150, '2018-11-26 17:25:42', 100, 'forum', 'onAfterTopicAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onTopicAdd', '', 1),
	(151, '2018-11-26 17:25:42', 100, 'forum', 'onAfterMessageAdd', 'forum', '', '\\Bitrix\\Forum\\Internals\\ConversionHandlers', 'onMessageAdd', '', 1),
	(152, '2018-11-26 17:25:42', 100, 'socialnetwork', 'onLogIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\Log', 'onIndexGetContent', '', 2),
	(153, '2018-11-26 17:25:42', 100, 'socialnetwork', 'onLogCommentIndexGetContent', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\LogComment', 'onIndexGetContent', '', 2),
	(154, '2018-11-26 17:25:42', 100, 'socialnetwork', 'onContentViewed', 'forum', '', '\\Bitrix\\Forum\\Integration\\Socialnetwork\\ContentViewHandler', 'onContentViewed', '', 2),
	(155, '2018-11-26 17:25:55', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1),
	(156, '2018-11-26 17:25:55', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1),
	(157, '2018-11-26 17:25:55', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1),
	(158, '2018-11-26 17:25:55', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1),
	(159, '2018-11-26 17:25:55', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1),
	(160, '2018-11-26 17:26:08', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1),
	(161, '2018-11-26 17:26:08', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1),
	(162, '2018-11-26 17:26:08', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1),
	(163, '2018-11-26 17:26:08', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1),
	(164, '2018-11-26 17:26:08', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1),
	(165, '2018-11-26 17:26:08', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1),
	(166, '2018-11-26 17:26:08', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1),
	(167, '2018-11-26 17:26:08', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1),
	(168, '2018-11-26 17:26:08', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1),
	(169, '2018-11-26 17:26:08', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1),
	(170, '2018-11-26 17:26:08', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1),
	(171, '2018-11-26 17:26:08', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1),
	(172, '2018-11-26 17:26:08', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1),
	(173, '2018-11-26 17:26:08', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1),
	(174, '2018-11-26 17:26:08', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1),
	(175, '2018-11-26 17:26:08', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1),
	(176, '2018-11-26 17:26:08', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1),
	(177, '2018-11-26 17:26:08', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1),
	(178, '2018-11-26 17:26:08', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1),
	(179, '2018-11-26 17:26:08', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1),
	(180, '2018-11-26 17:26:08', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1),
	(181, '2018-11-26 17:26:08', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1),
	(182, '2018-11-26 17:26:08', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1),
	(183, '2018-11-26 17:26:08', 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1),
	(184, '2018-11-26 17:26:44', 100, 'rest', 'OnRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2),
	(185, '2018-11-26 17:26:44', 100, 'rest', 'OnRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2),
	(186, '2018-11-26 17:26:44', 100, 'main', 'OnPanelCreate', 'landing', '', '\\Bitrix\\Landing\\Manager', 'addPanelButtons', '', 2),
	(187, '2018-11-26 17:27:18', 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1),
	(188, '2018-11-26 17:27:18', 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1),
	(189, '2018-11-26 17:27:18', 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1),
	(190, '2018-11-26 17:27:18', 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1),
	(191, '2018-11-26 17:27:21', 100, 'pull', 'OnGetDependentModule', 'mobileapp', '', 'CMobileAppPullSchema', 'OnGetDependentModule', '', 1),
	(192, '2018-11-26 17:27:30', 100, 'perfmon', 'OnGetTableSchema', 'perfmon', '', 'perfmon', 'OnGetTableSchema', '', 1),
	(193, '2018-11-26 17:27:34', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'photogallery', '', 'CPhotogalleryElement', 'OnBeforeIBlockElementDelete', '', 1),
	(194, '2018-11-26 17:27:34', 100, 'iblock', 'OnAfterIBlockElementAdd', 'photogallery', '', 'CPhotogalleryElement', 'OnAfterIBlockElementAdd', '', 1),
	(195, '2018-11-26 17:27:34', 100, 'search', 'BeforeIndex', 'photogallery', '', 'CRatingsComponentsPhotogallery', 'BeforeIndex', '', 1),
	(196, '2018-11-26 17:27:34', 100, 'im', 'OnGetNotifySchema', 'photogallery', '', 'CPhotogalleryNotifySchema', 'OnGetNotifySchema', '', 1),
	(197, '2018-11-26 17:27:34', 100, 'socialnetwork', 'OnSocNetGroupDelete', 'photogallery', '', '\\Bitrix\\Photogallery\\Integration\\Socialnetwork\\Group', 'onSocNetGroupDelete', '', 1),
	(198, '2018-11-26 17:27:59', 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2),
	(199, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2),
	(200, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2),
	(201, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2),
	(202, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2),
	(203, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2),
	(204, '2018-11-26 17:27:59', 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2),
	(205, '2018-11-26 17:27:59', 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2),
	(206, '2018-11-26 17:27:59', 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2),
	(207, '2018-11-26 17:27:59', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'OnRestServiceBuildDescription', '', 2),
	(208, '2018-11-26 17:27:59', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2),
	(209, '2018-11-26 17:27:59', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2),
	(210, '2018-11-26 17:27:59', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2),
	(211, '2018-11-26 17:28:06', 100, 'main', 'OnEventLogGetAuditTypes', 'scale', '', '\\Bitrix\\Scale\\Logger', 'onEventLogGetAuditTypes', '', 1),
	(212, '2018-11-26 17:28:15', 100, 'main', 'OnChangePermissions', 'search', '', 'CSearch', 'OnChangeFilePermissions', '', 1),
	(213, '2018-11-26 17:28:15', 100, 'main', 'OnChangeFile', 'search', '', 'CSearch', 'OnChangeFile', '', 1),
	(214, '2018-11-26 17:28:15', 100, 'main', 'OnGroupDelete', 'search', '', 'CSearch', 'OnGroupDelete', '', 1),
	(215, '2018-11-26 17:28:15', 100, 'main', 'OnLangDelete', 'search', '', 'CSearch', 'OnLangDelete', '', 1),
	(216, '2018-11-26 17:28:15', 100, 'main', 'OnAfterUserUpdate', 'search', '', 'CSearchUser', 'OnAfterUserUpdate', '', 1),
	(217, '2018-11-26 17:28:15', 100, 'main', 'OnUserDelete', 'search', '', 'CSearchUser', 'DeleteByUserID', '', 1),
	(218, '2018-11-26 17:28:15', 100, 'cluster', 'OnGetTableList', 'search', '', 'search', 'OnGetTableList', '', 1),
	(219, '2018-11-26 17:28:15', 100, 'perfmon', 'OnGetTableSchema', 'search', '', 'search', 'OnGetTableSchema', '', 1),
	(220, '2018-11-26 17:28:15', 90, 'main', 'OnEpilog', 'search', '', 'CSearchStatistic', 'OnEpilog', '', 1),
	(221, '2018-11-26 17:28:22', 100, 'main', 'OnUserDelete', 'security', '', 'CSecurityUser', 'OnUserDelete', '', 1),
	(222, '2018-11-26 17:28:22', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityFilter', 'GetAuditTypes', '', 1),
	(223, '2018-11-26 17:28:22', 100, 'main', 'OnEventLogGetAuditTypes', 'security', '', 'CSecurityAntiVirus', 'GetAuditTypes', '', 1),
	(224, '2018-11-26 17:28:22', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecurityFilter', 'OnAdminInformerInsertItems', '', 1),
	(225, '2018-11-26 17:28:22', 100, 'main', 'OnAdminInformerInsertItems', 'security', '', 'CSecuritySiteChecker', 'OnAdminInformerInsertItems', '', 1),
	(226, '2018-11-26 17:28:22', 5, 'main', 'OnBeforeProlog', 'security', '', 'CSecurityFilter', 'OnBeforeProlog', '', 1),
	(227, '2018-11-26 17:28:22', 9999, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityXSSDetect', 'OnEndBufferContent', '', 1),
	(228, '2018-11-26 17:28:22', 1, 'main', 'OnBeforeLocalRedirect', 'security', '', 'CSecurityRedirect', 'BeforeLocalRedirect', '', 1),
	(229, '2018-11-26 17:28:22', 1, 'main', 'OnEndBufferContent', 'security', '', 'CSecurityRedirect', 'EndBufferContent', '', 1),
	(230, '2018-11-26 17:28:33', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2),
	(231, '2018-11-26 17:28:33', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2),
	(232, '2018-11-26 17:28:33', 100, 'fileman', 'OnBeforeHTMLEditorScriptRuns', 'seo', '', 'CSeoEventHandlers', 'OnBeforeHTMLEditorScriptRuns', '', 2),
	(233, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockSectionAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addSection', '', 2),
	(234, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockElementAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'addElement', '', 2),
	(235, '2018-11-26 17:28:33', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteSection', '', 2),
	(236, '2018-11-26 17:28:33', 100, 'iblock', 'OnBeforeIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeDeleteElement', '', 2),
	(237, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockSectionDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteSection', '', 2),
	(238, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockElementDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'deleteElement', '', 2),
	(239, '2018-11-26 17:28:33', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateSection', '', 2),
	(240, '2018-11-26 17:28:33', 100, 'iblock', 'OnBeforeIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'beforeUpdateElement', '', 2),
	(241, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockSectionUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateSection', '', 2),
	(242, '2018-11-26 17:28:33', 100, 'iblock', 'OnAfterIBlockElementUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapIblock', 'updateElement', '', 2),
	(243, '2018-11-26 17:28:33', 100, 'forum', 'onAfterTopicAdd', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'addTopic', '', 2),
	(244, '2018-11-26 17:28:33', 100, 'forum', 'onAfterTopicUpdate', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'updateTopic', '', 2),
	(245, '2018-11-26 17:28:33', 100, 'forum', 'onAfterTopicDelete', 'seo', '', '\\Bitrix\\Seo\\SitemapForum', 'deleteTopic', '', 2),
	(246, '2018-11-26 17:28:33', 100, 'main', 'OnAdminIBlockElementEdit', 'seo', '', '\\Bitrix\\Seo\\AdvTabEngine', 'eventHandler', '', 2),
	(247, '2018-11-26 17:28:33', 100, 'main', 'OnBeforeProlog', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'checkSession', '', 2),
	(248, '2018-11-26 17:28:33', 100, 'sale', 'OnOrderSave', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onOrderSave', '', 2),
	(249, '2018-11-26 17:28:33', 100, 'sale', 'OnBasketOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onBasketOrder', '', 2),
	(250, '2018-11-26 17:28:33', 100, 'sale', 'onSalePayOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSalePayOrder', '', 2),
	(251, '2018-11-26 17:28:33', 100, 'sale', 'onSaleDeductOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeductOrder', '', 2),
	(252, '2018-11-26 17:28:33', 100, 'sale', 'onSaleDeliveryOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleDeliveryOrder', '', 2),
	(253, '2018-11-26 17:28:33', 100, 'sale', 'onSaleStatusOrder', 'seo', '', '\\Bitrix\\Seo\\AdvSession', 'onSaleStatusOrder', '', 2),
	(254, '2018-11-26 17:28:33', 100, 'conversion', 'OnSetDayContextAttributes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onSetDayContextAttributes', '', 2),
	(255, '2018-11-26 17:28:33', 100, 'conversion', 'OnGetAttributeTypes', 'seo', '', '\\Bitrix\\Seo\\ConversionHandler', 'onGetAttributeTypes', '', 2),
	(256, '2018-11-26 17:28:33', 100, 'catalog', 'OnProductUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
	(257, '2018-11-26 17:28:33', 100, 'catalog', 'OnProductSetAvailableUpdate', 'seo', '', '\\Bitrix\\Seo\\Adv\\Auto', 'checkQuantity', '', 2),
	(258, '2018-11-26 17:28:38', 100, 'main', 'OnUserDelete', 'socialservices', '', 'CSocServAuthDB', 'OnUserDelete', '', 1),
	(259, '2018-11-26 17:28:38', 100, 'timeman', 'OnAfterTMReportDailyAdd', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMReportDailyAdd', '', 1),
	(260, '2018-11-26 17:28:38', 100, 'timeman', 'OnAfterTMDayStart', 'socialservices', '', 'CSocServAuthDB', 'OnAfterTMDayStart', '', 1),
	(261, '2018-11-26 17:28:38', 100, 'timeman', 'OnTimeManShow', 'socialservices', '', 'CSocServEventHandlers', 'OnTimeManShow', '', 1),
	(262, '2018-11-26 17:28:38', 100, 'main', 'OnFindExternalUser', 'socialservices', '', 'CSocServAuthDB', 'OnFindExternalUser', '', 1),
	(263, '2018-11-26 17:28:38', 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkOldUser', '', 1),
	(264, '2018-11-26 17:28:38', 100, 'socialservices', 'OnFindSocialservicesUser', 'socialservices', '', 'CSocServAuthManager', 'checkAbandonedUser', '', 1),
	(265, '2018-11-26 17:28:43', 100, 'main', 'OnBeforeLangDelete', 'subscribe', '', 'CRubric', 'OnBeforeLangDelete', '', 1),
	(266, '2018-11-26 17:28:43', 100, 'main', 'OnUserDelete', 'subscribe', '', 'CSubscription', 'OnUserDelete', '', 1),
	(267, '2018-11-26 17:28:43', 100, 'main', 'OnUserLogout', 'subscribe', '', 'CSubscription', 'OnUserLogout', '', 1),
	(268, '2018-11-26 17:28:43', 100, 'main', 'OnGroupDelete', 'subscribe', '', 'CPosting', 'OnGroupDelete', '', 1),
	(269, '2018-11-26 17:28:43', 100, 'sender', 'OnConnectorList', 'subscribe', '', 'Bitrix\\Subscribe\\SenderEventHandler', 'onConnectorListSubscriber', '', 1),
	(270, '2018-11-26 17:28:45', 100, 'main', 'OnPanelCreate', 'translate', '', 'CTranslateEventHandlers', 'TranslatOnPanelCreate', '', 1),
	(271, '2018-11-26 17:28:54', 100, 'main', 'OnBeforeProlog', 'main', '/modules/vote/keepvoting.php', '', '', '', 1),
	(272, '2018-11-26 17:28:54', 200, 'main', 'OnUserTypeBuildList', 'vote', '', 'Bitrix\\Vote\\Uf\\VoteUserType', 'getUserTypeDescription', '', 1),
	(273, '2018-11-26 17:28:54', 200, 'main', 'OnUserLogin', 'vote', '', 'CVoteUser', 'OnUserLogin', '', 1),
	(274, '2018-11-26 17:28:54', 100, 'im', 'OnGetNotifySchema', 'vote', '', 'CVoteNotifySchema', 'OnGetNotifySchema', '', 1),
	(275, '2018-11-26 17:35:53', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1);
/*!40000 ALTER TABLE `b_module_to_module` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_numerator
DROP TABLE IF EXISTS `b_numerator`;
CREATE TABLE IF NOT EXISTS `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_numerator: ~0 rows (приблизительно)
DELETE FROM `b_numerator`;
/*!40000 ALTER TABLE `b_numerator` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_numerator_sequence
DROP TABLE IF EXISTS `b_numerator_sequence`;
CREATE TABLE IF NOT EXISTS `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT 0,
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_numerator_sequence: ~0 rows (приблизительно)
DELETE FROM `b_numerator_sequence`;
/*!40000 ALTER TABLE `b_numerator_sequence` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_numerator_sequence` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_operation
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE IF NOT EXISTS `b_operation` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_operation: ~115 rows (приблизительно)
DELETE FROM `b_operation`;
/*!40000 ALTER TABLE `b_operation` DISABLE KEYS */;
INSERT INTO `b_operation` (`ID`, `NAME`, `MODULE_ID`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'edit_php', 'main', NULL, 'module'),
	(2, 'view_own_profile', 'main', NULL, 'module'),
	(3, 'edit_own_profile', 'main', NULL, 'module'),
	(4, 'view_all_users', 'main', NULL, 'module'),
	(5, 'view_groups', 'main', NULL, 'module'),
	(6, 'view_tasks', 'main', NULL, 'module'),
	(7, 'view_other_settings', 'main', NULL, 'module'),
	(8, 'view_subordinate_users', 'main', NULL, 'module'),
	(9, 'edit_subordinate_users', 'main', NULL, 'module'),
	(10, 'edit_all_users', 'main', NULL, 'module'),
	(11, 'edit_groups', 'main', NULL, 'module'),
	(12, 'edit_tasks', 'main', NULL, 'module'),
	(13, 'edit_other_settings', 'main', NULL, 'module'),
	(14, 'cache_control', 'main', NULL, 'module'),
	(15, 'lpa_template_edit', 'main', NULL, 'module'),
	(16, 'view_event_log', 'main', NULL, 'module'),
	(17, 'edit_ratings', 'main', NULL, 'module'),
	(18, 'manage_short_uri', 'main', NULL, 'module'),
	(19, 'fm_view_permission', 'main', NULL, 'file'),
	(20, 'fm_view_file', 'main', NULL, 'file'),
	(21, 'fm_view_listing', 'main', NULL, 'file'),
	(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
	(23, 'fm_create_new_file', 'main', NULL, 'file'),
	(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
	(25, 'fm_create_new_folder', 'main', NULL, 'file'),
	(26, 'fm_delete_file', 'main', NULL, 'file'),
	(27, 'fm_delete_folder', 'main', NULL, 'file'),
	(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
	(29, 'fm_rename_file', 'main', NULL, 'file'),
	(30, 'fm_rename_folder', 'main', NULL, 'file'),
	(31, 'fm_upload_file', 'main', NULL, 'file'),
	(32, 'fm_add_to_menu', 'main', NULL, 'file'),
	(33, 'fm_download_file', 'main', NULL, 'file'),
	(34, 'fm_lpa', 'main', NULL, 'file'),
	(35, 'fm_edit_permission', 'main', NULL, 'file'),
	(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
	(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
	(38, 'bitrixcloud_cdn', 'bitrixcloud', NULL, 'module'),
	(39, 'clouds_browse', 'clouds', NULL, 'module'),
	(40, 'clouds_upload', 'clouds', NULL, 'module'),
	(41, 'clouds_config', 'clouds', NULL, 'module'),
	(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
	(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
	(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
	(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
	(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
	(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
	(48, 'fileman_admin_files', 'fileman', '', 'module'),
	(49, 'fileman_admin_folders', 'fileman', '', 'module'),
	(50, 'fileman_view_permissions', 'fileman', '', 'module'),
	(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
	(52, 'fileman_upload_files', 'fileman', '', 'module'),
	(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
	(54, 'fileman_install_control', 'fileman', '', 'module'),
	(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
	(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
	(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
	(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
	(59, 'medialib_access', 'fileman', '', 'medialib'),
	(60, 'medialib_new_item', 'fileman', '', 'medialib'),
	(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
	(62, 'medialib_del_item', 'fileman', '', 'medialib'),
	(63, 'sticker_view', 'fileman', '', 'stickers'),
	(64, 'sticker_edit', 'fileman', '', 'stickers'),
	(65, 'sticker_new', 'fileman', '', 'stickers'),
	(66, 'sticker_del', 'fileman', '', 'stickers'),
	(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
	(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
	(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
	(70, 'section_read', 'iblock', NULL, 'iblock'),
	(71, 'element_read', 'iblock', NULL, 'iblock'),
	(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
	(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
	(74, 'element_edit', 'iblock', NULL, 'iblock'),
	(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
	(76, 'element_delete', 'iblock', NULL, 'iblock'),
	(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
	(78, 'section_edit', 'iblock', NULL, 'iblock'),
	(79, 'section_delete', 'iblock', NULL, 'iblock'),
	(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
	(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
	(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
	(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
	(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
	(85, 'iblock_export', 'iblock', NULL, 'iblock'),
	(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
	(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
	(88, 'security_filter_bypass', 'security', NULL, 'module'),
	(89, 'security_edit_user_otp', 'security', NULL, 'module'),
	(90, 'security_module_settings_read', 'security', NULL, 'module'),
	(91, 'security_panel_view', 'security', NULL, 'module'),
	(92, 'security_filter_settings_read', 'security', NULL, 'module'),
	(93, 'security_otp_settings_read', 'security', NULL, 'module'),
	(94, 'security_iprule_admin_settings_read', 'security', NULL, 'module'),
	(95, 'security_session_settings_read', 'security', NULL, 'module'),
	(96, 'security_redirect_settings_read', 'security', NULL, 'module'),
	(97, 'security_stat_activity_settings_read', 'security', NULL, 'module'),
	(98, 'security_iprule_settings_read', 'security', NULL, 'module'),
	(99, 'security_antivirus_settings_read', 'security', NULL, 'module'),
	(100, 'security_frame_settings_read', 'security', NULL, 'module'),
	(101, 'security_module_settings_write', 'security', NULL, 'module'),
	(102, 'security_filter_settings_write', 'security', NULL, 'module'),
	(103, 'security_otp_settings_write', 'security', NULL, 'module'),
	(104, 'security_iprule_admin_settings_write', 'security', NULL, 'module'),
	(105, 'security_session_settings_write', 'security', NULL, 'module'),
	(106, 'security_redirect_settings_write', 'security', NULL, 'module'),
	(107, 'security_stat_activity_settings_write', 'security', NULL, 'module'),
	(108, 'security_iprule_settings_write', 'security', NULL, 'module'),
	(109, 'security_file_verifier_sign', 'security', NULL, 'module'),
	(110, 'security_file_verifier_collect', 'security', NULL, 'module'),
	(111, 'security_file_verifier_verify', 'security', NULL, 'module'),
	(112, 'security_antivirus_settings_write', 'security', NULL, 'module'),
	(113, 'security_frame_settings_write', 'security', NULL, 'module'),
	(114, 'seo_settings', 'seo', '', 'module'),
	(115, 'seo_tools', 'seo', '', 'module');
/*!40000 ALTER TABLE `b_operation` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_option
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE IF NOT EXISTS `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ix_option` (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_option: ~59 rows (приблизительно)
DELETE FROM `b_option`;
/*!40000 ALTER TABLE `b_option` DISABLE KEYS */;
INSERT INTO `b_option` (`MODULE_ID`, `NAME`, `VALUE`, `DESCRIPTION`, `SITE_ID`) VALUES
	('main', '~ft_b_user', 'a:3:{s:19:"SEARCH_USER_CONTENT";b:1;s:25:"SEARCH_DEPARTMENT_CONTENT";b:1;s:20:"SEARCH_ADMIN_CONTENT";b:1;}', NULL, NULL),
	('main', 'rating_authority_rating', '2', NULL, NULL),
	('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
	('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
	('main', 'rating_assign_rating_group', '3', NULL, NULL),
	('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
	('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
	('main', 'rating_assign_authority_group', '4', NULL, NULL),
	('main', 'rating_community_size', '1', NULL, NULL),
	('main', 'rating_community_authority', '30', NULL, NULL),
	('main', 'rating_vote_weight', '10', NULL, NULL),
	('main', 'rating_normalization_type', 'auto', NULL, NULL),
	('main', 'rating_normalization', '10', NULL, NULL),
	('main', 'rating_count_vote', '10', NULL, NULL),
	('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
	('main', 'rating_community_last_visit', '90', NULL, NULL),
	('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
	('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
	('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
	('main', 'rating_assign_type', 'auto', NULL, NULL),
	('main', 'rating_vote_type', 'like', NULL, NULL),
	('main', 'rating_self_vote', 'Y', NULL, NULL),
	('main', 'rating_vote_show', 'Y', NULL, NULL),
	('main', 'rating_vote_template', 'like', NULL, NULL),
	('main', 'rating_start_authority', '3', NULL, NULL),
	('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
	('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
	('main', 'distributive6', 'Y', NULL, NULL),
	('main', '~new_license11_sign', 'Y', NULL, NULL),
	('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
	('main', 'vendor', '1c_bitrix', NULL, NULL),
	('main', 'admin_lid', 'ru', NULL, NULL),
	('main', 'update_site', 'www.bitrixsoft.com', NULL, NULL),
	('main', 'update_site_ns', 'Y', NULL, NULL),
	('main', 'optimize_css_files', 'Y', NULL, NULL),
	('main', 'optimize_js_files', 'Y', NULL, NULL),
	('main', 'admin_passwordh', 'FVoQemYUBwYtCUVcDxcBCgsTAQ==', NULL, NULL),
	('main', 'server_uniq_id', 'e5f88ee9f7d31f0a00876425323347d9', NULL, NULL),
	('blog', 'socNetNewPerms', 'Y', NULL, NULL),
	('fileman', 'use_editor_3', 'Y', NULL, NULL),
	('forum', 'FILTER_DICT_W', '1', NULL, 'ru'),
	('forum', 'FILTER_DICT_T', '2', NULL, 'ru'),
	('forum', 'FILTER_DICT_W', '3', NULL, 'en'),
	('forum', 'FILTER_DICT_T', '4', NULL, 'en'),
	('forum', 'FILTER', 'N', NULL, NULL),
	('landing', 'disabled_namespaces', 'bitrix', NULL, NULL),
	('landing', 'block_vendor_bitrix', 'https://repo.bitrix24.site/rest/1/w1uqy3swvyp50bso/', NULL, NULL),
	('landing', 'pub_path_s1', '/lp/', NULL, NULL),
	('messageservice', 'clean_up_period', '14', NULL, NULL),
	('rest', 'server_path', '/rest', NULL, NULL),
	('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
	('search', 'version', 'v2.0', NULL, NULL),
	('search', 'dbnode_id', 'N', NULL, NULL),
	('search', 'dbnode_status', 'ok', NULL, NULL),
	('security', 'ipcheck_disable_file', '/bitrix/modules/ipcheck_disable_0b87b35291fcf6d6737926026de8c1fb', NULL, NULL),
	('security', 'redirect_sid', 's1ldbwa3j4rr403ps73zwz2ozrls4t17', NULL, NULL),
	('vote', 'VOTE_DIR', '', NULL, NULL),
	('vote', 'VOTE_COMPATIBLE_OLD_TEMPLATE', 'N', NULL, NULL),
	('main', 'email_from', 'webdev@gutagroup.ru', NULL, NULL),
	('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL);
/*!40000 ALTER TABLE `b_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_cache
DROP TABLE IF EXISTS `b_perf_cache`;
CREATE TABLE IF NOT EXISTS `b_perf_cache` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_SIZE` float DEFAULT NULL,
  `OP_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BASE_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INIT_DIR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_PATH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_CACHE_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_CACHE_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_cache: ~0 rows (приблизительно)
DELETE FROM `b_perf_cache`;
/*!40000 ALTER TABLE `b_perf_cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cache` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_cluster
DROP TABLE IF EXISTS `b_perf_cluster`;
CREATE TABLE IF NOT EXISTS `b_perf_cluster` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `THREADS` int(11) DEFAULT NULL,
  `HITS` int(11) DEFAULT NULL,
  `ERRORS` int(11) DEFAULT NULL,
  `PAGES_PER_SECOND` float DEFAULT NULL,
  `PAGE_EXEC_TIME` float DEFAULT NULL,
  `PAGE_RESP_TIME` float DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_cluster: ~0 rows (приблизительно)
DELETE FROM `b_perf_cluster`;
/*!40000 ALTER TABLE `b_perf_cluster` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_cluster` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_component
DROP TABLE IF EXISTS `b_perf_component`;
CREATE TABLE IF NOT EXISTS `b_perf_component` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `COMPONENT_TIME` float DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_COMPONENT_0` (`HIT_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_component: ~0 rows (приблизительно)
DELETE FROM `b_perf_component`;
/*!40000 ALTER TABLE `b_perf_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_component` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_error
DROP TABLE IF EXISTS `b_perf_error`;
CREATE TABLE IF NOT EXISTS `b_perf_error` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `ERRNO` int(18) DEFAULT NULL,
  `ERRSTR` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERRLINE` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_ERROR_0` (`HIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_error: ~0 rows (приблизительно)
DELETE FROM `b_perf_error`;
/*!40000 ALTER TABLE `b_perf_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_error` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_history
DROP TABLE IF EXISTS `b_perf_history`;
CREATE TABLE IF NOT EXISTS `b_perf_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `TOTAL_MARK` float DEFAULT NULL,
  `ACCELERATOR_ENABLED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_history: ~0 rows (приблизительно)
DELETE FROM `b_perf_history`;
/*!40000 ALTER TABLE `b_perf_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_history` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_hit
DROP TABLE IF EXISTS `b_perf_hit`;
CREATE TABLE IF NOT EXISTS `b_perf_hit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_HIT` datetime DEFAULT NULL,
  `IS_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SERVER_PORT` int(11) DEFAULT NULL,
  `SCRIPT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `INCLUDED_FILES` int(11) DEFAULT NULL,
  `MEMORY_PEAK_USAGE` int(11) DEFAULT NULL,
  `CACHE_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SIZE` int(11) DEFAULT NULL,
  `CACHE_COUNT_R` int(11) DEFAULT NULL,
  `CACHE_COUNT_W` int(11) DEFAULT NULL,
  `CACHE_COUNT_C` int(11) DEFAULT NULL,
  `QUERIES` int(11) DEFAULT NULL,
  `QUERIES_TIME` float DEFAULT NULL,
  `COMPONENTS` int(11) DEFAULT NULL,
  `COMPONENTS_TIME` float DEFAULT NULL,
  `SQL_LOG` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_TIME` float DEFAULT NULL,
  `PROLOG_TIME` float DEFAULT NULL,
  `PROLOG_BEFORE_TIME` float DEFAULT NULL,
  `AGENTS_TIME` float DEFAULT NULL,
  `PROLOG_AFTER_TIME` float DEFAULT NULL,
  `WORK_AREA_TIME` float DEFAULT NULL,
  `EPILOG_TIME` float DEFAULT NULL,
  `EPILOG_BEFORE_TIME` float DEFAULT NULL,
  `EVENTS_TIME` float DEFAULT NULL,
  `EPILOG_AFTER_TIME` float DEFAULT NULL,
  `MENU_RECALC` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_HIT_0` (`DATE_HIT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_hit: ~0 rows (приблизительно)
DELETE FROM `b_perf_hit`;
/*!40000 ALTER TABLE `b_perf_hit` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_hit` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_index_ban
DROP TABLE IF EXISTS `b_perf_index_ban`;
CREATE TABLE IF NOT EXISTS `b_perf_index_ban` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BAN_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_index_ban: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_ban`;
/*!40000 ALTER TABLE `b_perf_index_ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_ban` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_index_complete
DROP TABLE IF EXISTS `b_perf_index_complete`;
CREATE TABLE IF NOT EXISTS `b_perf_index_complete` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BANNED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_complete_0` (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_index_complete: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_complete`;
/*!40000 ALTER TABLE `b_perf_index_complete` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_complete` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_index_suggest
DROP TABLE IF EXISTS `b_perf_index_suggest`;
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SQL_MD5` char(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_COUNT` int(11) DEFAULT NULL,
  `SQL_TIME` float DEFAULT NULL,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ALIAS` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAMES` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_EXPLAIN` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_index_suggest_0` (`SQL_MD5`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_index_suggest: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest`;
/*!40000 ALTER TABLE `b_perf_index_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_index_suggest_sql
DROP TABLE IF EXISTS `b_perf_index_suggest_sql`;
CREATE TABLE IF NOT EXISTS `b_perf_index_suggest_sql` (
  `SUGGEST_ID` int(11) NOT NULL,
  `SQL_ID` int(11) NOT NULL,
  PRIMARY KEY (`SUGGEST_ID`,`SQL_ID`),
  KEY `ix_b_perf_index_suggest_sql_0` (`SQL_ID`,`SUGGEST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_index_suggest_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_index_suggest_sql`;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_index_suggest_sql` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_sql
DROP TABLE IF EXISTS `b_perf_sql`;
CREATE TABLE IF NOT EXISTS `b_perf_sql` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `HIT_ID` int(18) DEFAULT NULL,
  `COMPONENT_ID` int(18) DEFAULT NULL,
  `NN` int(18) DEFAULT NULL,
  `QUERY_TIME` float DEFAULT NULL,
  `NODE_ID` int(18) DEFAULT NULL,
  `MODULE_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPONENT_NAME` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SQL_TEXT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_PERF_SQL_0` (`HIT_ID`,`NN`),
  KEY `IX_B_PERF_SQL_1` (`COMPONENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_sql: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql`;
/*!40000 ALTER TABLE `b_perf_sql` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_sql_backtrace
DROP TABLE IF EXISTS `b_perf_sql_backtrace`;
CREATE TABLE IF NOT EXISTS `b_perf_sql_backtrace` (
  `SQL_ID` int(18) NOT NULL,
  `NN` int(18) NOT NULL,
  `FILE_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINE_NO` int(18) DEFAULT NULL,
  `CLASS_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FUNCTION_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SQL_ID`,`NN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_sql_backtrace: ~0 rows (приблизительно)
DELETE FROM `b_perf_sql_backtrace`;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_sql_backtrace` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_tab_column_stat
DROP TABLE IF EXISTS `b_perf_tab_column_stat`;
CREATE TABLE IF NOT EXISTS `b_perf_tab_column_stat` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLUMN_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  `COLUMN_ROWS` float DEFAULT NULL,
  `VALUE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_perf_tab_column_stat` (`TABLE_NAME`,`COLUMN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_tab_column_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_column_stat`;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_column_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_tab_stat
DROP TABLE IF EXISTS `b_perf_tab_stat`;
CREATE TABLE IF NOT EXISTS `b_perf_tab_stat` (
  `TABLE_NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_SIZE` float DEFAULT NULL,
  `TABLE_ROWS` float DEFAULT NULL,
  PRIMARY KEY (`TABLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_tab_stat: ~0 rows (приблизительно)
DELETE FROM `b_perf_tab_stat`;
/*!40000 ALTER TABLE `b_perf_tab_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_tab_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_perf_test
DROP TABLE IF EXISTS `b_perf_test`;
CREATE TABLE IF NOT EXISTS `b_perf_test` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REFERENCE_ID` int(18) DEFAULT NULL,
  `NAME` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_PERF_TEST_0` (`REFERENCE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_perf_test: ~0 rows (приблизительно)
DELETE FROM `b_perf_test`;
/*!40000 ALTER TABLE `b_perf_test` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_perf_test` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_posting
DROP TABLE IF EXISTS `b_posting`;
CREATE TABLE IF NOT EXISTS `b_posting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `VERSION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_SENT` datetime DEFAULT NULL,
  `SENT_BCC` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `FROM_FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BCC_FIELD` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL_FILTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BODY` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `DIRECT_SEND` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MSG_CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUBSCR_FORMAT` varchar(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_EMAIL` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUTO_SEND_TIME` datetime DEFAULT NULL,
  `BCC_TO_SEND` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_posting: ~0 rows (приблизительно)
DELETE FROM `b_posting`;
/*!40000 ALTER TABLE `b_posting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_posting_email
DROP TABLE IF EXISTS `b_posting_email`;
CREATE TABLE IF NOT EXISTS `b_posting_email` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `POSTING_ID` int(11) NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SUBSCRIPTION_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_posting_email_status` (`POSTING_ID`,`STATUS`),
  KEY `ix_posting_email_email` (`POSTING_ID`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_posting_email: ~0 rows (приблизительно)
DELETE FROM `b_posting_email`;
/*!40000 ALTER TABLE `b_posting_email` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_email` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_posting_file
DROP TABLE IF EXISTS `b_posting_file`;
CREATE TABLE IF NOT EXISTS `b_posting_file` (
  `POSTING_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_FILE` (`POSTING_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_posting_file: ~0 rows (приблизительно)
DELETE FROM `b_posting_file`;
/*!40000 ALTER TABLE `b_posting_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_file` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_posting_group
DROP TABLE IF EXISTS `b_posting_group`;
CREATE TABLE IF NOT EXISTS `b_posting_group` (
  `POSTING_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_GROUP` (`POSTING_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_posting_group: ~0 rows (приблизительно)
DELETE FROM `b_posting_group`;
/*!40000 ALTER TABLE `b_posting_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_posting_rubric
DROP TABLE IF EXISTS `b_posting_rubric`;
CREATE TABLE IF NOT EXISTS `b_posting_rubric` (
  `POSTING_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_POSTING_POSTING_RUBRIC` (`POSTING_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_posting_rubric: ~0 rows (приблизительно)
DELETE FROM `b_posting_rubric`;
/*!40000 ALTER TABLE `b_posting_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_posting_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE IF NOT EXISTS `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating: ~2 rows (приблизительно)
DELETE FROM `b_rating`;
/*!40000 ALTER TABLE `b_rating` DISABLE KEYS */;
INSERT INTO `b_rating` (`ID`, `ACTIVE`, `NAME`, `ENTITY_ID`, `CALCULATION_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_CALCULATED`, `POSITION`, `AUTHORITY`, `CALCULATED`, `CONFIGS`) VALUES
	(1, 'N', 'Рейтинг', 'USER', 'SUM', '2018-11-26 17:23:23', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:16:"TODAY_TOPIC_COEF";s:3:"0.4";s:15:"WEEK_TOPIC_COEF";s:3:"0.2";s:16:"MONTH_TOPIC_COEF";s:3:"0.1";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.2";s:14:"WEEK_POST_COEF";s:3:"0.1";s:15:"MONTH_POST_COEF";s:4:"0.05";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.5";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:3:"0.1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:9:{s:6:"ACTIVE";s:1:"Y";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}'),
	(2, 'N', 'Авторитет', 'USER', 'SUM', '2018-11-26 17:23:23', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:"MAIN";a:2:{s:4:"VOTE";a:1:{s:4:"USER";a:3:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:1:"0";}}s:6:"RATING";a:1:{s:5:"BONUS";a:2:{s:6:"ACTIVE";s:1:"Y";s:11:"COEFFICIENT";s:1:"1";}}}s:5:"FORUM";a:2:{s:4:"VOTE";a:2:{s:5:"TOPIC";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:16:"TODAY_TOPIC_COEF";s:2:"20";s:15:"WEEK_TOPIC_COEF";s:2:"10";s:16:"MONTH_TOPIC_COEF";s:1:"5";s:14:"ALL_TOPIC_COEF";s:1:"0";s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";}}}s:4:"BLOG";a:2:{s:4:"VOTE";a:2:{s:4:"POST";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}s:7:"COMMENT";a:2:{s:11:"COEFFICIENT";s:1:"1";s:5:"LIMIT";s:2:"30";}}s:6:"RATING";a:1:{s:8:"ACTIVITY";a:8:{s:15:"TODAY_POST_COEF";s:3:"0.4";s:14:"WEEK_POST_COEF";s:3:"0.2";s:15:"MONTH_POST_COEF";s:3:"0.1";s:13:"ALL_POST_COEF";s:1:"0";s:18:"TODAY_COMMENT_COEF";s:3:"0.2";s:17:"WEEK_COMMENT_COEF";s:3:"0.1";s:18:"MONTH_COMMENT_COEF";s:4:"0.05";s:16:"ALL_COMMENT_COEF";s:1:"0";}}}}');
/*!40000 ALTER TABLE `b_rating` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_component
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE IF NOT EXISTS `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_component: ~0 rows (приблизительно)
DELETE FROM `b_rating_component`;
/*!40000 ALTER TABLE `b_rating_component` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_component_results
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE IF NOT EXISTS `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_component_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_component_results`;
/*!40000 ALTER TABLE `b_rating_component_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_component_results` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_prepare
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE IF NOT EXISTS `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_prepare`;
/*!40000 ALTER TABLE `b_rating_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_results
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE IF NOT EXISTS `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT 0,
  `PREVIOUS_POSITION` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_results: ~0 rows (приблизительно)
DELETE FROM `b_rating_results`;
/*!40000 ALTER TABLE `b_rating_results` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_results` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_rule
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE IF NOT EXISTS `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_rule: ~5 rows (приблизительно)
DELETE FROM `b_rating_rule`;
/*!40000 ALTER TABLE `b_rating_rule` DISABLE KEYS */;
INSERT INTO `b_rating_rule` (`ID`, `ACTIVE`, `NAME`, `ENTITY_TYPE_ID`, `CONDITION_NAME`, `CONDITION_MODULE`, `CONDITION_CLASS`, `CONDITION_METHOD`, `CONDITION_CONFIG`, `ACTION_NAME`, `ACTION_CONFIG`, `ACTIVATE`, `ACTIVATE_CLASS`, `ACTIVATE_METHOD`, `DEACTIVATE`, `DEACTIVATE_CLASS`, `DEACTIVATE_METHOD`, `CREATED`, `LAST_MODIFIED`, `LAST_APPLIED`) VALUES
	(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-11-26 17:23:23', '2018-11-26 17:23:23', NULL),
	(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"3";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-11-26 17:23:23', '2018-11-26 17:23:23', NULL),
	(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:1;s:12:"RATING_VALUE";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:"ADD_TO_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2018-11-26 17:23:23', '2018-11-26 17:23:23', NULL),
	(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:"AUTHORITY";a:2:{s:16:"RATING_CONDITION";i:2;s:12:"RATING_VALUE";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:"REMOVE_FROM_GROUP";a:1:{s:8:"GROUP_ID";s:1:"4";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2018-11-26 17:23:23', '2018-11-26 17:23:23', NULL),
	(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:"VOTE";a:6:{s:10:"VOTE_LIMIT";i:90;s:11:"VOTE_RESULT";i:10;s:16:"VOTE_FORUM_TOPIC";d:0.5;s:15:"VOTE_FORUM_POST";d:0.1;s:14:"VOTE_BLOG_POST";d:0.5;s:17:"VOTE_BLOG_COMMENT";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2018-11-26 17:23:23', '2018-11-26 17:23:23', NULL);
/*!40000 ALTER TABLE `b_rating_rule` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_rule_vetting
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE IF NOT EXISTS `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_rule_vetting: ~0 rows (приблизительно)
DELETE FROM `b_rating_rule_vetting`;
/*!40000 ALTER TABLE `b_rating_rule_vetting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_rule_vetting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_user
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE IF NOT EXISTS `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT 0.0000,
  `VOTE_WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `VOTE_COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_user: ~0 rows (приблизительно)
DELETE FROM `b_rating_user`;
/*!40000 ALTER TABLE `b_rating_user` DISABLE KEYS */;
INSERT INTO `b_rating_user` (`ID`, `RATING_ID`, `ENTITY_ID`, `BONUS`, `VOTE_WEIGHT`, `VOTE_COUNT`) VALUES
	(1, 2, 1, 3.0000, 30.0000, 13);
/*!40000 ALTER TABLE `b_rating_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_vote
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE IF NOT EXISTS `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_4` (`USER_ID`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_vote: ~0 rows (приблизительно)
DELETE FROM `b_rating_vote`;
/*!40000 ALTER TABLE `b_rating_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_vote` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_vote_group
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE IF NOT EXISTS `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_vote_group: ~6 rows (приблизительно)
DELETE FROM `b_rating_vote_group`;
/*!40000 ALTER TABLE `b_rating_vote_group` DISABLE KEYS */;
INSERT INTO `b_rating_vote_group` (`ID`, `GROUP_ID`, `TYPE`) VALUES
	(5, 1, 'A'),
	(1, 1, 'R'),
	(3, 1, 'R'),
	(2, 3, 'R'),
	(4, 3, 'R'),
	(6, 4, 'A');
/*!40000 ALTER TABLE `b_rating_vote_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_voting
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE IF NOT EXISTS `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_voting: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting`;
/*!40000 ALTER TABLE `b_rating_voting` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_voting_prepare
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE IF NOT EXISTS `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_voting_prepare: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_prepare`;
/*!40000 ALTER TABLE `b_rating_voting_prepare` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_prepare` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_voting_reaction
DROP TABLE IF EXISTS `b_rating_voting_reaction`;
CREATE TABLE IF NOT EXISTS `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_voting_reaction: ~0 rows (приблизительно)
DELETE FROM `b_rating_voting_reaction`;
/*!40000 ALTER TABLE `b_rating_voting_reaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rating_voting_reaction` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rating_weight
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE IF NOT EXISTS `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT 0.0000,
  `COUNT` int(11) DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rating_weight: ~0 rows (приблизительно)
DELETE FROM `b_rating_weight`;
/*!40000 ALTER TABLE `b_rating_weight` DISABLE KEYS */;
INSERT INTO `b_rating_weight` (`ID`, `RATING_FROM`, `RATING_TO`, `WEIGHT`, `COUNT`) VALUES
	(1, -1000000.0000, 1000000.0000, 1.0000, 10);
/*!40000 ALTER TABLE `b_rating_weight` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_ap
DROP TABLE IF EXISTS `b_rest_ap`;
CREATE TABLE IF NOT EXISTS `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_ap: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap`;
/*!40000 ALTER TABLE `b_rest_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_app
DROP TABLE IF EXISTS `b_rest_app`;
CREATE TABLE IF NOT EXISTS `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_app: ~0 rows (приблизительно)
DELETE FROM `b_rest_app`;
/*!40000 ALTER TABLE `b_rest_app` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_app_lang
DROP TABLE IF EXISTS `b_rest_app_lang`;
CREATE TABLE IF NOT EXISTS `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_app_lang: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_lang`;
/*!40000 ALTER TABLE `b_rest_app_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_app_log
DROP TABLE IF EXISTS `b_rest_app_log`;
CREATE TABLE IF NOT EXISTS `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_app_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_app_log`;
/*!40000 ALTER TABLE `b_rest_app_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_app_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_ap_permission
DROP TABLE IF EXISTS `b_rest_ap_permission`;
CREATE TABLE IF NOT EXISTS `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_ap_permission: ~0 rows (приблизительно)
DELETE FROM `b_rest_ap_permission`;
/*!40000 ALTER TABLE `b_rest_ap_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_ap_permission` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_event
DROP TABLE IF EXISTS `b_rest_event`;
CREATE TABLE IF NOT EXISTS `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_app_id` (`APP_ID`),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_event: ~0 rows (приблизительно)
DELETE FROM `b_rest_event`;
/*!40000 ALTER TABLE `b_rest_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_event_offline
DROP TABLE IF EXISTS `b_rest_event_offline`;
CREATE TABLE IF NOT EXISTS `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_event_offline: ~0 rows (приблизительно)
DELETE FROM `b_rest_event_offline`;
/*!40000 ALTER TABLE `b_rest_event_offline` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_event_offline` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_log
DROP TABLE IF EXISTS `b_rest_log`;
CREATE TABLE IF NOT EXISTS `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp(),
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_log: ~0 rows (приблизительно)
DELETE FROM `b_rest_log`;
/*!40000 ALTER TABLE `b_rest_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_placement
DROP TABLE IF EXISTS `b_rest_placement`;
CREATE TABLE IF NOT EXISTS `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_placement: ~0 rows (приблизительно)
DELETE FROM `b_rest_placement`;
/*!40000 ALTER TABLE `b_rest_placement` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_placement` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_stat
DROP TABLE IF EXISTS `b_rest_stat`;
CREATE TABLE IF NOT EXISTS `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT 0,
  `HOUR_1` int(11) NOT NULL DEFAULT 0,
  `HOUR_2` int(11) NOT NULL DEFAULT 0,
  `HOUR_3` int(11) NOT NULL DEFAULT 0,
  `HOUR_4` int(11) NOT NULL DEFAULT 0,
  `HOUR_5` int(11) NOT NULL DEFAULT 0,
  `HOUR_6` int(11) NOT NULL DEFAULT 0,
  `HOUR_7` int(11) NOT NULL DEFAULT 0,
  `HOUR_8` int(11) NOT NULL DEFAULT 0,
  `HOUR_9` int(11) NOT NULL DEFAULT 0,
  `HOUR_10` int(11) NOT NULL DEFAULT 0,
  `HOUR_11` int(11) NOT NULL DEFAULT 0,
  `HOUR_12` int(11) NOT NULL DEFAULT 0,
  `HOUR_13` int(11) NOT NULL DEFAULT 0,
  `HOUR_14` int(11) NOT NULL DEFAULT 0,
  `HOUR_15` int(11) NOT NULL DEFAULT 0,
  `HOUR_16` int(11) NOT NULL DEFAULT 0,
  `HOUR_17` int(11) NOT NULL DEFAULT 0,
  `HOUR_18` int(11) NOT NULL DEFAULT 0,
  `HOUR_19` int(11) NOT NULL DEFAULT 0,
  `HOUR_20` int(11) NOT NULL DEFAULT 0,
  `HOUR_21` int(11) NOT NULL DEFAULT 0,
  `HOUR_22` int(11) NOT NULL DEFAULT 0,
  `HOUR_23` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_stat: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat`;
/*!40000 ALTER TABLE `b_rest_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_rest_stat_method
DROP TABLE IF EXISTS `b_rest_stat_method`;
CREATE TABLE IF NOT EXISTS `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_rest_stat_method: ~0 rows (приблизительно)
DELETE FROM `b_rest_stat_method`;
/*!40000 ALTER TABLE `b_rest_stat_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_rest_stat_method` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content
DROP TABLE IF EXISTS `b_search_content`;
CREATE TABLE IF NOT EXISTS `b_search_content` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CHANGE` datetime NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CUSTOM_RANK` int(11) NOT NULL DEFAULT 0,
  `USER_ID` int(11) DEFAULT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ENTITY_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `BODY` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPD` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_FROM` datetime DEFAULT NULL,
  `DATE_TO` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_CONTENT` (`MODULE_ID`,`ITEM_ID`),
  KEY `IX_B_SEARCH_CONTENT_1` (`MODULE_ID`,`PARAM1`(50),`PARAM2`(50)),
  KEY `IX_B_SEARCH_CONTENT_2` (`ENTITY_ID`(50),`ENTITY_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content: ~0 rows (приблизительно)
DELETE FROM `b_search_content`;
/*!40000 ALTER TABLE `b_search_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_freq
DROP TABLE IF EXISTS `b_search_content_freq`;
CREATE TABLE IF NOT EXISTS `b_search_content_freq` (
  `STEM` int(11) NOT NULL DEFAULT 0,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FREQ` float DEFAULT NULL,
  `TF` float DEFAULT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_FREQ` (`STEM`,`LANGUAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content_freq: ~0 rows (приблизительно)
DELETE FROM `b_search_content_freq`;
/*!40000 ALTER TABLE `b_search_content_freq` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_freq` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_param
DROP TABLE IF EXISTS `b_search_content_param`;
CREATE TABLE IF NOT EXISTS `b_search_content_param` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `PARAM_NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM_VALUE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  KEY `IX_B_SEARCH_CONTENT_PARAM` (`SEARCH_CONTENT_ID`,`PARAM_NAME`),
  KEY `IX_B_SEARCH_CONTENT_PARAM_1` (`PARAM_NAME`,`PARAM_VALUE`(50),`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content_param: ~0 rows (приблизительно)
DELETE FROM `b_search_content_param`;
/*!40000 ALTER TABLE `b_search_content_param` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_param` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_right
DROP TABLE IF EXISTS `b_search_content_right`;
CREATE TABLE IF NOT EXISTS `b_search_content_right` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_RIGHT` (`SEARCH_CONTENT_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content_right: ~0 rows (приблизительно)
DELETE FROM `b_search_content_right`;
/*!40000 ALTER TABLE `b_search_content_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_site
DROP TABLE IF EXISTS `b_search_content_site`;
CREATE TABLE IF NOT EXISTS `b_search_content_site` (
  `SEARCH_CONTENT_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content_site: ~0 rows (приблизительно)
DELETE FROM `b_search_content_site`;
/*!40000 ALTER TABLE `b_search_content_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_stem
DROP TABLE IF EXISTS `b_search_content_stem`;
CREATE TABLE IF NOT EXISTS `b_search_content_stem` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `STEM` int(11) NOT NULL,
  `TF` float NOT NULL,
  `PS` float NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_STEM` (`STEM`,`LANGUAGE_ID`,`TF`,`PS`,`SEARCH_CONTENT_ID`),
  KEY `IND_B_SEARCH_CONTENT_STEM` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix_standart.b_search_content_stem: ~0 rows (приблизительно)
DELETE FROM `b_search_content_stem`;
/*!40000 ALTER TABLE `b_search_content_stem` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_stem` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_text
DROP TABLE IF EXISTS `b_search_content_text`;
CREATE TABLE IF NOT EXISTS `b_search_content_text` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SEARCH_CONTENT_MD5` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `SEARCHABLE_CONTENT` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_content_text: ~0 rows (приблизительно)
DELETE FROM `b_search_content_text`;
/*!40000 ALTER TABLE `b_search_content_text` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_text` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_content_title
DROP TABLE IF EXISTS `b_search_content_title`;
CREATE TABLE IF NOT EXISTS `b_search_content_title` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `POS` int(11) NOT NULL,
  `WORD` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_CONTENT_TITLE` (`SITE_ID`,`WORD`,`SEARCH_CONTENT_ID`,`POS`),
  KEY `IND_B_SEARCH_CONTENT_TITLE` (`SEARCH_CONTENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix_standart.b_search_content_title: ~0 rows (приблизительно)
DELETE FROM `b_search_content_title`;
/*!40000 ALTER TABLE `b_search_content_title` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_content_title` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_custom_rank
DROP TABLE IF EXISTS `b_search_custom_rank`;
CREATE TABLE IF NOT EXISTS `b_search_custom_rank` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RANK` int(11) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `PARAM1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAM2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_CUSTOM_RANK` (`SITE_ID`,`MODULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_custom_rank: ~0 rows (приблизительно)
DELETE FROM `b_search_custom_rank`;
/*!40000 ALTER TABLE `b_search_custom_rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_custom_rank` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_phrase
DROP TABLE IF EXISTS `b_search_phrase`;
CREATE TABLE IF NOT EXISTS `b_search_phrase` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  `PAGES` int(11) NOT NULL,
  `SESSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_404` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_TO_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STAT_SESS_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_PH` (`SESSION_ID`,`PHRASE`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_SESS_TG` (`SESSION_ID`,`TAGS`(50)),
  KEY `IND_PK_B_SEARCH_PHRASE_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_phrase: ~0 rows (приблизительно)
DELETE FROM `b_search_phrase`;
/*!40000 ALTER TABLE `b_search_phrase` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_phrase` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_stem
DROP TABLE IF EXISTS `b_search_stem`;
CREATE TABLE IF NOT EXISTS `b_search_stem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `STEM` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_B_SEARCH_STEM` (`STEM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_stem: ~0 rows (приблизительно)
DELETE FROM `b_search_stem`;
/*!40000 ALTER TABLE `b_search_stem` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_stem` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_suggest
DROP TABLE IF EXISTS `b_search_suggest`;
CREATE TABLE IF NOT EXISTS `b_search_suggest` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_MD5` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `PHRASE` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `RATE` float NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `RESULT_COUNT` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IND_B_SEARCH_SUGGEST` (`FILTER_MD5`,`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_PHRASE` (`PHRASE`(50),`RATE`),
  KEY `IND_B_SEARCH_SUGGEST_TIME` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_suggest: ~0 rows (приблизительно)
DELETE FROM `b_search_suggest`;
/*!40000 ALTER TABLE `b_search_suggest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_suggest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_tags
DROP TABLE IF EXISTS `b_search_tags`;
CREATE TABLE IF NOT EXISTS `b_search_tags` (
  `SEARCH_CONTENT_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`SEARCH_CONTENT_ID`,`SITE_ID`,`NAME`),
  KEY `IX_B_SEARCH_TAGS_0` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1;

-- Дамп данных таблицы bitrix_standart.b_search_tags: ~0 rows (приблизительно)
DELETE FROM `b_search_tags`;
/*!40000 ALTER TABLE `b_search_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_tags` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_search_user_right
DROP TABLE IF EXISTS `b_search_user_right`;
CREATE TABLE IF NOT EXISTS `b_search_user_right` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UX_B_SEARCH_USER_RIGHT` (`USER_ID`,`GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_search_user_right: ~0 rows (приблизительно)
DELETE FROM `b_search_user_right`;
/*!40000 ALTER TABLE `b_search_user_right` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_search_user_right` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_security_sitecheck
DROP TABLE IF EXISTS `b_security_sitecheck`;
CREATE TABLE IF NOT EXISTS `b_security_sitecheck` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TEST_DATE` datetime DEFAULT NULL,
  `RESULTS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_security_sitecheck: ~0 rows (приблизительно)
DELETE FROM `b_security_sitecheck`;
/*!40000 ALTER TABLE `b_security_sitecheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_security_sitecheck` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_filter_mask
DROP TABLE IF EXISTS `b_sec_filter_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_filter_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_filter_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_filter_mask`;
/*!40000 ALTER TABLE `b_sec_filter_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_filter_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_frame_mask
DROP TABLE IF EXISTS `b_sec_frame_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_frame_mask` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT 10,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FRAME_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_frame_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_frame_mask`;
/*!40000 ALTER TABLE `b_sec_frame_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_frame_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_iprule
DROP TABLE IF EXISTS `b_sec_iprule`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ADMIN_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_FROM_TIMESTAMP` int(11) DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `ACTIVE_TO_TIMESTAMP` int(11) DEFAULT NULL,
  `NAME` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_iprule_active_to` (`ACTIVE_TO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_iprule: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule`;
/*!40000 ALTER TABLE `b_sec_iprule` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_iprule_excl_ip
DROP TABLE IF EXISTS `b_sec_iprule_excl_ip`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_iprule_excl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_iprule_excl_mask
DROP TABLE IF EXISTS `b_sec_iprule_excl_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_excl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_iprule_excl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_excl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_excl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_iprule_incl_ip
DROP TABLE IF EXISTS `b_sec_iprule_incl_ip`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_ip` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_IP` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `IP_START` bigint(18) DEFAULT NULL,
  `IP_END` bigint(18) DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_iprule_incl_ip: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_ip`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_ip` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_iprule_incl_mask
DROP TABLE IF EXISTS `b_sec_iprule_incl_mask`;
CREATE TABLE IF NOT EXISTS `b_sec_iprule_incl_mask` (
  `IPRULE_ID` int(11) NOT NULL,
  `RULE_MASK` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `LIKE_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREG_MASK` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IPRULE_ID`,`RULE_MASK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_iprule_incl_mask: ~0 rows (приблизительно)
DELETE FROM `b_sec_iprule_incl_mask`;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_iprule_incl_mask` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_recovery_codes
DROP TABLE IF EXISTS `b_sec_recovery_codes`;
CREATE TABLE IF NOT EXISTS `b_sec_recovery_codes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USED` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USING_DATE` datetime DEFAULT NULL,
  `USING_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_sec_recovery_codes_user_id` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_recovery_codes: ~0 rows (приблизительно)
DELETE FROM `b_sec_recovery_codes`;
/*!40000 ALTER TABLE `b_sec_recovery_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_recovery_codes` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_redirect_url
DROP TABLE IF EXISTS `b_sec_redirect_url`;
CREATE TABLE IF NOT EXISTS `b_sec_redirect_url` (
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `URL` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETER_NAME` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_redirect_url: ~2 rows (приблизительно)
DELETE FROM `b_sec_redirect_url`;
/*!40000 ALTER TABLE `b_sec_redirect_url` DISABLE KEYS */;
INSERT INTO `b_sec_redirect_url` (`IS_SYSTEM`, `SORT`, `URL`, `PARAMETER_NAME`) VALUES
	('Y', 10, '/bitrix/redirect.php', 'goto'),
	('Y', 20, '/bitrix/rk.php', 'goto'),
	('Y', 30, '/bitrix/click.php', 'goto');
/*!40000 ALTER TABLE `b_sec_redirect_url` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_session
DROP TABLE IF EXISTS `b_sec_session`;
CREATE TABLE IF NOT EXISTS `b_sec_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_b_sec_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_session: ~0 rows (приблизительно)
DELETE FROM `b_sec_session`;
/*!40000 ALTER TABLE `b_sec_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_session` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_user
DROP TABLE IF EXISTS `b_sec_user`;
CREATE TABLE IF NOT EXISTS `b_sec_user` (
  `USER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECRET` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ATTEMPTS` int(18) DEFAULT NULL,
  `INITIAL_DATE` datetime DEFAULT NULL,
  `SKIP_MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_user: ~0 rows (приблизительно)
DELETE FROM `b_sec_user`;
/*!40000 ALTER TABLE `b_sec_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_virus
DROP TABLE IF EXISTS `b_sec_virus`;
CREATE TABLE IF NOT EXISTS `b_sec_virus` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `INFO` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_virus: ~0 rows (приблизительно)
DELETE FROM `b_sec_virus`;
/*!40000 ALTER TABLE `b_sec_virus` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_virus` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sec_white_list
DROP TABLE IF EXISTS `b_sec_white_list`;
CREATE TABLE IF NOT EXISTS `b_sec_white_list` (
  `ID` int(11) NOT NULL,
  `WHITE_SUBSTR` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sec_white_list: ~0 rows (приблизительно)
DELETE FROM `b_sec_white_list`;
/*!40000 ALTER TABLE `b_sec_white_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sec_white_list` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_autolog
DROP TABLE IF EXISTS `b_seo_adv_autolog`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_autolog` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAMPAIGN_ID` int(11) NOT NULL,
  `CAMPAIGN_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `BANNER_XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CAUSE_CODE` int(11) DEFAULT 0,
  `SUCCESS` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_autolog1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_autolog2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_autolog: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_autolog`;
/*!40000 ALTER TABLE `b_seo_adv_autolog` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_autolog` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_banner
DROP TABLE IF EXISTS `b_seo_adv_banner`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_banner` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) DEFAULT NULL,
  `AUTO_QUANTITY_OFF` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTO_QUANTITY_ON` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_banner` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_banner1` (`CAMPAIGN_ID`),
  KEY `ix_b_seo_adv_banner2` (`AUTO_QUANTITY_OFF`,`AUTO_QUANTITY_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_banner: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_banner`;
/*!40000 ALTER TABLE `b_seo_adv_banner` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_banner` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_campaign
DROP TABLE IF EXISTS `b_seo_adv_campaign`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_campaign` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_campaign` (`ENGINE_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_campaign: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_campaign`;
/*!40000 ALTER TABLE `b_seo_adv_campaign` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_campaign` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_group
DROP TABLE IF EXISTS `b_seo_adv_group`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `CAMPAIGN_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_group` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_group1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_group: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_group`;
/*!40000 ALTER TABLE `b_seo_adv_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_link
DROP TABLE IF EXISTS `b_seo_adv_link`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_link` (
  `LINK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_ID` int(18) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  PRIMARY KEY (`LINK_TYPE`,`LINK_ID`,`BANNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_link: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_link`;
/*!40000 ALTER TABLE `b_seo_adv_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_log
DROP TABLE IF EXISTS `b_seo_adv_log`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `REQUEST_URI` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_TIME` float NOT NULL,
  `RESPONSE_STATUS` int(5) DEFAULT NULL,
  `RESPONSE_DATA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_adv_log1` (`ENGINE_ID`),
  KEY `ix_b_seo_adv_log2` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_log`;
/*!40000 ALTER TABLE `b_seo_adv_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_order
DROP TABLE IF EXISTS `b_seo_adv_order`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `ORDER_ID` int(11) NOT NULL,
  `SUM` float DEFAULT 0,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_order` (`ENGINE_ID`,`CAMPAIGN_ID`,`BANNER_ID`,`ORDER_ID`),
  KEY `ix_b_seo_adv_order1` (`ORDER_ID`,`PROCESSED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_order: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_order`;
/*!40000 ALTER TABLE `b_seo_adv_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_order` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_adv_region
DROP TABLE IF EXISTS `b_seo_adv_region`;
CREATE TABLE IF NOT EXISTS `b_seo_adv_region` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENGINE_ID` int(11) NOT NULL,
  `OWNER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_UPDATE` timestamp NULL DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARENT_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_adv_region` (`ENGINE_ID`,`XML_ID`),
  KEY `ix_b_seo_adv_region1` (`PARENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_adv_region: ~0 rows (приблизительно)
DELETE FROM `b_seo_adv_region`;
/*!40000 ALTER TABLE `b_seo_adv_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_adv_region` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_keywords
DROP TABLE IF EXISTS `b_seo_keywords`;
CREATE TABLE IF NOT EXISTS `b_seo_keywords` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_keywords_url` (`URL`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_keywords: ~0 rows (приблизительно)
DELETE FROM `b_seo_keywords`;
/*!40000 ALTER TABLE `b_seo_keywords` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_keywords` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_search_engine
DROP TABLE IF EXISTS `b_seo_search_engine`;
CREATE TABLE IF NOT EXISTS `b_seo_search_engine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SORT` int(5) DEFAULT 100,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_seo_search_engine_code` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_search_engine: ~3 rows (приблизительно)
DELETE FROM `b_seo_search_engine`;
/*!40000 ALTER TABLE `b_seo_search_engine` DISABLE KEYS */;
INSERT INTO `b_seo_search_engine` (`ID`, `CODE`, `ACTIVE`, `SORT`, `NAME`, `CLIENT_ID`, `CLIENT_SECRET`, `REDIRECT_URI`, `SETTINGS`) VALUES
	(1, 'google', 'Y', 200, 'Google', '868942902147-qrrd6ce1ajfkpse8ieq4gkpdeanvtnno.apps.googleusercontent.com', 'EItMlJpZLC2WRPKB6QsA5bV9', 'urn:ietf:wg:oauth:2.0:oob', NULL),
	(2, 'yandex', 'Y', 300, 'Yandex', 'f848c7bfc1d34a94ba6d05439f81bbd7', 'da0e73b2d9cc4e809f3170e49cb9df01', 'https://oauth.yandex.ru/verification_code', NULL),
	(3, 'yandex_direct', 'Y', 400, 'Yandex.Direct', '', '', 'https://oauth.yandex.ru/verification_code', NULL);
/*!40000 ALTER TABLE `b_seo_search_engine` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_service_log
DROP TABLE IF EXISTS `b_seo_service_log`;
CREATE TABLE IF NOT EXISTS `b_seo_service_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_service_log: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_log`;
/*!40000 ALTER TABLE `b_seo_service_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_log` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_service_rtg_queue
DROP TABLE IF EXISTS `b_seo_service_rtg_queue`;
CREATE TABLE IF NOT EXISTS `b_seo_service_rtg_queue` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ACCOUNT_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIENCE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONTACT_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION` char(3) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_AUTO_REMOVE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_1` (`ACTION`,`DATE_AUTO_REMOVE`),
  KEY `IX_B_SEO_SRV_RTG_QUEUE_2` (`TYPE`,`ACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_service_rtg_queue: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_rtg_queue`;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_rtg_queue` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_service_subscription
DROP TABLE IF EXISTS `b_seo_service_subscription`;
CREATE TABLE IF NOT EXISTS `b_seo_service_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALLBACK_SERVER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HAS_AUTH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_SUB_1` (`TYPE`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_service_subscription: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_subscription`;
/*!40000 ALTER TABLE `b_seo_service_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_service_webhook
DROP TABLE IF EXISTS `b_seo_service_webhook`;
CREATE TABLE IF NOT EXISTS `b_seo_service_webhook` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SEO_SERVICE_WEBHOOK_1` (`TYPE`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_service_webhook: ~0 rows (приблизительно)
DELETE FROM `b_seo_service_webhook`;
/*!40000 ALTER TABLE `b_seo_service_webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_service_webhook` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_sitemap
DROP TABLE IF EXISTS `b_seo_sitemap`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_RUN` datetime DEFAULT NULL,
  `SETTINGS` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_sitemap: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap`;
/*!40000 ALTER TABLE `b_seo_sitemap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_sitemap_entity
DROP TABLE IF EXISTS `b_seo_sitemap_entity`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_entity_1` (`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_seo_sitemap_entity_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_sitemap_entity: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_entity`;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_entity` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_sitemap_iblock
DROP TABLE IF EXISTS `b_seo_sitemap_iblock`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `SITEMAP_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_seo_sitemap_iblock_1` (`IBLOCK_ID`),
  KEY `ix_b_seo_sitemap_iblock_2` (`SITEMAP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_sitemap_iblock: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_iblock`;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_iblock` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_sitemap_runtime
DROP TABLE IF EXISTS `b_seo_sitemap_runtime`;
CREATE TABLE IF NOT EXISTS `b_seo_sitemap_runtime` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) NOT NULL,
  `PROCESSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ITEM_PATH` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `ITEM_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'D',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `ACTIVE_ELEMENT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_seo_sitemap_runtime1` (`PID`,`PROCESSED`,`ITEM_TYPE`,`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_sitemap_runtime: ~0 rows (приблизительно)
DELETE FROM `b_seo_sitemap_runtime`;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_sitemap_runtime` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_seo_yandex_direct_stat
DROP TABLE IF EXISTS `b_seo_yandex_direct_stat`;
CREATE TABLE IF NOT EXISTS `b_seo_yandex_direct_stat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CAMPAIGN_ID` int(11) NOT NULL,
  `BANNER_ID` int(11) NOT NULL,
  `DATE_DAY` date NOT NULL,
  `CURRENCY` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUM` float DEFAULT 0,
  `SUM_SEARCH` float DEFAULT 0,
  `SUM_CONTEXT` float DEFAULT 0,
  `CLICKS` int(7) DEFAULT 0,
  `CLICKS_SEARCH` int(7) DEFAULT 0,
  `CLICKS_CONTEXT` int(7) DEFAULT 0,
  `SHOWS` int(7) DEFAULT 0,
  `SHOWS_SEARCH` int(7) DEFAULT 0,
  `SHOWS_CONTEXT` int(7) DEFAULT 0,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_seo_yandex_direct_stat` (`BANNER_ID`,`DATE_DAY`),
  KEY `ix_seo_yandex_direct_stat1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_seo_yandex_direct_stat: ~0 rows (приблизительно)
DELETE FROM `b_seo_yandex_direct_stat`;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_seo_yandex_direct_stat` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_short_uri
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE IF NOT EXISTS `b_short_uri` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(18) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(18) NOT NULL,
  `STATUS` int(18) NOT NULL DEFAULT 301,
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_short_uri: ~0 rows (приблизительно)
DELETE FROM `b_short_uri`;
/*!40000 ALTER TABLE `b_short_uri` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_short_uri` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_site_template
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE IF NOT EXISTS `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT 500,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_site_template: ~0 rows (приблизительно)
DELETE FROM `b_site_template`;
/*!40000 ALTER TABLE `b_site_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_site_template` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_smile
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE IF NOT EXISTS `b_smile` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(18) NOT NULL DEFAULT 0,
  `SORT` int(10) NOT NULL DEFAULT 150,
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT 0,
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_smile: ~24 rows (приблизительно)
DELETE FROM `b_smile`;
/*!40000 ALTER TABLE `b_smile` DISABLE KEYS */;
INSERT INTO `b_smile` (`ID`, `TYPE`, `SET_ID`, `SORT`, `TYPING`, `CLICKABLE`, `HIDDEN`, `IMAGE`, `IMAGE_DEFINITION`, `IMAGE_WIDTH`, `IMAGE_HEIGHT`) VALUES
	(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
	(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
	(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
	(4, 'S', 2, 115, '8) 8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
	(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
	(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
	(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
	(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
	(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
	(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
	(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
	(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
	(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
	(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
	(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
	(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
	(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
	(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
	(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
	(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
	(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
	(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
	(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
	(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);
/*!40000 ALTER TABLE `b_smile` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_smile_lang
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE IF NOT EXISTS `b_smile_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_smile_lang: ~38 rows (приблизительно)
DELETE FROM `b_smile_lang`;
/*!40000 ALTER TABLE `b_smile_lang` DISABLE KEYS */;
INSERT INTO `b_smile_lang` (`ID`, `TYPE`, `SID`, `LID`, `NAME`) VALUES
	(1, 'P', 1, 'ru', 'Стандартная галерея'),
	(2, 'P', 1, 'en', 'Standard gallery'),
	(3, 'G', 2, 'ru', 'Основной набор'),
	(4, 'G', 2, 'en', 'Default pack'),
	(5, 'S', 1, 'ru', 'С улыбкой'),
	(6, 'S', 1, 'en', 'Smile'),
	(7, 'S', 2, 'ru', 'Шутливо'),
	(8, 'S', 2, 'en', 'Wink'),
	(9, 'S', 3, 'ru', 'Широкая улыбка'),
	(10, 'S', 3, 'en', 'Big grin'),
	(11, 'S', 4, 'ru', 'Здорово'),
	(12, 'S', 4, 'en', 'Cool'),
	(13, 'S', 5, 'ru', 'Разочарование'),
	(14, 'S', 5, 'en', 'Facepalm'),
	(15, 'S', 6, 'ru', 'Поцелуй'),
	(16, 'S', 6, 'en', 'Kiss'),
	(17, 'S', 7, 'ru', 'Печально'),
	(18, 'S', 7, 'en', 'Sad'),
	(19, 'S', 8, 'ru', 'Скептически'),
	(20, 'S', 8, 'en', 'Skeptic'),
	(21, 'S', 9, 'ru', 'Смущенный'),
	(22, 'S', 9, 'en', 'Embarrassed'),
	(23, 'S', 10, 'ru', 'Очень грустно'),
	(24, 'S', 10, 'en', 'Crying'),
	(25, 'S', 11, 'ru', 'Со злостью'),
	(26, 'S', 11, 'en', 'Angry'),
	(27, 'S', 12, 'ru', 'Удивленно'),
	(28, 'S', 12, 'en', 'Surprised'),
	(29, 'S', 13, 'ru', 'Смущенно'),
	(30, 'S', 13, 'en', 'Confused'),
	(31, 'S', 14, 'ru', 'Идея'),
	(32, 'S', 14, 'en', 'Idea'),
	(33, 'S', 15, 'ru', 'Вопрос'),
	(34, 'S', 15, 'en', 'Question'),
	(35, 'S', 16, 'ru', 'Восклицание'),
	(36, 'S', 16, 'en', 'Exclamation'),
	(37, 'S', 17, 'ru', 'Нравится'),
	(38, 'S', 17, 'en', 'Like');
/*!40000 ALTER TABLE `b_smile_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_smile_set
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE IF NOT EXISTS `b_smile_set` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(18) NOT NULL DEFAULT 0,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(10) NOT NULL DEFAULT 150,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_smile_set: ~2 rows (приблизительно)
DELETE FROM `b_smile_set`;
/*!40000 ALTER TABLE `b_smile_set` DISABLE KEYS */;
INSERT INTO `b_smile_set` (`ID`, `TYPE`, `PARENT_ID`, `STRING_ID`, `SORT`) VALUES
	(1, 'P', 0, 'bitrix', 150),
	(2, 'G', 1, 'bitrix_main', 150);
/*!40000 ALTER TABLE `b_smile_set` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_ap
DROP TABLE IF EXISTS `b_socialservices_ap`;
CREATE TABLE IF NOT EXISTS `b_socialservices_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ENDPOINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `SETTINGS` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_socialservices_ap1` (`USER_ID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_ap: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_ap`;
/*!40000 ALTER TABLE `b_socialservices_ap` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_ap` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_contact
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE IF NOT EXISTS `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_contact: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact`;
/*!40000 ALTER TABLE `b_socialservices_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_contact_connect
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE IF NOT EXISTS `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT current_timestamp(),
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_contact_connect: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_contact_connect`;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_contact_connect` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_message
DROP TABLE IF EXISTS `b_socialservices_message`;
CREATE TABLE IF NOT EXISTS `b_socialservices_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `PROVIDER` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INSERT_DATE` datetime DEFAULT NULL,
  `SUCCES_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_message: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_message`;
/*!40000 ALTER TABLE `b_socialservices_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_user
DROP TABLE IF EXISTS `b_socialservices_user`;
CREATE TABLE IF NOT EXISTS `b_socialservices_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CAN_DELETE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PERSONAL_WWW` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERMISSIONS` varchar(555) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN` varchar(3000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OATOKEN_EXPIRES` int(11) DEFAULT NULL,
  `OASECRET` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEND_ACTIVITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SITE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIALIZED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_SOCIALSERVICES_USER` (`XML_ID`,`EXTERNAL_AUTH_ID`),
  KEY `IX_B_SOCIALSERVICES_US_1` (`USER_ID`),
  KEY `IX_B_SOCIALSERVICES_US_3` (`LOGIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_user: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user`;
/*!40000 ALTER TABLE `b_socialservices_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_socialservices_user_link
DROP TABLE IF EXISTS `b_socialservices_user_link`;
CREATE TABLE IF NOT EXISTS `b_socialservices_user_link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `SOCSERV_USER_ID` int(11) NOT NULL,
  `LINK_USER_ID` int(11) DEFAULT NULL,
  `LINK_UID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LINK_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_PICTURE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_user_link_5` (`SOCSERV_USER_ID`),
  KEY `ix_b_socialservices_user_link_6` (`LINK_USER_ID`,`TIMESTAMP_X`),
  KEY `ix_b_socialservices_user_link_7` (`LINK_UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_socialservices_user_link: ~0 rows (приблизительно)
DELETE FROM `b_socialservices_user_link`;
/*!40000 ALTER TABLE `b_socialservices_user_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_socialservices_user_link` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sticker
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE IF NOT EXISTS `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sticker: ~0 rows (приблизительно)
DELETE FROM `b_sticker`;
/*!40000 ALTER TABLE `b_sticker` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_sticker_group_task
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE IF NOT EXISTS `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_sticker_group_task: ~0 rows (приблизительно)
DELETE FROM `b_sticker_group_task`;
/*!40000 ALTER TABLE `b_sticker_group_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_sticker_group_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_subscription
DROP TABLE IF EXISTS `b_subscription`;
CREATE TABLE IF NOT EXISTS `b_subscription` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `DATE_UPDATE` datetime DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DATE_CONFIRM` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_SUBSCRIPTION_EMAIL` (`EMAIL`,`USER_ID`),
  KEY `IX_DATE_CONFIRM` (`CONFIRMED`,`DATE_CONFIRM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_subscription: ~0 rows (приблизительно)
DELETE FROM `b_subscription`;
/*!40000 ALTER TABLE `b_subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_subscription_rubric
DROP TABLE IF EXISTS `b_subscription_rubric`;
CREATE TABLE IF NOT EXISTS `b_subscription_rubric` (
  `SUBSCRIPTION_ID` int(11) NOT NULL,
  `LIST_RUBRIC_ID` int(11) NOT NULL,
  UNIQUE KEY `UK_SUBSCRIPTION_RUBRIC` (`SUBSCRIPTION_ID`,`LIST_RUBRIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_subscription_rubric: ~0 rows (приблизительно)
DELETE FROM `b_subscription_rubric`;
/*!40000 ALTER TABLE `b_subscription_rubric` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_subscription_rubric` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_task
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE IF NOT EXISTS `b_task` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_task: ~48 rows (приблизительно)
DELETE FROM `b_task`;
/*!40000 ALTER TABLE `b_task` DISABLE KEYS */;
INSERT INTO `b_task` (`ID`, `NAME`, `LETTER`, `MODULE_ID`, `SYS`, `DESCRIPTION`, `BINDING`) VALUES
	(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
	(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
	(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
	(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
	(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
	(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
	(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
	(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
	(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
	(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
	(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
	(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
	(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
	(14, 'clouds_denied', 'D', 'clouds', 'Y', NULL, 'module'),
	(15, 'clouds_browse', 'F', 'clouds', 'Y', NULL, 'module'),
	(16, 'clouds_upload', 'U', 'clouds', 'Y', NULL, 'module'),
	(17, 'clouds_full_access', 'W', 'clouds', 'Y', NULL, 'module'),
	(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
	(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
	(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
	(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
	(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
	(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
	(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
	(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
	(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
	(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
	(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
	(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
	(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
	(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
	(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
	(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
	(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
	(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
	(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
	(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
	(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
	(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
	(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
	(41, 'security_denied', 'D', 'security', 'Y', NULL, 'module'),
	(42, 'security_filter', 'F', 'security', 'Y', NULL, 'module'),
	(43, 'security_otp', 'S', 'security', 'Y', NULL, 'module'),
	(44, 'security_view_all_settings', 'T', 'security', 'Y', NULL, 'module'),
	(45, 'security_full_access', 'W', 'security', 'Y', NULL, 'module'),
	(46, 'seo_denied', 'D', 'seo', 'Y', '', 'module'),
	(47, 'seo_edit', 'F', 'seo', 'Y', '', 'module'),
	(48, 'seo_full_access', 'W', 'seo', 'Y', '', 'module');
/*!40000 ALTER TABLE `b_task` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_task_operation
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE IF NOT EXISTS `b_task_operation` (
  `TASK_ID` int(18) NOT NULL,
  `OPERATION_ID` int(18) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_task_operation: ~225 rows (приблизительно)
DELETE FROM `b_task_operation`;
/*!40000 ALTER TABLE `b_task_operation` DISABLE KEYS */;
INSERT INTO `b_task_operation` (`TASK_ID`, `OPERATION_ID`) VALUES
	(2, 2),
	(2, 3),
	(3, 2),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(4, 2),
	(4, 3),
	(4, 4),
	(4, 5),
	(4, 6),
	(4, 7),
	(5, 2),
	(5, 3),
	(5, 5),
	(5, 6),
	(5, 7),
	(5, 8),
	(5, 9),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(6, 6),
	(6, 7),
	(6, 10),
	(6, 11),
	(6, 12),
	(6, 13),
	(6, 14),
	(6, 15),
	(6, 16),
	(6, 17),
	(6, 18),
	(8, 19),
	(8, 20),
	(8, 21),
	(9, 19),
	(9, 20),
	(9, 21),
	(9, 22),
	(9, 23),
	(9, 24),
	(9, 25),
	(9, 26),
	(9, 27),
	(9, 28),
	(9, 29),
	(9, 30),
	(9, 31),
	(9, 32),
	(9, 33),
	(9, 34),
	(10, 19),
	(10, 20),
	(10, 21),
	(10, 22),
	(10, 23),
	(10, 24),
	(10, 25),
	(10, 26),
	(10, 27),
	(10, 28),
	(10, 29),
	(10, 30),
	(10, 31),
	(10, 32),
	(10, 33),
	(10, 34),
	(10, 35),
	(11, 19),
	(11, 20),
	(11, 21),
	(11, 24),
	(11, 28),
	(13, 36),
	(13, 37),
	(13, 38),
	(15, 39),
	(16, 39),
	(16, 40),
	(17, 39),
	(17, 40),
	(17, 41),
	(19, 44),
	(19, 45),
	(19, 46),
	(19, 47),
	(19, 48),
	(19, 49),
	(19, 50),
	(19, 52),
	(19, 53),
	(20, 42),
	(20, 43),
	(20, 44),
	(20, 45),
	(20, 46),
	(20, 47),
	(20, 48),
	(20, 49),
	(20, 50),
	(20, 51),
	(20, 52),
	(20, 53),
	(20, 54),
	(22, 55),
	(23, 55),
	(23, 56),
	(23, 60),
	(24, 55),
	(24, 60),
	(24, 61),
	(24, 62),
	(25, 55),
	(25, 56),
	(25, 57),
	(25, 58),
	(25, 60),
	(25, 61),
	(25, 62),
	(26, 55),
	(26, 56),
	(26, 57),
	(26, 58),
	(26, 59),
	(26, 60),
	(26, 61),
	(26, 62),
	(28, 63),
	(29, 63),
	(29, 64),
	(29, 65),
	(29, 66),
	(31, 67),
	(32, 68),
	(32, 69),
	(34, 70),
	(34, 71),
	(35, 72),
	(36, 70),
	(36, 71),
	(36, 73),
	(37, 70),
	(37, 71),
	(37, 72),
	(37, 73),
	(38, 70),
	(38, 71),
	(38, 72),
	(38, 73),
	(38, 74),
	(38, 75),
	(38, 76),
	(38, 77),
	(39, 70),
	(39, 71),
	(39, 72),
	(39, 73),
	(39, 74),
	(39, 75),
	(39, 76),
	(39, 77),
	(39, 78),
	(39, 79),
	(39, 80),
	(39, 81),
	(40, 70),
	(40, 71),
	(40, 72),
	(40, 73),
	(40, 74),
	(40, 75),
	(40, 76),
	(40, 77),
	(40, 78),
	(40, 79),
	(40, 80),
	(40, 81),
	(40, 82),
	(40, 83),
	(40, 84),
	(40, 85),
	(40, 86),
	(40, 87),
	(42, 88),
	(43, 89),
	(44, 90),
	(44, 91),
	(44, 92),
	(44, 93),
	(44, 94),
	(44, 95),
	(44, 96),
	(44, 97),
	(44, 98),
	(44, 99),
	(44, 100),
	(45, 88),
	(45, 89),
	(45, 90),
	(45, 91),
	(45, 92),
	(45, 93),
	(45, 94),
	(45, 95),
	(45, 96),
	(45, 97),
	(45, 98),
	(45, 99),
	(45, 100),
	(45, 101),
	(45, 102),
	(45, 103),
	(45, 104),
	(45, 105),
	(45, 106),
	(45, 107),
	(45, 108),
	(45, 109),
	(45, 110),
	(45, 111),
	(45, 112),
	(45, 113),
	(47, 115),
	(48, 114),
	(48, 115);
/*!40000 ALTER TABLE `b_task_operation` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_undo
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE IF NOT EXISTS `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_undo: ~0 rows (приблизительно)
DELETE FROM `b_undo`;
/*!40000 ALTER TABLE `b_undo` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_undo` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_urlpreview_metadata
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE IF NOT EXISTS `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTRA` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_urlpreview_metadata: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_metadata`;
/*!40000 ALTER TABLE `b_urlpreview_metadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_metadata` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_urlpreview_route
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE IF NOT EXISTS `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_urlpreview_route: ~0 rows (приблизительно)
DELETE FROM `b_urlpreview_route`;
/*!40000 ALTER TABLE `b_urlpreview_route` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_urlpreview_route` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE IF NOT EXISTS `b_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(18) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_LOGO` int(18) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(18) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(18) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user: ~0 rows (приблизительно)
DELETE FROM `b_user`;
/*!40000 ALTER TABLE `b_user` DISABLE KEYS */;
INSERT INTO `b_user` (`ID`, `TIMESTAMP_X`, `LOGIN`, `PASSWORD`, `CHECKWORD`, `ACTIVE`, `NAME`, `LAST_NAME`, `EMAIL`, `LAST_LOGIN`, `DATE_REGISTER`, `LID`, `PERSONAL_PROFESSION`, `PERSONAL_WWW`, `PERSONAL_ICQ`, `PERSONAL_GENDER`, `PERSONAL_BIRTHDATE`, `PERSONAL_PHOTO`, `PERSONAL_PHONE`, `PERSONAL_FAX`, `PERSONAL_MOBILE`, `PERSONAL_PAGER`, `PERSONAL_STREET`, `PERSONAL_MAILBOX`, `PERSONAL_CITY`, `PERSONAL_STATE`, `PERSONAL_ZIP`, `PERSONAL_COUNTRY`, `PERSONAL_NOTES`, `WORK_COMPANY`, `WORK_DEPARTMENT`, `WORK_POSITION`, `WORK_WWW`, `WORK_PHONE`, `WORK_FAX`, `WORK_PAGER`, `WORK_STREET`, `WORK_MAILBOX`, `WORK_CITY`, `WORK_STATE`, `WORK_ZIP`, `WORK_COUNTRY`, `WORK_PROFILE`, `WORK_LOGO`, `WORK_NOTES`, `ADMIN_NOTES`, `STORED_HASH`, `XML_ID`, `PERSONAL_BIRTHDAY`, `EXTERNAL_AUTH_ID`, `CHECKWORD_TIME`, `SECOND_NAME`, `CONFIRM_CODE`, `LOGIN_ATTEMPTS`, `LAST_ACTIVITY_DATE`, `AUTO_TIME_ZONE`, `TIME_ZONE`, `TIME_ZONE_OFFSET`, `TITLE`, `BX_USER_ID`, `LANGUAGE_ID`) VALUES
	(1, '2018-11-26 17:35:53', 'admin', 'MGqUt9FEefe869b14daac4c57bd85a07682df9f7', 'EEijXfqBca5be02019237a39cd4cea2acc9b7d5f', 'Y', 'Администратор', 'ГутаГрупп', 'webdev@gutagroup.ru', '2018-11-26 17:35:53', '2018-11-26 17:35:53', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-11-26 17:35:53', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `b_user` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_access
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE IF NOT EXISTS `b_user_access` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_access: ~5 rows (приблизительно)
DELETE FROM `b_user_access`;
/*!40000 ALTER TABLE `b_user_access` DISABLE KEYS */;
INSERT INTO `b_user_access` (`USER_ID`, `PROVIDER_ID`, `ACCESS_CODE`) VALUES
	(0, 'group', 'G2'),
	(1, 'group', 'G1'),
	(1, 'group', 'G3'),
	(1, 'group', 'G4'),
	(1, 'group', 'G2'),
	(1, 'user', 'U1');
/*!40000 ALTER TABLE `b_user_access` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_access_check
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE IF NOT EXISTS `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  KEY `ix_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_access_check: ~2 rows (приблизительно)
DELETE FROM `b_user_access_check`;
/*!40000 ALTER TABLE `b_user_access_check` DISABLE KEYS */;
INSERT INTO `b_user_access_check` (`USER_ID`, `PROVIDER_ID`) VALUES
	(1, 'group'),
	(1, 'user');
/*!40000 ALTER TABLE `b_user_access_check` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_auth_action
DROP TABLE IF EXISTS `b_user_auth_action`;
CREATE TABLE IF NOT EXISTS `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT 100,
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_auth_action: ~0 rows (приблизительно)
DELETE FROM `b_user_auth_action`;
/*!40000 ALTER TABLE `b_user_auth_action` DISABLE KEYS */;
INSERT INTO `b_user_auth_action` (`ID`, `USER_ID`, `PRIORITY`, `ACTION`, `ACTION_DATE`) VALUES
	(1, 1, 200, 'update', '2018-11-26 17:35:53');
/*!40000 ALTER TABLE `b_user_auth_action` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_counter
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE IF NOT EXISTS `b_user_counter` (
  `USER_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(18) NOT NULL DEFAULT 0,
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  PRIMARY KEY (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_counter: ~0 rows (приблизительно)
DELETE FROM `b_user_counter`;
/*!40000 ALTER TABLE `b_user_counter` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_counter` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_digest
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE IF NOT EXISTS `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_digest: ~0 rows (приблизительно)
DELETE FROM `b_user_digest`;
/*!40000 ALTER TABLE `b_user_digest` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_digest` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_field
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE IF NOT EXISTS `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_field: ~5 rows (приблизительно)
DELETE FROM `b_user_field`;
/*!40000 ALTER TABLE `b_user_field` DISABLE KEYS */;
INSERT INTO `b_user_field` (`ID`, `ENTITY_ID`, `FIELD_NAME`, `USER_TYPE_ID`, `XML_ID`, `SORT`, `MULTIPLE`, `MANDATORY`, `SHOW_FILTER`, `SHOW_IN_LIST`, `EDIT_IN_LIST`, `IS_SEARCHABLE`, `SETTINGS`) VALUES
	(1, 'BLOG_POST', 'UF_BLOG_POST_DOC', 'file', 'UF_BLOG_POST_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(2, 'BLOG_COMMENT', 'UF_BLOG_COMMENT_DOC', 'file', 'UF_BLOG_COMMENT_DOC', 100, 'Y', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(3, 'BLOG_POST', 'UF_BLOG_POST_URL_PRV', 'url_preview', 'UF_BLOG_POST_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(4, 'BLOG_COMMENT', 'UF_BLOG_COMM_URL_PRV', 'url_preview', 'UF_BLOG_COMM_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'Y', 'a:0:{}'),
	(5, 'BLOG_POST', 'UF_GRATITUDE', 'integer', 'UF_GRATITUDE', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}'),
	(6, 'FORUM_MESSAGE', 'UF_FORUM_MES_URL_PRV', 'url_preview', 'UF_FORUM_MES_URL_PRV', 100, 'N', 'N', 'N', 'N', 'Y', 'N', 'a:0:{}');
/*!40000 ALTER TABLE `b_user_field` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_field_confirm
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE IF NOT EXISTS `b_user_field_confirm` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_field_confirm: ~0 rows (приблизительно)
DELETE FROM `b_user_field_confirm`;
/*!40000 ALTER TABLE `b_user_field_confirm` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_confirm` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_field_enum
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE IF NOT EXISTS `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT 500,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_field_enum: ~0 rows (приблизительно)
DELETE FROM `b_user_field_enum`;
/*!40000 ALTER TABLE `b_user_field_enum` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_enum` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_field_lang
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE IF NOT EXISTS `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_field_lang: ~0 rows (приблизительно)
DELETE FROM `b_user_field_lang`;
/*!40000 ALTER TABLE `b_user_field_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_field_lang` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_group
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE IF NOT EXISTS `b_user_group` (
  `USER_ID` int(18) NOT NULL,
  `GROUP_ID` int(18) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_group: ~3 rows (приблизительно)
DELETE FROM `b_user_group`;
/*!40000 ALTER TABLE `b_user_group` DISABLE KEYS */;
INSERT INTO `b_user_group` (`USER_ID`, `GROUP_ID`, `DATE_ACTIVE_FROM`, `DATE_ACTIVE_TO`) VALUES
	(1, 1, NULL, NULL),
	(1, 3, NULL, NULL),
	(1, 4, NULL, NULL);
/*!40000 ALTER TABLE `b_user_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_hit_auth
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE IF NOT EXISTS `b_user_hit_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_hit_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_hit_auth`;
/*!40000 ALTER TABLE `b_user_hit_auth` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_hit_auth` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_index
DROP TABLE IF EXISTS `b_user_index`;
CREATE TABLE IF NOT EXISTS `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_index: ~0 rows (приблизительно)
DELETE FROM `b_user_index`;
/*!40000 ALTER TABLE `b_user_index` DISABLE KEYS */;
INSERT INTO `b_user_index` (`USER_ID`, `SEARCH_USER_CONTENT`, `SEARCH_DEPARTMENT_CONTENT`, `SEARCH_ADMIN_CONTENT`, `NAME`, `LAST_NAME`, `SECOND_NAME`, `WORK_POSITION`, `UF_DEPARTMENT_NAME`) VALUES
	(1, '001 Администратор ГутаГрупп', '', '001 Администратор ГутаГрупп jroqri thgntebhc jroqri@thgntebhc.eh nqzva', 'Администратор', 'ГутаГрупп', '', '', '');
/*!40000 ALTER TABLE `b_user_index` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_option
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE IF NOT EXISTS `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_option: ~3 rows (приблизительно)
DELETE FROM `b_user_option`;
/*!40000 ALTER TABLE `b_user_option` DISABLE KEYS */;
INSERT INTO `b_user_option` (`ID`, `USER_ID`, `CATEGORY`, `NAME`, `VALUE`, `COMMON`) VALUES
	(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:"GADGETS";a:8:{s:20:"ADMIN_INFO@333333333";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:19:"HTML_AREA@444444444";a:5:{s:6:"COLUMN";i:0;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";s:8:"USERDATA";a:1:{s:7:"content";s:797:"<table class="bx-gadgets-info-site-table" cellspacing="0"><tr>	<td class="bx-gadget-gray">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class="bx-gadgets-info-site-logo" rowspan="5"><img src="/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png"></td></tr><tr>	<td class="bx-gadget-gray">Адрес сайта:</td>	<td><a href="http://www.1c-bitrix.ru">www.1c-bitrix.ru</a></td></tr><tr>	<td class="bx-gadget-gray">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class="bx-gadget-gray">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class="bx-gadget-gray">E-mail:</td>	<td><a href="mailto:info@1c-bitrix.ru">info@1c-bitrix.ru</a></td></tr></table>";}s:8:"SETTINGS";a:1:{s:9:"TITLE_STD";s:34:"Информация о сайте";}}s:25:"ADMIN_CHECKLIST@777888999";a:3:{s:6:"COLUMN";i:0;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:19:"RSSREADER@777777777";a:4:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";s:8:"SETTINGS";a:3:{s:9:"TITLE_STD";s:33:"Новости 1С-Битрикс";s:3:"CNT";i:10;s:7:"RSS_URL";s:45:"https://www.1c-bitrix.ru/about/life/news/rss/";}}s:24:"ADMIN_SECURITY@555555555";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:0;s:4:"HIDE";s:1:"N";}s:25:"ADMIN_SITESPEED@666666777";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:1;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_PERFMON@666666666";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:2;s:4:"HIDE";s:1:"N";}s:23:"ADMIN_MARKETPALCE@22549";a:3:{s:6:"COLUMN";i:1;s:3:"ROW";i:3;s:4:"HIDE";s:1:"N";}}}}', 'Y'),
	(2, 1, 'admin_panel', 'settings', 'a:2:{s:4:"edit";s:3:"off";s:9:"collapsed";s:2:"on";}', 'N'),
	(3, 1, 'hot_keys', 'user_defined', 'b:1;', 'N');
/*!40000 ALTER TABLE `b_user_option` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_profile_history
DROP TABLE IF EXISTS `b_user_profile_history`;
CREATE TABLE IF NOT EXISTS `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_profile_history: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_history`;
/*!40000 ALTER TABLE `b_user_profile_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_history` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_profile_record
DROP TABLE IF EXISTS `b_user_profile_record`;
CREATE TABLE IF NOT EXISTS `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_profile_record: ~0 rows (приблизительно)
DELETE FROM `b_user_profile_record`;
/*!40000 ALTER TABLE `b_user_profile_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_user_profile_record` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_user_stored_auth
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE IF NOT EXISTS `b_user_stored_auth` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_user_stored_auth: ~0 rows (приблизительно)
DELETE FROM `b_user_stored_auth`;
/*!40000 ALTER TABLE `b_user_stored_auth` DISABLE KEYS */;
INSERT INTO `b_user_stored_auth` (`ID`, `USER_ID`, `DATE_REG`, `LAST_AUTH`, `STORED_HASH`, `TEMP_HASH`, `IP_ADDR`) VALUES
	(1, 1, '2018-11-26 17:35:53', '2018-11-26 17:35:53', 'f78203db0a34e02c1d09af66f5fba8c1', 'N', 2130706433);
/*!40000 ALTER TABLE `b_user_stored_auth` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_utm_blog_comment
DROP TABLE IF EXISTS `b_utm_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_utm_blog_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_COMMENT_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_COMMENT_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_utm_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_comment`;
/*!40000 ALTER TABLE `b_utm_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_utm_blog_post
DROP TABLE IF EXISTS `b_utm_blog_post`;
CREATE TABLE IF NOT EXISTS `b_utm_blog_post` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_BLOG_POST_1` (`FIELD_ID`),
  KEY `ix_utm_BLOG_POST_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_utm_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_utm_blog_post`;
/*!40000 ALTER TABLE `b_utm_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_utm_forum_message
DROP TABLE IF EXISTS `b_utm_forum_message`;
CREATE TABLE IF NOT EXISTS `b_utm_forum_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VALUE_ID` int(11) NOT NULL,
  `FIELD_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_INT` int(11) DEFAULT NULL,
  `VALUE_DOUBLE` float DEFAULT NULL,
  `VALUE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_utm_FORUM_MESSAGE_1` (`FIELD_ID`),
  KEY `ix_utm_FORUM_MESSAGE_2` (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_utm_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_utm_forum_message`;
/*!40000 ALTER TABLE `b_utm_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_utm_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_uts_blog_comment
DROP TABLE IF EXISTS `b_uts_blog_comment`;
CREATE TABLE IF NOT EXISTS `b_uts_blog_comment` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_COMMENT_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_COMM_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_uts_blog_comment: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_comment`;
/*!40000 ALTER TABLE `b_uts_blog_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_comment` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_uts_blog_post
DROP TABLE IF EXISTS `b_uts_blog_post`;
CREATE TABLE IF NOT EXISTS `b_uts_blog_post` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_BLOG_POST_DOC` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_BLOG_POST_URL_PRV` int(11) DEFAULT NULL,
  `UF_GRATITUDE` int(18) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_uts_blog_post: ~0 rows (приблизительно)
DELETE FROM `b_uts_blog_post`;
/*!40000 ALTER TABLE `b_uts_blog_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_blog_post` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_uts_forum_message
DROP TABLE IF EXISTS `b_uts_forum_message`;
CREATE TABLE IF NOT EXISTS `b_uts_forum_message` (
  `VALUE_ID` int(11) NOT NULL,
  `UF_FORUM_MES_URL_PRV` int(11) DEFAULT NULL,
  PRIMARY KEY (`VALUE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_uts_forum_message: ~0 rows (приблизительно)
DELETE FROM `b_uts_forum_message`;
/*!40000 ALTER TABLE `b_uts_forum_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_uts_forum_message` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote
DROP TABLE IF EXISTS `b_vote`;
CREATE TABLE IF NOT EXISTS `b_vote` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NOTIFY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `AUTHOR_ID` int(18) DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL,
  `DATE_START` datetime NOT NULL,
  `DATE_END` datetime NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `EVENT1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EVENT3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNIQUE_TYPE` int(18) NOT NULL DEFAULT 2,
  `KEEP_IP_SEC` int(18) DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESULT_TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_CHANNEL_ID` (`CHANNEL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote: ~0 rows (приблизительно)
DELETE FROM `b_vote`;
/*!40000 ALTER TABLE `b_vote` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_answer
DROP TABLE IF EXISTS `b_vote_answer`;
CREATE TABLE IF NOT EXISTS `b_vote_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `FIELD_TYPE` int(5) NOT NULL DEFAULT 0,
  `FIELD_WIDTH` int(18) DEFAULT NULL,
  `FIELD_HEIGHT` int(18) DEFAULT NULL,
  `FIELD_PARAM` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COLOR` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_QUESTION_ID` (`QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_answer`;
/*!40000 ALTER TABLE `b_vote_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_attached_object
DROP TABLE IF EXISTS `b_vote_attached_object`;
CREATE TABLE IF NOT EXISTS `b_vote_attached_object` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CREATE_TIME` datetime NOT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_AO_1` (`OBJECT_ID`),
  KEY `IX_VOTE_AO_2` (`MODULE_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_attached_object: ~0 rows (приблизительно)
DELETE FROM `b_vote_attached_object`;
/*!40000 ALTER TABLE `b_vote_attached_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_attached_object` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_channel
DROP TABLE IF EXISTS `b_vote_channel`;
CREATE TABLE IF NOT EXISTS `b_vote_channel` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SYMBOLIC_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_SORT` int(18) DEFAULT 100,
  `FIRST_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TIMESTAMP_X` datetime NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VOTE_SINGLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `USE_CAPTCHA` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_channel: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel`;
/*!40000 ALTER TABLE `b_vote_channel` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_channel_2_group
DROP TABLE IF EXISTS `b_vote_channel_2_group`;
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_group` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `GROUP_ID` int(18) NOT NULL DEFAULT 0,
  `PERMISSION` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_CHANNEL_ID_GROUP_ID` (`CHANNEL_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_channel_2_group: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_group`;
/*!40000 ALTER TABLE `b_vote_channel_2_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_group` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_channel_2_site
DROP TABLE IF EXISTS `b_vote_channel_2_site`;
CREATE TABLE IF NOT EXISTS `b_vote_channel_2_site` (
  `CHANNEL_ID` int(18) NOT NULL DEFAULT 0,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`CHANNEL_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_channel_2_site: ~0 rows (приблизительно)
DELETE FROM `b_vote_channel_2_site`;
/*!40000 ALTER TABLE `b_vote_channel_2_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_channel_2_site` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_event
DROP TABLE IF EXISTS `b_vote_event`;
CREATE TABLE IF NOT EXISTS `b_vote_event` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `VOTE_USER_ID` int(18) NOT NULL DEFAULT 0,
  `DATE_VOTE` datetime NOT NULL,
  `STAT_SESSION_ID` int(18) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALID` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `IX_USER_ID` (`VOTE_USER_ID`),
  KEY `IX_B_VOTE_EVENT_2` (`VOTE_ID`,`IP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_event: ~0 rows (приблизительно)
DELETE FROM `b_vote_event`;
/*!40000 ALTER TABLE `b_vote_event` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_event_answer
DROP TABLE IF EXISTS `b_vote_event_answer`;
CREATE TABLE IF NOT EXISTS `b_vote_event_answer` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  `ANSWER_ID` int(18) NOT NULL DEFAULT 0,
  `MESSAGE` text COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_QUESTION_ID` (`EVENT_QUESTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_event_answer: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_answer`;
/*!40000 ALTER TABLE `b_vote_event_answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_answer` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_event_question
DROP TABLE IF EXISTS `b_vote_event_question`;
CREATE TABLE IF NOT EXISTS `b_vote_event_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `EVENT_ID` int(18) NOT NULL DEFAULT 0,
  `QUESTION_ID` int(18) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`),
  KEY `IX_EVENT_ID` (`EVENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_event_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_event_question`;
/*!40000 ALTER TABLE `b_vote_event_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_event_question` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_question
DROP TABLE IF EXISTS `b_vote_question`;
CREATE TABLE IF NOT EXISTS `b_vote_question` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TIMESTAMP_X` datetime NOT NULL,
  `VOTE_ID` int(18) NOT NULL DEFAULT 0,
  `C_SORT` int(18) DEFAULT 100,
  `COUNTER` int(11) NOT NULL DEFAULT 0,
  `QUESTION` text COLLATE utf8_unicode_ci NOT NULL,
  `QUESTION_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'html',
  `IMAGE_ID` int(18) DEFAULT NULL,
  `DIAGRAM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `REQUIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DIAGRAM_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'histogram',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE_NEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_VOTE_ID` (`VOTE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_question: ~0 rows (приблизительно)
DELETE FROM `b_vote_question`;
/*!40000 ALTER TABLE `b_vote_question` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_question` ENABLE KEYS */;

-- Дамп структуры для таблица bitrix_standart.b_vote_user
DROP TABLE IF EXISTS `b_vote_user`;
CREATE TABLE IF NOT EXISTS `b_vote_user` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STAT_GUEST_ID` int(18) DEFAULT NULL,
  `AUTH_USER_ID` int(18) DEFAULT NULL,
  `COUNTER` int(18) NOT NULL DEFAULT 0,
  `DATE_FIRST` datetime NOT NULL,
  `DATE_LAST` datetime NOT NULL,
  `LAST_IP` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы bitrix_standart.b_vote_user: ~0 rows (приблизительно)
DELETE FROM `b_vote_user`;
/*!40000 ALTER TABLE `b_vote_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `b_vote_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
