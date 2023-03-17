-- phpMyAdmin SQL Dump
-- version 4.9.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 17, 2023 at 06:13 AM
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
-- Database: `abidingg_abs2`
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
(1, 'Abiding Building Systems Limited.'),
(2, 'Abiding Building Systems Ltd. - A unit of Abiding Group'),
(3, 'Abiding Building Systems Limited is (a sister concern of Abiding Group).Abiding Buildings System Limited is a growing pre-fabricated steel building manufacturer in Bangladesh with a group of experienced and self-recognized professionals. We are delighted to introduce ourselves as one of the organization doing complete solution of design, detailing, Fabrication, supply and installation of modern Pre-Engineered total Building Systems.\r\n\r\nAbiding Building Systems Ltd. is a Pre-Engineered Steel Building System doing its activities for long time. We have immense experience in the field of creation from all type of Design, Fabrication, Supply and Erection of Pre-Fabricated Steel Structure, Civil Construction Works etc. ABSL is designing for both (Civil &amp; Steel) and working with our skill personal.\r\n\r\nThe company was established in the year 2009 and since our establishment we have been successfully working on several projects in the Architectural &amp; Engineering arena. We have already completed industrial building projects, numerous apartment buildings, through which we have gained comprehensive experience and attained goodwill.'),
(4, 'abs.abidinggroupbd.com'),
(5, 'abs@abidinggroupbd.com'),
(6, 'Feel The Strength'),
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
(470, 'ABS', 0, 0, 1, '', 0, 100),
(471, 'ABS', 0, 0, 1, '', 0, 2),
(473, 'Working Area of ABSL', 1, 253, 1, '', 1, 50),
(475, 'Buisness Ventures of ABSL', 1, 254, 1, '', 1, 50),
(476, 'Chaina Factory Visit', 0, 0, 1, '', 0, 100),
(477, 'Factory Visit', 0, 0, 1, '', 0, 100),
(478, 'Our Factory', 0, 0, 1, '', 0, 100),
(479, 'Our Factory', 0, 0, 1, '', 0, 100);

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
(91, '2019-08-12', 'Business Matter', ' Name : Viral Patel\n Company : Green World Overseas\n E-mail : gwo.viral@gmail.com\n\nHello,\r\nThis is Viral from Green World Overseas, INDIA.\r\nWe are manufacturer and exporter of cPVC and uPVC pipes and all kind of pipe fittings.\r\nIf you import the same kindly contact us.\r\nWe can supply on regular basis.\r\nHoping your earliest reply.\r\n( The mail delivery system shows that your inbox is full. May this info helpful to you.)\r\n\r\n\r\n\r\nThanks &amp; Regards,\r\n\r\nViral Sankhavra,\r\nGreen World Overseas,\r\nE-mail : gwo.viral@gmail.com\r\nMo : +91 7096004500\r\nWhatsApp &amp; wechat : +91 7096004500\r\nWebsite : www.greenworldoverseas.co\r\n'),
(92, '2021-01-27', 'Happy New Year !!! 2021', ' Name : Stella www.google.com\n Company : www.google.com\n E-mail : 12neuquevertia@mail.ru\n\nHappy New Year!!! www.google.com \r\n\r\nAre you working tomorrow ?\r\n'),
(93, '2021-03-12', 'QGWF01OSUMKT246WXF   www.ask.com', ' Name : QGWF01OSUMKT246WXF   www.web.de\n Company : QGWF01OSUMKT246WXF   www.msn.com\n E-mail : trangifonomny85@list.ru\n\nQGWF01OSUMKT246WXF   www.google.com     Where are you located ? I want to come to you one of these days\r\n'),
(94, '2021-03-23', 'QGW8UIQT7SN1WDXWXF   www.ask.com', ' Name : QGW8UIQT7SN1WDXWXF   www.web.de\n Company : Mason Kuehner\n E-mail : roma.makeev.95@inbox.ru\n\nQGW8UIQT7SN1WDXWXF   www.google.com\r\n   I have a small question for you'),
(95, '2021-04-07', 'About welding electrodes', ' Name : Ak\n Company : Bim Corporation\n E-mail : ceo@bim-bd.com\n\nDear Concern,we want to supply welding electrodes and wire like mig, Saw , ms welding electrodes of your company.please give me feedback.\r\n\r\nThanks\r\nAzad\r\nCell 01711835963'),
(96, '2021-04-07', 'About welding electrodes', ' Name : Ak\n Company : Bim Corporation\n E-mail : ceo@bim-bd.com\n\nDear Concern,we want to supply welding electrodes and wire like mig, Saw , ms welding electrodes of your company.please give me feedback.\r\n\r\nThanks\r\nAzad\r\nCell 01711835963'),
(97, '2021-05-20', 'URGENT', ' Name : https://u.to/2x5AGw\n Company : https://is.gd/j9JyS0\n E-mail : noll.lupe@yahoo.com\n\nLast day of special discounts   https://u.to/2x5AGw'),
(98, '2021-06-10', '??? ? ATTENTION', ' Name : ??? ? Do you want to become a millionaire?  https://is.gd/CAmo59\n Company : ??? ? Do you want to become a millionaire?  https://is.gd/CAmo59\n E-mail : kelley.adalberto@gmail.com\n\n??? ? The last day of giant discounts on all our products   Do you want to become a millionaire?  https://is.gd/CAmo59\r\n'),
(99, '2022-06-25', 'Hello!', ' Name : Kathie Lower\n Company : ??? ? Where can I pick up my gift? Here?  https://u.to/pHYyHA\n E-mail : lower.kathie@yahoo.com\n\n??? ? Where can I pick up my prize? Here?  https://u.to/pHYyHA'),
(100, '2023-02-10', 'Hi abidinggroupbd.com Admin!', ' Name : Abraham Hartley\n Company : Abraham Hartley\n E-mail : hartley.abraham@outlook.com\n\nDear abidinggroupbd.com Administrator!\r\n\r\nhttps://conductiveruthless.com/ivt13tueyr?key=c45f1c84f1b6b84a1f5e1f19c6996316\r\n\r\nThank You');

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
  `content` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `hidden` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `text_data`
