-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2023 at 06:12 AM
-- Server version: 10.3.37-MariaDB-log-cll-lve
-- PHP Version: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `abidingg_abs`
--

-- --------------------------------------------------------

--
-- Table structure for table `fahim_commentmeta`
--

CREATE TABLE `fahim_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fahim_comments`
--

CREATE TABLE `fahim_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_comments`
--

INSERT INTO `fahim_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'Mr WordPress', '', 'https://wordpress.org/', '', '2015-07-13 05:45:24', '2015-07-13 05:45:24', 'Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.', 0, '1', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_layerslider`
--

CREATE TABLE `fahim_layerslider` (
  `id` int(10) NOT NULL,
  `author` int(10) NOT NULL DEFAULT 0,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `data` mediumtext NOT NULL,
  `date_c` int(10) NOT NULL,
  `date_m` int(11) NOT NULL,
  `flag_hidden` tinyint(1) NOT NULL DEFAULT 0,
  `flag_deleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fahim_layerslider`
--

INSERT INTO `fahim_layerslider` (`id`, `author`, `name`, `slug`, `data`, `date_c`, `date_m`, `flag_hidden`, `flag_deleted`) VALUES
(1, 1, 'HP1', '', '{\"properties\":{\"post_taxonomy\":\"0\",\"post_orderby\":\"date\",\"post_order\":\"DESC\",\"post_offset\":\"-1\",\"title\":\"HP1\",\"width\":\"100%\",\"height\":\"555px\",\"responsive\":\"on\",\"maxwidth\":\"\",\"responsiveunder\":\"1280\",\"sublayercontainer\":\"1280\",\"autostart\":\"on\",\"firstlayer\":\"1\",\"animatefirstlayer\":\"on\",\"keybnav\":\"on\",\"touchnav\":\"on\",\"loops\":\"0\",\"forceloopnum\":\"on\",\"twowayslideshow\":\"on\",\"skin\":\"captiva-skin\",\"backgroundcolor\":\"transparent\",\"backgroundimage\":\"\",\"sliderstyle\":\"margin-bottom: 0px;\",\"navprevnext\":\"on\",\"navstartstop\":\"on\",\"navbuttons\":\"on\",\"hoverprevnext\":\"on\",\"hoverbottomnav\":\"on\",\"bartimer\":\"on\",\"circletimer\":\"on\",\"thumb_nav\":\"hover\",\"thumb_container_width\":\"60%\",\"thumb_width\":\"100\",\"thumb_height\":\"60\",\"thumb_active_opacity\":\"35\",\"thumb_inactive_opacity\":\"100\",\"autoplayvideos\":\"on\",\"autopauseslideshow\":\"auto\",\"youtubepreview\":\"maxresdefault.jpg\",\"imgpreload\":\"on\",\"lazyload\":\"on\",\"yourlogoId\":\"\",\"yourlogo\":\"\",\"yourlogostyle\":\"left: -10px; top: -10px;\",\"yourlogolink\":\"\",\"yourlogotarget\":\"_self\",\"cbinit\":\"function(element) {\\r\\n\\r\\n}\",\"cbstart\":\"function(data) {\\r\\n\\r\\n}\",\"cbstop\":\"function(data) {\\r\\n\\r\\n}\",\"cbpause\":\"function(data) {\\r\\n\\r\\n}\",\"cbanimstart\":\"function(data) {\\r\\n\\r\\n}\",\"cbanimstop\":\"function(data) {\\r\\n\\r\\n}\",\"cbprev\":\"function(data) {\\r\\n\\r\\n}\",\"cbnext\":\"function(data) {\\r\\n\\r\\n}\"},\"layers\":[{\"properties\":{\"post_offset\":\"-1\",\"3d_transitions\":\"\",\"2d_transitions\":\"\",\"custom_3d_transitions\":\"\",\"custom_2d_transitions\":\"\",\"backgroundId\":\"65980\",\"background\":\"http:\\/\\/captivatheme1.commercegurus.com\\/wp-content\\/uploads\\/2014\\/07\\/party-season.jpg\",\"thumbnailId\":\"\",\"thumbnail\":\"\",\"slidedelay\":\"4000\",\"timeshift\":\"0\",\"layer_link\":\"\",\"layer_link_target\":\"_self\",\"id\":\"\",\"deeplink\":\"\"},\"sublayers\":[{\"subtitle\":\"Subheading\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Cool Nightlife Outfits\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"80\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"-80\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"38px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#fff\\\\\\\"}\",\"top\":\"108px\",\"left\":\"144px\",\"style\":\"font-weight: 300;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Heading\",\"media\":\"text\",\"type\":\"h1\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Party Season!\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"Top\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"800\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"Top\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"82px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#fff\\\\\\\"}\",\"top\":\"149px\",\"left\":\"141px\",\"style\":\"font-weight:600;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Copy\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Our experts pick the hottest buys for<br\\/>\\r\\nwork, weekends, occasions and going out.\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1200\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"22px\\\\\\\",\\\\\\\"line-height\\\\\\\":\\\\\\\"1.4em\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#fff\\\\\\\"}\",\"top\":\"254px\",\"left\":\"144px\",\"style\":\"font-weight:600;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Button\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"EXPLORE COLLECTION\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1600\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"http:\\/\\/captivatheme1.commercegurus.com\\/shop\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"padding-top\\\\\\\":\\\\\\\"15px\\\\\\\",\\\\\\\"padding-right\\\\\\\":\\\\\\\"25px\\\\\\\",\\\\\\\"padding-bottom\\\\\\\":\\\\\\\"15px\\\\\\\",\\\\\\\"padding-left\\\\\\\":\\\\\\\"25px\\\\\\\",\\\\\\\"font-family\\\\\\\":\\\\\\\"Quicksand\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"14px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#333\\\\\\\",\\\\\\\"background\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"border-radius\\\\\\\":\\\\\\\"20px\\\\\\\"}\",\"top\":\"342px\",\"left\":\"144px\",\"style\":\"font-weight:700;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"}]},{\"properties\":{\"post_offset\":\"-1\",\"3d_transitions\":\"\",\"2d_transitions\":\"5,6,7,8,9,11,12,13,14,15,17\",\"custom_3d_transitions\":\"\",\"custom_2d_transitions\":\"\",\"backgroundId\":\"65057\",\"background\":\"http:\\/\\/captivatheme1.commercegurus.com\\/wp-content\\/uploads\\/2014\\/05\\/beach.jpg\",\"thumbnailId\":\"\",\"thumbnail\":\"\",\"slidedelay\":\"5000\",\"timeshift\":\"0\",\"layer_link\":\"\",\"layer_link_target\":\"_self\",\"id\":\"\",\"deeplink\":\"\"},\"sublayers\":[{\"subtitle\":\"Subtext\",\"media\":\"html\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Funky Summer Style\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"top\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"top\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"38px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"106px\",\"left\":\"140px\",\"style\":\"font-weight: 300;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Main text\",\"media\":\"text\",\"type\":\"h1\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Beach Ready!\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"800\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"82px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"146px\",\"left\":\"138px\",\"style\":\"font-weight: 600;\\r\\nletter-spacing: -0.02em;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Main copy\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Style experts pick the hottest buys for<br\\/>\\r\\nwork, weekends, occasions and going out.\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1200\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"22px\\\\\\\",\\\\\\\"line-height\\\\\\\":\\\\\\\"1.4em;\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"248px\",\"left\":\"143px\",\"style\":\"font-weight: 600;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Button 1\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"SHOP WOMEN\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1600\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"http:\\/\\/captivatheme1.commercegurus.com\\/shop\\/\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"padding-top\\\\\\\":\\\\\\\"12px\\\\\\\",\\\\\\\"padding-right\\\\\\\":\\\\\\\"30px\\\\\\\",\\\\\\\"padding-bottom\\\\\\\":\\\\\\\"12px\\\\\\\",\\\\\\\"padding-left\\\\\\\":\\\\\\\"30px\\\\\\\",\\\\\\\"font-family\\\\\\\":\\\\\\\"Quicksand\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"14px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#111\\\\\\\",\\\\\\\"background\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"border-radius\\\\\\\":\\\\\\\"20px\\\\\\\"}\",\"top\":\"333px\",\"left\":\"142px\",\"style\":\"font-weight:700;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Button 2\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"SHOP MEN\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"2000\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"http:\\/\\/captivatheme1.commercegurus.com\\/shop\\/\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"padding-top\\\\\\\":\\\\\\\"12px\\\\\\\",\\\\\\\"padding-right\\\\\\\":\\\\\\\"30px\\\\\\\",\\\\\\\"padding-bottom\\\\\\\":\\\\\\\"12px\\\\\\\",\\\\\\\"padding-left\\\\\\\":\\\\\\\"30px\\\\\\\",\\\\\\\"font-family\\\\\\\":\\\\\\\"Quicksand\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"14px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#111\\\\\\\",\\\\\\\"background\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"border-radius\\\\\\\":\\\\\\\"20px\\\\\\\"}\",\"top\":\"333px\",\"left\":\"319px\",\"style\":\"font-weight:700;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"}]},{\"properties\":{\"post_offset\":\"-1\",\"3d_transitions\":\"\",\"2d_transitions\":\"5,6,7,8,9,11,12,13,14,15,17\",\"custom_3d_transitions\":\"\",\"custom_2d_transitions\":\"\",\"backgroundId\":\"65038\",\"background\":\"http:\\/\\/captivatheme1.commercegurus.com\\/wp-content\\/uploads\\/2014\\/05\\/girls.jpg\",\"thumbnailId\":\"\",\"thumbnail\":\"\",\"slidedelay\":\"4000\",\"timeshift\":\"0\",\"layer_link\":\"\",\"layer_link_target\":\"_self\",\"id\":\"\",\"deeplink\":\"\"},\"sublayers\":[{\"subtitle\":\"Subtext\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"It\\\\\'s finally here!\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"top\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"top\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"400\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"38px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"147px\",\"left\":\"144px\",\"style\":\"font-weight: 300;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Heading\",\"media\":\"text\",\"type\":\"h1\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Summer Sale\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"800\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"82px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"184px\",\"left\":\"143px\",\"style\":\"font-weight:600;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Tagline\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"Up to 75% off everything!\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1200\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"left\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"font-family\\\\\\\":\\\\\\\"Lato\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"24px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#222\\\\\\\"}\",\"top\":\"290px\",\"left\":\"144px\",\"style\":\"\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"},{\"subtitle\":\"Button\",\"media\":\"text\",\"type\":\"p\",\"imageId\":\"\",\"image\":\"\",\"html\":\"START SHOPPING\",\"post_text_length\":\"\",\"transition\":\"{\\\\\\\"offsetxin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyin\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationin\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"delayin\\\\\\\":\\\\\\\"1600\\\\\\\",\\\\\\\"easingin\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadein\\\\\\\":true,\\\\\\\"rotatein\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginin\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxin\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyin\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexin\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyin\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"offsetxout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"offsetyout\\\\\\\":\\\\\\\"bottom\\\\\\\",\\\\\\\"durationout\\\\\\\":\\\\\\\"1000\\\\\\\",\\\\\\\"showuntil\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"easingout\\\\\\\":\\\\\\\"easeInOutQuint\\\\\\\",\\\\\\\"fadeout\\\\\\\":true,\\\\\\\"rotateout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotatexout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"rotateyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"transformoriginout\\\\\\\":\\\\\\\"50% 50% 0\\\\\\\",\\\\\\\"skewxout\\\\\\\":\\\\\\\"-30\\\\\\\",\\\\\\\"skewyout\\\\\\\":\\\\\\\"0\\\\\\\",\\\\\\\"scalexout\\\\\\\":\\\\\\\"1\\\\\\\",\\\\\\\"scaleyout\\\\\\\":\\\\\\\".1\\\\\\\",\\\\\\\"parallaxlevel\\\\\\\":\\\\\\\"0\\\\\\\"}\",\"url\":\"http:\\/\\/captivatheme1.commercegurus.com\\/shop\\/\",\"target\":\"_self\",\"styles\":\"{\\\\\\\"padding-top\\\\\\\":\\\\\\\"15px\\\\\\\",\\\\\\\"padding-right\\\\\\\":\\\\\\\"25px\\\\\\\",\\\\\\\"padding-bottom\\\\\\\":\\\\\\\"15px\\\\\\\",\\\\\\\"padding-left\\\\\\\":\\\\\\\"25px\\\\\\\",\\\\\\\"font-family\\\\\\\":\\\\\\\"Quicksand\\\\\\\",\\\\\\\"font-size\\\\\\\":\\\\\\\"14px\\\\\\\",\\\\\\\"color\\\\\\\":\\\\\\\"#111\\\\\\\",\\\\\\\"background\\\\\\\":\\\\\\\"#fff\\\\\\\",\\\\\\\"border-radius\\\\\\\":\\\\\\\"20px\\\\\\\"}\",\"top\":\"348px\",\"left\":\"144px\",\"style\":\"font-weight:700;\",\"id\":\"\",\"class\":\"\",\"title\":\"\",\"alt\":\"\",\"rel\":\"\"}]}]}', 1436772071, 1436772071, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_links`
--

CREATE TABLE `fahim_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fahim_nextend_smartslider_layouts`
--

CREATE TABLE `fahim_nextend_smartslider_layouts` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `slide` longtext DEFAULT NULL,
  `params` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fahim_nextend_smartslider_sliders`
--

CREATE TABLE `fahim_nextend_smartslider_sliders` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `type` varchar(30) NOT NULL,
  `params` text NOT NULL,
  `generator` text NOT NULL,
  `slide` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fahim_nextend_smartslider_slides`
--

CREATE TABLE `fahim_nextend_smartslider_slides` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `slider` int(11) NOT NULL,
  `publish_up` datetime NOT NULL,
  `publish_down` datetime NOT NULL,
  `published` tinyint(1) NOT NULL,
  `first` int(11) NOT NULL,
  `slide` longtext DEFAULT NULL,
  `description` text NOT NULL,
  `thumbnail` varchar(255) NOT NULL,
  `background` varchar(300) NOT NULL,
  `params` text NOT NULL,
  `ordering` int(11) NOT NULL,
  `generator` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fahim_nextend_smartslider_storage`
--

CREATE TABLE `fahim_nextend_smartslider_storage` (
  `id` int(11) NOT NULL,
  `key` varchar(200) NOT NULL,
  `value` longtext DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `fahim_nextend_smartslider_storage`
--

INSERT INTO `fahim_nextend_smartslider_storage` (`id`, `key`, `value`) VALUES
(1, 'layout', '{\"size\":\"1024|*|768\"}'),
(2, 'settings', '{\"debugmessages\":\"1\",\"slideeditoralert\":\"1\",\"translateurl\":\"|*|\",\"jquery\":\"1\",\"placeholder\":\"http:\\/\\/www.nextendweb.com\\/static\\/placeholder.png\",\"tidy-input-encoding\":\"utf8\",\"tidy-output-encoding\":\"utf8\"}'),
(3, 'font', '{\"sliderfont1customlabel\":\"Heading light\",\"sliderfont1\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"320||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"paddingleft\\\":0,\\\"size\\\":\\\"100||%\\\"},\\\"Link:Hover\\\":{\\\"paddingleft\\\":0,\\\"size\\\":\\\"100||%\\\"}}\",\"sliderfont2customlabel\":\"Heading dark\",\"sliderfont2\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"320||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":1,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont3customlabel\":\"Subheading light\",\"sliderfont3\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"170||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont4customlabel\":\"Subheading dark\",\"sliderfont4\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"170||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont5customlabel\":\"Paragraph light\",\"sliderfont5\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"114||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.4\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"justify\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont6customlabel\":\"Paragraph dark\",\"sliderfont6\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"114||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.4\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"justify\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont7customlabel\":\"Small text light\",\"sliderfont7\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"90||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont8customlabel\":\"Small text dark\",\"sliderfont8\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"90||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.1\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont9customlabel\":\"Handwritten light\",\"sliderfont9\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"140||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Pacifico);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont10customlabel\":\"Handwritten dark\",\"sliderfont10\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"140||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Pacifico);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont11customlabel\":\"Button light\",\"sliderfont11\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"100||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfont12customlabel\":\"Button dark\",\"sliderfont12\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"000000db\\\",\\\"size\\\":\\\"100||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|0|*|ffffff33\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"paddingleft\\\":0,\\\"size\\\":\\\"100||%\\\"},\\\"Link:Hover\\\":{\\\"paddingleft\\\":0,\\\"size\\\":\\\"100||%\\\"}}\",\"sliderfontcustom1customlabel\":\"My first custom font\",\"sliderfontcustom1\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"1abc9cff\\\",\\\"size\\\":\\\"360||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Pacifico);),Arial\\\",\\\"lineheight\\\":\\\"1.3\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"left\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfontcustom2customlabel\":\"My second custom font\",\"sliderfontcustom2\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"ffffffff\\\",\\\"size\\\":\\\"140||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfontcustom3customlabel\":\"My third custom font\",\"sliderfontcustom3\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"1abc9cff\\\",\\\"size\\\":\\\"120||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"center\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\",\"sliderfontcustom4customlabel\":\"My fourthcustom font \",\"sliderfontcustom4\":\"{\\\"firsttab\\\":\\\"Text\\\",\\\"Text\\\":{\\\"color\\\":\\\"1abc9cff\\\",\\\"size\\\":\\\"120||%\\\",\\\"tshadow\\\":\\\"0|*|1|*|1|*|000000c7\\\",\\\"afont\\\":\\\"google(@import url(http:\\/\\/fonts.googleapis.com\\/css?family=Open Sans);),Arial\\\",\\\"lineheight\\\":\\\"1.2\\\",\\\"bold\\\":0,\\\"italic\\\":0,\\\"underline\\\":0,\\\"align\\\":\\\"right\\\",\\\"paddingleft\\\":0},\\\"Link\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0},\\\"Link:Hover\\\":{\\\"size\\\":\\\"100||%\\\",\\\"paddingleft\\\":0}}\"}');

-- --------------------------------------------------------

--
-- Table structure for table `fahim_options`
--

CREATE TABLE `fahim_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_options`
--

INSERT INTO `fahim_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://abidinggroupbd.com/abs', 'yes'),
(2, 'home', 'http://abidinggroupbd.com/abs', 'yes'),
(3, 'blogname', 'Abiding Building System', 'yes'),
(4, 'blogdescription', 'Abiding Building System', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'frihim.ist.cse@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%postname%/', 'yes'),
(29, 'gzipcompression', '0', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:3:{i:0;s:27:\"LayerSlider/layerslider.php\";i:1;s:27:\"js_composer/js_composer.php\";i:2;s:27:\"wp-subtitle/wp-subtitle.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'advanced_edit', '0', 'yes'),
(37, 'comment_max_links', '2', 'yes'),
(38, 'gmt_offset', '0', 'yes'),
(39, 'default_email_category', '1', 'yes'),
(40, 'recently_edited', '', 'no'),
(41, 'template', 'abs-template-uwl', 'yes'),
(42, 'stylesheet', 'abs-template-uwl', 'yes'),
(43, 'comment_whitelist', '1', 'yes'),
(44, 'blacklist_keys', '', 'no'),
(45, 'comment_registration', '0', 'yes'),
(46, 'html_type', 'text/html', 'yes'),
(47, 'use_trackback', '0', 'yes'),
(48, 'default_role', 'subscriber', 'yes'),
(49, 'db_version', '31536', 'yes'),
(50, 'uploads_use_yearmonth_folders', '1', 'yes'),
(51, 'upload_path', '', 'yes'),
(52, 'blog_public', '1', 'yes'),
(53, 'default_link_category', '2', 'yes'),
(54, 'show_on_front', 'posts', 'yes'),
(55, 'tag_base', '', 'yes'),
(56, 'show_avatars', '1', 'yes'),
(57, 'avatar_rating', 'G', 'yes'),
(58, 'upload_url_path', '', 'yes'),
(59, 'thumbnail_size_w', '150', 'yes'),
(60, 'thumbnail_size_h', '150', 'yes'),
(61, 'thumbnail_crop', '1', 'yes'),
(62, 'medium_size_w', '300', 'yes'),
(63, 'medium_size_h', '300', 'yes'),
(64, 'avatar_default', 'mystery', 'yes'),
(65, 'large_size_w', '1024', 'yes'),
(66, 'large_size_h', '1024', 'yes'),
(67, 'image_default_link_type', 'file', 'yes'),
(68, 'image_default_size', '', 'yes'),
(69, 'image_default_align', '', 'yes'),
(70, 'close_comments_for_old_posts', '0', 'yes'),
(71, 'close_comments_days_old', '14', 'yes'),
(72, 'thread_comments', '1', 'yes'),
(73, 'thread_comments_depth', '5', 'yes'),
(74, 'page_comments', '0', 'yes'),
(75, 'comments_per_page', '50', 'yes'),
(76, 'default_comments_page', 'newest', 'yes'),
(77, 'comment_order', 'asc', 'yes'),
(78, 'sticky_posts', 'a:0:{}', 'yes'),
(79, 'widget_categories', 'a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(80, 'widget_text', 'a:0:{}', 'yes'),
(81, 'widget_rss', 'a:0:{}', 'yes'),
(82, 'uninstall_plugins', 'a:1:{s:27:\"LayerSlider/layerslider.php\";s:29:\"layerslider_uninstall_scripts\";}', 'no'),
(83, 'timezone_string', '', 'yes'),
(84, 'page_for_posts', '0', 'yes'),
(85, 'page_on_front', '0', 'yes'),
(86, 'default_post_format', '0', 'yes'),
(87, 'link_manager_enabled', '0', 'yes'),
(88, 'initial_db_version', '31535', 'yes'),
(89, 'fahim_user_roles', 'a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}', 'yes'),
(90, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(91, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(92, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(93, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(94, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(95, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:18:\"orphaned_widgets_1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(97, 'cron', 'a:5:{i:1456508726;a:1:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1456508727;a:2:{s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1456553404;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1456559638;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}', 'yes'),
(104, '_transient_random_seed', '1ac73e13df31ab8b049c71663046d52f', 'yes'),
(129, 'theme_mods_twentyfifteen', 'a:1:{s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1436767815;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}}}}', 'yes'),
(130, 'current_theme', '', 'yes'),
(131, 'theme_mods_abs-template-uwl', 'a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:2:{s:9:\"main-menu\";i:2;s:10:\"quick-menu\";i:4;}}', 'yes'),
(132, 'theme_switched', '', 'yes'),
(133, 'nav_menu_options', 'a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}', 'yes'),
(134, 'recently_activated', 'a:0:{}', 'yes'),
(135, 'vc_version', '4.4.2', 'yes'),
(138, 'wpb_js_content_types', 'a:2:{i:0;s:4:\"post\";i:1;s:4:\"page\";}', 'yes'),
(139, 'wpb_js_groups_access_rules', 'a:4:{s:13:\"administrator\";a:1:{s:4:\"show\";s:3:\"all\";}s:6:\"editor\";a:1:{s:4:\"show\";s:3:\"all\";}s:6:\"author\";a:1:{s:4:\"show\";s:3:\"all\";}s:11:\"contributor\";a:1:{s:4:\"show\";s:3:\"all\";}}', 'yes'),
(140, 'wpb_js_not_responsive_css', '', 'yes'),
(141, 'wpb_js_google_fonts_subsets', 'a:1:{i:0;s:5:\"latin\";}', 'yes'),
(149, 'ls-plugin-version', '5.1.1', 'yes'),
(150, 'ls-db-version', '5.0.0', 'yes'),
(151, 'ls-installed', '1', 'yes'),
(152, 'ls-google-fonts', 'a:4:{i:0;a:2:{s:5:\"param\";s:28:\"Lato:100,300,regular,700,900\";s:5:\"admin\";b:0;}i:1;a:2:{s:5:\"param\";s:13:\"Open+Sans:300\";s:5:\"admin\";b:0;}i:2;a:2:{s:5:\"param\";s:20:\"Indie+Flower:regular\";s:5:\"admin\";b:0;}i:3;a:2:{s:5:\"param\";s:22:\"Oswald:300,regular,700\";s:5:\"admin\";b:0;}}', 'yes'),
(154, 'category_children', 'a:0:{}', 'yes'),
(155, 'wpb_js_composer_license_activation_notified', 'yes', 'yes'),
(160, 'redux-framework-tracking', 'a:3:{s:8:\"dev_mode\";b:0;s:4:\"hash\";s:32:\"d1b5fa4073a594b717a409f2118a17c9\";s:14:\"allow_tracking\";s:2:\"no\";}', 'yes'),
(161, 'redux_version_upgraded_from', '3.5.4.3', 'yes'),
(162, '_transient_timeout__redux_activation_redirect', '1456502087', 'no'),
(163, '_transient__redux_activation_redirect', '1', 'no'),
(164, 'fahim', 'a:19:{s:8:\"last_tab\";s:1:\"4\";s:11:\"logo-change\";a:5:{s:3:\"url\";s:78:\"http://localhost/abs/wp-content/themes/abs-template-uwl/assets/images/logo.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:8:\"fav-icon\";a:5:{s:3:\"url\";s:70:\"http://localhost/abs/wp-content/themes/abs-template-uwl/images/fav.png\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:18:\"first-left-heading\";s:15:\"CUSTOM ELEMENTS\";s:19:\"first-left-subtitle\";s:22:\"LOBORITS SED IMPERDIET\";s:15:\"first-right-img\";a:5:{s:3:\"url\";s:88:\"http://localhost/abs/wp-content/themes/abs-template-uwl/content/background/960x540-1.jpg\";s:2:\"id\";s:0:\"\";s:6:\"height\";s:0:\"\";s:5:\"width\";s:0:\"\";s:9:\"thumbnail\";s:0:\"\";}s:17:\"left-grid-content\";s:224:\"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittis ex nisi, eget tincidunt quam mollis luctus. Praesent ultrices et sapien vitae aliquet. Nullam ultrices tincidunt metus.\";s:11:\"ach_clients\";s:4:\"1500\";s:16:\"ach_team_members\";s:3:\"200\";s:12:\"ach_projects\";s:4:\"1150\";s:12:\"ach_products\";s:4:\"1999\";s:13:\"facebook-link\";s:23:\"http://www.facebook.com\";s:12:\"twitter-link\";s:22:\"http://www.twitter.com\";s:12:\"linkdin-link\";s:22:\"http://www.linkdin.com\";s:12:\"youtube-link\";s:22:\"http://www.youtube.com\";s:10:\"gplus-link\";s:26:\"http://www.plus.google.com\";s:14:\"footer_address\";s:145:\"\n							<p>\n								<strong>Corporate offices</strong><br>\n								 4000 Brentwood Drive<br>\n								 Austin, TX 78746\n							</p>\n							\n						\";s:11:\"google-plus\";s:38:\"Put Google Plus Link Here In TEXT Mode\";s:16:\"defaults-section\";s:13:\"Reset Section\";}', 'yes'),
(165, 'fahim-transients', 'a:3:{s:14:\"changed_values\";a:1:{s:14:\"footer_address\";s:339:\"<div class=\"widget widget_text\">\r\n<div class=\"textwidget\">\r\n\r\n<strong>Corporate offices</strong>\r\n4000 Brentwood Drive\r\nAustin, TX 78746\r\n<p class=\"no-margin-bottom\"><strong>Contact Info</strong>\r\n<span class=\"hidden-tablet\">Phone / Fax:</span> 951-906-5605\r\n<span class=\"hidden-tablet\">Email:</span> office@indie.com</p>\r\n\r\n</div>\r\n</div>\";}s:9:\"last_save\";i:1436857614;s:13:\"last_compiler\";i:1436778518;}', 'yes'),
(198, 'WPLANG', '', 'yes'),
(203, 'rewrite_rules', 'a:109:{s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:36:\"services/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:46:\"services/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:66:\"services/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:61:\"services/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"services/([^/]+)/trackback/?$\";s:35:\"index.php?services=$matches[1]&tb=1\";s:37:\"services/([^/]+)/page/?([0-9]{1,})/?$\";s:48:\"index.php?services=$matches[1]&paged=$matches[2]\";s:44:\"services/([^/]+)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?services=$matches[1]&cpage=$matches[2]\";s:29:\"services/([^/]+)(/[0-9]+)?/?$\";s:47:\"index.php?services=$matches[1]&page=$matches[2]\";s:25:\"services/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:35:\"services/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:55:\"services/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:50:\"services/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:39:\"testamonial/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"testamonial/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"testamonial/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testamonial/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testamonial/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:32:\"testamonial/([^/]+)/trackback/?$\";s:38:\"index.php?testamonial=$matches[1]&tb=1\";s:40:\"testamonial/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?testamonial=$matches[1]&paged=$matches[2]\";s:47:\"testamonial/([^/]+)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?testamonial=$matches[1]&cpage=$matches[2]\";s:32:\"testamonial/([^/]+)(/[0-9]+)?/?$\";s:50:\"index.php?testamonial=$matches[1]&page=$matches[2]\";s:28:\"testamonial/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"testamonial/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"testamonial/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testamonial/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testamonial/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"vc_grid_item/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:50:\"vc_grid_item/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:70:\"vc_grid_item/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:65:\"vc_grid_item/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\"vc_grid_item/([^/]+)/trackback/?$\";s:39:\"index.php?vc_grid_item=$matches[1]&tb=1\";s:41:\"vc_grid_item/([^/]+)/page/?([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&paged=$matches[2]\";s:48:\"vc_grid_item/([^/]+)/comment-page-([0-9]{1,})/?$\";s:52:\"index.php?vc_grid_item=$matches[1]&cpage=$matches[2]\";s:33:\"vc_grid_item/([^/]+)(/[0-9]+)?/?$\";s:51:\"index.php?vc_grid_item=$matches[1]&page=$matches[2]\";s:29:\"vc_grid_item/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:39:\"vc_grid_item/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:59:\"vc_grid_item/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:54:\"vc_grid_item/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";s:27:\"[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\"[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\"[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\"[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)/trackback/?$\";s:31:\"index.php?name=$matches[1]&tb=1\";s:40:\"([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:35:\"([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?name=$matches[1]&feed=$matches[2]\";s:28:\"([^/]+)/page/?([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&paged=$matches[2]\";s:35:\"([^/]+)/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?name=$matches[1]&cpage=$matches[2]\";s:20:\"([^/]+)(/[0-9]+)?/?$\";s:43:\"index.php?name=$matches[1]&page=$matches[2]\";s:16:\"[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:26:\"[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:46:\"[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:41:\"[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";}', 'yes'),
(215, 'db_upgraded', '1', 'yes'),
(218, 'auto_core_update_notified', 'a:4:{s:4:\"type\";s:7:\"success\";s:5:\"email\";s:24:\"frihim.ist.cse@gmail.com\";s:7:\"version\";s:5:\"4.2.7\";s:9:\"timestamp\";i:1455288429;}', 'yes'),
(404, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:3:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:7:\"upgrade\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.4.2\";s:7:\"version\";s:5:\"4.4.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.4\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":12:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.4.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.4.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.4.2-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.4.2\";s:7:\"version\";s:5:\"4.4.2\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.4\";s:15:\"partial_version\";s:0:\"\";s:13:\"support_email\";s:26:\"updatehelp42@wordpress.org\";s:9:\"new_files\";s:1:\"1\";}i:2;O:8:\"stdClass\":12:{s:8:\"response\";s:10:\"autoupdate\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.3.3.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-4.3.3.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-4.3.3-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-4.3.3-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"4.3.3\";s:7:\"version\";s:5:\"4.3.3\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"4.4\";s:15:\"partial_version\";s:0:\"\";s:13:\"support_email\";s:26:\"updatehelp42@wordpress.org\";s:9:\"new_files\";s:1:\"1\";}}s:12:\"last_checked\";i:1456501974;s:15:\"version_checked\";s:5:\"4.2.7\";s:12:\"translations\";a:0:{}}', 'yes'),
(409, '_site_transient_timeout_theme_roots', '1456503775', 'yes'),
(410, '_site_transient_theme_roots', 'a:4:{s:16:\"abs-template-uwl\";s:7:\"/themes\";s:13:\"twentyfifteen\";s:7:\"/themes\";s:14:\"twentyfourteen\";s:7:\"/themes\";s:14:\"twentythirteen\";s:7:\"/themes\";}', 'yes'),
(411, '_site_transient_update_themes', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1456501976;s:7:\"checked\";a:4:{s:16:\"abs-template-uwl\";s:0:\"\";s:13:\"twentyfifteen\";s:3:\"1.2\";s:14:\"twentyfourteen\";s:3:\"1.4\";s:14:\"twentythirteen\";s:3:\"1.5\";}s:8:\"response\";a:3:{s:13:\"twentyfifteen\";a:4:{s:5:\"theme\";s:13:\"twentyfifteen\";s:11:\"new_version\";s:3:\"1.4\";s:3:\"url\";s:43:\"https://wordpress.org/themes/twentyfifteen/\";s:7:\"package\";s:59:\"https://downloads.wordpress.org/theme/twentyfifteen.1.4.zip\";}s:14:\"twentyfourteen\";a:4:{s:5:\"theme\";s:14:\"twentyfourteen\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentyfourteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentyfourteen.1.6.zip\";}s:14:\"twentythirteen\";a:4:{s:5:\"theme\";s:14:\"twentythirteen\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentythirteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentythirteen.1.7.zip\";}}s:12:\"translations\";a:0:{}}', 'yes'),
(412, '_site_transient_update_plugins', 'O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1456501976;s:8:\"response\";a:2:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:2:\"15\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"3.1.7\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.3.1.7.zip\";}s:27:\"wp-subtitle/wp-subtitle.php\";O:8:\"stdClass\":7:{s:2:\"id\";s:4:\"9012\";s:4:\"slug\";s:11:\"wp-subtitle\";s:6:\"plugin\";s:27:\"wp-subtitle/wp-subtitle.php\";s:11:\"new_version\";s:3:\"2.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/wp-subtitle/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/wp-subtitle.2.6.zip\";s:14:\"upgrade_notice\";s:126:\"Added quick edit support for subtitle. Security Update: Sanitize $_REQUEST and $_GET when establishing post type in the admin.\";}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:1:{s:9:\"hello.php\";O:8:\"stdClass\":6:{s:2:\"id\";s:4:\"3564\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:3:\"1.6\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/plugin/hello-dolly.1.6.zip\";}}}', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `fahim_postmeta`
--

CREATE TABLE `fahim_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_postmeta`
--

INSERT INTO `fahim_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 4, '_menu_item_type', 'custom'),
(3, 4, '_menu_item_menu_item_parent', '0'),
(4, 4, '_menu_item_object_id', '4'),
(5, 4, '_menu_item_object', 'custom'),
(6, 4, '_menu_item_target', ''),
(7, 4, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(8, 4, '_menu_item_xfn', ''),
(9, 4, '_menu_item_url', 'http://localhost/abs/'),
(10, 4, '_menu_item_orphaned', '1436770844'),
(11, 5, '_menu_item_type', 'post_type'),
(12, 5, '_menu_item_menu_item_parent', '0'),
(13, 5, '_menu_item_object_id', '2'),
(14, 5, '_menu_item_object', 'page'),
(15, 5, '_menu_item_target', ''),
(16, 5, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(17, 5, '_menu_item_xfn', ''),
(18, 5, '_menu_item_url', ''),
(19, 5, '_menu_item_orphaned', '1436770844'),
(50, 9, '_edit_last', '1'),
(51, 9, '_edit_lock', '1436773922:1'),
(54, 9, '_wpb_vc_js_status', 'false'),
(55, 9, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(56, 9, 'vc_teaser', 'a:2:{s:4:\"data\";s:115:\"[{\"name\":\"title\",\"link\":\"post\"},{\"name\":\"image\",\"image\":\"featured\",\"link\":\"none\"},{\"name\":\"text\",\"mode\":\"excerpt\"}]\";s:7:\"bgcolor\";s:0:\"\";}'),
(57, 11, '_edit_last', '1'),
(58, 11, '_edit_lock', '1436773941:1'),
(61, 11, '_wpb_vc_js_status', 'false'),
(62, 11, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(63, 11, 'vc_teaser', 'a:2:{s:4:\"data\";s:115:\"[{\"name\":\"title\",\"link\":\"post\"},{\"name\":\"image\",\"image\":\"featured\",\"link\":\"none\"},{\"name\":\"text\",\"mode\":\"excerpt\"}]\";s:7:\"bgcolor\";s:0:\"\";}'),
(64, 13, '_edit_last', '1'),
(65, 13, '_edit_lock', '1436863059:1'),
(68, 13, '_wpb_vc_js_status', 'false'),
(69, 13, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(70, 13, 'vc_teaser', 'a:2:{s:4:\"data\";s:115:\"[{\"name\":\"title\",\"link\":\"post\"},{\"name\":\"image\",\"image\":\"featured\",\"link\":\"none\"},{\"name\":\"text\",\"mode\":\"excerpt\"}]\";s:7:\"bgcolor\";s:0:\"\";}'),
(71, 18, '_edit_last', '1'),
(72, 18, '_edit_lock', '1436774644:1'),
(73, 18, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(74, 19, '_edit_last', '1'),
(75, 19, '_edit_lock', '1436774657:1'),
(76, 19, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(77, 20, '_edit_last', '1'),
(78, 20, '_edit_lock', '1436775255:1'),
(79, 20, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(80, 23, '_wp_attached_file', '2015/07/95x95-2.png'),
(81, 23, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:95;s:6:\"height\";i:95;s:4:\"file\";s:19:\"2015/07/95x95-2.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:0;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}'),
(82, 22, '_thumbnail_id', '23'),
(83, 22, '_edit_last', '1'),
(84, 22, '_edit_lock', '1436777576:1'),
(85, 22, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(86, 22, 'wps_subtitle', 'Person TItle'),
(87, 24, '_wp_attached_file', '2015/07/Lighthouse.jpg'),
(88, 24, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1024;s:6:\"height\";i:768;s:4:\"file\";s:22:\"2015/07/Lighthouse.jpg\";s:5:\"sizes\";a:6:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:22:\"Lighthouse-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:22:\"Lighthouse-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:23:\"Lighthouse-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:14:\"post-thumbnail\";a:4:{s:4:\"file\";s:22:\"Lighthouse-350x250.jpg\";s:5:\"width\";i:350;s:6:\"height\";i:250;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:15:\"testamonial-img\";a:4:{s:4:\"file\";s:20:\"Lighthouse-95x95.jpg\";s:5:\"width\";i:95;s:6:\"height\";i:95;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"large_img\";a:4:{s:4:\"file\";s:23:\"Lighthouse-1024x500.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:500;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";i:0;s:6:\"credit\";s:10:\"Tom Alphin\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:1202729571;s:9:\"copyright\";s:24:\"© Microsoft Corporation\";s:12:\"focal_length\";i:0;s:3:\"iso\";i:0;s:13:\"shutter_speed\";i:0;s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:0;}}'),
(89, 13, '_thumbnail_id', '24'),
(92, 13, 'wps_subtitle', ''),
(93, 25, '_menu_item_type', 'custom'),
(94, 25, '_menu_item_menu_item_parent', '0'),
(95, 25, '_menu_item_object_id', '25'),
(96, 25, '_menu_item_object', 'custom'),
(97, 25, '_menu_item_target', ''),
(98, 25, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(99, 25, '_menu_item_xfn', ''),
(100, 25, '_menu_item_url', 'http://abidinggroupbd.com/abs'),
(102, 26, '_menu_item_type', 'post_type'),
(103, 26, '_menu_item_menu_item_parent', '0'),
(104, 26, '_menu_item_object_id', '13'),
(105, 26, '_menu_item_object', 'post'),
(106, 26, '_menu_item_target', ''),
(107, 26, '_menu_item_classes', 'a:1:{i:0;s:8:\"dropdown\";}'),
(108, 26, '_menu_item_xfn', ''),
(109, 26, '_menu_item_url', ''),
(111, 27, '_menu_item_type', 'post_type'),
(112, 27, '_menu_item_menu_item_parent', '26'),
(113, 27, '_menu_item_object_id', '11'),
(114, 27, '_menu_item_object', 'post'),
(115, 27, '_menu_item_target', ''),
(116, 27, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(117, 27, '_menu_item_xfn', ''),
(118, 27, '_menu_item_url', ''),
(120, 28, '_menu_item_type', 'post_type'),
(121, 28, '_menu_item_menu_item_parent', '26'),
(122, 28, '_menu_item_object_id', '9'),
(123, 28, '_menu_item_object', 'post'),
(124, 28, '_menu_item_target', ''),
(125, 28, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(126, 28, '_menu_item_xfn', ''),
(127, 28, '_menu_item_url', ''),
(129, 25, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(130, 26, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(131, 27, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(132, 28, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(133, 29, '_edit_last', '1'),
(134, 29, '_wpb_vc_js_status', 'false'),
(135, 29, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(136, 29, 'wps_subtitle', ''),
(137, 29, 'vc_teaser', 'a:2:{s:4:\"data\";s:115:\"[{\"name\":\"title\",\"link\":\"post\"},{\"name\":\"image\",\"image\":\"featured\",\"link\":\"none\"},{\"name\":\"text\",\"mode\":\"excerpt\"}]\";s:7:\"bgcolor\";s:0:\"\";}'),
(138, 29, '_edit_lock', '1436865580:1'),
(139, 31, '_menu_item_type', 'post_type'),
(140, 31, '_menu_item_menu_item_parent', '0'),
(141, 31, '_menu_item_object_id', '29'),
(142, 31, '_menu_item_object', 'page'),
(143, 31, '_menu_item_target', ''),
(144, 31, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(145, 31, '_menu_item_xfn', ''),
(146, 31, '_menu_item_url', ''),
(147, 31, '_menu_item_orphaned', '1436865711'),
(148, 32, '_menu_item_type', 'post_type'),
(149, 32, '_menu_item_menu_item_parent', '0'),
(150, 32, '_menu_item_object_id', '20'),
(151, 32, '_menu_item_object', 'services'),
(152, 32, '_menu_item_target', ''),
(153, 32, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(154, 32, '_menu_item_xfn', ''),
(155, 32, '_menu_item_url', ''),
(156, 32, '_menu_item_orphaned', '1436865718'),
(157, 33, '_menu_item_type', 'post_type'),
(158, 33, '_menu_item_menu_item_parent', '0'),
(159, 33, '_menu_item_object_id', '19'),
(160, 33, '_menu_item_object', 'services'),
(161, 33, '_menu_item_target', ''),
(162, 33, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(163, 33, '_menu_item_xfn', ''),
(164, 33, '_menu_item_url', ''),
(165, 33, '_menu_item_orphaned', '1436865718'),
(166, 34, '_menu_item_type', 'post_type'),
(167, 34, '_menu_item_menu_item_parent', '0'),
(168, 34, '_menu_item_object_id', '18'),
(169, 34, '_menu_item_object', 'services'),
(170, 34, '_menu_item_target', ''),
(171, 34, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(172, 34, '_menu_item_xfn', ''),
(173, 34, '_menu_item_url', ''),
(174, 34, '_menu_item_orphaned', '1436865718'),
(175, 35, '_edit_last', '1'),
(176, 35, '_edit_lock', '1436865717:1'),
(177, 35, '_wpb_vc_js_status', 'false'),
(178, 35, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(179, 35, 'wps_subtitle', ''),
(180, 35, 'vc_teaser', 'a:2:{s:4:\"data\";s:115:\"[{\"name\":\"title\",\"link\":\"post\"},{\"name\":\"image\",\"image\":\"featured\",\"link\":\"none\"},{\"name\":\"text\",\"mode\":\"excerpt\"}]\";s:7:\"bgcolor\";s:0:\"\";}'),
(181, 37, '_menu_item_type', 'post_type'),
(182, 37, '_menu_item_menu_item_parent', '0'),
(183, 37, '_menu_item_object_id', '35'),
(184, 37, '_menu_item_object', 'page'),
(185, 37, '_menu_item_target', ''),
(186, 37, '_menu_item_classes', 'a:1:{i:0;s:8:\"dropdown\";}'),
(187, 37, '_menu_item_xfn', ''),
(188, 37, '_menu_item_url', ''),
(190, 38, '_menu_item_type', 'post_type'),
(191, 38, '_menu_item_menu_item_parent', '37'),
(192, 38, '_menu_item_object_id', '20'),
(193, 38, '_menu_item_object', 'services'),
(194, 38, '_menu_item_target', ''),
(195, 38, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(196, 38, '_menu_item_xfn', ''),
(197, 38, '_menu_item_url', ''),
(199, 39, '_menu_item_type', 'post_type'),
(200, 39, '_menu_item_menu_item_parent', '37'),
(201, 39, '_menu_item_object_id', '19'),
(202, 39, '_menu_item_object', 'services'),
(203, 39, '_menu_item_target', ''),
(204, 39, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(205, 39, '_menu_item_xfn', ''),
(206, 39, '_menu_item_url', ''),
(208, 40, '_menu_item_type', 'post_type'),
(209, 40, '_menu_item_menu_item_parent', '37'),
(210, 40, '_menu_item_object_id', '18'),
(211, 40, '_menu_item_object', 'services'),
(212, 40, '_menu_item_target', ''),
(213, 40, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(214, 40, '_menu_item_xfn', ''),
(215, 40, '_menu_item_url', ''),
(217, 41, '_menu_item_type', 'post_type'),
(218, 41, '_menu_item_menu_item_parent', '0'),
(219, 41, '_menu_item_object_id', '29'),
(220, 41, '_menu_item_object', 'page'),
(221, 41, '_menu_item_target', ''),
(222, 41, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(223, 41, '_menu_item_xfn', ''),
(224, 41, '_menu_item_url', ''),
(226, 37, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(227, 38, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(228, 39, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(229, 40, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(230, 41, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(231, 42, '_menu_item_type', 'post_type'),
(232, 42, '_menu_item_menu_item_parent', '0'),
(233, 42, '_menu_item_object_id', '20'),
(234, 42, '_menu_item_object', 'services'),
(235, 42, '_menu_item_target', ''),
(236, 42, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(237, 42, '_menu_item_xfn', ''),
(238, 42, '_menu_item_url', ''),
(240, 43, '_menu_item_type', 'post_type'),
(241, 43, '_menu_item_menu_item_parent', '0'),
(242, 43, '_menu_item_object_id', '19'),
(243, 43, '_menu_item_object', 'services'),
(244, 43, '_menu_item_target', ''),
(245, 43, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(246, 43, '_menu_item_xfn', ''),
(247, 43, '_menu_item_url', ''),
(249, 44, '_menu_item_type', 'post_type'),
(250, 44, '_menu_item_menu_item_parent', '0'),
(251, 44, '_menu_item_object_id', '18'),
(252, 44, '_menu_item_object', 'services'),
(253, 44, '_menu_item_target', ''),
(254, 44, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(255, 44, '_menu_item_xfn', ''),
(256, 44, '_menu_item_url', ''),
(258, 45, '_menu_item_type', 'post_type'),
(259, 45, '_menu_item_menu_item_parent', '0'),
(260, 45, '_menu_item_object_id', '13'),
(261, 45, '_menu_item_object', 'post'),
(262, 45, '_menu_item_target', ''),
(263, 45, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(264, 45, '_menu_item_xfn', ''),
(265, 45, '_menu_item_url', ''),
(267, 46, '_menu_item_type', 'post_type'),
(268, 46, '_menu_item_menu_item_parent', '0'),
(269, 46, '_menu_item_object_id', '11'),
(270, 46, '_menu_item_object', 'post'),
(271, 46, '_menu_item_target', ''),
(272, 46, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(273, 46, '_menu_item_xfn', ''),
(274, 46, '_menu_item_url', ''),
(276, 47, '_menu_item_type', 'post_type'),
(277, 47, '_menu_item_menu_item_parent', '0'),
(278, 47, '_menu_item_object_id', '9'),
(279, 47, '_menu_item_object', 'post'),
(280, 47, '_menu_item_target', ''),
(281, 47, '_menu_item_classes', 'a:1:{i:0;s:0:\"\";}'),
(282, 47, '_menu_item_xfn', ''),
(283, 47, '_menu_item_url', ''),
(285, 42, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(286, 43, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(287, 44, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(288, 45, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(289, 46, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}'),
(290, 47, '_vc_post_settings', 'a:1:{s:7:\"vc_grid\";a:0:{}}');

-- --------------------------------------------------------

--
-- Table structure for table `fahim_posts`
--

CREATE TABLE `fahim_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_posts`
--

INSERT INTO `fahim_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2015-07-13 05:45:24', '2015-07-13 05:45:24', 'Welcome to WordPress. This is your first post. Edit or delete it, then start blogging!', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2015-07-13 05:45:24', '2015-07-13 05:45:24', '', 0, 'http://localhost/abs/?p=1', 0, 'post', '', 1),
(2, 1, '2015-07-13 05:45:24', '2015-07-13 05:45:24', 'This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my blog. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/abs/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!', 'Sample Page', '', 'publish', 'open', 'open', '', 'sample-page', '', '', '2015-07-13 05:45:24', '2015-07-13 05:45:24', '', 0, 'http://localhost/abs/?page_id=2', 0, 'page', '', 0),
(4, 1, '2015-07-13 07:00:42', '0000-00-00 00:00:00', '', 'Home', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-13 07:00:42', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=4', 1, 'nav_menu_item', '', 0),
(5, 1, '2015-07-13 07:00:44', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-13 07:00:44', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=5', 1, 'nav_menu_item', '', 0),
(9, 1, '2015-07-13 07:54:21', '2015-07-13 07:54:21', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'Welcome To ABS', '', 'publish', 'open', 'open', '', 'welcome-to-abs', '', '', '2015-07-13 07:54:21', '2015-07-13 07:54:21', '', 0, 'http://localhost/abs/?p=9', 0, 'post', '', 0),
(10, 1, '2015-07-13 07:54:21', '2015-07-13 07:54:21', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'Welcome To ABS', '', 'inherit', 'open', 'open', '', '9-revision-v1', '', '', '2015-07-13 07:54:21', '2015-07-13 07:54:21', '', 9, 'http://localhost/abs/2015/07/13/9-revision-v1/', 0, 'revision', '', 0),
(11, 1, '2015-07-13 07:54:40', '2015-07-13 07:54:40', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'Abiding Building System', '', 'publish', 'open', 'open', '', 'abiding-building-system', '', '', '2015-07-13 07:54:40', '2015-07-13 07:54:40', '', 0, 'http://localhost/abs/?p=11', 0, 'post', '', 0),
(12, 1, '2015-07-13 07:54:40', '2015-07-13 07:54:40', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'Abiding Building System', '', 'inherit', 'open', 'open', '', '11-revision-v1', '', '', '2015-07-13 07:54:40', '2015-07-13 07:54:40', '', 11, 'http://localhost/abs/2015/07/13/11-revision-v1/', 0, 'revision', '', 0),
(13, 1, '2015-07-13 07:54:56', '2015-07-13 07:54:56', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'About Us', '', 'publish', 'open', 'open', '', 'about-us', '', '', '2015-07-14 08:38:52', '2015-07-14 08:38:52', '', 0, 'http://localhost/abs/?p=13', 0, 'post', '', 0),
(14, 1, '2015-07-13 07:54:56', '2015-07-13 07:54:56', 'Enable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything againEnable distraction-free writing mode, and everything surrounding the editor will fade away when you start typing. Move your mouse out of the editor to reveal everything again', 'About Us', '', 'inherit', 'open', 'open', '', '13-revision-v1', '', '', '2015-07-13 07:54:56', '2015-07-13 07:54:56', '', 13, 'http://localhost/abs/2015/07/13/13-revision-v1/', 0, 'revision', '', 0),
(18, 1, '2015-07-13 08:06:26', '2015-07-13 08:06:26', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittis', 'Service One', '', 'publish', 'closed', 'closed', '', 'service-one', '', '', '2015-07-13 08:06:26', '2015-07-13 08:06:26', '', 0, 'http://localhost/abs/?post_type=services&#038;p=18', 0, 'services', '', 0),
(19, 1, '2015-07-13 08:06:38', '2015-07-13 08:06:38', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittis', 'Service Two', '', 'publish', 'closed', 'closed', '', 'service-two', '', '', '2015-07-13 08:06:38', '2015-07-13 08:06:38', '', 0, 'http://localhost/abs/?post_type=services&#038;p=19', 0, 'services', '', 0),
(20, 1, '2015-07-13 08:06:55', '2015-07-13 08:06:55', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eget imperdiet libero. Suspendisse sagittisimperdiet libero. Suspendisse sagittis', 'Service Three', '', 'publish', 'closed', 'closed', '', 'service-three', '', '', '2015-07-13 08:07:07', '2015-07-13 08:07:07', '', 0, 'http://localhost/abs/?post_type=services&#038;p=20', 0, 'services', '', 0),
(22, 1, '2015-07-13 08:26:17', '2015-07-13 08:26:17', 'his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.his field has moved from a meta box to below the post title.', 'Person Name', '', 'publish', 'closed', 'closed', '', 'person-name', '', '', '2015-07-13 08:26:17', '2015-07-13 08:26:17', '', 0, 'http://localhost/abs/?post_type=testamonial&#038;p=22', 0, 'testamonial', '', 0),
(23, 1, '2015-07-13 08:20:28', '2015-07-13 08:20:28', '', '95x95-2', '', 'inherit', 'open', 'open', '', '95x95-2', '', '', '2015-07-13 08:20:28', '2015-07-13 08:20:28', '', 22, 'http://localhost/abs/wp-content/uploads/2015/07/95x95-2.png', 0, 'attachment', 'image/png', 0),
(24, 1, '2015-07-14 08:38:47', '2015-07-14 08:38:47', '', 'Lighthouse', '', 'inherit', 'open', 'open', '', 'lighthouse', '', '', '2015-07-14 08:38:47', '2015-07-14 08:38:47', '', 13, 'http://localhost/abs/wp-content/uploads/2015/07/Lighthouse.jpg', 0, 'attachment', 'image/jpeg', 0),
(25, 1, '2015-07-14 09:21:06', '2015-07-14 09:21:06', '', 'Home', '', 'publish', 'open', 'open', '', 'home', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=25', 1, 'nav_menu_item', '', 0),
(26, 1, '2015-07-14 09:21:06', '2015-07-14 09:21:06', ' ', '', '', 'publish', 'open', 'open', '', '26', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=26', 2, 'nav_menu_item', '', 0),
(27, 1, '2015-07-14 09:21:06', '2015-07-14 09:21:06', ' ', '', '', 'publish', 'open', 'open', '', '27', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=27', 3, 'nav_menu_item', '', 0),
(28, 1, '2015-07-14 09:21:06', '2015-07-14 09:21:06', ' ', '', '', 'publish', 'open', 'open', '', '28', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=28', 4, 'nav_menu_item', '', 0),
(29, 1, '2015-07-14 09:21:30', '2015-07-14 09:21:30', '', 'Contuct Us', '', 'publish', 'open', 'open', '', 'contuct-us', '', '', '2015-07-14 09:21:30', '2015-07-14 09:21:30', '', 0, 'http://localhost/abs/?page_id=29', 0, 'page', '', 0),
(30, 1, '2015-07-14 09:21:30', '2015-07-14 09:21:30', '', 'Contuct Us', '', 'inherit', 'open', 'open', '', '29-revision-v1', '', '', '2015-07-14 09:21:30', '2015-07-14 09:21:30', '', 29, 'http://localhost/abs/2015/07/14/29-revision-v1/', 0, 'revision', '', 0),
(31, 1, '2015-07-14 09:21:51', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-14 09:21:51', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=31', 1, 'nav_menu_item', '', 0),
(32, 1, '2015-07-14 09:21:58', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-14 09:21:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=32', 1, 'nav_menu_item', '', 0),
(33, 1, '2015-07-14 09:21:58', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-14 09:21:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=33', 1, 'nav_menu_item', '', 0),
(34, 1, '2015-07-14 09:21:58', '0000-00-00 00:00:00', ' ', '', '', 'draft', 'open', 'open', '', '', '', '', '2015-07-14 09:21:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/abs/?p=34', 1, 'nav_menu_item', '', 0),
(35, 1, '2015-07-14 09:22:16', '2015-07-14 09:22:16', '', 'Our Services', '', 'publish', 'open', 'open', '', 'our-services', '', '', '2015-07-14 09:22:16', '2015-07-14 09:22:16', '', 0, 'http://localhost/abs/?page_id=35', 0, 'page', '', 0),
(36, 1, '2015-07-14 09:22:16', '2015-07-14 09:22:16', '', 'Our Services', '', 'inherit', 'open', 'open', '', '35-revision-v1', '', '', '2015-07-14 09:22:16', '2015-07-14 09:22:16', '', 35, 'http://localhost/abs/2015/07/14/35-revision-v1/', 0, 'revision', '', 0),
(37, 1, '2015-07-14 09:23:00', '2015-07-14 09:23:00', ' ', '', '', 'publish', 'open', 'open', '', '37', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=37', 5, 'nav_menu_item', '', 0),
(38, 1, '2015-07-14 09:23:00', '2015-07-14 09:23:00', ' ', '', '', 'publish', 'open', 'open', '', '38', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=38', 6, 'nav_menu_item', '', 0),
(39, 1, '2015-07-14 09:23:00', '2015-07-14 09:23:00', ' ', '', '', 'publish', 'open', 'open', '', '39', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=39', 7, 'nav_menu_item', '', 0),
(40, 1, '2015-07-14 09:23:00', '2015-07-14 09:23:00', ' ', '', '', 'publish', 'open', 'open', '', '40', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=40', 8, 'nav_menu_item', '', 0),
(41, 1, '2015-07-14 09:23:00', '2015-07-14 09:23:00', ' ', '', '', 'publish', 'open', 'open', '', '41', '', '', '2015-07-14 09:24:34', '2015-07-14 09:24:34', '', 0, 'http://localhost/abs/?p=41', 9, 'nav_menu_item', '', 0),
(42, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '42', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=42', 1, 'nav_menu_item', '', 0),
(43, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '43', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=43', 2, 'nav_menu_item', '', 0),
(44, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '44', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=44', 3, 'nav_menu_item', '', 0),
(45, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '45', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=45', 4, 'nav_menu_item', '', 0),
(46, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '46', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=46', 5, 'nav_menu_item', '', 0),
(47, 1, '2015-07-14 09:25:17', '2015-07-14 09:25:17', ' ', '', '', 'publish', 'open', 'open', '', '47', '', '', '2015-07-14 09:28:53', '2015-07-14 09:28:53', '', 0, 'http://abidinggroupbd.com/abs/?p=47', 6, 'nav_menu_item', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_terms`
--

CREATE TABLE `fahim_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_terms`
--

INSERT INTO `fahim_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'main-menu', 'main-menu', 0),
(3, 'top-three-block', 'top-three-block', 0),
(4, 'Quick Nav', 'quick-nav', 0);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_term_relationships`
--

CREATE TABLE `fahim_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_term_relationships`
--

INSERT INTO `fahim_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(9, 3, 0),
(11, 3, 0),
(13, 1, 0),
(13, 3, 0),
(25, 2, 0),
(26, 2, 0),
(27, 2, 0),
(28, 2, 0),
(37, 2, 0),
(38, 2, 0),
(39, 2, 0),
(40, 2, 0),
(41, 2, 0),
(42, 4, 0),
(43, 4, 0),
(44, 4, 0),
(45, 4, 0),
(46, 4, 0),
(47, 4, 0);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_term_taxonomy`
--

CREATE TABLE `fahim_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_term_taxonomy`
--

INSERT INTO `fahim_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 2),
(2, 2, 'nav_menu', '', 0, 9),
(3, 3, 'category', '', 0, 3),
(4, 4, 'nav_menu', '', 0, 6);

-- --------------------------------------------------------

--
-- Table structure for table `fahim_usermeta`
--

CREATE TABLE `fahim_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_usermeta`
--

INSERT INTO `fahim_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', ''),
(3, 1, 'last_name', ''),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'comment_shortcuts', 'false'),
(7, 1, 'admin_color', 'fresh'),
(8, 1, 'use_ssl', '0'),
(9, 1, 'show_admin_bar_front', 'true'),
(10, 1, 'fahim_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(11, 1, 'fahim_user_level', '10'),
(12, 1, 'dismissed_wp_pointers', 'wp360_locks,wp390_widgets,wp410_dfw,wps_subtitle_field_to_top'),
(13, 1, 'show_welcome_panel', '1'),
(14, 1, 'session_tokens', 'a:4:{s:64:\"ed3a24a22aee2a111248381363c7719ee0a056d79234be84dc9ff4bcbb0e9677\";a:4:{s:10:\"expiration\";i:1436939208;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36\";s:5:\"login\";i:1436766408;}s:64:\"4d6ff6e8664e16f1486051e5a53bbcc1b8ef86d2adbd21cf81d2fe2e81eae8cd\";a:4:{s:10:\"expiration\";i:1436946811;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36\";s:5:\"login\";i:1436774011;}s:64:\"10dd590a2401046ea836f974bcf328f0cea2d22c471c550a329fb4e1d33c4c92\";a:4:{s:10:\"expiration\";i:1437030158;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36\";s:5:\"login\";i:1436857358;}s:64:\"a237f1f2af4505ebd5e22ce286250ba925c9fb2a86001d5c988a22f87712766d\";a:4:{s:10:\"expiration\";i:1437038290;s:2:\"ip\";s:14:\"113.21.228.242\";s:2:\"ua\";s:102:\"Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36\";s:5:\"login\";i:1436865490;}}'),
(15, 1, 'fahim_dashboard_quick_press_last_post_id', '3'),
(16, 1, 'managenav-menuscolumnshidden', 'a:3:{i:0;s:11:\"link-target\";i:1;s:3:\"xfn\";i:2;s:11:\"description\";}'),
(17, 1, 'metaboxhidden_nav-menus', 'a:1:{i:0;s:12:\"add-post_tag\";}'),
(18, 1, 'nav_menu_recently_edited', '4'),
(19, 1, 'layerslider_help_wp_pointer', '1'),
(20, 1, 'fahim_user-settings', 'libraryContent=browse&editor=tinymce'),
(21, 1, 'fahim_user-settings-time', '1436863099'),
(22, 1, 'closedpostboxes_nav-menus', 'a:0:{}');

-- --------------------------------------------------------

--
-- Table structure for table `fahim_users`
--

CREATE TABLE `fahim_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fahim_users`
--

INSERT INTO `fahim_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$BWXD9vNRBD3mXW2AqMSGwHVbkBcVND/', 'admin', 'frihim.ist.cse@gmail.com', '', '2015-07-13 05:45:23', '', 0, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fahim_commentmeta`
--
ALTER TABLE `fahim_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fahim_comments`
--
ALTER TABLE `fahim_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10));

--
-- Indexes for table `fahim_layerslider`
--
ALTER TABLE `fahim_layerslider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fahim_links`
--
ALTER TABLE `fahim_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `fahim_nextend_smartslider_layouts`
--
ALTER TABLE `fahim_nextend_smartslider_layouts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fahim_nextend_smartslider_sliders`
--
ALTER TABLE `fahim_nextend_smartslider_sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fahim_nextend_smartslider_slides`
--
ALTER TABLE `fahim_nextend_smartslider_slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fahim_nextend_smartslider_storage`
--
ALTER TABLE `fahim_nextend_smartslider_storage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Indexes for table `fahim_options`
--
ALTER TABLE `fahim_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `fahim_postmeta`
--
ALTER TABLE `fahim_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fahim_posts`
--
ALTER TABLE `fahim_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `fahim_terms`
--
ALTER TABLE `fahim_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `fahim_term_relationships`
--
ALTER TABLE `fahim_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `fahim_term_taxonomy`
--
ALTER TABLE `fahim_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `fahim_usermeta`
--
ALTER TABLE `fahim_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `fahim_users`
--
ALTER TABLE `fahim_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fahim_commentmeta`
--
ALTER TABLE `fahim_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fahim_comments`
--
ALTER TABLE `fahim_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fahim_layerslider`
--
ALTER TABLE `fahim_layerslider`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `fahim_links`
--
ALTER TABLE `fahim_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fahim_nextend_smartslider_layouts`
--
ALTER TABLE `fahim_nextend_smartslider_layouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fahim_nextend_smartslider_sliders`
--
ALTER TABLE `fahim_nextend_smartslider_sliders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fahim_nextend_smartslider_slides`
--
ALTER TABLE `fahim_nextend_smartslider_slides`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fahim_nextend_smartslider_storage`
--
ALTER TABLE `fahim_nextend_smartslider_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fahim_options`
--
ALTER TABLE `fahim_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=413;

--
-- AUTO_INCREMENT for table `fahim_postmeta`
--
ALTER TABLE `fahim_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=291;

--
-- AUTO_INCREMENT for table `fahim_posts`
--
ALTER TABLE `fahim_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `fahim_terms`
--
ALTER TABLE `fahim_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fahim_term_taxonomy`
--
ALTER TABLE `fahim_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `fahim_usermeta`
--
ALTER TABLE `fahim_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `fahim_users`
--
ALTER TABLE `fahim_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
