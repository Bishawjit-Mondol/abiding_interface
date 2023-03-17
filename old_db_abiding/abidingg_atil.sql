-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2023 at 06:15 AM
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
-- Database: `abidingg_atil`
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
(1, 126),
(2, 121),
(3, 118),
(4, 119),
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
  `fixedtext` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fixedtext`
--

INSERT INTO `fixedtext` (`id`, `fixedtext`) VALUES
(1, 'ABIDING TRADE INT. LTD.'),
(2, 'Abiding Trade International Ltd - House of Quality Building Products - A unit of Abiding Group'),
(3, 'Abiding Trade International Ltd is a house of quality building products and a unit of Abiding Group. We are one of the largest importer and distributor of High Quality PPR and PVC pipe and pipe fittings in Bangladesh. Abiding Trade International Ltd as well as there sister concerns are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. Our mission is to work with our clients to develop the best possible habitat. We are committed to helping our clients to turn there dreams into really. Elaborate information about Abiding Trade International Ltd and their project would be available in this website soon, but now the website is still under construction. '),
(4, 'atil.abidinggroupbd.com'),
(5, 'smahamed23@yahoo.com'),
(6, 'House of Quality Building Products'),
(7, 'https://www.facebook.com/pages/Abiding-Trade-International-Ltd/1525303851052563');

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
(410, 'Fittings', 0, 0, 1, '', 0, 100),
(411, '90 Degree Elbow', 5, 188, 3, '', 0, 100),
(412, 'Angle-Stop-Cock', 5, 189, 3, '', 0, 100),
(413, 'Ball-Valve', 5, 190, 3, '', 0, 100),
(414, 'Conceal-Stop-Cock', 5, 191, 3, '', 0, 100),
(415, 'Cross-Tee', 5, 192, 3, '', 0, 100),
(416, 'End-Cap', 5, 193, 3, '', 0, 100),
(417, 'Equal-Tee', 5, 194, 3, '', 0, 100),
(418, 'Mr. Kamrul Islam', 2, 183, 1, '', 1, 50),
(420, 'Mr. ABM Sabbir Mokammel', 2, 185, 1, '', 0, 50),
(421, 'Mr. Syed Murad Ahamed', 2, 184, 1, '', 1, 50),
(422, 'Female Thread Union', 5, 196, 3, '', 0, 100),
(423, 'Female-Elbow-Copper-Thread', 5, 197, 3, '', 0, 100),
(424, 'Male-Elbow-Copper-Thread', 5, 200, 3, '', 0, 100),
(425, 'Female Tee Copper Thread', 5, 199, 3, '', 0, 50),
(426, 'Female Socket Copper Thread', 5, 198, 3, '', 0, 50),
(427, 'Male-Socket-Copper-Thread', 5, 201, 3, '', 0, 100),
(428, 'Male-Tee-Copper-Thread', 5, 202, 3, '', 0, 100),
(429, 'Plug', 5, 203, 3, '', 0, 100),
(430, 'Reducing-Elbow', 5, 204, 3, '', 0, 100),
(431, 'Reducing-Socket', 5, 205, 3, '', 0, 100),
(432, 'Stop-Valve-Gate-Valve-Coppe', 5, 206, 3, '', 0, 100),
(433, 'Union', 5, 207, 3, '', 0, 100),
(434, 'Fittings', 0, 0, 1, '', 0, 100),
(435, 'Angle Stop Cock and Female Thread Union', 0, 0, 1, '', 0, 100),
(436, 'Valve', 0, 0, 1, '', 0, 100),
(437, 'Pipe Cutter', 5, 208, 3, '', 0, 100),
(438, 'Heat Machine', 5, 209, 3, '', 0, 100),
(439, 'PPR Pipe', 5, 210, 1, '', 0, 100),
(440, 'Double Thread Female Elbow', 5, 211, 1, '', 0, 100);

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
(89, '2014-12-18', 'PRODUCT ORDER FROM SITE', '\n Name : df\n Address : klasdlk\n E-mail : sssskk@in.in\n Country : Bangladesh\n Phone : 22222222\n\nBooking Description : asdklf\n\nOrdered : Stop-Valve Gate Valve Coppe'),
(90, '2014-12-18', 'PRODUCT ORDER FROM SITE', '\n Name : df\n Address : \n E-mail : sssskk@in.in\n Country : Bangladesh\n Phone : 22222222\n\nBooking Description : asdklf\n\nOrdered : Stop-Valve Gate Valve Coppe'),
(91, '2014-12-18', 'PRODUCT ORDER FROM SITE', '\n Name : df\n Address : \n E-mail : sssskk@in.in\n Country : Bangladesh\n Phone : 22222222\n\nBooking Description : asdklf\n\nOrdered : Stop-Valve Gate Valve Coppe'),
(92, '2014-12-18', 'PRODUCT ORDER FROM SITE', '\n Name : df\n Address : \n E-mail : sssskk@in.in\n Country : Bangladesh\n Phone : 22222222\n\nBooking Description : asdklf\n\nOrdered : Stop-Valve Gate Valve Coppe'),
(93, '2015-01-08', 'test', ' Name : ankita\n E-mail : shahnazkhan19@yahoo.com\n\nHi '),
(94, '2015-01-16', 'bXmvaMqdeGjfze', ' Name : cqubtmfmgwt\n Company : xSrBnqBlcHrsGCgFsWA\n E-mail : ogjvpb@mfkhoq.com\n\n5gsWbM  &lt;a href=&quot;http://btqkhrmtcwhs.com/&quot;&gt;btqkhrmtcwhs&lt;/a&gt;, [url=http://hkkjhbhqzfhm.com/]hkkjhbhqzfhm[/url], [link=http://sxaoukszxkcr.com/]sxaoukszxkcr[/link], http://djcdpeuiaiba.com/'),
(95, '2015-01-31', 'viagra recommended dosage', ' Name : Cedriccelineer\n E-mail : cedricenaply@outlook.com\n\nbuying viagra in mexico erection viagra http://fast-sildenafil.com/ - Viagra cost of viagra pills uprima viagra &lt;a href=http://fast-sildenafil.com/&gt;Sildenafil&lt;/a&gt; is viagra covered by medicaid viagra discount card http://fast-sildenafil.com/ - Viagra. is generic viagra legal in canada viagra for copd'),
(96, '2015-04-25', 'Free E-book shows how to get #1 position in Google for your keyword', ' Name : Yoko\n Company : google\n E-mail : Lesmerises@yahoo.com\n\nDo you want to drive thousands of highly targeted visitors to your website and off Couse that is for free? In this case, only Google can help you. \r\n \r\nLearn all the 200 factors that Google considers to rank a site in its search result page. The e-book not only explains all the 200 factors, but also helps you to understand how you can implement these in your website so that Googles give your website full mark while considering your site for the #1 position. \r\n \r\nGet the E-book completely free, visit:- http://tinyurl.com/q3zjh9z \r\n \r\nThank You'),
(97, '2015-05-28', 'PRODUCT ORDER FROM SITE', '\n Name : sohag\n Address : akram towe\n E-mail : sohagadhl7@gmail.com\n Country : Bangladesh\n Phone : 01777786708\n\nBooking Description : 3 pcs\n\nOrdered : Reducing Elbow'),
(98, '2015-07-03', 'Jacqueline', ' Name : Jacqueline\n Company : Jacqueline\n E-mail : biruueqq@hotmail.fr\n\nHi my name is Jacqueline and I just wanted to drop you a quick note here instead of calling you. I discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more visitors. I have found that the key to running a popular website is making sure the visitors you are getting are interested in your niche. There is a company that you can get targeted visitors from and they let you try the service for free for 7 days. I managed to get over 300 targeted visitors to day to my website. Check it out here: http://zoy.bz/4nn\r\nJacqueline http://www.arvut.org/1/ddo'),
(99, '2015-08-12', 'PRODUCT ORDER FROM SITE', '\n Name : Syed ghjj\n Address : 57\n E-mail : smahamed23@yahoo.com\n Country : Bangladesh\n Phone : 7115225\n\nBooking Description : Plug 50 pcs \n\nOrdered : Plug'),
(100, '2015-08-12', 'PRODUCT ORDER FROM SITE', '\n Name : Syed\n Address : 57 kakrail \n E-mail : smahamed23@yahoo.com\n Country : Bangladesh\n Phone : 7115225\n\nBooking Description : Plug 50 pcs \n\nOrdered : Plug'),
(101, '2015-09-05', 'PRODUCT ORDER FROM SITE', '\n Name : Milad\n Address : \n E-mail : hpoteuhg7e9@outlook.com\n Country : Central African Republic\n Phone : 9q96TyqfFtq\n\nBooking Description : Someone on the list mentioned your pioppes and I am so glad I went back to look....gorgeous!I love pioppes and your threadpainting really does them justice.R\n\nOrdered : Angle Stop Cock'),
(102, '2015-10-08', 'PRODUCT ORDER FROM SITE', '\n Name : dani\n Address : dianko\n E-mail : zjhuijia@gmail.com\n Country : China\n Phone : 9999\n\nBooking Description : hi\r\n\n\nOrdered : 90 Degree Elbow'),
(103, '2016-02-09', 'PRODUCT ORDER FROM SITE', '\n Name : Mark\n Address : CpMQJHIcLGji\n E-mail : mark357177@hotmail.com\n Country : Malta\n Phone : 66896733802\n\nBooking Description : XBsmdU http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com\n\nOrdered : PPR Pipe'),
(104, '2016-03-11', 'Order for supply', ' Name : Sarwar\n E-mail : Sarwar@purba.ltd.com\n\nSalam, pl send SB to Purba office again as we are to order supply for dogs project soon. Sarwar , the Purba ltd 01974645474 tnx'),
(105, '2017-04-23', 'Elisa Brown', ' Name : Elisa Brown\n Company : Elisa Brown\n E-mail : zqbfugrpqip@fdsijrqf.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://tdil.co/3p'),
(106, '2017-05-24', 'Chelsea Wallace', ' Name : Chelsea Wallace\n Company : Chelsea Wallace\n E-mail : oqmnvsldgf@tkfdszixc.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site:  - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)																				Unsubscribe here: http://tdil.co/5p'),
(107, '2017-06-13', 'Sarah Hughes', ' Name : Sarah Hughes\n Company : Sarah Hughes\n E-mail : ngworl@ikxrbh.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://priscilarodrigues.com.br/url/v																				Unsubscribe here: http://tdil.co/5p'),
(108, '2017-06-29', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : tkftqhrfbu@whcrea.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://stpicks.com/27 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(109, '2017-07-25', 'Ann Weaver', ' Name : Ann Weaver\n Company : Ann Weaver\n E-mail : gdbwkuyul@dsrronap.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://priscilarodrigues.com.br/url/v																			Unsubscribe here: http://pcgroup.com.uy/2a'),
(110, '2017-08-19', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : fbysxjfe@jbeukxywux.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://v-doc.co/nm/jkfq0																													Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(111, '2017-09-04', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : oappeoyghkr@uzkgbwd.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://priscilarodrigues.com.br/url/v 															Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(112, '2017-09-09', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : dgpyimge@puayxs.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://v-doc.co/nm/jkfq0 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :) 																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(113, '2017-09-17', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : emagdou@bkopmt.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://url.euqueroserummacaco.com/ifa 															Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(114, '2017-09-24', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : bfqdjbjbl@zbjbzcs.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://lis.ovh/is																													Unsubscribe here: http://pcgroup.com.uy/2a'),
(115, '2017-10-01', 'Sarah Carlson', ' Name : Sarah Carlson\n Company : Sarah Carlson\n E-mail : ohbizjte@lmvjhtebxhd.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://segundaibc.com.br/go/1i - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :) 																				Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(116, '2017-10-09', 'Andrea Gibson', ' Name : Andrea Gibson\n Company : Andrea Gibson\n E-mail : yrlxrgh@djzatbl.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: https://flxv.tk/6																													Unsubscribe here: http://priscilarodrigues.com.br/url/11'),
(117, '2017-10-22', 'Sandra', ' Name : Sandra\n Company : Sandra\n E-mail : diqjuwwiqn@onuneg.com\n\nI decided to leave a message here on your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page instead of calling you. Do you need more likes for your Facebook Fan Page? The more people that LIKE your website and fanpage on Facebook, the more credibility you will have with new visitors. It works the same for Twitter, Instagram and Youtube. When people visit your page and see that you have a lot of followers, they now want to follow you too. They too want to know what all the hype is and why all those people are following you. Get some free likes, followers, and views just for trying this service: http://pcgroup.com.uy/1n134																		Unsubscribe here: http://corta.co/eXu'),
(118, '2017-11-03', 'Andrea Gibson', ' Name : Andrea Gibson\n Company : Andrea Gibson\n E-mail : brhfjbeqtnd@hcgyyufmwi.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://priscilarodrigues.com.br/url/v 															Unsubscribe here: http://corta.co/f5m'),
(119, '2017-11-07', 'Erma Bowman', ' Name : Erma Bowman\n Company : Erma Bowman\n E-mail : osjlill@flzwnmvzcz.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:http://priscilarodrigues.com.br/url/v																													Unsubscribe here: http://corta.co/f5m'),
(120, '2017-11-12', 'Erma Bowman', ' Name : Erma Bowman\n Company : Erma Bowman\n E-mail : kpaewcsv@gueimjsbd.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:http://priscilarodrigues.com.br/url/v																													Unsubscribe here: http://corta.co/f5m\r\nErma Bowman http://priscilarodrigues.com.br/url/v'),
(121, '2017-11-18', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : igjtbkqmsbl@mziblbqx.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/csy																				Unsubscribe here: http://0nulu.com/mvx'),
(122, '2017-11-29', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : tqntpbysce@gmail.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/sdq																				Unsubscribe here: http://0nulu.com/mvx'),
(123, '2017-12-03', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : ngusnc@gmail.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your site: http://0nulu.com/sdq - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/mvx'),
(124, '2017-12-07', 'Virginia Williams', ' Name : Virginia Williams\n Company : Virginia Williams\n E-mail : ladihkjacr@gmail.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/csy		 																	Unsubscribe here: http://0nulu.com/mvx'),
(125, '2017-12-13', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : bbjlrmo@gmail.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://0nulu.com/rjv																				Unsubscribe here: http://0nulu.com/nbz'),
(126, '2017-12-21', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : tsuvxsmvbq@gmail.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/rjv		 																	Unsubscribe here: http://0nulu.com/mvx'),
(127, '2017-12-28', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : sjommeiahe@gmail.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will  dramatically increase your traffic to your website: http://0nulu.com/rjv - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://0nulu.com/mvx'),
(128, '2018-01-03', 'Heidi Reynolds', ' Name : Heidi Reynolds\n Company : Heidi Reynolds\n E-mail : zcfvelsdjq@gmail.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://0nulu.com/sdq		 																	Unsubscribe here: http://0nulu.com/mvx'),
(129, '2018-01-22', 'Website Traffic', ' Name : Website Traffic\n Company : Website Traffic\n E-mail : juhgkqbd@gmail.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://0nulu.com/opx		 																	Unsubscribe here: http://0nulu.com/nbz'),
(130, '2018-01-27', 'Website Traffic', ' Name : Website Traffic\n Company : Website Traffic\n E-mail : aodmlqgm@gmail.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://0nulu.com/opx		 																	Unsubscribe here: http://0nulu.com/mvx'),
(131, '2018-02-02', 'Carla French', ' Name : Carla French\n Company : Carla French\n E-mail : htfdnftdkxh@gmail.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here:http://0nulu.com/sdq																				Unsubscribe here: http://0nulu.com/mvx'),
(132, '2018-02-08', 'Carla French', ' Name : Carla French\n Company : Carla French\n E-mail : fglwzslpbsl@gmail.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here: http://gd.is/y/nfhpq																				Unsubscribe here: http://gd.is/y/mun53'),
(133, '2018-02-14', 'Rebecca Sutton', ' Name : Rebecca Sutton\n Company : Rebecca Sutton\n E-mail : vjaypkwcs@gmail.com\n\nI am reaching out since we saw a link to your website and thought you would be a good candidate for our traffic service. We provide targeted website traffic to virtually any type of website. We target our visitors by both country and keywords that you either submit to us or we can do keyword research for you. We offer a seven day FREE trial period with free traffic so that you can try our service to make sure it will work for you. Which of your websites needs the most growth? Find out more here: http://priscilarodrigues.com.br/url/v																				Unsubscribe here: http://gd.is/y/mun53'),
(134, '2018-02-26', 'Barbara Kennedy', ' Name : Barbara Kennedy\n Company : Barbara Kennedy\n E-mail : qoaraw@gmail.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://gd.is/y/nfhpq																				Unsubscribe here: http://gd.is/y/mun53'),
(135, '2018-03-05', 'Ramona Jordan', ' Name : Ramona Jordan\n Company : Ramona Jordan\n E-mail : cojhwxapuy@gmail.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: http://insl.co/11 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://xahl.de/q'),
(136, '2018-04-01', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : ycewxcind@gmail.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://stpicks.com/2rusd																					Unsubscribe here: http://stpicks.com/2ruse'),
(137, '2018-04-15', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : rpfrkznt@gmail.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://url.euqueroserummacaco.com/3ewon																					Unsubscribe here: http://xahl.de/q'),
(138, '2018-04-21', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : xzroet@gmail.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://insl.co/11																					Unsubscribe here: http://stpicks.com/2ruse'),
(139, '2018-05-01', 'Kerry Beck', ' Name : Kerry Beck\n Company : Kerry Beck\n E-mail : apjuyp@fnobdqcmmju.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: http://xahl.de/p - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://stpicks.com/2ruse'),
(140, '2018-05-09', 'Monica', ' Name : Monica\n Company : Monica\n E-mail : yxjslzzy@olhjhktrvuf.com\n\nNeed to rank your website? Get some free backlinks here: http://freest.at/4kl We use a natural link building strategy to build awesome in-content backlinks. Our massive team of copywriters create original, semantically relevant content around your subject matter. We then post that content around the web to make your website go viral in the eyes of Google. Start your free trial today: http://corta.co/gpQm                                  																				Unsubscribe: https://bwlink.io/39imp'),
(141, '2018-05-21', 'Monica', ' Name : Monica\n Company : Monica\n E-mail : eatmfij@ldjlanxw.com\n\nNeed to rank your website? Get some free backlinks here: http://corta.co/gpQm We use a natural link building strategy to build awesome in-content backlinks. Our massive team of copywriters create original, semantically relevant content around your subject matter. We then post that content around the web to make your website go viral in the eyes of Google. Start your free trial today: http://likes.avanimisra.com/4p1o                                  																				Unsubscribe: http://freest.at/4km'),
(142, '2018-06-03', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : ikycyazgjaa@ipawlotx.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your website: http://insl.co/11 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://xahl.de/q'),
(143, '2018-06-17', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : tledccxs@fneijlcl.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: http://xahl.de/p - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://xahl.de/q');
INSERT INTO `mail` (`id`, `date`, `subject`, `message`) VALUES
(144, '2018-06-26', 'Amber Stevens', ' Name : Amber Stevens\n Company : Amber Stevens\n E-mail : vubqeuqa@wyrbbu.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://insl.co/11																					Unsubscribe here: http://stpicks.com/2ruse'),
(145, '2018-07-12', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : rcursuoyvrr@waoqfiijub.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://insl.co/11																				Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors http://insl.co/11'),
(146, '2018-07-21', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : msvznvfk@vyaiavz.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: https://flust.de/tpuwx																				Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors https://flust.de/tpuwx'),
(147, '2018-08-30', 'Targeted website visitors', ' Name : Targeted website visitors\n Company : Targeted website visitors\n E-mail : qqltnkldut@bdlozd.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: http://insl.co/11																					Unsubscribe here: http://stpicks.com/2ruse\r\nTargeted website visitors http://insl.co/11'),
(148, '2018-09-11', 'Rate adjustment notice', ' Name : Matthew Gooseberry\n Company : Matthew Gooseberry\n E-mail : matthew.gooseberry13@yahoo.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: http://stpicks.com/2rusd\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: http://stpicks.com/2ruse'),
(149, '2018-09-18', 'Shana Marley', ' Name : Shana Marley\n Company : Shana Marley\n E-mail : tcjgrgf@gehbeuduh.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your website: http://stpicks.com/2rusd - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://stpicks.com/2ruse\r\nShana Marley http://stpicks.com/2rusd'),
(150, '2018-09-29', 'Shana Marley', ' Name : Shana Marley\n Company : Shana Marley\n E-mail : tcqwse@azzvgpwpk.com\n\nThis is a message to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us admin. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: http://duckshop.co/1f1p - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: http://stpicks.com/2ruse\r\nShana Marley http://duckshop.co/1f1p'),
(151, '2018-10-02', 'Rate adjustment notice', ' Name : Ellie Brandenburg\n Company : Ellie Brandenburg\n E-mail : brandenburg.ellie15@yahoo.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: http://duckshop.co/1f1p\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: http://stpicks.com/2ruse'),
(152, '2018-10-12', 'Dianne Bennett', ' Name : Dianne Bennett\n Company : Dianne Bennett\n E-mail : ttgdaqg@jotmdlc.com\n\nI discovered your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Check it out here: http://s.miku.moe/jbpuz																					Unsubscribe here: https://twe.lv/gg'),
(153, '2018-10-21', 'Nicole Mawrey', ' Name : Nicole Mawrey\n Company : Nicole Mawrey\n E-mail : ayjtbnmk@lyukhv.com\n\nThis is a comment to the ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us webmaster. Your website is missing out on at least 300 visitors per day. Our traffic system will dramatically increase your traffic to your site: https://38x.de/92sj7 - We offer 500 free targeted visitors during our free trial period and we offer up to 30,000 targeted visitors per month. Hope this helps :)											 					Unsubscribe here: https://twe.lv/gg'),
(154, '2018-10-26', 'Rate adjustment notice', ' Name : Franchesca Kortig\n Company : Franchesca Kortig\n E-mail : kortig.franchesca@gmail.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: https://38x.de/92sj7\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: https://twe.lv/gg'),
(155, '2018-10-29', 'Nicole Mawrey', ' Name : Nicole Mawrey\n Company : Nicole Mawrey\n E-mail : aujzlild@kqrzawovanj.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE website traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: https://38x.de/92sj7																				Unsubscribe here: https://twe.lv/gg'),
(156, '2018-11-07', 'Nicole Mawrey', ' Name : Nicole Mawrey\n Company : Nicole Mawrey\n E-mail : gigrbex@qcdwdo.com\n\nI came to your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us page and noticed you could have a lot more traffic. I have found that the key to running a website is making sure the visitors you are getting are interested in your subject matter. We can send you targeted traffic and we let you try it for free. Get over 1,000 targeted visitors per day to your website. Start your free trial: https://38x.de/92sj7																					Unsubscribe here: https://twe.lv/gg'),
(157, '2018-11-17', 'Heidi Wright', ' Name : Heidi Wright\n Company : Heidi Wright\n E-mail : usrmgqcjy@yvipxgaay.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: https://38x.de/92sj7																				Unsubscribe here: https://twe.lv/gg'),
(158, '2018-11-20', 'Rate adjustment notice', ' Name : Kala Edmonds\n Company : Kala Edmonds\n E-mail : kala.edmonds@gmail.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: http://s.miku.moe/jbpuz\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: https://twe.lv/gg'),
(159, '2018-11-27', 'Lillian Davis', ' Name : Lillian Davis\n Company : Lillian Davis\n E-mail : uplwtws@cnaiaw.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: https://go.woh.to/151																				Unsubscribe here: https://twe.lv/gg'),
(160, '2018-12-07', 'Rate adjustment notice', ' Name : Danny Nealy\n Company : Danny Nealy\n E-mail : nealy.danny48@gmail.com\n\nFor a limited time we have lowered the rate on targeted website traffic. We have visitors from virtually every country on Earth. Each visitor is targeted by both country and keywords that you submit when you start your free trial period. If you need more visitors or product sales try our service free for seven days and we will send you 500 free visitors during the trial. There are no contracts and if you cancel during the trial period you will not be charged anything! Start your trial today: http://wntdco.mx/dkfzt	\r\n\r\n\r\n\r\n\r\n\r\n\r\nUnsubscribe here: http://2url.de/1alt'),
(161, '2018-12-25', 'Kelley Brown', ' Name : Kelley Brown\n Company : Kelley Brown\n E-mail : mgavwktvgmh@qzrtpmj.com\n\nI came across your ABIDING TRADE INT. LTD. - House of Quality Building Products - Contact Us website and wanted to let you know that we have decided to open our POWERFUL and PRIVATE web traffic system to the public for a limited time! You can sign up for our targeted traffic network with a free trial as we make this offer available again. If you need targeted traffic that is interested in your subject matter or products start your free trial today: http://sp7.site/7																					Unsubscribe here: http://sp7.site/8'),
(162, '2020-09-29', '??????????? ?????? ????????? ??????', ' Name : jdikiirf\n Company : google\n E-mail : nsly72@mail.ru\n\n???????? seo ????????? ??????????? ?????, ???????? ?????? ?? ??????????? ????? ?? ???? ????????? ???????? ?? ?????? ?????????? ? ????? ????? &lt;b&gt;pokras7777&lt;/b&gt;????????? ????? ??? ???? \r\n.??? ?? ???????? ????  ???????? ?????? ????? ???? ??? ?????? \r\n \r\n'),
(163, '2021-08-01', 'Price Quotation', ' Name : Md. Amzad Hossen\n Company : Transpower Engineering Corporation \n E-mail : transpowerdk@gmail.com\n\ni need the price List of PPR Pipe &amp; PPR Fittings . If Need the BOQ , Please response my email as soon as early. \r\n\r\n\r\nMd. Amzad Hossen \r\nCell: +8801766679701\r\nTranspower Engineering Corporation\r\nTranspower Engineering Ltd.\r\nwww.transpowerbd.com'),
(164, '2021-11-20', '????????? ? ????????? ??? ????????', ' Name : RichardHob\n Company : google\n E-mail : glukhina.1998@mail.ru\n\n??????? ??? ???? ???????? ????? ????????? ???????? ?? ??????? ???????  ????????????????? ????? &lt;b&gt;&lt;a href=https://r.honeygain.me/BIKON9A1AB&gt;?????&lt;/a&gt;&lt;/b&gt;'),
(165, '2021-12-25', '?????? ?????? ????? ????????', ' Name : EverettNinee\n Company : google\n E-mail : glukhina.1998@mail.ru\n\n???????? ?????????, ???? ? ????????? ????????-??????, ??????? ??????????? ????????. ? ???? ?????? ???? ??? ????????? ??? ????????: ???????? ????, ???????? ?????? ??? ?????????? ?????. ??? ??????? ?????? ??????? ???????, ?????? ??????????????? ??????? \r\n?? ????? ????? &quot;??????? ??????&quot; &mdash; ???????? ? ???????? ? ????????. \r\n \r\nhttps://vd-tv.ru\r\nhttp://remstroitelstvo.ru\r\nhttps://dooralei.ru\r\nhttp://u-sity.net\r\nhttps://arctic-online.ru\r\nhttps://mirzodiaka.com\r\nhttps://dobrenok.com\r\nhttps://csharpcoderr.com\r\nhttps://zagorodny.net\r\nhttps://vpolozhenii.com\r\nhttps://1npf.com\r\nhttp://medinfon.ru\r\nhttps://avtotema.kr.ua\r\nhttp://nalatty.com\r\nhttps://1001guru.ru\r\nhttp://teletap.org\r\nhttp://slapk.ru\r\nhttp://dumainfo.ru\r\nhttps://domocvet.com\r\nhttp://womaan.ru\r\nhttp://montazhnik02.ru\r\nhttps://renewablenergy-world.com\r\nhttp://dk-zio.ru\r\nhttps://2019god.net\r\nhttp://tvoi-noski.ru\r\nhttp://rusbetonplus.ru\r\nhttp://sovet-sadovody.ru\r\nhttps://rossoshru.ru\r\nhttp://akro-spb.ru\r\nhttps://rabotainternet.com\r\nhttp://windowss10.ru\r\nhttp://apploidnews.com\r\nhttp://xozyaika.com\r\nhttps://lifeposi.ru\r\nhttps://deepcool-ma.com\r\nhttp://s-narodom.ru\r\nhttps://milomarket.com\r\nhttps://hozyaushka.org\r\nhttp://omontazhe.ru\r\nhttp://kapitosha.net\r\nhttps://parovarim.com\r\nhttp://gdefile.ru\r\nhttps://buzulukmedia.ru\r\nhttp://oneznakomke.ru\r\nhttp://ladyup.ru\r\nhttp://qllq.ru\r\nhttp://gturs.com\r\nhttp://rempostroy.ru\r\nhttp://dettka.com\r\nhttp://womanmaniya.ru\r\nhttps://adres.kr.ua\r\nhttps://fraufluger.ru\r\nhttps://ruspl.com\r\nhttps://astrakhan.net\r\nhttp://kakpravilino.com\r\nhttp://beton-cement-ru.ru\r\nhttp://shoptrip.ru\r\nhttps://loverust.ru\r\nhttp://ladysarafan.ru\r\nhttps://chexov.net\r\nhttp://ladystory.ru\r\nhttps://zazdorovie.net\r\nhttps://albooking.net\r\nhttps://hypecrib.com\r\nhttps://russianshop.org\r\nhttps://womanka.com\r\nhttp://blitz-remont.ru\r\nhttps://cultmoscow.com\r\nhttps://friendlygames.ru\r\nhttps://donklephant.net\r\nhttps://dailybest.me\r\nhttps://doccentr.com\r\nhttps://ifvremya.ru\r\nhttps://novostidnja.ru\r\nhttp://fi-hi.ru\r\nhttp://dom-lady.ru\r\nhttp://newsfast.ru\r\nhttp://telead.ru\r\nhttps://icar-by.com\r\nhttps://pancreatus.com\r\nhttps://dvedoli.com\r\nhttps://2020about.com\r\nhttp://intofact.ru\r\nhttp://zonakulinara.ru\r\nhttps://4dekor.ru\r\nhttps://crimeabest.com\r\nhttps://aromat.kr.ua\r\nhttps://mama-creative.com\r\nhttp://about-windows.ru\r\nhttp://binom-s.com\r\nhttps://womanjour.ru\r\nhttp://roofor.ru\r\nhttp://mirokru.ru\r\nhttps://modnuesovetu.ru\r\nhttp://hayastannews.com\r\nhttps://megamcpe.com\r\nhttps://belady.online\r\nhttp://domoxozyaiki.ru\r\nhttps://golubevod.net\r\n'),
(166, '2021-12-27', 'Look this free videos', ' Name : Richardappen\n Company : google\n E-mail : maxtubex@gmail.com\n\n&lt;a href=https://www.slutl.com/&gt;free hardcore movie&lt;/a&gt; slut tube present pleasant time spending \r\n \r\n&lt;a href=https://afalinaclimat.ru/blog/komplekty-dlya-zimnej-ekspluatatsii-konditsiionerov#comment_71&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=https://www.relaxoffice.co.uk/relax-impulse-1200-height-cupboard.html&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=https://la2s.ru/forum/index.php/topic,1.new.html#new&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://www.nihongoplat.org/2017/10/29/%e3%83%96%e3%83%a9%e3%82%b8%e3%83%ab%e3%83%bb%e3%82%b5%e3%83%b3%e3%83%91%e3%82%a6%e3%83%ad%e5%b8%82%e3%81%ae%e3%83%96%e3%83%a9%e3%82%b8%e3%83%ab%e6%97%a5%e6%9c%ac%e8%aa%9e%e3%82%bb%e3%83%b3%e3%82%bf/#comment-345630&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://certifiedlearner.org/#comment-40318&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://aojiaoji.com/index.php?case=guestbook&amp;act=index&amp;url=cn&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://rizo-totinow.seesaa.net/article/218707593.html&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=https://www.diendandj.com/threads/do%CC%A3c-sang-xi%CC%A3n-mi%CC%A3n-15.150637/#post-1481381&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://condensator.kz/blog/otzyvy#comment_3106&gt;Look this free videos&lt;/a&gt;\r\n&lt;a href=http://batkimtrang.com/san-pham/bat-dua/bat-dua.html&gt;Look this free videos&lt;/a&gt;\r\n 6022b93 '),
(167, '2022-01-08', '?????? ?????? ????? ????????', ' Name : EverettNinee\n Company : google\n E-mail : glukhina.1998@mail.ru\n\n???????? ?????????, ???? ? ????????? ????????-??????, ??????? ??????????? ????????. ? ???? ?????? ???? ??? ????????? ??? ????????: ???????? ????, ???????? ?????? ??? ?????????? ?????. ??? ??????? ?????? ??????? ???????, ?????? ??????????????? ??????? \r\n?? ????? ????? &quot;??????? ??????&quot; &mdash; ???????? ? ???????? ? ????????. \r\n \r\n&lt;a href=https://viewangle.net&gt;i&lt;/a&gt;\r\n&lt;a href=https://doccentr.com&gt;a&lt;/a&gt;,&lt;a href=http://dom-lady.ru&gt;b&lt;/a&gt;,&lt;a href=https://zagorodny.net&gt;c&lt;/a&gt;,&lt;a href=https://ifvremya.ru&gt;d&lt;/a&gt;,&lt;a href=http://akro-spb.ru&gt;i&lt;/a&gt;,&lt;a href=http://blitz-remont.ru&gt;f&lt;/a&gt;,&lt;a href=https://ruspl.com&gt;g&lt;/a&gt;,&lt;a href=https://dailybest.me&gt;h&lt;/a&gt;,&lt;a href=https://novostidnja.ru&gt;i&lt;/a&gt;,&lt;a href=http://binom-s.com&gt;j&lt;/a&gt;,&lt;a href=http://medinfon.ru&gt;k&lt;/a&gt;,&lt;a href=https://friendlygames.ru&gt;l&lt;/a&gt;,&lt;a href=https://2019god.net&gt;m&lt;/a&gt;,&lt;a href=http://rusbetonplus.ru&gt;n&lt;/a&gt;,&lt;a href=https://domocvet.com&gt;o&lt;/a&gt;,&lt;a href=http://telead.ru&gt;p&lt;/a&gt;,&lt;a href=http://womaan.ru&gt;q&lt;/a&gt;,&lt;a href=http://ladyup.ru&gt;r&lt;/a&gt;,&lt;a href=http://about-windows.ru&gt;s&lt;/a&gt;,&lt;a href=http://icar-by.com&gt;t&lt;/a&gt;,&lt;a href=https://pancreatus.com&gt;u&lt;/a&gt;,&lt;a href=http://shoptrip.ru&gt;v&lt;/a&gt;,&lt;a href=http://zonakulinara.ru&gt;w&lt;/a&gt;,&lt;a href=https://loverust.ru&gt;x&lt;/a&gt;,&lt;a href=http://beton-cement-ru.ru&gt;y&lt;/a&gt;,&lt;a href=http://tvoi-noski.ru&gt;z&lt;/a&gt;,&lt;a href=http://arctic-online.ru&gt;a&lt;/a&gt;,&lt;a href=http://dk-zio.ru&gt;b&lt;/a&gt;,&lt;a href=http://womanmaniya.ru&gt;c&lt;/a&gt;,&lt;a href=https://4dekor.ru&gt;d&lt;/a&gt;,&lt;a href=http://apploidnews.com&gt;i&lt;/a&gt;,&lt;a href=http://omontazhe.ru&gt;f&lt;/a&gt;,&lt;a href=http://qllq.ru&gt;g&lt;/a&gt;,&lt;a href=http://windowss10.ru&gt;h&lt;/a&gt;,&lt;a href=http://domoxozyaiki.ru&gt;i&lt;/a&gt;,&lt;a href=http://dumainfo.ru&gt;j&lt;/a&gt;,&lt;a href=http://rempostroy.ru&gt;k&lt;/a&gt;,&lt;a href=http://slapk.ru&gt;l&lt;/a&gt;,&lt;a href=http://gdefile.ru&gt;m&lt;/a&gt;,&lt;a href=https://1vesti.kharkiv.ua&gt;n&lt;/a&gt;,&lt;a href=https://newsstroy.kyiv.ua&gt;o&lt;/a&gt;,&lt;a href=https://rnews.kharkiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://rnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://bestnews.kyiv.ua&gt;r&lt;/a&gt;,&lt;a href=https://bestnews.kharkiv.ua&gt;s&lt;/a&gt;,&lt;a href=https://newsfor.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://newsfor.kyiv.ua&gt;u&lt;/a&gt;,&lt;a href=https://newsfor.kharkiv.ua&gt;v&lt;/a&gt;,&lt;a href=https://vsenews.kharkiv.ua&gt;w&lt;/a&gt;,&lt;a href=https://n1.kharkiv.ua&gt;x&lt;/a&gt;,&lt;a href=https://autonews.kyiv.ua&gt;y&lt;/a&gt;,&lt;a href=https://nbest.kyiv.ua&gt;z&lt;/a&gt;,&lt;a href=https://nbest.kharkiv.ua&gt;a&lt;/a&gt;,&lt;a href=https://n1.kyiv.ua&gt;b&lt;/a&gt;,&lt;a href=https://newsstroy.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://x-news.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://v-news.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://novostidnya.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://newsru.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://daynews.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://realnews.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://thenews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://sobitiya.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://miv.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://rnews.kyiv.ua&gt;m&lt;/a&gt;,&lt;a href=https://1vesti.kyiv.ua&gt;n&lt;/a&gt;,&lt;a href=https://vsenews.kyiv.ua&gt;o&lt;/a&gt;,&lt;a href=https://autonews.kharkiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://mirnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://onews.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://uk.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://vnovostyah.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://infopress.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://vse.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://n-news.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://development.eu.com&gt;x&lt;/a&gt;,&lt;a href=https://vesti.eu.com&gt;y&lt;/a&gt;,&lt;a href=https://novosti.eu.com&gt;z&lt;/a&gt;,&lt;a href=https://allaboutnews.eu.com&gt;a&lt;/a&gt;,&lt;a href=https://rusnews.kharkiv.ua&gt;b&lt;/a&gt;,&lt;a href=https://f-news.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://formatnews.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://autonews.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://worldpress.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://vsenews.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://nbest.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://1vesti.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://svodnews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://q.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://yk.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://onlinenews.eu.com&gt;m&lt;/a&gt;,&lt;a href=https://people.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://n1.kr.ua&gt;o&lt;/a&gt;,&lt;a href=https://rusnews.kyiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://rusnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://bestnews.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://euronews.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://timenews.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://rtnews.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://town-news.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://krnews.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://vedomost.kr.ua&gt;x&lt;/a&gt;,&lt;a href=https://euro.kr.ua&gt;y&lt;/a&gt;,&lt;a href=https://1news.kr.ua&gt;z&lt;/a&gt;,&lt;a href=https://obzor.kr.ua&gt;a&lt;/a&gt;,&lt;a href=https://aboutnews.kr.ua&gt;b&lt;/a&gt;,&lt;a href=https://worldnews.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://newsday.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://strana.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://newsn.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://infonews.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://h.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://moivesti.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://currentnews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://easynews.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://lifenews.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://lastnews.kr.ua&gt;m&lt;/a&gt;,&lt;a href=https://j.kr.ua&gt;n&lt;/a&gt;,&lt;a href=https://inform.kr.ua&gt;o&lt;/a&gt;,&lt;a href=https://rus.kr.ua&gt;p&lt;/a&gt;,&lt;a href=https://press-release.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://izvesti.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://034.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://v.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://xop.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://dni.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://ykr.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://newsportal.kr.ua&gt;x&lt;/a&gt;,&lt;a href=https://msv.kr.ua&gt;y&lt;/a&gt;,&lt;a href=https://s5.kr.ua&gt;z&lt;/a&gt;,&lt;a href=https://znews.kr.ua&gt;a&lt;/a&gt;,&lt;a href=https://information.kr.ua&gt;b&lt;/a&gt;,&lt;a href=https://ukr.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://portalnews.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://today.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://xznews.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://nn.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://mls.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://novostnik.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://informing.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://vnovosti.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://y.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://nation.kr.ua&gt;m&lt;/a&gt;,&lt;a href=https://item.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://gazette.eu.com&gt;o&lt;/a&gt;,&lt;a href=https://headline.eu.com&gt;p&lt;/a&gt;,&lt;a href=https://fact.eu.com&gt;q&lt;/a&gt;,&lt;a href=https://somenews.eu.com&gt;r&lt;/a&gt;,&lt;a href=https://lifenews.eu.com&gt;s&lt;/a&gt;,&lt;a href=https://tidings.eu.com&gt;t&lt;/a&gt;,&lt;a href=https://today.eu.com&gt;u&lt;/a&gt;,&lt;a href=https://eunews.eu.com&gt;v&lt;/a&gt;,&lt;a href=https://sir.eu.com&gt;w&lt;/a&gt;,&lt;a href=https://journal.eu.com&gt;x&lt;/a&gt;,&lt;a href=https://gazeta.eu.com&gt;y&lt;/a&gt;,&lt;a href=https://lenta.eu.com&gt;z&lt;/a&gt;,&lt;a href=https://exclusive.eu.com&gt;a&lt;/a&gt;,&lt;a href=https://all.eu.com&gt;b&lt;/a&gt;,&lt;a href=https://expert.eu.com&gt;c&lt;/a&gt;,&lt;a href=https://news-magazine.eu.com&gt;d&lt;/a&gt;,&lt;a href=https://newshour.eu.com&gt;i&lt;/a&gt;,&lt;a href=https://presentation.eu.com&gt;f&lt;/a&gt;,&lt;a href=https://publication.eu.com&gt;g&lt;/a&gt;,&lt;a href=https://release.eu.com&gt;h&lt;/a&gt;,&lt;a href=https://smi.eu.com&gt;i&lt;/a&gt;,&lt;a href=https://view.eu.com&gt;j&lt;/a&gt;,&lt;a href=https://vremya.eu.com&gt;k&lt;/a&gt;,&lt;a href=https://prsn.eu.com&gt;l&lt;/a&gt;,&lt;a href=https://lnd.eu.com&gt;m&lt;/a&gt;,&lt;a href=https://034.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://all-about.eu.com&gt;o&lt;/a&gt;,&lt;a href=https://solution.eu.com&gt;p&lt;/a&gt;,&lt;a href=https://rightnow.eu.com&gt;q&lt;/a&gt;,&lt;a href=https://euro21.eu.com&gt;r&lt;/a&gt;,&lt;a href=https://euro22.eu.com&gt;s&lt;/a&gt;,&lt;a href=https://100.eu.com&gt;t&lt;/a&gt;,&lt;a href=https://mdrd.eu.com&gt;u&lt;/a&gt;,&lt;a href=https://newtime.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://fraufluger.ru&gt;w&lt;/a&gt;,&lt;a href=https://rossoshru.ru&gt;x&lt;/a&gt;,&lt;a href=https://lifeposi.ru&gt;y&lt;/a&gt;,&lt;a href=http://megamcpe.com&gt;z&lt;/a&gt;,&lt;a href=https://mirzodiaka.com&gt;a&lt;/a&gt;,&lt;a href=http://ladysarafan.ru&gt;b&lt;/a&gt;,&lt;a href=https://hypecrib.com&gt;c&lt;/a&gt;,&lt;a href=https://vd-tv.ru&gt;d&lt;/a&gt;,&lt;a href=https://buzulukmedia.ru&gt;i&lt;/a&gt;,&lt;a href=https://donklephant.net&gt;f&lt;/a&gt;,&lt;a href=https://avtotema.kr.ua&gt;g&lt;/a&gt;,&lt;a href=http://hayastannews.com&gt;h&lt;/a&gt;,&lt;a href=https://deepcool-ma.com&gt;i&lt;/a&gt;,&lt;a href=https://russianshop.org&gt;j&lt;/a&gt;,&lt;a href=http://dettka.com&gt;k&lt;/a&gt;,&lt;a href=https://chexov.net&gt;l&lt;/a&gt;,&lt;a href=http://nalatty.com&gt;m&lt;/a&gt;,&lt;a href=https://hozyaushka.org&gt;n&lt;/a&gt;,&lt;a href=http://montazhnik02.ru&gt;o&lt;/a&gt;,&lt;a href=https://mama-creative.com&gt;p&lt;/a&gt;,&lt;a href=https://crimeabest.com&gt;q&lt;/a&gt;,&lt;a href=https://womanka.com&gt;r&lt;/a&gt;,&lt;a href=http://teletap.org&gt;s&lt;/a&gt;,&lt;a href=https://csharpcoderr.com&gt;t&lt;/a&gt;,&lt;a href=https://dooralei.ru&gt;u&lt;/a&gt;,&lt;a href=http://newsfast.ru&gt;v&lt;/a&gt;,&lt;a href=https://2020about.com&gt;w&lt;/a&gt;,&lt;a href=http://u-sity.net&gt;x&lt;/a&gt;,&lt;a href=http://intofact.ru&gt;y&lt;/a&gt;,&lt;a href=https://astrakhan.net&gt;z&lt;/a&gt;,&lt;a href=http://oneznakomke.ru&gt;a&lt;/a&gt;,&lt;a href=https://vpolozhenii.com&gt;b&lt;/a&gt;,&lt;a href=http://gturs.com&gt;c&lt;/a&gt;,&lt;a href=https://cultmoscow.com&gt;d&lt;/a&gt;,&lt;a href=https://dvedoli.com&gt;i&lt;/a&gt;,&lt;a href=https://belady.online&gt;f&lt;/a&gt;,&lt;a href=https://dobrenok.com&gt;g&lt;/a&gt;,&lt;a href=https://milomarket.com&gt;h&lt;/a&gt;,&lt;a href=https://adres.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://womanjour.ru&gt;j&lt;/a&gt;,&lt;a href=http://ladystory.ru&gt;k&lt;/a&gt;,&lt;a href=http://kapitosha.net&gt;l&lt;/a&gt;,&lt;a href=http://mirokru.ru&gt;m&lt;/a&gt;,&lt;a href=https://kakpravilino.com&gt;n&lt;/a&gt;,&lt;a href=https://1001guru.ru&gt;o&lt;/a&gt;,&lt;a href=http://xozyaika.com&gt;p&lt;/a&gt;,&lt;a href=https://aromat.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://parovarim.com&gt;r&lt;/a&gt;,&lt;a href=http://remstroitelstvo.ru&gt;s&lt;/a&gt;,&lt;a href=https://golubevod.net&gt;t&lt;/a&gt;,&lt;a href=http://s-narodom.ru&gt;u&lt;/a&gt;,&lt;a href=https://zazdorovie.net&gt;v&lt;/a&gt;,&lt;a href=http://roofor.ru&gt;w&lt;/a&gt;,&lt;a href=http://sovet-sadovody.ru&gt;x&lt;/a&gt;,&lt;a href=https://albooking.net&gt;y&lt;/a&gt;,&lt;a href=http://fi-hi.ru&gt;z&lt;/a&gt;,&lt;a href=https://modnuesovetu.ru&gt;a&lt;/a&gt;,&lt;a href=https://rabotainternet.com&gt;b&lt;/a&gt;,&lt;a href=https://1npf.com&gt;c&lt;/a&gt;,&lt;a href=https://renewablenergy-world.com&gt;d&lt;/a&gt;,\r\n'),
(168, '2022-01-23', '??????? ???? ??? ???????', ' Name : EverettNinee\n Company : google\n E-mail : glukhina.1998@mail.ru\n\n???? ???????? ??? ??????? \r\n?? ??????????? ???????????? ??????? ????? ??? ? ???. ? ??? ?? ?????? ??????? ????? ?????? ??? ????? ?????? ???? ??? ???????? Xrumer ? GSA, allsubmitter ?? ?????? ??????? ?????????.??? ??????? ???? ??? ??????? \r\nXrumer ? GSA, allsubmitter \r\n???? ?? ??????, ???? ??? ???? ????????? ??? ????? ?????? ???????????, ?? ?????, ???? ?? ??? ?? ?????? ???????? ? ???????, ?? ? ?????? ???????????????? ??? ???????????. ??? ????????? ?????? ?????? ? ??????, ?????? ???? ?????? ??????? ???????? ??????? ? ??????? ??????? ???? ? ?????????? ??????, ?? ????? ???????????? ?????? ????? ????????. ????? ??????? ?? ?????? ?? ?????? ??????? ???????? ???????? ?????????, ?? ? ???? ?????????? ????? ? ??????. \r\n \r\n?????? &mdash; ??? ???? ??? ???????? ???????? ???????????? ?? ????????? ?????, ?????, ????? ?????????? ? ???? ?????????? ????. ?????? ?? ??????? ?????????? ?????????????, ???? ????????? ????????? ???????? ?????????????? ?????????????? ???????? ?? ??????, ???????? ????? ? ????? ?????? ?????? ?? ?????????????? ??????????? ? ??????????. ?????? ??????????? ??????? ??????????? ??? ????? ??? ? ????? ???????? ? ?????????????? CMS. \r\n \r\n??? ?? ??????????, ???? ???????? ?????? ????????? ??? ???? ? ???, ??? ?????????? ????????? ???????? ?????? ????????? ????? ? ?????, ?? ??????? ?????????? ?????? ??????, ????????? ???? ? ??????. ?????? ????? ???????? ?? ??????? ??????????? ????????? ????? ?????? ???????, ???????? ??????? ????????? ???????????. ?????????? ??????? ?? ????????? ????????????, ??????????? ?? ? ??????? ? ??? ?????? ?? ?????? ????????, ? ???????????? ?? ??? ?????????? ?????? ???????? ???????? ????????????. \r\n \r\n?????? ????? ?????? ??????????, ?????? ? ??????????? ?? ????? ?????????????????, ????? ????? ???????? ???????? ?????? - ?????????? ????? ????? ??????? ???? ?? ?????? ??? ??????????? ???????? ???. ?????? ??????? ????? ???????? ??????? ????? ??????, ????????? ?? ?? ???????????? ???????? ? ??????? ?????? ?????, ????????? ???????????? ?????????? ??????. ?? ? ???? ???? ???????? ??????? ?????? ? ?????? ?????? ?????? ????? ????????. ??? ??????? ?? ???? ??? ?????? ???????? ?????? ???????? ? ?????????????? ? ???????? ????????????? ???????? ????????? ? ???? ????????? ??????? ? ??????? ???????????????? ?????????????. ??? ??????????? ????? ?????? ?? ?????? ???????? ? ??????????????? ?????? ???????? ?? ??????? ????????. \r\n&lt;a href=https://doccentr.com&gt;a&lt;/a&gt;,&lt;a href=http://dom-lady.ru&gt;b&lt;/a&gt;,&lt;a href=https://zagorodny.net&gt;c&lt;/a&gt;,&lt;a href=https://ifvremya.ru&gt;d&lt;/a&gt;,&lt;a href=http://akro-spb.ru&gt;i&lt;/a&gt;,&lt;a href=http://blitz-remont.ru&gt;f&lt;/a&gt;,&lt;a href=https://ruspl.com&gt;g&lt;/a&gt;,&lt;a href=https://dailybest.me&gt;h&lt;/a&gt;,&lt;a href=https://novostidnja.ru&gt;i&lt;/a&gt;,&lt;a href=http://binom-s.com&gt;j&lt;/a&gt;,&lt;a href=http://medinfon.ru&gt;k&lt;/a&gt;,&lt;a href=https://friendlygames.ru&gt;l&lt;/a&gt;,&lt;a href=https://2019god.net&gt;m&lt;/a&gt;,&lt;a href=http://rusbetonplus.ru&gt;n&lt;/a&gt;,&lt;a href=https://domocvet.com&gt;o&lt;/a&gt;,&lt;a href=http://telead.ru&gt;p&lt;/a&gt;,&lt;a href=http://womaan.ru&gt;q&lt;/a&gt;,&lt;a href=http://ladyup.ru&gt;r&lt;/a&gt;,&lt;a href=http://about-windows.ru&gt;s&lt;/a&gt;,&lt;a href=http://icar-by.com&gt;t&lt;/a&gt;,&lt;a href=https://pancreatus.com&gt;u&lt;/a&gt;,&lt;a href=http://shoptrip.ru&gt;v&lt;/a&gt;,&lt;a href=http://zonakulinara.ru&gt;w&lt;/a&gt;,&lt;a href=https://loverust.ru&gt;x&lt;/a&gt;,&lt;a href=http://beton-cement-ru.ru&gt;y&lt;/a&gt;,&lt;a href=http://tvoi-noski.ru&gt;z&lt;/a&gt;,&lt;a href=http://arctic-online.ru&gt;a&lt;/a&gt;,&lt;a href=http://dk-zio.ru&gt;b&lt;/a&gt;,&lt;a href=http://womanmaniya.ru&gt;c&lt;/a&gt;,&lt;a href=https://4dekor.ru&gt;d&lt;/a&gt;,&lt;a href=http://apploidnews.com&gt;i&lt;/a&gt;,&lt;a href=http://omontazhe.ru&gt;f&lt;/a&gt;,&lt;a href=http://qllq.ru&gt;g&lt;/a&gt;,&lt;a href=http://windowss10.ru&gt;h&lt;/a&gt;,&lt;a href=http://domoxozyaiki.ru&gt;i&lt;/a&gt;,&lt;a href=http://dumainfo.ru&gt;j&lt;/a&gt;,&lt;a href=http://rempostroy.ru&gt;k&lt;/a&gt;,&lt;a href=http://slapk.ru&gt;l&lt;/a&gt;,&lt;a href=http://gdefile.ru&gt;m&lt;/a&gt;,&lt;a href=https://1vesti.kharkiv.ua&gt;n&lt;/a&gt;,&lt;a href=https://newsstroy.kyiv.ua&gt;o&lt;/a&gt;,&lt;a href=https://rnews.kharkiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://rnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://bestnews.kyiv.ua&gt;r&lt;/a&gt;,&lt;a href=https://bestnews.kharkiv.ua&gt;s&lt;/a&gt;,&lt;a href=https://newsfor.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://newsfor.kyiv.ua&gt;u&lt;/a&gt;,&lt;a href=https://newsfor.kharkiv.ua&gt;v&lt;/a&gt;,&lt;a href=https://vsenews.kharkiv.ua&gt;w&lt;/a&gt;,&lt;a href=https://n1.kharkiv.ua&gt;x&lt;/a&gt;,&lt;a href=https://autonews.kyiv.ua&gt;y&lt;/a&gt;,&lt;a href=https://nbest.kyiv.ua&gt;z&lt;/a&gt;,&lt;a href=https://nbest.kharkiv.ua&gt;a&lt;/a&gt;,&lt;a href=https://n1.kyiv.ua&gt;b&lt;/a&gt;,&lt;a href=https://newsstroy.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://x-news.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://v-news.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://novostidnya.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://newsru.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://daynews.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://realnews.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://thenews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://sobitiya.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://miv.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://rnews.kyiv.ua&gt;m&lt;/a&gt;,&lt;a href=https://1vesti.kyiv.ua&gt;n&lt;/a&gt;,&lt;a href=https://vsenews.kyiv.ua&gt;o&lt;/a&gt;,&lt;a href=https://autonews.kharkiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://mirnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://onews.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://uk.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://vnovostyah.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://infopress.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://vse.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://n-news.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://development.eu.com&gt;x&lt;/a&gt;,&lt;a href=https://vesti.eu.com&gt;y&lt;/a&gt;,&lt;a href=https://novosti.eu.com&gt;z&lt;/a&gt;,&lt;a href=https://allaboutnews.eu.com&gt;a&lt;/a&gt;,&lt;a href=https://rusnews.kharkiv.ua&gt;b&lt;/a&gt;,&lt;a href=https://f-news.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://formatnews.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://autonews.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://worldpress.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://vsenews.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://nbest.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://1vesti.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://svodnews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://q.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://yk.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://onlinenews.eu.com&gt;m&lt;/a&gt;,&lt;a href=https://people.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://n1.kr.ua&gt;o&lt;/a&gt;,&lt;a href=https://rusnews.kyiv.ua&gt;p&lt;/a&gt;,&lt;a href=https://rusnews.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://bestnews.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://euronews.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://timenews.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://rtnews.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://town-news.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://krnews.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://vedomost.kr.ua&gt;x&lt;/a&gt;,&lt;a href=https://euro.kr.ua&gt;y&lt;/a&gt;,&lt;a href=https://1news.kr.ua&gt;z&lt;/a&gt;,&lt;a href=https://obzor.kr.ua&gt;a&lt;/a&gt;,&lt;a href=https://aboutnews.kr.ua&gt;b&lt;/a&gt;,&lt;a href=https://worldnews.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://newsday.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://strana.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://newsn.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://infonews.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://h.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://moivesti.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://currentnews.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://easynews.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://lifenews.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://lastnews.kr.ua&gt;m&lt;/a&gt;,&lt;a href=https://j.kr.ua&gt;n&lt;/a&gt;,&lt;a href=https://inform.kr.ua&gt;o&lt;/a&gt;,&lt;a href=https://rus.kr.ua&gt;p&lt;/a&gt;,&lt;a href=https://press-release.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://izvesti.kr.ua&gt;r&lt;/a&gt;,&lt;a href=https://034.kr.ua&gt;s&lt;/a&gt;,&lt;a href=https://v.kr.ua&gt;t&lt;/a&gt;,&lt;a href=https://xop.kr.ua&gt;u&lt;/a&gt;,&lt;a href=https://dni.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://ykr.kr.ua&gt;w&lt;/a&gt;,&lt;a href=https://newsportal.kr.ua&gt;x&lt;/a&gt;,&lt;a href=https://msv.kr.ua&gt;y&lt;/a&gt;,&lt;a href=https://s5.kr.ua&gt;z&lt;/a&gt;,&lt;a href=https://znews.kr.ua&gt;a&lt;/a&gt;,&lt;a href=https://information.kr.ua&gt;b&lt;/a&gt;,&lt;a href=https://ukr.kr.ua&gt;c&lt;/a&gt;,&lt;a href=https://portalnews.kr.ua&gt;d&lt;/a&gt;,&lt;a href=https://today.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://xznews.kr.ua&gt;f&lt;/a&gt;,&lt;a href=https://nn.kr.ua&gt;g&lt;/a&gt;,&lt;a href=https://mls.kr.ua&gt;h&lt;/a&gt;,&lt;a href=https://novostnik.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://informing.kr.ua&gt;j&lt;/a&gt;,&lt;a href=https://vnovosti.kr.ua&gt;k&lt;/a&gt;,&lt;a href=https://y.kr.ua&gt;l&lt;/a&gt;,&lt;a href=https://nation.kr.ua&gt;m&lt;/a&gt;,&lt;a href=https://item.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://gazette.eu.com&gt;o&lt;/a&gt;,&lt;a href=https://headline.eu.com&gt;p&lt;/a&gt;,&lt;a href=https://fact.eu.com&gt;q&lt;/a&gt;,&lt;a href=https://somenews.eu.com&gt;r&lt;/a&gt;,&lt;a href=https://lifenews.eu.com&gt;s&lt;/a&gt;,&lt;a href=https://tidings.eu.com&gt;t&lt;/a&gt;,&lt;a href=https://today.eu.com&gt;u&lt;/a&gt;,&lt;a href=https://eunews.eu.com&gt;v&lt;/a&gt;,&lt;a href=https://sir.eu.com&gt;w&lt;/a&gt;,&lt;a href=https://journal.eu.com&gt;x&lt;/a&gt;,&lt;a href=https://gazeta.eu.com&gt;y&lt;/a&gt;,&lt;a href=https://lenta.eu.com&gt;z&lt;/a&gt;,&lt;a href=https://exclusive.eu.com&gt;a&lt;/a&gt;,&lt;a href=https://all.eu.com&gt;b&lt;/a&gt;,&lt;a href=https://expert.eu.com&gt;c&lt;/a&gt;,&lt;a href=https://news-magazine.eu.com&gt;d&lt;/a&gt;,&lt;a href=https://newshour.eu.com&gt;i&lt;/a&gt;,&lt;a href=https://presentation.eu.com&gt;f&lt;/a&gt;,&lt;a href=https://publication.eu.com&gt;g&lt;/a&gt;,&lt;a href=https://release.eu.com&gt;h&lt;/a&gt;,&lt;a href=https://smi.eu.com&gt;i&lt;/a&gt;,&lt;a href=https://view.eu.com&gt;j&lt;/a&gt;,&lt;a href=https://vremya.eu.com&gt;k&lt;/a&gt;,&lt;a href=https://prsn.eu.com&gt;l&lt;/a&gt;,&lt;a href=https://lnd.eu.com&gt;m&lt;/a&gt;,&lt;a href=https://034.eu.com&gt;n&lt;/a&gt;,&lt;a href=https://all-about.eu.com&gt;o&lt;/a&gt;,&lt;a href=https://solution.eu.com&gt;p&lt;/a&gt;,&lt;a href=https://rightnow.eu.com&gt;q&lt;/a&gt;,&lt;a href=https://euro21.eu.com&gt;r&lt;/a&gt;,&lt;a href=https://euro22.eu.com&gt;s&lt;/a&gt;,&lt;a href=https://100.eu.com&gt;t&lt;/a&gt;,&lt;a href=https://mdrd.eu.com&gt;u&lt;/a&gt;,&lt;a href=https://newtime.kr.ua&gt;v&lt;/a&gt;,&lt;a href=https://fraufluger.ru&gt;w&lt;/a&gt;,&lt;a href=https://rossoshru.ru&gt;x&lt;/a&gt;,&lt;a href=https://lifeposi.ru&gt;y&lt;/a&gt;,&lt;a href=http://megamcpe.com&gt;z&lt;/a&gt;,&lt;a href=https://mirzodiaka.com&gt;a&lt;/a&gt;,&lt;a href=http://ladysarafan.ru&gt;b&lt;/a&gt;,&lt;a href=https://hypecrib.com&gt;c&lt;/a&gt;,&lt;a href=https://vd-tv.ru&gt;d&lt;/a&gt;,&lt;a href=https://buzulukmedia.ru&gt;i&lt;/a&gt;,&lt;a href=https://donklephant.net&gt;f&lt;/a&gt;,&lt;a href=https://avtotema.kr.ua&gt;g&lt;/a&gt;,&lt;a href=http://hayastannews.com&gt;h&lt;/a&gt;,&lt;a href=https://deepcool-ma.com&gt;i&lt;/a&gt;,&lt;a href=https://russianshop.org&gt;j&lt;/a&gt;,&lt;a href=http://dettka.com&gt;k&lt;/a&gt;,&lt;a href=https://chexov.net&gt;l&lt;/a&gt;,&lt;a href=http://nalatty.com&gt;m&lt;/a&gt;,&lt;a href=https://hozyaushka.org&gt;n&lt;/a&gt;,&lt;a href=http://montazhnik02.ru&gt;o&lt;/a&gt;,&lt;a href=https://mama-creative.com&gt;p&lt;/a&gt;,&lt;a href=https://crimeabest.com&gt;q&lt;/a&gt;,&lt;a href=https://womanka.com&gt;r&lt;/a&gt;,&lt;a href=http://teletap.org&gt;s&lt;/a&gt;,&lt;a href=https://csharpcoderr.com&gt;t&lt;/a&gt;,&lt;a href=https://dooralei.ru&gt;u&lt;/a&gt;,&lt;a href=http://newsfast.ru&gt;v&lt;/a&gt;,&lt;a href=https://2020about.com&gt;w&lt;/a&gt;,&lt;a href=http://u-sity.net&gt;x&lt;/a&gt;,&lt;a href=http://intofact.ru&gt;y&lt;/a&gt;,&lt;a href=https://astrakhan.net&gt;z&lt;/a&gt;,&lt;a href=http://oneznakomke.ru&gt;a&lt;/a&gt;,&lt;a href=https://vpolozhenii.com&gt;b&lt;/a&gt;,&lt;a href=http://gturs.com&gt;c&lt;/a&gt;,&lt;a href=https://cultmoscow.com&gt;d&lt;/a&gt;,&lt;a href=https://dvedoli.com&gt;i&lt;/a&gt;,&lt;a href=https://belady.online&gt;f&lt;/a&gt;,&lt;a href=https://dobrenok.com&gt;g&lt;/a&gt;,&lt;a href=https://milomarket.com&gt;h&lt;/a&gt;,&lt;a href=https://adres.kr.ua&gt;i&lt;/a&gt;,&lt;a href=https://womanjour.ru&gt;j&lt;/a&gt;,&lt;a href=http://ladystory.ru&gt;k&lt;/a&gt;,&lt;a href=http://kapitosha.net&gt;l&lt;/a&gt;,&lt;a href=http://mirokru.ru&gt;m&lt;/a&gt;,&lt;a href=https://kakpravilino.com&gt;n&lt;/a&gt;,&lt;a href=https://1001guru.ru&gt;o&lt;/a&gt;,&lt;a href=http://xozyaika.com&gt;p&lt;/a&gt;,&lt;a href=https://aromat.kr.ua&gt;q&lt;/a&gt;,&lt;a href=https://parovarim.com&gt;r&lt;/a&gt;,&lt;a href=http://remstroitelstvo.ru&gt;s&lt;/a&gt;,&lt;a href=https://golubevod.net&gt;t&lt;/a&gt;,&lt;a href=http://s-narodom.ru&gt;u&lt;/a&gt;,&lt;a href=https://zazdorovie.net&gt;v&lt;/a&gt;,&lt;a href=http://roofor.ru&gt;w&lt;/a&gt;,&lt;a href=http://sovet-sadovody.ru&gt;x&lt;/a&gt;,&lt;a href=https://albooking.net&gt;y&lt;/a&gt;,&lt;a href=http://fi-hi.ru&gt;z&lt;/a&gt;,&lt;a href=https://modnuesovetu.ru&gt;a&lt;/a&gt;,&lt;a href=https://rabotainternet.com&gt;b&lt;/a&gt;,&lt;a href=https://1npf.com&gt;c&lt;/a&gt;,&lt;a href=https://renewablenergy-world.com&gt;d&lt;/a&gt;,\r\n&lt;a href=https://viewangle.net&gt;i&lt;/a&gt;\r\nhttps://doccentr.com, http://dom-lady.ru, https://zagorodny.net, https://ifvremya.ru, http://akro-spb.ru, http://blitz-remont.ru, https://ruspl.com, https://dailybest.me, https://novostidnja.ru, http://binom-s.com, http://medinfon.ru, https://friendlygames.ru, https://2019god.net, http://rusbetonplus.ru, https://domocvet.com, http://telead.ru, http://womaan.ru, http://ladyup.ru, http://about-windows.ru, http://icar-by.com, https://pancreatus.com, http://shoptrip.ru, http://zonakulinara.ru, https://loverust.ru, http://beton-cement-ru.ru, http://tvoi-noski.ru, http://arctic-online.ru, http://dk-zio.ru, http://womanmaniya.ru, https://4dekor.ru, http://apploidnews.com, http://omontazhe.ru, http://qllq.ru, http://windowss10.ru, http://domoxozyaiki.ru, http://dumainfo.ru, http://rempostroy.ru, http://slapk.ru, http://gdefile.ru, https://1vesti.kharkiv.ua, https://newsstroy.kyiv.ua, https://rnews.kharkiv.ua, https://rnews.kr.ua, https://bestnews.kyiv.ua, https://bestnews.kharkiv.ua, https://newsfor.kr.ua, https://newsfor.kyiv.ua, https://newsfor.kharkiv.ua, https://vsenews.kharkiv.ua, https://n1.kharkiv.ua, https://autonews.kyiv.ua, https://nbest.kyiv.ua, https://nbest.kharkiv.ua, https://n1.kyiv.ua, https://newsstroy.kr.ua, https://x-news.kr.ua, https://v-news.kr.ua, https://novostidnya.kr.ua, https://newsru.kr.ua, https://daynews.kr.ua, https://realnews.kr.ua, https://thenews.kr.ua, https://sobitiya.kr.ua, https://miv.kr.ua, https://rnews.kyiv.ua, https://1vesti.kyiv.ua, https://vsenews.kyiv.ua, https://autonews.kharkiv.ua, https://mirnews.kr.ua, https://onews.kr.ua, https://uk.kr.ua, https://vnovostyah.kr.ua, https://infopress.kr.ua, https://vse.kr.ua, https://n-news.kr.ua, https://development.eu.com, https://vesti.eu.com, https://novosti.eu.com, https://allaboutnews.eu.com, https://rusnews.kharkiv.ua, https://f-news.kr.ua, https://formatnews.kr.ua, https://autonews.kr.ua, https://worldpress.kr.ua, https://vsenews.kr.ua, https://nbest.kr.ua, https://1vesti.kr.ua, https://svodnews.kr.ua, https://q.kr.ua, https://yk.kr.ua, https://onlinenews.eu.com, https://people.eu.com, https://n1.kr.ua, https://rusnews.kyiv.ua, https://rusnews.kr.ua, https://bestnews.kr.ua, https://euronews.kr.ua, https://timenews.kr.ua, https://rtnews.kr.ua, https://town-news.kr.ua, https://krnews.kr.ua, https://vedomost.kr.ua, https://euro.kr.ua, https://1news.kr.ua, https://obzor.kr.ua, https://aboutnews.kr.ua, https://worldnews.kr.ua, https://newsday.kr.ua, https://strana.kr.ua, https://newsn.kr.ua, https://infonews.kr.ua, https://h.kr.ua, https://moivesti.kr.ua, https://currentnews.kr.ua, https://easynews.kr.ua, https://lifenews.kr.ua, https://lastnews.kr.ua, https://j.kr.ua, https://inform.kr.ua, https://rus.kr.ua, https://press-release.kr.ua, https://izvesti.kr.ua, https://034.kr.ua, https://v.kr.ua, https://xop.kr.ua, https://dni.kr.ua, https://ykr.kr.ua, https://newsportal.kr.ua, https://msv.kr.ua, https://s5.kr.ua, https://znews.kr.ua, https://information.kr.ua, https://ukr.kr.ua, https://portalnews.kr.ua, https://today.kr.ua, https://xznews.kr.ua, https://nn.kr.ua, https://mls.kr.ua, https://novostnik.kr.ua, https://informing.kr.ua, https://vnovosti.kr.ua, https://y.kr.ua, https://nation.kr.ua, https://item.eu.com, https://gazette.eu.com, https://headline.eu.com, https://fact.eu.com, https://somenews.eu.com, https://lifenews.eu.com, https://tidings.eu.com, https://today.eu.com, https://eunews.eu.com, https://sir.eu.com, https://journal.eu.com, https://gazeta.eu.com, https://lenta.eu.com, https://exclusive.eu.com, https://all.eu.com, https://expert.eu.com, https://news-magazine.eu.com, https://newshour.eu.com, https://presentation.eu.com, https://publication.eu.com, https://release.eu.com, https://smi.eu.com, https://view.eu.com, https://vremya.eu.com, https://prsn.eu.com, https://lnd.eu.com, https://034.eu.com, https://all-about.eu.com, https://solution.eu.com, https://rightnow.eu.com, https://euro21.eu.com, https://euro22.eu.com, https://100.eu.com, https://mdrd.eu.com, https://newtime.kr.ua, https://fraufluger.ru, https://rossoshru.ru, https://lifeposi.ru, http://megamcpe.com, https://mirzodiaka.com, http://ladysarafan.ru, https://hypecrib.com, https://vd-tv.ru, https://buzulukmedia.ru, https://donklephant.net, https://avtotema.kr.ua, http://hayastannews.com, https://deepcool-ma.com, https://russianshop.org, http://dettka.com, https://chexov.net, http://nalatty.com, https://hozyaushka.org, http://montazhnik02.ru, https://mama-creative.com, https://crimeabest.com, https://womanka.com, http://teletap.org, https://csharpcoderr.com, https://dooralei.ru, http://newsfast.ru, https://2020about.com, http://u-sity.net, http://intofact.ru, https://astrakhan.net, http://oneznakomke.ru, https://vpolozhenii.com, http://gturs.com, https://cultmoscow.com, https://dvedoli.com, https://belady.online, https://dobrenok.com, https://milomarket.com, https://adres.kr.ua, https://womanjour.ru, http://ladystory.ru, http://kapitosha.net, http://mirokru.ru, https://kakpravilino.com, https://1001guru.ru, http://xozyaika.com, https://aromat.kr.ua, https://parovarim.com, http://remstroitelstvo.ru, https://golubevod.net, http://s-narodom.ru, https://zazdorovie.net, http://roofor.ru, http://sovet-sadovody.ru, https://albooking.net, http://fi-hi.ru, https://modnuesovetu.ru, https://rabotainternet.com, https://1npf.com, https://renewablenergy-world.com, https://viewangle.net\r\n \r\n \r\nRHzs43hgndIpuiSy');
INSERT INTO `mail` (`id`, `date`, `subject`, `message`) VALUES
(169, '2022-06-11', '??????? ? ??????', ' Name : EverettNinee\n Company : google\n E-mail : grushina.manya@mail.ru\n\n                  &lt;center&gt;&lt;a href=https://postimages.org/&gt;&lt;img src=&quot;https://i.postimg.cc/y8kBBwFj/1-1.jpg&quot;&gt;&lt;/a&gt;&lt;/center&gt; \r\n \r\n \r\n \r\n???? ????? ??????. ? 2022 ???? ? ???????????? ??????? ?? ??????? ? ????? ?? ??????????. ????? ???? ????????, ??????? ?????? ??? ???? ??? ? ??????? ?????????, ??????? ? ???? ? ??? ????? ?????? ???????? ???????????????? ????????? ? ?????? ??????. ? ??????? ????????? ? &lt;a href= &quot; https://medchina.kz/diagnozy/lechenie-adenomy-v-kitae/  &quot;&gt;  ??????? ??????? ?????????? ? ?????, &lt;/a&gt; ????? ???????? ??????? ? ???????????? ?? ??????? ????? ?????????. ??? ?????? ????? ?? ???????????, ??? ?????? ??? ??? ?????????? ?????? ? ???? ?????????? ????????, ?? ???? ????????? ????????, ??????? ????? 2 ??? ??? ??? ???????? ??????? ?? ??????? ????????. ??? ?????????? ??????? ??????? ????????? &lt;a href= &quot; https://medchina.kz/catalog/kupit-kitajskoe-lekarstvo-ot-adenomy-prostaty/ &quot;&gt; ????????? ?? ????? ?? ??????? ???????? &lt;/a&gt;?? ??????? ?????????? ????????? ????????, ? ????? ?? ??? ??????, ??????? ???? ? ?????, ???????, ??? ????? ????? ?? ????????? ??? ????????? ?? ????? ??????? ? ?????. ??? ??? ? ??????? ??????? ???????? ?? ?????, ???????? ? ????????? ???? ?? ???????? ? ??????????, ? ????? ??????? ????????? ????? ??????? ?? &lt;a href= &quot; https://medchina.kz/oficialnyj-sajt-kitajskogo-voennogo-gospitalja/ ,&quot;&gt; ??????? ? ?????&lt;/a&gt;   ?????? ?????????????? ? ????? ?????? ??????? ?????????? ????????? ??????????&lt;a href= &quot; . https://medchina.kz/catalog/kupit-kitajskoe-lekarstvo-ot-adenomy-prostaty/,&quot;&gt; ??????? ?????????? ????????? ??????????&lt;/a&gt;     ? ???????? ???? ????????? ???????? ???????? ???????????? ??????? ??? ???????? ????????? ??????????? ????????. &lt;a href= &quot; https://online-tkm.com/professor-sun-delin/ ,&quot;&gt; ????????? Sun Delin&lt;/a&gt;      ?????????? ??? ????????????, ????????? ??????? ????????? ?? ????, ? ? ??????? ???????? ??????????? ???? &lt;a href= &quot;  https://medchina.kz/diagnozy/lechenie-adenomy-v-kitae/ ,&quot;&gt; ??????? ??????? ????????? ?????????  &lt;/a&gt;  ? ???????????? ?? ??????? ? ?????? ?????, ??? ????? ???? ???? ???????, ??? ??? ???? ????????? ?????????. ????? ? ????? ????????? ?? ?????, ??????? ?????? ? ????, ??? ???? ?????? ? ??? ?????- ???? ???????. ??? ?????????? ???? ?????? ?? ?????, ??? ??? ??????? ????????? ? ??????????? ????????. ?????? ??? 7 ?????? ? ???????? ?????????, ??????? ????? ? ?????????? ????? ????????????? ?????????, ???????????? ??????????, ? ????? ???????????? ?? ?????? ?????? ??????? ???????????? ????????? ?????????: ?????? ????, ????????, ??? ?????????????? ???????? ????? ? ???? ????????? ? ??????? ????????, ??????????? ????????? ?????????????????? ???????.  ? ????? ? ????? ???????  &lt;a href= &quot; https://medchina.kz/oficialnyj-sajt-kitajskogo-voennogo-gospitalja/ ,&quot;&gt;???????? ?? ?????  &lt;/a&gt;   ????? ?????????? ?????????? ? ????? ??????????? ?????, ???? ?????????, ??? ? ???? ????? ??????????? ???????? ?????, ????? ????????? ????????. \r\n \r\n \r\n \r\nRHzs43hgndIpuiSy?????'),
(170, '2022-07-28', 'Look this free videos', ' Name : Richardappen\n Company : google\n E-mail : maxtubex@gmail.com\n\nHot new site &lt;a href=https://bit.ly/3nCqGIo&gt;Slut Anal Tube&lt;/a&gt; present hardcore videos for free'),
(171, '2023-02-10', 'Dear abidinggroupbd.com Webmaster!', ' Name : Lorene Melvin\n Company : Lorene Melvin\n E-mail : lorene.melvin@gmail.com\n\nTo the abidinggroupbd.com Owner.\r\n\r\nhttps://conductiveruthless.com/ivt13tueyr?key=c45f1c84f1b6b84a1f5e1f19c6996316\r\n\r\nRegards');

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
(2, 'our_people', 'Our People', 8, 98),
(4, 'contact', 'Contact Us', 0, 80),
(5, 'products', 'Our Products', 6, 97),
(7, 'home', 'Home', -1, 100);

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
(183, 'skirasel@gmail.com'),
(184, 'smahamed23@yahoo.com'),
(185, 'atil@abidinggoupbd.com');

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
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `hidden` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `text_data`
--

INSERT INTO `text_data` (`id`, `page_id`, `heading`, `content`, `priority`, `hidden`) VALUES
(179, 4, 'Head Office', 'Akram Tower, Level - 8, Suite - 9,\r\n199, Shahid Syed Nazrul Islam Sharani,\r\n(15/5, Bijoynagar), Dhaka -1000,\r\nBangladesh', 50, 0),
(180, 4, 'Kakrail Office', 'Abiding Reza Tower\r\n57/2,Kakrail,Dhaka', 50, 0),
(181, 4, 'Telephone', '+88-02-8392006', 50, 0),
(182, 4, 'Email', 'atil@abidinggroupbd.com', 50, 0),
(183, 2, 'Managing Director', 'Md. Kamrul Islam\r\nManaging Director\r\nMobile: +88 01777786700', 100, 0),
(184, 2, 'Director Operation', 'Syed Murad Ahamed\r\nDirector Operation\r\nMobile: +88 01777786701', 100, 0),
(185, 2, 'Director Marketing', 'Director Marketing\r\nABM Sabbir Mokammel\r\nMobile: +88 01777786702', 100, 0),
(186, 1, 'Our Speciality', 'Abiding Trade International Ltd as well as there sister concerns are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. Our mission is to work with our clients to develop the best possible habitat. We are committed to helping our clients to turn there dreams into really. Elaborate information about Abiding Trade International Ltd and their project would be available in this website soon, but now the website is still under construction. ', 50, 0),
(187, 1, 'What we do?', 'We are one of the largest importer and distributor of High Quality PPR and PVC pipe and pipe fittings in Bangladesh   ', 50, 0),
(188, 5, '90 Degree Elbow', 'An elbow is a pipe fitting installed between two lengths of pipe or tubing to allow a change of direction, usually a 90 Degree or 45 Degree angle.\r\n\r\n90 Deg Elbow is a fitting which is bent in such a way to produce 90 degree change in the direction of flow in the pipe. It is used to change the direction in piping and is also sometimes called a &quot;quarter bend&quot;. A 90 degree elbow attaches readily to plastic, copper, cast iron, steel and lead. It can also attach to rubber with stainless steel clamps. It is available in many materials like silicone, rubber compounds, galvanized steel, etc. The main application of an elbow (90 degree) is to connect hoses to valves, water pressure pumps, and deck drains. These elbows can be made from tough nylon material or NPT thread.', 50, 0),
(189, 5, 'Angle Stop Cock', 'Angle Stop Cock. A stopcock is a valve used to restrict or isolate the flow of a liquid or gas through a pipe.', 50, 0),
(190, 5, 'Ball Valve', 'Ball-Valve. Valves are equipment designed to stop or regulate flow of any fluid (liquid, gas, condensate, stem, slurry, etc.) in its path. Valves are categorized depending on their applications like isolation, throttling, and non-return. Ball valve is usually used for isolation only.', 50, 0),
(191, 5, 'Conceal Stop Cock', 'Conceal Stop Cock. A stopcock is a valve used to restrict or isolate the flow of a liquid or gas through a pipe.', 50, 0),
(192, 5, 'Cross Tee', 'Cross-Tee. Cross fittings are also called 4-way fittings. If a branch line passes completely through a tee, the fitting becomes a cross. A cross has one inlet and three outlets, or vice versa. They often have solvent welded socket ends or female threaded ends.\r\n\r\nCross fittings can generate a huge amount of stress on pipe as temperature changes, because they are at the center of four connection points. A tee is more steady than a cross, as a tee behaves like a three-legged stool, while a cross behaves like a four-legged stool.', 50, 0),
(193, 5, 'End Cap', 'End-Cap. A type of pipe fitting, usually liquid or gas tight, which covers the end of a pipe. A cap is used like plug, except that the pipe cap screws or attaches on the male thread of a pipe. A cap may have a solvent weld socket end or a female threaded end and the other end closed off. In plumbing systems that use threads, the cap has female threads. Industrial caps can be round, square, rectangular, U-shaped, I-shaped and may have a round hand grip or a flat hand grip.\r\n\r\nIf a solvent weld cap is used to provide for a future connection point, several inches of pipe must be left before the cap. This is because when the cap is cut off for the future connection, enough pipe must remain to allow a new fitting to be glued onto it.', 50, 0),
(194, 5, 'Equal Tee', 'Equal-Tee. A tee is the most common pipe fitting. It is available with all female thread sockets, all solvent weld sockets, or with opposed solvent weld sockets and a side outlet with female threads. It is used to either combine or split a fluid flow. It is a type of pipe fitting which is T-shaped having two outlets, at 90 Degree to the connection to the main line. It is a short piece of pipe with a lateral outlet. A tee is used for connecting pipes of different diameters or for changing the direction of pipe runs. They are made of various materials and available in various sizes and finishes. They are extensively used in pipeline networks to transport two-phase fluid mixtures. ', 50, 0),
(195, 1, 'Why Choose Us?', 'We guarantee you will find the best price and quality based on the international market; we compete with all the manufacturers around the world. ', 50, 0),
(196, 5, 'Female Thread Union', 'Female Thread Union. A union is similar to a coupling, except it is designed to allow quick and convenient disconnection of pipes for maintenance or fixture replacement. While a coupling would require either solvent welding, soldering or being able to rotate with all the pipes adjacent as with a threaded coupling, a union provides a simple transition, allowing easy connection or disconnection at any future time. A standard union pipe is made in three parts consisting of a nut, a female end, and a male end. When the female and male ends are joined, the nuts then provide the necessary pressure to seal the joint. Since the mating ends of the union are interchangeable, changing of a valve or other device can be achieved with a minimum loss of time. Pipe unions are essentially a type of flange connector, as discussed further below.', 50, 0),
(197, 5, 'Female Elbow Copper Thread', 'Female Elbow Copper Thread. A threaded pipe is a pipe with a screw thread at one or both ends for assembly. Steel pipe is often joined using threaded connections, where tapered threads (in the US/Canada see National Pipe Thread, in Commonwealth Nations such as the UK, Australia, New Zealand see British standard pipe thread) are cut into the end of the tubing segment, sealant is applied in the form of thread sealing compound or thread seal tape (also known as PTFE or Teflon tape), and it is then threaded into a corresponding threaded fitting using a pipe wrench.\r\n\r\nThreaded steel pipe is still widely used in many homes and businesses to convey natural gas or propane fuel, and is a popular choice in fire sprinkler systems due to its high heat resistance. Threaded brass pipe was once used in a similar fashion, and was considered superior to steel for carrying drinking water, but is now effectively obsolete.\r\n\r\nAssembling threaded steel pipe takes some skill, plus careful planning to allow lengths of pipe to be screwed together in proper sequence. Most threaded pipe systems require occasional use of pipe union fittings to allow final assembly.', 50, 0),
(198, 5, 'Female Socket Copper Thread', 'Female Socket Copper Thread. A threaded pipe is a pipe with a screw thread at one or both ends for assembly. Steel pipe is often joined using threaded connections, where tapered threads (in the US or Canada see National Pipe Thread, in Commonwealth Nations such as the UK, Australia, New Zealand see British standard pipe thread) are cut into the end of the tubing segment, sealant is applied in the form of thread sealing compound or thread seal tape (also known as PTFE or Teflon tape), and it is then threaded into a corresponding threaded fitting using a pipe wrench.\r\n\r\nThreaded steel pipe is still widely used in many homes and businesses to convey natural gas or propane fuel, and is a popular choice in fire sprinkler systems due to its high heat resistance. Threaded brass pipe was once used in a similar fashion, and was considered superior to steel for carrying drinking water, but is now effectively obsolete.\r\n\r\nAssembling threaded steel pipe takes some skill, plus careful planning to allow lengths of pipe to be screwed together in proper sequence. Most threaded pipe systems require occasional use of pipe union fittings to allow final assembly.', 50, 0),
(199, 5, 'Female Tee Copper Thread', 'Female Tee Copper Thread. A tee is the most common pipe fitting. It is available with all female thread sockets, all solvent weld sockets, or with opposed solvent weld sockets and a side outlet with female threads. It is used to either combine or split a fluid flow. It is a type of pipe fitting which is T-shaped having two outlets, at 90 Degree to the connection to the main line. It is a short piece of pipe with a lateral outlet. A tee is used for connecting pipes of different diameters or for changing the direction of pipe runs. They are made of various materials and available in various sizes and finishes. They are extensively used in pipeline networks to transport two-phase fluid mixtures. ', 50, 0),
(200, 5, 'Male Elbow Copper Thread', 'Male Elbow Copper Thread. A threaded pipe is a pipe with a screw thread at one or both ends for assembly. Steel pipe is often joined using threaded connections, where tapered threads (in the US/Canada see National Pipe Thread, in Commonwealth Nations such as the UK, Australia, New Zealand see British standard pipe thread) are cut into the end of the tubing segment, sealant is applied in the form of thread sealing compound or thread seal tape (also known as PTFE or Teflon tape), and it is then threaded into a corresponding threaded fitting using a pipe wrench.\r\n\r\nThreaded steel pipe is still widely used in many homes and businesses to convey natural gas or propane fuel, and is a popular choice in fire sprinkler systems due to its high heat resistance. Threaded brass pipe was once used in a similar fashion, and was considered superior to steel for carrying drinking water, but is now effectively obsolete.\r\n\r\nAssembling threaded steel pipe takes some skill, plus careful planning to allow lengths of pipe to be screwed together in proper sequence. Most threaded pipe systems require occasional use of pipe union fittings to allow final assembly.', 50, 0),
(201, 5, 'Male Socket Copper Thread', 'Male Socket Copper Thread. A threaded pipe is a pipe with a screw thread at one or both ends for assembly. Steel pipe is often joined using threaded connections, where tapered threads (in the US or Canada see National Pipe Thread, in Commonwealth Nations such as the UK, Australia, New Zealand see British standard pipe thread) are cut into the end of the tubing segment, sealant is applied in the form of thread sealing compound or thread seal tape (also known as PTFE or Teflon tape), and it is then threaded into a corresponding threaded fitting using a pipe wrench.\r\n\r\nThreaded steel pipe is still widely used in many homes and businesses to convey natural gas or propane fuel, and is a popular choice in fire sprinkler systems due to its high heat resistance. Threaded brass pipe was once used in a similar fashion, and was considered superior to steel for carrying drinking water, but is now effectively obsolete.\r\n\r\nAssembling threaded steel pipe takes some skill, plus careful planning to allow lengths of pipe to be screwed together in proper sequence. Most threaded pipe systems require occasional use of pipe union fittings to allow final assembly.', 50, 0),
(202, 5, 'Male Tee Copper Thread', 'Male Tee Copper Thread. A tee is the most common pipe fitting. It is available with all female thread sockets, all solvent weld sockets, or with opposed solvent weld sockets and a side outlet with female threads. It is used to either combine or split a fluid flow. It is a type of pipe fitting which is T-shaped having two outlets, at 90 Degree to the connection to the main line. It is a short piece of pipe with a lateral outlet. A tee is used for connecting pipes of different diameters or for changing the direction of pipe runs. They are made of various materials and available in various sizes and finishes. They are extensively used in pipeline networks to transport two-phase fluid mixtures. ', 50, 0),
(203, 5, 'Plug', 'Plug. A plug closes off the end of a pipe. It is similar to a cap but it fits inside the fitting it is mated to. In a threaded iron pipe plumbing system, plugs have male threads.', 50, 0),
(204, 5, 'Reducing Elbow', 'Reducing-Elbow. A reducer allows for a change in pipe size to meet hydraulic flow requirements of the system, or to adapt to existing piping of a different size. Reducers are usually concentric but eccentric reducers are used when required to maintain the same top- or bottom-of-pipe level.', 50, 0),
(205, 5, 'Reducing Socket', 'Reducing-Socket. A reducer allows for a change in pipe size to meet hydraulic flow requirements of the system, or to adapt to existing piping of a different size. Reducers are usually concentric but eccentric reducers are used when required to maintain the same top- or bottom-of-pipe level.', 50, 0),
(206, 5, 'Stop-Valve Gate Valve Coppe', 'Stop Valve or Gate Valve. Valves are equipment designed to stop or regulate flow of any fluid (liquid, gas, condensate, stem, slurry, etc.) in its path. Valves are categorized depending on their applications like isolation, throttling, and non-return. Usually Gate valve is used for isolation only', 50, 0),
(207, 5, 'Union', 'A union is similar to a coupling, except it is designed to allow quick and convenient disconnection of pipes for maintenance or fixture replacement. While a coupling would require either solvent welding, soldering or being able to rotate with all the pipes adjacent as with a threaded coupling, a union provides a simple transition, allowing easy connection or disconnection at any future time. A standard union pipe is made in three parts consisting of a nut, a female end, and a male end. When the female and male ends are joined, the nuts then provide the necessary pressure to seal the joint. Since the mating ends of the union are interchangeable, changing of a valve or other device can be achieved with a minimum loss of time. Pipe unions are essentially a type of flange connector, as discussed further below.', 50, 0),
(208, 5, 'Pipe Cutter', 'A pipecutter is a type of tool used by plumbers to cut pipe. Besides producing a clean cut, the tool is often a faster, cleaner, and more convenient way of cutting pipe than using a hacksaw, although this depends on the metal of the pipe.\r\n\r\nThere are two types of pipe cutters. Plastic tubing cutters, which really look much like a pair of pruning shears, may be used for thinner pipes and tubes, such as sprinkler pipe. For use on thicker pipes, there is a pipecutter with a sharp wheel and adjustable jaw grips. These are used by rotating it around the pipe and repeatedly tightening it until it cuts all of the way through.', 1, 0),
(209, 5, 'Heat Machine', 'Heat Machine. After heating, quicklyinsert pipe into the fitting by exerting light pressure.\r\nAny misalignment should be corrected immediately after insertion to avoid any Stress in the weld.\r\nAllow the joint to cool as per cooling time given in table.\r\n', 1, 0),
(210, 5, 'PPR Pipe', 'PPR Pipe', 2, 0),
(211, 5, 'Double Thread Female Elbow', 'Double Thread Female Elbow', 2, 0);

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
(1, 'nahin', '47d60f8c85fc25583958700ed9a0bca6', '72b302bf297a228a75730123efef7c41', 1),
(2, '1234', '81dc9bdb52d04dc20036dbd8313ed055', '912ec803b2ce49e4a541068d495ab570', 2);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT for table `imgtype`
--
ALTER TABLE `imgtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `page`
--
ALTER TABLE `page`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
