-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2023 at 06:14 AM
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
-- Database: `abidingg_adhl`
--

-- --------------------------------------------------------

--
-- Table structure for table `a`
--

CREATE TABLE `a` (
  `id` int(11) NOT NULL,
  `a` text NOT NULL,
  `visual` text NOT NULL,
  `comment` text NOT NULL,
  `page_id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `category` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `priority` int(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_vs_text_data`
--

CREATE TABLE `category_vs_text_data` (
  `id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dated`
--

CREATE TABLE `dated` (
  `id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `dated` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `download`
--

CREATE TABLE `download` (
  `id` int(11) NOT NULL,
  `downloadtype_id` int(11) NOT NULL,
  `title` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `downloadtype`
--

CREATE TABLE `downloadtype` (
  `id` int(11) NOT NULL,
  `downloadtype` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phpcheck` varchar(400) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `downloadtype`
--

INSERT INTO `downloadtype` (`id`, `downloadtype`, `phpcheck`) VALUES
(1, '.pdf', 'application/pdf'),
(2, '.doc', 'application/msword'),
(3, '.zip', 'application/zip'),
(4, '.docx', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document');

-- --------------------------------------------------------

--
-- Table structure for table `featured`
--

CREATE TABLE `featured` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `text_data_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `featured`
--

INSERT INTO `featured` (`id`, `text_data_id`) VALUES
(1, 9),
(2, 179),
(3, 219),
(4, 220),
(5, 131),
(6, 122),
(7, 79),
(8, 136),
(9, 142),
(10, 143);

-- --------------------------------------------------------

--
-- Table structure for table `fixedtext`
--

CREATE TABLE `fixedtext` (
  `id` int(11) NOT NULL,
  `fixedtext` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fixedtext`
--

INSERT INTO `fixedtext` (`id`, `fixedtext`) VALUES
(1, 'Abiding Development and Holdings Limited'),
(2, 'Abiding Development and Holdings Limited - Dreams Made Real - A unit of Abiding Group'),
(3, '<p>Abiding Development &amp; Holdings Limited (ADHL) is a leading name in quality development in the field of real estate, having nationwide operation. ADHL is the Unique Solution of the Peaceful &amp; Joyful accommodation problem of 21st century. Our aspiration is to desire a better and secured shelter for everybody. ADHL sharing with you to make real of your dream and can ensure you of our all efforts to build for you a hazardless, secured, and lovely home with honesty and sincerity. <br />ADHL always conscious about your investment, which you have earned with the sweat of brow. You will try to have maximum facilities against your investment and we always appreciate your desire. That\'s why a team of highly qualified Management personnel, experienced Architect and Engineers are always equipped to act to prove their job with sincerity &amp; honesty to the honorable clients, society and environment. We believe that a valued client is our best advertiser. <br />By the grace of almighty Allah expend a few years as a developing company ADHL is known as a reputed Real estate company in the country. <br />Thanks to our valued clients and trusted partners who have constantly support to us. ADHL takes pride in being a premier real estate development company that has successfully turned the dreams of many more across the length and breadth of our country into reality. </p>'),
(4, 'adhl.abidinggroupbd.com'),
(5, 'adhl@abidinggroupbd.com'),
(6, 'Dreams Made Real'),
(7, 'https://www.facebook.com/pages/Abiding-Development-Holding-Ltd/1495885853965848');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `id` int(11) NOT NULL,
  `caption` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `page_id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL,
  `imgtype_id` int(11) NOT NULL,
  `link` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `border` tinyint(4) NOT NULL DEFAULT 1,
  `priority` int(3) UNSIGNED NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `img`
--

INSERT INTO `img` (`id`, `caption`, `page_id`, `text_data_id`, `imgtype_id`, `link`, `border`, `priority`) VALUES
(27, 'NELOY', 2, 8, 1, '', 1, 0),
(28, 'Preview', 2, 9, 1, '', 0, 100),
(32, '1', 2, 9, 1, '', 1, 50),
(33, '2', 2, 9, 1, '', 1, 96),
(34, '3', 2, 9, 1, '', 1, 50),
(35, '4', 2, 9, 1, '', 1, 50),
(36, '5', 2, 9, 1, '', 1, 50),
(37, '6', 2, 9, 1, '', 1, 50),
(38, '7', 2, 9, 1, '', 1, 50),
(39, '8', 2, 9, 1, '', 1, 50),
(40, '9', 2, 9, 1, '', 1, 50),
(114, 'COVER', 2, 7, 1, '', 1, 50),
(115, 'LOCATION MAP', 2, 7, 1, '', 1, 50),
(116, 'PROJECT AT A GLANCE', 2, 7, 1, '', 1, 50),
(117, 'PARKING', 2, 7, 1, '', 1, 50),
(118, 'TYPICAL FLOOR PLAN', 2, 7, 1, '', 1, 50),
(119, 'TYPE A PLAN', 2, 7, 1, '', 1, 50),
(120, 'TYPE B PLAN', 2, 7, 1, '', 1, 50),
(141, 'Twin Homes', 2, 7, 1, '', 1, 100),
(437, 'Managing Director', 9, 212, 1, '', 1, 50),
(438, 'Director Operation', 9, 213, 1, '', 1, 50),
(439, 'Director Marketing', 9, 214, 1, '', 1, 50),
(440, 'Assesment', 0, 0, 1, '', 0, 98),
(441, 'Changing', 0, 0, 1, '', 0, 99),
(442, 'Design', 0, 0, 1, '', 0, 97),
(443, 'Dreams', 0, 0, 1, '', 0, 100),
(446, 'Proper Construction', 1, 209, 1, '', 0, 50),
(447, 'Eco Friendly Environments', 1, 209, 1, '', 0, 50),
(448, 'ADHL Official Logo', 1, 208, 3, '', 0, 50),
(449, 'Proper Documentation ', 1, 210, 1, '', 0, 50),
(450, 'Proper Handover', 1, 210, 1, '', 0, 50),
(452, 'Abiding Twin Homes', 2, 215, 3, 'http://adhl.abidinggroupbd.com/index.php?page=ongoing_projects&&data_id=215', 1, 50),
(453, 'Abiding Noor Castle', 2, 216, 3, 'http://adhl.abidinggroupbd.com/index.php?page=ongoing_projects&&data_id=216', 1, 50),
(454, 'Abiding Habib Garden', 2, 217, 3, 'adhl.abidinggroupbd.com/index.php?page=ongoing_projects&&data_id=217', 1, 50),
(455, 'Abiding Twin Homes', 2, 215, 1, '', 1, 50),
(456, 'Abiding Noor Castle', 2, 216, 2, '', 1, 50),
(457, 'Abiding Habib Garden', 2, 217, 1, '', 1, 50),
(458, 'Abiding Afsun Cottage', 2, 218, 1, '', 1, 31),
(459, 'Abiding Afsun Cottage', 2, 218, 1, '', 1, 50),
(461, 'Abiding S.S. Palace', 2, 219, 3, '', 1, 50),
(462, 'Abiding S S Palace', 2, 219, 3, '', 1, 56),
(463, 'Abiding Nirjhor', 3, 221, 3, '', 1, 50),
(464, 'Abiding Nirjhor', 3, 221, 3, '', 1, 50),
(465, 'Abiding Reza Tower', 4, 224, 3, '', 1, 50),
(466, 'Abiding Reza Tower', 4, 224, 3, '', 1, 50),
(467, 'Abiding Nirjhor', 2, 221, 3, '', 1, 50),
(468, 'Abiding Nirjhor', 2, 221, 3, '', 1, 50),
(469, 'Abiding Habib Garden', 4, 217, 3, '', 1, 50),
(470, 'Abiding Habib Garden', 4, 217, 3, '', 1, 50),
(471, 'Abiding Afsun Cottage', 4, 218, 3, '', 1, 50),
(472, 'Abiding Afsun Cottage', 4, 218, 3, '', 1, 50),
(473, 'Abiding Molla Tower', 4, 225, 3, '', 1, 50),
(474, 'Abiding Molla Tower', 4, 225, 3, '', 1, 50),
(475, 'Abiding Neela', 4, 226, 3, '', 1, 50),
(476, 'Abiding Neela', 4, 226, 3, '', 1, 50),
(477, 'Abiding Afsar Garden', 4, 227, 3, '', 1, 50),
(478, 'Abiding Afsar Garden', 4, 227, 3, '', 1, 50),
(479, 'Abiding Rose Bud', 4, 228, 3, '', 1, 50),
(480, 'Abiding Rose Bud', 4, 228, 3, '', 1, 50),
(481, 'Abiding Nijhum', 4, 229, 3, '', 1, 50),
(482, 'Abiding Nijhum', 4, 229, 3, '', 1, 50),
(483, 'Abiding Kibrin', 4, 230, 3, '', 1, 50),
(484, 'Abiding Kibrin', 4, 230, 3, '', 1, 50);

-- --------------------------------------------------------

--
-- Table structure for table `imgtype`
--

CREATE TABLE `imgtype` (
  `id` int(11) NOT NULL,
  `imgtype` varchar(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `phpcheck` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `imgtype`
--

INSERT INTO `imgtype` (`id`, `imgtype`, `phpcheck`) VALUES
(1, '.jpg', 'image/jpeg'),
(2, '.gif', 'image/gif'),
(3, '.png', 'image/png');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `subject` varchar(200) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`id`, `date`, `subject`, `message`) VALUES
(3, '2010-03-20', 'Nahin seeking appointment', 'Nahin is seeking an appointment on 2010-3-20.\nThe cellnumber of Nahin is 012123132\nand E-mail address is qazinahin@sdfs.sdsc .'),
(4, '2013-05-12', 'Testing email Script', ' Name : Nahin\n Company : Unique Webers\n E-mail : qazinahin@yahoo.com\n\nThis is Nahin I am Just testing the mailing script. Please Ignore this message. '),
(5, '2013-05-12', 'Testing email Script', ' Name : Nahin\n Company : Unique Webers\n E-mail : qazinahin@yahoo.com\n\nThis is Nahin I am Just testing the mailing script. Please Ignore this message. '),
(6, '2013-05-12', 'Testing email Script 2', ' Name : Nahin\n Company : Unique Webers\n E-mail : qazinahin@yahoo.com\n\nThis is Nahin I am Just testing the mailing script again. Please Ignore this message. '),
(7, '2013-05-12', 'Testing Team Page Mailing Script', ' Name : Nahin\n E-mail : qazinahin@yahoo.com\n\nThis is Nahin I am Just testing the mailing script og the team page. Please Ignore this message. '),
(8, '2013-07-11', 'JzggKjINCCHq', ' Name : yjygmhdr\n Company : kTyfIeoWUGSpz\n E-mail : wvqwub@ywrobm.com\n\nQnDAwo  &lt;a href=&quot;http://heiyaalqfobu.com/&quot;&gt;heiyaalqfobu&lt;/a&gt;, [url=http://tgkuscjukrrx.com/]tgkuscjukrrx[/url], [link=http://cvcacowzkjvt.com/]cvcacowzkjvt[/link], http://lactjydztzym.com/'),
(9, '2013-07-11', 'JzggKjINCCHq', ' Name : yjygmhdr\n Company : kTyfIeoWUGSpz\n E-mail : wvqwub@ywrobm.com\n\nQnDAwo  &lt;a href=&quot;http://heiyaalqfobu.com/&quot;&gt;heiyaalqfobu&lt;/a&gt;, [url=http://tgkuscjukrrx.com/]tgkuscjukrrx[/url], [link=http://cvcacowzkjvt.com/]cvcacowzkjvt[/link], http://lactjydztzym.com/'),
(10, '2014-05-18', 'Testing', ' Name : Qainahin\n Company : Unique webers\n E-mail : qazinahin@yahoo.com\n\nJust testing the mailing script'),
(11, '2014-06-25', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : I want home delivery\n\nOrdered : Classic Piano'),
(12, '2014-06-25', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur Dhaka\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : I want home delivery\n\nOrdered : Classic Piano'),
(13, '2014-06-25', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : Just Ordering\n\nOrdered : Electric guitar Model 1456'),
(14, '2014-07-04', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Nahin\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 011990986852\n\nBooking Description : I want Some\n\nOrdered : Electric guitar Model 1456'),
(15, '2014-07-04', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Nahin\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 011990986852\n\nBooking Description : I want Some\n\nOrdered : Electric guitar Model 1456'),
(16, '2014-07-06', 'PRODUCT ORDER FROM SITE', ' Name : MD AMAN CHOWDHURY\n Address : NEW ELEPHANT ROAD,DHAKA\n E-mail : cvcon.aman@gmail.com\n Country : Bangladesh\n Phone : 01715413113\n\nBooking Description : Nothing but check the web condition.\r\nAman.\n\nOrdered : Electric guitar Model 1456'),
(17, '2014-07-06', 'PRODUCT ORDER FROM SITE', ' Name : MD AMAN CHOWDHURY\n Address : NEW ELEPHANT ROAD,DHAKA\n E-mail : cvcon.aman@gmail.com\n Country : Bangladesh\n Phone : 01715413113\n\nBooking Description : Nothing but check the web condition.\r\nAman.\n\nOrdered : Electric guitar Model 1456'),
(18, '2014-07-06', 'PRODUCT ORDER FROM SITE', ' Name : MD AMAN CHOWDHURY\n Address : NEW ELEPHANT ROAD,DHAKA\n E-mail : cvcon.aman@gmail.com\n Country : Bangladesh\n Phone : 01715413113\n\nBooking Description : Nothing but check the web condition.\r\nAman.\n\nOrdered : Electric guitar Model 1456'),
(19, '2014-07-06', 'PRODUCT ORDER FROM SITE', ' Name : MD AMAN CHOWDHURY\n Address : NEW ELEPHANT ROAD,DHAKA\n E-mail : cvcon.aman@gmail.com\n Country : Bangladesh\n Phone : 01715413113\n\nBooking Description : Nothing but check the web condition.\r\nAman.\n\nOrdered : Electric guitar Model 1456'),
(20, '2014-07-07', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : guiter\n\nOrdered : Electric guitar Model 1456'),
(21, '2014-07-08', 'PRODUCT ORDER FROM SITE', ' Name : yy\n Address : ugfxsjkbc hhhk hui\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone :  01717178535\n\nBooking Description : Fjcif\n\nOrdered : Guitars accessories Set 4561'),
(22, '2014-07-11', 'PRODUCT ORDER FROM SITE', ' Name : tuhd\n Address : fjo\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone : 01670868856\n\nBooking Description : Hi\n\nOrdered : Classic Piano'),
(23, '2014-07-12', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : \n\nOrdered : Electric guitar Model 1456'),
(24, '2014-07-12', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : \n\nOrdered : Electric guitar Model 1456'),
(25, '2014-07-16', 'PRODUCT ORDER FROM SITE', ' Name : fkjxhj\n Address : dgkkgd\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone :  01670868856\n\nBooking Description : Hi\n\nOrdered : Acoustic guitar Model 55561'),
(26, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : nahin\n Address : dhaka\n E-mail : imran.tariqul@gmail.com\n Country : Bangladesh\n Phone : 01617040402\n\nBooking Description : thisisisisiisisis\n\nOrdered : Electric guitar Model 5372'),
(27, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : nahin\n Address : dhaka\n E-mail : imran.tariqul@gmail.com\n Country : Bangladesh\n Phone : 01617040402\n\nBooking Description : ghfghfhvdfh\n\nOrdered : Electric guitar Model 5372'),
(28, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : nahin\n Address : dhaka\n E-mail : imran.tariqul@gmail.com\n Country : Bangladesh\n Phone : 01617040402\n\nBooking Description : ghfghfhvdfh\n\nOrdered : Electric guitar Model 5372'),
(29, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : nahin\n Address : dhaka\n E-mail : imran.tariqul@gmail.com\n Country : Bangladesh\n Phone : 01617040402\n\nBooking Description : ghfghfhvdfh\n\nOrdered : Electric guitar Model 5372'),
(30, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : nahin\n Address : dhaka\n E-mail : imran.tariqul@gmail.com\n Country : Bangladesh\n Phone : 01617040402\n\nBooking Description : fhfhfhgfg\n\nOrdered : Electric guitar Model 1456'),
(31, '2014-07-17', 'PRODUCT ORDER FROM SITE', ' Name : ru\n Address : terh\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone : 01670868856\n\nBooking Description : di\n\nOrdered : Classic Violins'),
(32, '2014-07-21', 'Testing', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nTesting'),
(33, '2014-07-21', 'Testing', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nJust Testing Again'),
(34, '2014-07-21', 'Testing', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nJust Testing Again'),
(35, '2014-07-21', 'Testing', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nJust Testing Again'),
(36, '2014-07-21', 'Urgent', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nBhai Please change the admin panel Id and password for your own site and software security.'),
(37, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : sayem\n Address : mirpur\n E-mail : frihim@hotmail.com\n Country : Bangladesh\n Phone : 2586\n\nBooking Description : sjdhfghdgfhd\n\nOrdered : Electric guitar Model 1456'),
(38, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : \n\nOrdered : '),
(39, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Gaza\n E-mail : qazinahin@yahoo.com\n Country : Palestinian Territory, Occupied\n Phone : 1666548\n\nBooking Description : Check your Admin-panel.\n\nOrdered : '),
(40, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : \n\nOrdered : '),
(41, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Gaza\n E-mail : qazinahin@yahoo.com\n Country : Palestinian Territory, Occupied\n Phone : 1666548\n\nBooking Description : Check your Admin-panel.\n\nOrdered : '),
(42, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Gaza\n E-mail : qazinahin@yahoo.com\n Country : Palestinian Territory, Occupied\n Phone : 1666548\n\nBooking Description : Check your Admin-panel.\n\nOrdered : '),
(43, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Gaza\n E-mail : qazinahin@yahoo.com\n Country : Palestinian Territory, Occupied\n Phone : 1666548\n\nBooking Description : Check your Admin-panel.\n\nOrdered : '),
(44, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Checking\n Address : Somewhere\n E-mail : qazinahin@yahoo.com\n Country : Israel\n Phone : 01199198382\n\nBooking Description : Just checking\n\nOrdered : Classic Piano'),
(45, '2014-07-21', 'Have you checked?', ' Name : Nahin\n Company : UWL\n E-mail : qazinahin@yahoo.com\n\nBhai I Have you checked the admin panel. You can change the destination email address from the admin panel.'),
(46, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : hjb\n Address : ghkkfs\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone :  01670868856\n\nBooking Description : Hi\n\nOrdered : Electric guitar Model 1456'),
(47, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : \n\nOrdered : Electric guitar Model 1456'),
(48, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : Imran\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : I want  good service\n\nOrdered : Electric guitar Model 1456'),
(49, '2014-07-21', 'PRODUCT ORDER FROM SITE', ' Name : hi\n Address : hi\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone :  01670868856\n\nBooking Description : Hi\n\nOrdered : Classic Piano'),
(50, '2014-07-27', 'PRODUCT ORDER FROM SITE', ' Name : Nahinirpur\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : Just testing\n\nOrdered : Electric guitar Model 1456'),
(51, '2014-07-27', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Adamzee\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199387526\n\nBooking Description : Just testing\n\nOrdered : Electric guitar Model 1456'),
(52, '2014-07-27', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Adamzee\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199387526\n\nBooking Description : Just testing\n\nOrdered : Electric guitar Model 1456'),
(53, '2014-07-27', 'PRODUCT ORDER FROM SITE', ' Name : gdjj\n Address : hhddf\n E-mail : gxdg\n Country : Bangladesh\n Phone : 01670868856\n\nBooking Description : Hi\n\nOrdered : Classic Piano'),
(54, '2014-08-13', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199098382\n\nBooking Description : Just Testing\n\nOrdered : Classic Piano'),
(55, '2014-09-04', 'Just showing', ' Name : Nahin\n Company : UNique Webers\n E-mail : qazianhin@yahoo.com\n\nJust showing the message thing.'),
(56, '2014-09-04', 'PRODUCT ORDER FROM SITE', ' Name : Nahin\n Address : MIrpur 1 Dhaka.\n E-mail : qazinah@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : I need it urgently\n\nOrdered : Electric guitar Model 1456'),
(57, '2014-09-17', 'PRODUCT ORDER FROM SITE', ' Name : NAhin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 01199198382\n\nBooking Description : Testing\n\nOrdered : Electric guitar Model 1456'),
(58, '2014-09-23', 'PRODUCT ORDER FROM SITE', ' Name : amit\n Address : jffjkkxbjk Jeff juju\n E-mail : solfamusicbd@gmail.com\n Country : Bangladesh\n Phone : 01670868856\n\nBooking Description : He huff jhxck\n\nOrdered : Acoustic guitar Model 55561'),
(59, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Testing\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 064464656\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(60, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Testing\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 064464656\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(61, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Testing\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 064464656\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(62, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Testing\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 064464656\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(63, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ridwan\n Address : Lalbag\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 054+663263263\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(64, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ridwan\n Address : Lalbag\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 054+663263263\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(65, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ridwan\n Address : Lalbag\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 054+663263263\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(66, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ridwan\n Address : Lalbag\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 054+663263263\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(67, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ridwan\n Address : Lalbag\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 054+663263263\n\nBooking Description : Hello There\n\nOrdered : Electric guitar Model 1456'),
(68, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : solfa_music@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : Testing\n\nOrdered : Electric guitar Model 1456'),
(69, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : solfa_music@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : Testing\n\nOrdered : Electric guitar Model 1456'),
(70, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Ashraful\n Address : Somewhere\n E-mail : ashraful@abidinggroupbd.com\n Country : Bangladesh\n Phone : 5959565263\n\nBooking Description : Testing the script\n\nOrdered : Electric guitar Model 1456'),
(71, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Tester\n Address : Multiplan\n E-mail : qazinahin@yahoo.com\n Country : Afghanistan\n Phone : 95962323\n\nBooking Description : Hello\n\nOrdered : Electric guitar Model 1456'),
(72, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(73, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(74, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(75, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(76, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(77, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(78, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(79, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(80, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Nahin\n Address : Mirpur\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : +8801199198382\n\nBooking Description : I want one\n\nOrdered : Classic Piano'),
(81, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Fardin\n Address : Adamzee\n E-mail : solfa_music@yahoo.com\n Country : Argentina\n Phone : 059585959\n\nBooking Description : I want it now.\n\nOrdered : Electric guitar Model 1456'),
(82, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : Fardin\n Address : Adamzee\n E-mail : qazinahin@yahoo.com\n Country : Bangladesh\n Phone : 29959595\n\nBooking Description : Just testing\n\nOrdered : Electric guitar Model 1456'),
(83, '2014-09-26', 'PRODUCT ORDER FROM SITE', '\n Name : gdj\n Address : ufdj\n E-mail : solfa_music@yahoo.com\n Country : Bangladesh\n Phone : 01725353737\n\nBooking Description : Hdg\n\nOrdered : Acoustic guitar Model 55561'),
(84, '2014-09-27', 'ufLeVgRQcx', ' Name : pktyzuskqtz\n Company : gSfghzDuzPx\n E-mail : qoduie@hlsuog.com\n\nUGlLRE  &lt;a href=&quot;http://guxlijuchkep.com/&quot;&gt;guxlijuchkep&lt;/a&gt;, [url=http://gqvkliyttbbg.com/]gqvkliyttbbg[/url], [link=http://congtycmygoj.com/]congtycmygoj[/link], http://yahlmxnjygaa.com/'),
(85, '2014-09-27', 'uKPbLxEfKKxXA', ' Name : yzdbuyxql\n Company : KfFLYtDgCh\n E-mail : xtidtl@lxkzjb.com\n\n510zyu  &lt;a href=&quot;http://jcdwipcsatqi.com/&quot;&gt;jcdwipcsatqi&lt;/a&gt;, [url=http://wctgctluljco.com/]wctgctluljco[/url], [link=http://upzvboebqifr.com/]upzvboebqifr[/link], http://mtjxjtnpfukn.com/'),
(86, '2014-10-01', 'gxrtXpZOOrcrKWy', ' Name : omlojxyo\n Company : PQeQskCiMSUS\n E-mail : dzrwqv@dwnggy.com\n\ntC7ekD  &lt;a href=&quot;http://msnjrhjacybn.com/&quot;&gt;msnjrhjacybn&lt;/a&gt;, [url=http://pfklxangvbit.com/]pfklxangvbit[/url], [link=http://xnewespodrmr.com/]xnewespodrmr[/link], http://xkmewaysqrkt.com/'),
(87, '2014-10-01', 'QGdtasWGowfMlPSki', ' Name : rtgpcxh\n Company : rxfIFTLAiplIuPxFRnV\n E-mail : cdpmgo@vmkbut.com\n\n6YCMX0  &lt;a href=&quot;http://apbfwuhujpla.com/&quot;&gt;apbfwuhujpla&lt;/a&gt;, [url=http://razhavfdesur.com/]razhavfdesur[/url], [link=http://popglekmxlco.com/]popglekmxlco[/link], http://dljnuppzyave.com/'),
(88, '2014-10-23', 'Your Gmail Account', ' Name : Nahin\n Company : Unique Webers\n E-mail : qazinahin@yahoo.com\n\nthegaragebandbd@gmail.com\r\nimran5thday'),
(89, '2014-12-29', 'sdfsfd', ' Name : sfsdf\n Company : sfsdf\n E-mail : sfsdf\n\nsdfsdf'),
(90, '2015-07-03', 'Jacqueline', ' Name : Jacqueline\n Company : Jacqueline\n E-mail : biruueqq@hotmail.fr\n\nHi my name is Jacqueline and I just wanted to drop you a quick note here instead of calling you. I discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more hits. I have found that the key to running a successful website is making sure the visitors you are getting are interested in your niche. There is a company that you can get targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Visit them here: http://innovad.ws/2dttq\r\nJacqueline http://ft1.info/9mks'),
(91, '2016-05-08', 'Bella', ' Name : Bella\n Company : Bella\n E-mail : jrpwpkh@gmail.com\n\nGet get targeted paid traffic sent to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website for 7 days free here: http://sirrico.net/yourls/p7j6'),
(92, '2016-10-03', 'Land Owner', ' Name : Hasan Al Mehedi \n Company : Land Owner\n E-mail : mehedijune@gmail.com\n\nDear\r\nAbiding Development and Holdings Limited\r\n\r\nWould like to know Abiding Development and Holdings Limited interested to take any new project at East Rampura, Dhaka.\r\n\r\nThanks\r\n\r\nHasan Al Mehedi \r\n+8810755528282\r\n'),
(93, '2017-03-28', 'Tami Sandoval', ' Name : Tami Sandoval\n Company : Tami Sandoval\n E-mail : qoohxb@uezorgd.com\n\nHi my name is Tami Sandoval and I just wanted to drop you a quick message here instead of calling you. I discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your website topic. There is a company that you can get keyword targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my site. http://soheavyblog.com/1m'),
(94, '2017-04-23', 'Elisa Brown', ' Name : Elisa Brown\n Company : Elisa Brown\n E-mail : eteicwkrtb@feursh.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://priscilarodrigues.com.br/url/v'),
(95, '2017-04-28', 'Elisa Brown', ' Name : Elisa Brown\n Company : Elisa Brown\n E-mail : hpradfwsnq@ajanquigbb.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://priscilarodrigues.com.br/url/v                                                                                                                                                - Unsubscribe here: http://acortarurl.es/8y'),
(96, '2017-05-24', 'Chelsea Wallace', ' Name : Chelsea Wallace\n Company : Chelsea Wallace\n E-mail : pildaxpkt@mcljnwpakfy.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://priscilarodrigues.com.br/url/v																				Unsubscribe here: http://acortarurl.es/97'),
(97, '2017-06-29', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : amypfhcqgnj@znasfydj.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://stpicks.com/27																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(98, '2017-07-05', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : hrdztrxc@yhmjtjwj.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://priscilarodrigues.com.br/url/v																			Unsubscribe here: http://pcgroup.com.uy/2a'),
(99, '2017-07-25', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : xnzftkaggp@oaeoin.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://pcgroup.com.uy/15 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(100, '2017-08-04', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : pxkpdmdzojk@eeoswfdbnd.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://stpicks.com/27																			Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(101, '2017-08-19', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : utlnbgf@ywcbfjnrbii.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://lis.ovh/is 															Unsubscribe here: http://pcgroup.com.uy/2a'),
(102, '2017-09-04', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : gsaywvxwnu@gcuhxqi.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your website: http://segundaibc.com.br/go/1i - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :) 																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(103, '2017-09-09', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : pxvsisoousr@xokjdnapixp.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://lis.ovh/is 															Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(104, '2017-10-02', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : zaqpojvec@skpazzup.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://pcgroup.com.uy/15																													Unsubscribe here: http://pcgroup.com.uy/2a'),
(105, '2017-10-23', 'Sandra', ' Name : Sandra\n Company : Sandra\n E-mail : gxuciso@vnzhtk.com\n\nI decided to leave a message here on your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page instead of calling you. Do you need more likes for your Facebook Fan Page? The more people that LIKE your website and fanpage on Facebook, the more credibility you will have with new visitors. It works the same for Twitter, Instagram and Youtube. When people visit your page and see that you have a lot of followers, they now want to follow you too. They too want to know what all the hype is and why all those people are following you. Get some free likes, followers, and views just for trying this service: http://url.euqueroserummacaco.com/ikn																		Unsubscribe here: http://corta.co/eXu'),
(106, '2017-10-29', 'buy a flat in rampura project', ' Name : M shamim\n Company : asn\n E-mail : shaki202122@yahoo.com\n\nWish to buy a flat at Rampura project\r\n\r\n01712168746'),
(107, '2017-11-03', 'Andrea Gibson', ' Name : Andrea Gibson\n Company : Andrea Gibson\n E-mail : xxplialvwux@fqrjkpeamva.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: https://flxv.tk/6 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :) 																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(108, '2017-11-07', 'Erma Bowman', ' Name : Erma Bowman\n Company : Erma Bowman\n E-mail : vpqvqyazsmr@squhyouc.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:http://priscilarodrigues.com.br/url/v																													Unsubscribe here: http://corta.co/f5m'),
(109, '2017-11-13', 'Erma Bowman', ' Name : Erma Bowman\n Company : Erma Bowman\n E-mail : zvpozrdbc@ioizenjwlv.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:https://flxv.tk/6																													Unsubscribe here: http://corta.co/f5m\r\nErma Bowman https://flxv.tk/6'),
(110, '2017-11-18', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : dvtgzyaleyl@pnshrh.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/csy																				Unsubscribe here: http://0nulu.com/mvx'),
(111, '2017-11-29', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : dquslldfb@gmail.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your website: http://0nulu.com/csy - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/mvx'),
(112, '2017-12-04', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : lsgltxv@gmail.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/sdq		 																	Unsubscribe here: http://0nulu.com/mvx'),
(113, '2017-12-07', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : fnlockfqrxc@gmail.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/opx		 																	Unsubscribe here: http://0nulu.com/mvx'),
(114, '2017-12-13', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : hfiufh@gmail.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/sdq																				Unsubscribe here: http://0nulu.com/mvx'),
(115, '2017-12-22', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : zjebsgxrc@gmail.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://0nulu.com/opx - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/nbz'),
(116, '2017-12-29', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : pujhnuxqb@gmail.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://0nulu.com/csy		 																	Unsubscribe here: http://0nulu.com/mvx'),
(117, '2018-01-03', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : gyihstdfoh@gmail.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://0nulu.com/sdq		 																	Unsubscribe here: http://0nulu.com/mvx'),
(118, '2018-01-09', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : wsfshxqka@gmail.com\n\nThis is a comment to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://0nulu.com/opx - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/mvx'),
(119, '2018-01-18', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : caxxtxy@gmail.com\n\nThis is a comment to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your website: http://0nulu.com/sdq - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/nbz'),
(120, '2018-01-23', 'Website Traffic', ' Name : Website Traffic\n Company : Website Traffic\n E-mail : ztyfya@gmail.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/rjv		 																	Unsubscribe here: http://0nulu.com/nbz'),
(121, '2018-01-27', 'Website Traffic', ' Name : Website Traffic\n Company : Website Traffic\n E-mail : sclofaoamk@gmail.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/sdq																				Unsubscribe here: http://0nulu.com/nbz'),
(122, '2018-02-02', 'Carla French', ' Name : Carla French\n Company : Carla French\n E-mail : nopefhru@gmail.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:http://0nulu.com/sdq																				Unsubscribe here: http://0nulu.com/nbz'),
(123, '2018-02-08', '??? ???????????? ? ???????? ????????', ' Name : Dinabisse\n Company : google\n E-mail : menops7@h18.top\n\n???????? ?????? - ??? ???????, ??? ??????? ??????? ??????? (??????) ? ????? ??????? ???????. ????? ? ???? ???????? ?? ???, ??????? ?? ???????. ??????? - ??? ??????, ??????? ???????? ?????? ??????????? ? ??????, ????? ???? ?? ???????. ??? ??????? 1 ???? ???????? ????????? ??????????? ??????. ??? ???????? ??????? 2 ????, ??????? ???????? ???????? ?????????? ????????, ???? ??????????? ????? ????????? ???????. ?? ???????? ??????? ??????? ? ????? ????? ???????? ??????, ????? ? ??????? ???????. ?????????? ??????? ? ?????????? ????????????? ??????? ??????? ????? ?????? ??? ???????????? ???????? ??????. ?? ????? ??????  ????????? ?????????????? ??????? ?????? ? ????? ? ????????? ????????, ???? ??? ??????? ????????. \r\n&lt;a href=http://endocrin-patient.com/kak-snizit-sahar-v-krovi/&gt;http://endocrin-patient.com/kak-snizit-sahar-v-krovi/&lt;/a&gt;'),
(124, '2018-02-08', 'Carla French', ' Name : Carla French\n Company : Carla French\n E-mail : idsymapa@gmail.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here: http://priscilarodrigues.com.br/url/v																				Unsubscribe here: http://pzr.eu/18'),
(125, '2018-02-09', '??? ???????????? ? ???????? ????????', ' Name : Dinabisse\n Company : google\n E-mail : jqpjzy5@h18.top\n\n?????? - ??? ???????, ??? ??????? ??????? ??????? (??????) ? ????? ??????? ???????. ??????? ? ???? ????????? ?? ?????????, ??????? ?? ???????. ??????? - ??? ??????, ??????? ???????? ??????? ??????????? ? ??????, ????? ???? ?? ???????. ??? ???????? ??????? 1 ???? ???? ????????? ???????????? ??????. ??? ???????? ??????? 2 ????, ??????? ???????? ???????? ?????????? ????????????, ???? ??????????? ????? ????????? ???????. ?? ???????? ?????? ?????? ? ????? ????? ???????? ?????, ????? ? ?????. ??????? ? ?????????? ??????????????? ??????? ??????? ????? ?????? ??? ?????????????? ???????? ??????. ?? ????? ???????  ????????? ?????????????? ??????? ??????? ? ????? ? ????????? ????????, ???? ??? ????????? ????????. \r\n&lt;a href=http://endocrin-patient.com/norma-sahara-v-krovi/&gt;http://endocrin-patient.com/norma-sahara-v-krovi/&lt;/a&gt;'),
(126, '2018-02-15', 'Rebecca Sutton', ' Name : Rebecca Sutton\n Company : Rebecca Sutton\n E-mail : vjmtfkbelgk@gmail.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://pzr.eu/17																					Unsubscribe here: http://gd.is/y/mun53'),
(127, '2018-02-21', 'Rebecca Sutton', ' Name : Rebecca Sutton\n Company : Rebecca Sutton\n E-mail : xyeacs@gmail.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://pzr.eu/17																				Unsubscribe here: http://pzr.eu/18'),
(128, '2018-02-27', 'Barbara Kennedy', ' Name : Barbara Kennedy\n Company : Barbara Kennedy\n E-mail : dbojoqfyc@gmail.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://priscilarodrigues.com.br/url/v																					Unsubscribe here: http://pzr.eu/18'),
(129, '2018-03-06', 'Ramona Jordan', ' Name : Ramona Jordan\n Company : Ramona Jordan\n E-mail : lneczxokue@gmail.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://stpicks.com/2rusd																				Unsubscribe here: http://xahl.de/q'),
(130, '2018-04-02', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : hahqpmkqlc@gmail.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://insl.co/11																				Unsubscribe here: http://stpicks.com/2ruse'),
(131, '2018-04-15', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : vqhukvqoeg@gmail.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://url.euqueroserummacaco.com/3ewon																					Unsubscribe here: http://stpicks.com/2ruse'),
(132, '2018-04-20', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : gjckbwvtmz@gmail.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://insl.co/11																					Unsubscribe here: http://stpicks.com/2ruse'),
(133, '2018-05-02', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : nrczjhbtmg@zgtjwwhp.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://url.euqueroserummacaco.com/3ewon																				Unsubscribe here: http://stpicks.com/2ruse'),
(134, '2018-05-11', 'Monica', ' Name : Monica\n Company : Monica\n E-mail : lzbgqgpbhk@zeauwedsfse.com\n\nNeed to rank your website? Get some free backlinks here: http://corta.co/gpQm We use a natural link building strategy to build awesome in-content backlinks. Our massive team of copywriters create original, semantically relevant content around your subject matter. We then post that content around the web to make your website go viral in the eyes of Google. Start your free trial today: http://ttree.co/fb6sd                                  																				Unsubscribe: http://freest.at/4km'),
(135, '2018-05-22', 'Monica', ' Name : Monica\n Company : Monica\n E-mail : pwndyroo@gzwaekk.com\n\nNeed to rank your website? Get some free backlinks here: http://likes.avanimisra.com/4p1o We use a natural link building strategy to build awesome in-content backlinks. Our massive team of copywriters create original, semantically relevant content around your subject matter. We then post that content around the web to make your website go viral in the eyes of Google. Start your free trial today: https://bwlink.io/erhqf                                  																				Unsubscribe: http://freest.at/4km'),
(136, '2018-06-04', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : bicsxnctvb@fboqpf.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://xahl.de/p																				Unsubscribe here: http://xahl.de/q');
INSERT INTO `mail` (`id`, `date`, `subject`, `message`) VALUES
(137, '2018-06-05', 'Security Services', ' Name : Monir Ahmed\n Company : Bengle Electra &amp; Security System\n E-mail : mmonir152@gmail.com\n\nHello, Dear We are Service Say This? 1.CCTV Solution, 2. Access Control, 3. Digital Marketing, 4. Facebook, 5. SEO, 6. PABX'),
(138, '2018-06-18', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : tytagdkn@tpyonqk.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://url.euqueroserummacaco.com/3ewon																				Unsubscribe here: http://stpicks.com/2ruse'),
(139, '2018-06-20', 'RE: build business relation ship', ' Name : Eric Kong\n Company : YANOHAO GROUP\n E-mail : eric.kong@yanhao.com.hk\n\nDear Sir\r\n     Recommend by Dhaka chamber of commercial and Industry I write this message to introduce our self \r\nas supplier for Aluminum profile in Hong Kong and China, We have market in South East Asia for many years \r\nNow we intend to promote our business in your country, we need a co-operate partner like you,\r\n\r\nOf course first of all we need your agree to work together with us, so let me have your feedback, may be \r\nyou need some person to contact , please let me have his/her name and e-mail address.\r\n\r\nAs soon as we have contact person we will sent Aluminum window picture and it technical drawing.\r\n\r\nLooking for your respond to the matter. \r\n\r\nRegards\r\nYANHAO GROUP\r\nERIC KONG\r\nE-MAIL : eric.kong@yanhao.com.hk\r\nTel: (852)28109619/90282321\r\n'),
(140, '2018-06-26', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : evoryr@bgiurdgrho.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://stpicks.com/2rusd																				Unsubscribe here: http://stpicks.com/2ruse'),
(141, '2018-07-21', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : fxoujb@tnsaqcyl.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://stpicks.com/2rusd																					Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors http://stpicks.com/2rusd'),
(142, '2018-07-31', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : vnmawpk@vzegdwmtt.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://stpicks.com/2rusd																				Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors http://duckshop.co/1f1p'),
(143, '2018-08-01', 'for a meeting seduale ', ' Name : RAZU ROY BHOWMIK\n Company : BASHUNDHARA CORPORATR OFFICE ,DEPARTMENT OF SALES\n E-mail : rrbhowmik@yahoo.co.uk\n\ni want to meet with your procurement department as early possible to provide to use Bashundhara cement.can it possible to give me a meeting date. \r\n\r\nthanks Regards\r\n\r\nRAZU ROY BHOWMIK'),
(144, '2018-08-07', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : xaldwdxv@jmuwqsq.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: http://stpicks.com/2rusd - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors http://insl.co/11'),
(145, '2018-08-09', 'Proposal for Professional Pest Control Service', ' Name : Md Imran Hossain \n Company : Tiger Pest Control Co\n E-mail : tigerpestcontrolbd@gmail.com\n\nTiger Pest Control Co (TPC) is a new generation leading Best Pest Control Service Provider anywhere in Bangladesh. We Provide Cockroach Control, Rat Control, Bed Bugs Control, Mosquito Control, Termite Control, Snake Control, Ants Control, Flies Control, Lizard Control, Spider Control, Crawling Insects etc. Let us give a chance to give you a best Reliable &amp; Affordable Pest Control Services.  . 01725286527.01866970740 &amp; 01977286527\r\nE- Mail: tigerpestcontrolbd@gmail.com ; tigerpestcontrolco@yahoo.com  \r\nWeb: www.tigerpestcontrolbd.com  Face Book: https://www.facebook.com/tigerpestcontrolco/'),
(146, '2018-08-22', 'Rate adjustment notice', ' Name : Chauncey Thomas\n Company : Chauncey Thomas\n E-mail : chauncey.thomas68@yahoo.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: http://insl.co/11\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: http://stpicks.com/2ruse'),
(147, '2018-09-29', 'Shana Marley', ' Name : Shana Marley\n Company : Shana Marley\n E-mail : qhlsdiaatv@xzsohgrpsw.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://stpicks.com/2rusd																					Unsubscribe here: http://stpicks.com/2ruse\r\nShana Marley http://stpicks.com/2rusd'),
(148, '2018-10-07', 'Dianne Bennett', ' Name : Dianne Bennett\n Company : Dianne Bennett\n E-mail : yswodzjtnc@temcbvn.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://stpicks.com/2rusd																				Unsubscribe here: http://stpicks.com/2ruse'),
(149, '2018-10-13', 'Dianne Bennett', ' Name : Dianne Bennett\n Company : Dianne Bennett\n E-mail : tvpxweauurr@rstboszmvuh.com\n\nI came across your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://s.miku.moe/jbpuz																				Unsubscribe here: https://twe.lv/gg'),
(150, '2018-10-30', 'Nicole Mawrey', ' Name : Nicole Mawrey\n Company : Nicole Mawrey\n E-mail : xalqtc@bgthxwckxuk.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://www.1lnk.net//1ol7																					Unsubscribe here: https://twe.lv/gg'),
(151, '2018-11-08', 'Nicole Mawrey', ' Name : Nicole Mawrey\n Company : Nicole Mawrey\n E-mail : xfjmxucisv@yyacuwnv.com\n\nI came to your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://www.1lnk.net//1ol7																					Unsubscribe here: https://twe.lv/gg'),
(152, '2018-12-13', 'Alice Lowe', ' Name : Alice Lowe\n Company : Alice Lowe\n E-mail : xnoeazjdmz@xvvxqq.com\n\nThis is a message to the Abiding Development and Holdings Limited - Dreams Made Real - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your website: http://wntdco.mx/dkfzt - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://2url.de/1alt'),
(153, '2019-05-15', 'Joann', ' Name : Joann\n Company : Joann\n E-mail : *@*.com\n\nI discovered your Abiding Development and Holdings Limited - Dreams Made Real - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: https://oxx.jp/2a																				Unsubscribe here: https://oxx.jp/2b'),
(154, '2019-10-05', 'Star Wars', ' Name : Star Wars Home Theatre\n Company : google\n E-mail : slrzidz@gmail.com\n\nxuxe je Starwars youtube.com/watch?v=KgUoGsWrFEs'),
(155, '2020-04-26', '???????? ??????', ' Name : FigaroNoub\n Company : google\n E-mail : fbnmtophuj@tubeview.cf\n\n?????? ?????? ? : \r\n&lt;a href=https://youtu.be/3jSy5rhqumI&gt;https://www.youtube.com/watch?v=3jSy5rhqumI&lt;/a&gt; '),
(156, '2020-05-17', 'BodyWellness Posture Corrector', ' Name : MolliRorp\n Company : google\n E-mail : auuvoglihhg@ytview.ml\n\n????????? ????????!: http://kbhp.2track.info'),
(157, '2021-01-24', 'Need info project \"hafiz heights\" ', ' Name : Sharif Jahan Nipun\n Company : Brac Bank Ltd.\n E-mail : nipun_cse@live.com\n\nThere are no details about  on going project &quot;hafiz heights&quot; at your website. Please give me more details regarding this project.\r\n\r\n'),
(158, '2021-03-10', 'QGWFGAOSQQC07VCWXF   www.ask.com', ' Name : QGWFGAOSQQC07VCWXF   www.web.de\n Company : QGWFGAOSQQC07VCWXF   www.msn.com\n E-mail : trangifonomny85@list.ru\n\nQGWFGAOSQQC07VCWXF   www.google.com     Where are you located ? I want to come to you one of these days\r\n'),
(159, '2021-03-23', 'QGWEOCDV9ZA253CWXF   www.ask.com', ' Name : QGWEOCDV9ZA253CWXF   www.web.de\n Company : Matilda Wemyss\n E-mail : roma.makeev.95@inbox.ru\n\nQGWEOCDV9ZA253CWXF   www.google.com\r\n   I have a small question for you'),
(160, '2021-05-16', 'LAST DAY', ' Name : https://u.to/1x5AGw\n Company : https://u.to/2h5AGw\n E-mail : corine.dougharty@gmail.com\n\nCrazy discounts on all our products   https://u.to/1x5AGw'),
(161, '2021-06-03', '??? ? ATTENTION', ' Name : ??? ? Do you want to earn a lot of money?  https://is.gd/CAmo59\n Company : ??? ? Do you want to earn a lot of money?  https://is.gd/CAmo59\n E-mail : hoover.shella@hotmail.com\n\n??? ? Last day of special discounts   Would You Make A Great Career Online?  https://is.gd/CAmo59\r\n'),
(162, '2022-06-23', 'Hello!', ' Name : Cheryle Lemos\n Company : ??? ? Where can I get my prize? Here?  https://u.to/pHYyHA\n E-mail : lemos.cheryle@gmail.com\n\n??? ? Where can I get my prize? Here?  https://u.to/pHYyHA'),
(163, '2023-02-10', 'Dear abidinggroupbd.com Administrator.', ' Name : Ashley Oppenheim\n Company : Ashley Oppenheim\n E-mail : oppenheim.ashley@hotmail.com\n\nDear abidinggroupbd.com Admin!\r\n\r\nhttps://conductiveruthless.com/ivt13tueyr?key=c45f1c84f1b6b84a1f5e1f19c6996316\r\n\r\nRegards');

-- --------------------------------------------------------

--
-- Table structure for table `page`
--

CREATE TABLE `page` (
  `id` int(11) NOT NULL,
  `page` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `visual` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pagetype_id` int(4) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `page`
--

INSERT INTO `page` (`id`, `page`, `visual`, `pagetype_id`, `priority`) VALUES
(1, 'about', 'About Us', 1, 99),
(2, 'ongoing_projects', 'Ongoing Projects', 6, 97),
(3, 'upcoming_projects', 'Upcoming Project', 6, 96),
(4, 'handed_over_projects', 'Handed Over Projects', 6, 95),
(7, 'home', 'Home', -1, 100),
(8, 'contact', 'Contact Us', 0, 80),
(9, 'management', 'Management', 8, 98);

-- --------------------------------------------------------

--
-- Table structure for table `pagetype`
--

CREATE TABLE `pagetype` (
  `id` int(11) NOT NULL,
  `pagetype` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `visual` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `transferable` int(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pagetype`
--

INSERT INTO `pagetype` (`id`, `pagetype`, `visual`, `transferable`) VALUES
(-1, 'auto_updated', 'Auto Updated', 0),
(0, 'custom', 'Custom', 1),
(1, 'common', 'Common', 1),
(2, 'dated', 'Blog or News with Date', 0),
(3, 'product_soft', 'Product Soft', 0),
(5, 'common_showcase', 'Common with Showcase', 1),
(6, 'product', 'Product', 1),
(7, 'services_showcase', 'Services with Showcase', 1),
(8, 'people', 'People', 0);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `sells_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `date` date NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `people_email`
--

CREATE TABLE `people_email` (
  `text_data_id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `people_email`
--

INSERT INTO `people_email` (`text_data_id`, `email`) VALUES
(212, 'skirasel@gmail.com'),
(213, 'smahamed23@yahoo.com'),
(214, 'skirasel@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `id` int(11) NOT NULL,
  `position` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`id`, `position`) VALUES
(1, 'center'),
(2, 'right'),
(3, 'left');

-- --------------------------------------------------------

--
-- Table structure for table `price`
--

CREATE TABLE `price` (
  `text_data_id` int(11) NOT NULL,
  `price` double NOT NULL,
  `p_price` double NOT NULL,
  `negotiable` tinyint(1) NOT NULL,
  `note` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sells`
--

CREATE TABLE `sells` (
  `id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `date` date NOT NULL,
  `customer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `discount` double NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL COMMENT '0=Ordered,  1=delivered-payed,  2=delivered-due,  3=delivered-seteled'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sells_details`
--

CREATE TABLE `sells_details` (
  `id` int(11) NOT NULL,
  `sells_id` bigint(20) UNSIGNED ZEROFILL NOT NULL,
  `text_data_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `text_data_id` int(11) NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock_update`
--

CREATE TABLE `stock_update` (
  `id` int(11) NOT NULL,
  `text_data_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `stock` int(11) NOT NULL,
  `status` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `text_data`
--

CREATE TABLE `text_data` (
  `id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `heading` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `content` varchar(10000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `hidden` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `text_data`
--

INSERT INTO `text_data` (`id`, `page_id`, `heading`, `content`, `priority`, `hidden`) VALUES
(9, 2, 'Abiding La-Verna', 'Project Name:Abiding La-verna\r\n\r\n\r\nAddress         :64,B.C.C Road,Wari,Dhaka.\r\nLand Area       :5 Katha.\r\nApartment Size  :Unit A-1015sft\r\n                 Unit B-1125sft\r\n                 Unit C-1100sft\r\n\r\nUnit Each floor :3(Three)\r\nNo.of total unit:24(Twenty Four)\r\nBuilding Height :9(Nine)Storied(G+8)', 87, 0),
(179, 8, 'Corporate Office', 'Abiding Reza Tower\r\n57/2, Kakrail,\r\nDhaka -1000, Bangladesh\r\nCorporate', 50, 0),
(181, 8, 'Telephone', '+88-02-8392006', 50, 0),
(182, 8, 'Email', 'adhl@abidinggroupbd.com', 50, 0),
(208, 1, 'About ADHL', 'Abiding Development and Holdings Limited as well as there sister concerns believe in continuous product innovation and excellent service. Therefore, we are also concentrating on Quality Management. We are continuously upgrading our staff in their competence and knowledge and equip them with better service skills in order to exceed our the expectations of out customers.\r\n\r\nAbiding Development and Holdings Limited as well as there sister concerns offer a development service to our clients. This includes providing analysis, assessment according to there budget, suggesting the best option for our clients, developing the land area, performing construction work, proper government registration , preparing other necessary legal documents, assuring necessary utility connection and so on.\r\n\r\nHousing could be generally termed as a habitable shelter but its meaning stretches far from merely a shelter. It is the total living environment including dwelling units, land, the neighborhood services and utilities needed for the well being of its inhabitants. Housing is one of the basic beings, which provides security, and sense of belonging to the owner. The per-requisite for health and comfort is proper housing.', 50, 0),
(209, 1, 'Building Features and Amenities', '• Building will be planned and designed by professional Architects and structural design Engineers.\r\n• For all service connections and disposals (sewerage, solid waste, etc.) British/American/BNBC building codes will be followed.\r\n• Structural design parameters will be based of American Concrete Institute (ACI) and American Standards of Testing Materials (ASTM) and BNBC codes.\r\n• Sub-soil investigation and soil composition will be analyzed from laboratory.\r\n• Building will be comprised of reinforced cement concrete (R.C.C) foundation, column, beam and slab considering systematic and wind effect with modern design concept.\r\n• Comprehensive checking and testing of all steel reinforcement will be conducted by professional design and supervising engineers.\r\n• All structural materials including steel (60 grade deformed / tore steel bar), cement (Crown, Akij, King Brand, SKS etc.), bricks (1st class), Sylhet sand, etc, will be of highest available standard.\r\n• For concrete works to give crushing strengths of 2500 psi to 4000 psi (cyl. test) at 28 days depending on concrete ratio & design. ', 50, 0),
(210, 1, 'Terms and Conditions', '1. Allotment: Interested persons are welcome to apply for allotment of apartments. The application should be made on the prescribed form along with the booking money/earnest money. On acceptance of application, Abiding Development & Holdings Ltd. will issue a provisional allotment letter in favour of the applicant along with the schedule of payment for balance amount. 30% down payment will have to made within 15 days from the date of issuing of provisional allotment letter. Allotment will be made on first come first served basis. Buyers willing to make onetime payment will be given preference. The company has the right to accept or reject any application without assigning any reason there to.\r\n\r\n2. Payments: All payments (Down payment, installments, car park cost, Utility Cost, additional works and other charges) should be made in favour of Abiding Development & Holdings Ltd. in the form of Cash/Demand Draft or Pay Order from a schedule bank of Bangladesh. Bangladeshi residing abroad may ensure payment in foreign Exchange by TT or DD as per exchange rate issued by Bangladesh bank on the due date of installment payment.\r\n\r\n3. Delay in Payment: Payments of Installments and all other charges are to be made on the due date. Any delay in payment up to 30 days will make the buyer liable to pay an additional payment @ 3% per 30 days on amount of payment delayed. If the payment is delayed more than 60 days, then the company shall have the right to cancel the allotment. In this case the amount paid by buyer will be refunded after deducting service charge of Tk. 1,00,000.00.The balance amount will be back after selling of the said apartment to the new buyer.\r\n\r\n4. Deed of Agreement: After down payment of 30% of the total price Abiding Development & Holdings Ltd. and the Allottee shall execute a Deed of Agreement for safe guarding the interest of the Allottee as well as the Company.\r\n\r\n5. Allotment Transfer: the buyer shall not transfer or sell the allotted apartment to a third party before registration. But if the buyer desire to transfer his/her apartment to a nearest relative, in such case the company have right to demand 2% of total flat cost as a documentation charge related to transfer of allotment\r\n\r\n6. Design & Layout: Limited changes in the design and specifications and/ or layout of the apartments and other facilities may be made by Abiding Development & Holdings Ltd. for the overall interest of the project or due to unavoidable reasons. If the floor covering areas increased or decreased, the allottee will have to pay as per actual measurement with common space.\r\n\r\n7. Utility Connection: Connection fees/charges, security deposits and other relevant/incidental expenses relating to gas, water, sewerage and electric connections are not included in the price of apartments. This payment will be made by the purchaser through Abiding Development & Holdings Ltd. to the concerned authorities. If will provided solar panel in the project buyers will have to pay extra cost for this purpose.\r\n\r\n8. Title of the Land: Proportionate share of land of the project will be transferred to the allottee after payment of all dues. The allottee will bear all costs such as stamp duties, registration fees, Vat, sale permission cost, Taxes related with land and Apartment transfer and registration procedure.\r\n\r\n9. Possession Transfer: The possession of each apartment shall be duly handed over to the allottee on completion and on full payment of installments & other charges & dues amount.\r\n\r\n\r\n10. Abandon of project: The completion period of construction of the project can be affected by unavoidable circumstances like as Acts of God, Natural calamities, political or civil disturbance, civil war, govt. policies or any other reason, time period for completion of project may be extended or if the company compel to abandon the project, the buyer shall be refunded with all deposited money, in such situations the buyer will not be entitled to claim any kind of compensation or interest on the money deposited.', 50, 0),
(211, 1, 'Our Believe', 'We believe in continuous product innovation and excellent service. Therefore, we are also concentrating on Quality Management. \r\n\r\nWe are continuously upgrading our staff in their competence and knowledge and equip them with better service skills in order to exceed our customer’s expectations.', 50, 0),
(212, 9, 'Managing Director', 'Md. Kamrul Islam\r\nManaging Director\r\nMobile: +88 01777786700', 100, 0),
(213, 9, 'Director Operation', 'Syed Murad Ahamed\r\nDirector Operation\r\nMobile: +88 01777786701', 100, 0),
(214, 9, 'Director Marketing', 'Director Marketing\r\nABM Sabbir Mokammel\r\nMobile: +88 01777786702', 100, 0),
(215, 2, 'Abiding Twin Homes', 'Project Name:Abiding Twin Homes\r\n\r\nAddress :21-22,Mohonimohon Das Lane,FOrashgonj,Dhaka.\r\nLand Area :6 Katha.\r\nApartment Size :Unit A-1000sft\r\nUnit B-950sft\r\nUnit C-950sft\r\nUnit D-880sft\r\n\r\nUnit Each floor :4(Four)\r\nNo.of total unit:32(Thirty Four)\r\nBuilding Height :9(Nine)Storied(G+8)', 50, 0),
(216, 2, 'Abiding Noor Castle', 'Project Name:Abiding Noor Castle\r\n\r\nAddress :267/1,East Rampura,Dhaka.\r\nLand Area :3.81 Katha.\r\nApartment Size :Unit A-1075sft.\r\nUnit B-1075sft.\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:12(Twelve)\r\nApartment Facing:South-East Conner facing.\r\nBuilding Height :7(Seven)Storied(G+6)', 50, 0),
(217, 4, 'Abiding Habib Garden', 'Project Name:Abiding Habib Garden\r\n\r\nAddress :81,West Rampura,Wapda Road,Dhaka.\r\nLand Area :7.5 Katha.\r\nApartment Size :Unit A-1010sft.\r\nUnit B-1080sft.\r\nUnit C-1025sft.\r\nUnit D-1025sft.\r\n\r\nUnit Each floor :4(Four)\r\nNo.of total unit:28(Twenty Eight)\r\nApartment Facing:South-East Conner facing.\r\nBuilding Height :8(Eight)Storied(G+7)', 50, 0),
(218, 4, 'Abiding Afsun Cottage', 'Project Name:Abiding Afsun Cottage\r\n\r\nAddress :409/Ka,S.P Road,Pike Para,Mirpur,Dhaka.\r\nLand Area :3.5 Katha.\r\nApartment Size :Unit A-1000sft.\r\nUnit B-1050sft.\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:12(Twelve)\r\nApartment Facing:North facing.\r\nBuilding Height :7(Seven)Storied(G+6)', 50, 0),
(219, 2, 'Abiding S.S Palace', 'Project Name:Abiding S.S Palace\r\n\r\nAddress :334/2,South Goran,Khilgaon,Dhaka.\r\nLand Area :4 Katha.\r\nApartment Size :Unit A-1080sft.\r\nUnit B-1170sft.\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:14(Fourteen)\r\nApartment Facing:South-West Corner facing.\r\nBuilding Height :8(Eight)Storied(G+7)', 50, 0),
(221, 2, 'Abiding Nirjhor', 'Project Name:Abiding Nirjhor\r\n\r\n\r\nAddress :390,Gulbagh,Malibagh,Dhaka.\r\nLand Area :6 Katha.\r\nApartment Size :Unit A-1010 sft\r\nUnit B-1010 sft\r\nUnit C-1010 sft\r\nUnit D-850 sft\r\n\r\nUnit Each floor :4(Three)\r\nNo.of total unit:28(Twenty Eight)\r\nApartment Facing:South Facing\r\nBuilding Height :8(Eight)Storied(G+7)', 50, 0),
(223, 3, 'Abiding Masud Homes', 'Project Name:Abiding Masud Homes\r\n\r\n\r\nAddress :349/3,East Goran,Dhaka.\r\nLand Area :3 Katha.\r\nApartment Size :Unit A-750 sft\r\nUnit B-700 sft\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:10(Ten)\r\nApartment Facing:South Facing\r\nBuilding Height :6(Six)Storied(G+5)', 50, 0),
(224, 4, 'Abiding Reza Tower', 'Project Name:Abiding Reza Tower\r\n\r\n\r\nAddress :57/2,Kakrail,Dhaka.\r\nLand Area :3.5 Katha.\r\nApartment Size :Unit A-1025 sft\r\nUnit B-1025 sft\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:15(Twelve)\r\nApartment Facing:West Facing\r\nBuilding Height :7(Seven)Storied(G+6)', 50, 0),
(225, 4, 'Abiding Molla Tower', 'Project Name:Abiding Molla Tower\r\n\r\n\r\nAddress :15/c,Mirbag,Moghbazar,Dhaka.\r\nLand Area :3.25 Katha.\r\nApartment Size :Unit A-910 sft\r\nUnit B-880 sft\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:10(Ten)\r\nApartment Facing:East Facing\r\nBuilding Height :6(Six)Storied(G+5)', 50, 0),
(226, 4, 'Abiding Neela', 'Project Name:Abiding Neela\r\n\r\n\r\nAddress :539/c,Khilgaon,Dhaka.\r\nLand Area :3.27 Katha.\r\nApartment Size :Unit A-1075 sft\r\nUnit B-1075 sft\r\n\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:12(Twelve)\r\nApartment Facing:East Facing\r\nBuilding Height :7(Seven)Storied(G+6)', 50, 0),
(227, 4, 'Abiding Afsar Garden', 'Project Name:Abiding Afsar Garden\r\n\r\n\r\nAddress :394/2,Gulbag,Malibag,Dhaka.\r\nLand Area :6 Katha.\r\nApartment Size :Unit A-1050 sft\r\nUnit B-885 sft\r\nUnit C-950 sft\r\nUnit D-950 sft\r\n\r\nUnit Each floor :4(Four)\r\nNo.of total unit:24(Twenty Four)\r\nApartment Facing:South-East Corner Facing\r\nBuilding Height :7(Seven)Storied(G+6)', 50, 0),
(228, 4, 'Abiding Rose Bud', 'Project Name:Abiding Rose Bud\r\n\r\n\r\nAddress :114/2,South Mathertek,Basabo,Dhaka.\r\nLand Area :2.56 Katha.\r\nApartment Size :Unit A-795 sft\r\nUnit B-765 sft\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:10(Ten)\r\nApartment Facing:North-East Corner Facing\r\nBuilding Height :6(Six)Storied(G+5)', 50, 0),
(229, 4, 'Abiding Nijhum', 'Project Name:Abiding Nijhum\r\n\r\n\r\nAddress :438/3-A,Senpara,Parabata,Mirpur,Dhaka.\r\nLand Area :2.57 Katha.\r\nApartment Size :Unit A-700 sft\r\nUnit B-710 sft\r\n\r\nUnit Each floor :2(Two)\r\nNo.of total unit:10(Ten)\r\nApartment Facing:North-East Corner Facing\r\nBuilding Height :6(Six)Storied(G+5)', 50, 0),
(230, 4, 'Abiding Kibrin', 'Project Name:Abiding Kibrin\r\n\r\n\r\nAddress :215/2,Shantibag,Malibag,Dhaka.\r\nLand Area :6.27 Katha.\r\nApartment Size :Unit A-1195 sft\r\nUnit B-1145 sft\r\nUnit C-930 sft\r\n\r\n\r\nUnit Each floor :3(Three)\r\nNo.of total unit:21(Twenty One)\r\nApartment Facing:South-West Corner Facing\r\nBuilding Height :8(Eight)Storied(G+7)', 50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user` varchar(32) NOT NULL,
  `enuser` varchar(32) NOT NULL,
  `pass` varchar(32) NOT NULL,
  `level` tinyint(1) NOT NULL COMMENT '0=Suspended, 1=Admin, 2=Soft-Operator, 3=Site-Operator'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user`, `enuser`, `pass`, `level`) VALUES
(1, 'ashraful', '7d04559ddb86598ab0e369f4a5e82eab', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(2, '1234', '81dc9bdb52d04dc20036dbd8313ed055', '912ec803b2ce49e4a541068d495ab570', 2),
(3, 'nahin', '47d60f8c85fc25583958700ed9a0bca6', '81dc9bdb52d04dc20036dbd8313ed055', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a`
--
ALTER TABLE `a`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_vs_text_data`
--
ALTER TABLE `category_vs_text_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dated`
--
ALTER TABLE `dated`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `download`
--
ALTER TABLE `download`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `downloadtype`
--
ALTER TABLE `downloadtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featured`
--
ALTER TABLE `featured`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fixedtext`
--
ALTER TABLE `fixedtext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imgtype`
--
ALTER TABLE `imgtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page`
--
ALTER TABLE `page`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pagetype`
--
ALTER TABLE `pagetype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `people_email`
--
ALTER TABLE `people_email`
  ADD PRIMARY KEY (`text_data_id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`text_data_id`);

--
-- Indexes for table `sells`
--
ALTER TABLE `sells`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sells_details`
--
ALTER TABLE `sells_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `FK_stock_1` (`text_data_id`);

--
-- Indexes for table `stock_update`
--
ALTER TABLE `stock_update`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `text_data`
--
ALTER TABLE `text_data`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a`
--
ALTER TABLE `a`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `category_vs_text_data`
--
ALTER TABLE `category_vs_text_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dated`
--
ALTER TABLE `dated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `download`
--
ALTER TABLE `download`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `downloadtype`
--
ALTER TABLE `downloadtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=485;

--
-- AUTO_INCREMENT for table `imgtype`
--
ALTER TABLE `imgtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sells`
--
ALTER TABLE `sells`
  MODIFY `id` bigint(20) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sells_details`
--
ALTER TABLE `sells_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_update`
--
ALTER TABLE `stock_update`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `text_data`
--
ALTER TABLE `text_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=231;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