--

INSERT INTO `text_data` (`id`, `page_id`, `heading`, `content`, `priority`, `hidden`) VALUES
(179, 8, 'Corporate Office', '2nd Floor Abiding Reza Tower\r\n57/2, Kakrail,\r\nDhaka -1000, Bangladesh', 50, 0),
(181, 8, 'Telephone', '+88-02-8392006', 50, 0),
(182, 8, 'Email', 'abs@abidinggroupbd.com', 50, 0),
(212, 9, 'Managing Director', 'Md. Kamrul Islam\r\nManaging Director\r\nMobile: +88 01777786700', 100, 0),
(213, 9, 'Director Operation', 'Syed Murad Ahamed\r\nDirector Operation\r\nMobile: +88 01777786701', 100, 0),
(214, 9, 'Director Marketing', 'Director Marketing\r\nABM Sabbir Mokammel\r\nMobile: +88 01777786702', 100, 0),
(251, 1, 'Board of Director', '<table> <thead> <tr> <th>Sl</th> <th>Name</th> <th>Qualification</th> <th>Designation</th> </tr></thead> <tbody> <tr> <td>1</td><td>Md. Amin Helaly</td><td>B.com(Hon’s) M.com (Accounting) Fellow NDC, Capstone Course</td><td>Chairman</td></tr><tr> <td>2</td><td>Md. Kamrul Islam</td><td>MBA(Marketing), DU</td><td>Managing Director</td></tr><tr> <td>3</td><td>Syed Murad Ahamed</td><td>B.com(Hon’s) M.com(Accounting)</td><td>Director Operation</td></tr><tr> <td>4</td><td>ABM Sabbir Mokammel</td><td>BBA (India)MBA (Cyprus)</td><td>Director Marketing</td></tr><tbody></table>', 50, 0),
(252, 1, 'Company Information', '<table> <thead> <tr> <th>Ttitle</th> <th>Details</th> </tr></thead> <tr> <td>Name of the<br>Company</td><td>Abiding Building Systems Limited</td></tr><tbody> <tr> <td>Type of Business</td><td>Design &amp; Development<br>Consultation<br>Construction<br>Pre-Engineered Steel building manufacturer</td></tr><tr> <td>Establishment Year</td><td>2009 For Abiding Development &amp; Holdings Ltd.<br>2014 For Abiding Building Systems Ltd.</td></tr><tr> <td>Company Registration</td><td>2009</td></tr><tr> <td>Trade License</td><td>Dhaka City Corporation, No: 0151066</td></tr><tr> <td>Registration Number</td><td>ADHL,C-79046/09 &amp; ABSL -120801/15</td></tr><tr> <td>Registered Address</td><td>Abiding Reza Tower, 57/2 Kakrail, Dhaka - 1000, Phone: 880-2-9355430, 9341971</td></tr><tr> <td>Taxes Information</td><td>TIN: 860517736064</td></tr><tr> <td>VAT Registration</td><td>19051028760</td></tr><tr> <td>Banking Partner</td><td>Social Islami Bank Ltd.Islami Bank Bangladesh Ltd.Southeast Bank Ltd.</td></tr></tbody></table>', 50, 0),
(253, 1, 'Working Area', '\r\n<strong>Abiding Building Systems Limited</strong> is specialized and working in the following fields of development sector: \r\n<ul>\r\n<li><b>Consultation:</b> This includes architectural, structural, electrical, plumbing & sanitary design, consultation & supervision services for apartment, residential, commercial, industrial buildings, hotels, satellite city etc. </li>\r\n<li><b>Construction:</b> Construction, supervision, management of various types of buildings in contract and/or turn-key basis.</li>\r\n<li><b>Project Management:</b> Project scheduling and resource management using MS Project and project management of various projects.</li>\r\n<li><b>Real Estate development:</b> Development of apartment buildings and selling of flats at numerous locations in Dhaka city.</li>\r\n<li><b>Industrial Building:</b> Design, preparation of plan, supervision and construction management of industrial buildings – both civil and Pre-Engineered Steel works.</li>\r\n</ul>', 50, 0),
(254, 1, 'Ventures', '<strong>Pre-fabricated Steel Building:</strong>\r\n\r\nAbiding Building Systems Ltd. has its large venture in civil construction and pre fabricated steel structure. It has its own fully equipped fabrication factory in Teghoria Road, South Keranigonj. ABSL runs its factory with highly skilled engineers and BOC certified workers. All the raw materials for the production of the building are imported from Japan, Taiwan, China, Malaysia and some other countries. ABSL has its capacity to fabricate more than 200MT of raw material per month. It is fully aware of its capacity and emphasize on the timely handover of the projects. We have already completed many turnkey projects including spinning, knitting, dyeing, garments factory and warehouses. Our projects area ranges from 2,000 to 2, 00,000sft. Costumers’ almost satisfaction and high quality work with best quality material available and reasonable price with timely completion is the prime concern of the company', 50, 0),
(255, 1, 'Resources', '<strong>Design Department</strong><table><thead><tr><th>Sl</th><th>Name</th><th>Qualification</th><th>Designation</th></thead><tbody><tr><td>1</td><td>Md. Ruhul Amin</td><td>B.Sc.in Civil Engg. (BUET)</td><td>Chief Structural Engineer</td></tr><tr><td>2<td>Md. Abu BakkarSidik</td><td>B.Sc.in Civil Engg. (CUET)</td><td>Manager</td></tr><tr><td>3</td><td>Md. Ataur Rahman</td><td>B.Sc.in Civil Engg. (SUST)</td><td>Design Engineer</td></tr><tr><td>4</td><td>Md. Helal Uddin</td><td>B.Sc.in Civil Engg. (CUET)</td><td>Design Engineer</td></tr><tr><td>5</td><td>Faisal Miah</td><td>B.Sc.in Civil Engg. (SUST)</td><td>Design Engineer</td></tr><tr><td>6</td><td>Mahmudul Hasan</td><td>B.Sc.in Civil Engg. (SUST)</td><td>Design Engineer</td></tr><tr><td>7</td><td>Abu Bakar Siddik</td><td>B.Sc.in Civil Engg. (BUET)</td><td>Design Engineer</td></tr><tr><td>8</td><td>Md. Samiul Islam</td><td>Dip. In Civil Engg.</td><td>CAD Detailer</td></tr><tr><td>9</td><td>Md. Moshiur Rahman</td><td>Dip. In Civil Engg.</td><td>CAD Detailer</td></tr><tr><td>10</td><td>FarjanaAkter</td><td>Dip. In Civil Engg</td>.<td>CAD Operator</td></tr></tbody></table><strong>Implementation Department</strong>\r\n<table><thead><tr><th >Sl</th><th>Name</th><th>Qualification</th><th>Designation</th></tr></thead><tbody><tr><td >1</td><td>Md. Kamrul Islam</td><td >MBA</td><td>Managing Director</td></tr><tr><td >2</td><td>Syed Murad Ahmed</td><td >MBA</td><td>Director</td></tr><tr><td >3</td><td>Mohammad Shahidul Islam</td><td >M.Com (Accounting), CMA(Inter.)</td><td>Head Of Accounts &amp; Admin</td></tr><tr><td >4</td><td>Md. Muzaddid Karim</td><td >B.Sc. in Civil Engr</td><td>Implementation Manager</td></tr><tr><td >5</td><td>Md. Motiur Rahman</td><td >B.Sc. in Civil Engr</td><td>Project Manager</td></tr><tr><td >6</td><td>Md. Sobuj Mahmud</td><td >B.Sc. in Civil Engr</td><td>Project Engr.</td></tr><tr><td >7</td><td>Md. Moniruzaman</td><td >B.Sc. in Civil Engr</td><td>ProjectCo-ordinator</td></tr><tr><td >8</td><td>Md. Rofiqul Islam</td><td >Dip. In Civil Engr</td><td>Site Engr.</td></tr><tr><td >9</td><td>Md. Helal Uddin</td><td >Dip. In Civil Engr</td><td>Site Engr.</td></tr><tr><td >10</td><td>Md. EmdulHaque</td><td >Dip. In Civil Engr</td><td>Site Engr.</td></tr><tr><td >11</td><td>Md. Monif</td><td >Dip. In Civil Engr</td><td>Site Engr.</td></tr><tr><td >12</td><td>Md. Ashraf</td><td >Dip. In Civil Engr</td><td>Site Engr.</td></tr></tbody></table>\r\n<strong>Marketing Department</strong>\r\n\r\n<table><thead><tr><th>Sl</th><th>Name</th><th>Qualification</th><th>Designation</th></tr></thead><tbody><tr><td>1</td><td>A.B.M SabbirMokammel</td><td>MBA (India)</td><td>Director</td></tr><tr><td>2</td><td>Md. Aminul Islam</td><td>B.B.S(Hons),M.S.S(Economics)</td><td>Sr. Asst.General Manager</td></tr><tr><td>3</td><td>Md. Aktharuzzaman Khan</td><td>B.Sc.in Civil Engg.</td><td>Asst.General Manager</td></tr><tr><td>4</td><td>Md. Kauser Ahmed</td><td>BBA (AIUB)</td><td>Asst. Manager Sales &amp;Marketing</td></tr><tr><td>5</td><td>Md. RowsanAlom</td><td>M.A (NU)</td><td>Asst. Manager Sales &amp;Marketing</td></tr><tr><td>6</td><td>Abdullah Al Muhit</td><td>M.B.A (SEU)</td><td>Executive</td></tr><tr><td>7</td><td>Md. Raju Ahmed</td><td>B.S.S (Hons)</td><td>Executive</td></tr></tbody></table>', 50, 0);

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
(1, 'nahin', '47d60f8c85fc25583958700ed9a0bca6', '81dc9bdb52d04dc20036dbd8313ed055', 1),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `imgtype`
--
ALTER TABLE `imgtype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=256;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
