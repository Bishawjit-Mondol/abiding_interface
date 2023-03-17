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
-- Database: `abidingg_home`
--

-- --------------------------------------------------------

--
-- Table structure for table `career`
--

CREATE TABLE `career` (
  `img_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `career`
--

INSERT INTO `career` (`img_id`) VALUES
(12),
(13),
(14);

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `img_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`img_id`) VALUES
(9),
(10),
(11);

-- --------------------------------------------------------

--
-- Table structure for table `fixedtext`
--

CREATE TABLE `fixedtext` (
  `id` int(10) UNSIGNED NOT NULL,
  `fixedtext` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fixedtext`
--

INSERT INTO `fixedtext` (`id`, `fixedtext`) VALUES
(1, 'ABIDING GROUP'),
(2, 'Abiding Group'),
(3, 'We are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. Our mission is to work with our clients to develop the best possible habitat. We are committed to helping our clients to turn there dreams into really. '),
(4, 'abidinggroupbd.com'),
(5, 'adhl@abidinggroupbd.com'),
(6, 'Dreams Made Real');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `id` int(10) UNSIGNED NOT NULL,
  `caption` text NOT NULL,
  `description` text NOT NULL,
  `imgtype_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(200) NOT NULL,
  `priority` int(3) UNSIGNED NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `img`
--

INSERT INTO `img` (`id`, `caption`, `description`, `imgtype_id`, `link`, `priority`) VALUES
(1, 'ABIDING DEVELOPMENT \r\nAND HOLDINGS LTD.', 'Dreams Made Real\r\nAbiding Development and Holdings Limited as well as there sister concerns are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. Our mission is to work with our clients to develop the best possible habitat. We are committed to helping our clients to turn there dreams into really.', 3, 'http://adhl.abidinggroupbd.com/', 98),
(2, 'ABIDING TRADE\r\nINTERNATIONAL LTD.', 'House of Quality Building Products\r\nAbiding Trade International Ltd is a house of quality building products and a unit of Abiding Group. We are one of the largest importer and distributor of High Quality PPR and PVC pipe and pipe fittings in Bangladesh. Abiding Trade International Ltd as well as there sister concerns are devoted to make your dreams real. We assist our clients in identifying their entire needs.', 3, 'http://atil.abidinggroupbd.com/', 97),
(4, 'ABIDING FURNITURE LTD.', 'Committed to commitment\r\nAbiding Furniture Limited is Committed to the commitment of providing world class Doors and Furniture to you. We are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. \r\n', 3, 'http://afl.abidinggroupbd.com/', 96),
(5, 'IDEA TRADING CORPORATION\r\n', 'Supply and Distribution\r\nIdea Trading Corporation believe in continuous product innovation and excellent service. Therefore, we are also concentrating on Quality Management. We are continuously upgrading our staff in their competence and knowledge and equip them with better service skills in order to exceed our customer’s expectations.', 3, 'http://idea.abidinggroupbd.com/', 95),
(6, 'Managing Director', 'Md. Kamrul Islam\r\nManaging Director\r\nMobile: +88 01777786700\r\nE mail : skirasel@gmail.com', 1, '', 95),
(7, 'Director Operation', 'Syed Murad Ahamed\r\nDirector Operation\r\nMobile: +88 01777786701\r\nE mail : smahamed23@yahoo.com', 1, '', 94),
(8, 'Director Marketing', 'Director Marketing\r\nABM Sabbir Mokammel\r\nMobile: +88 01777786702\r\nE mail : atil@abidinggoupbd.com', 1, '', 93),
(9, 'Head Office', 'Akram Tower, Level - 8, Suite - 9,\r\n199, Shahid Syed Nazrul Islam Sharani,\r\n(15/5, Bijoynagar), Dhaka -1000,\r\nBangladesh\r\nPhone: +88-02-8392006', 3, '', 92),
(10, 'Kakrail Office', 'Abiding Reza Tower\r\n57/2,Kakrail,Dhaka -1000,\r\nBangladesh\r\nPhone: +88-02-8392006', 3, '', 91),
(11, 'Email', 'adhl@abidinggroupbd.com\r\natil@abidinggroupbd.com\r\nuwl@abidinggroupbd.com\r\nafl@abidinggroupbd.com\r\nidea@abidinggroupbd.com', 3, '', 50),
(12, 'Marketing Executive', 'The website is still under construction. More information will be provided soon.\r\nThe website is still under construction. More information will be provided soon.\r\nThe website is still under construction. More information will be provided soon.\r\nThe website is still under construction. More information will be provided soon.', 3, '', 50),
(13, 'Web Developer', 'If you are a born Artist, drawing /painting comes naturally to you, and you can create excellent backgrounds and character for international animated films, then we are looking for you. You have to have minimum 1 to 2 years experience, working on creating variety of Backgrounds and character. You should have the ability to understand the color schemes, lighting & perspectives. Then you are eligible to apply as 2D background artist.', 3, '', 50),
(14, 'Software Developer', 'The website is still under construction. More information will be provided soon. The website is still under construction. More information will be provided soon. The website is still under construction. More information will be provided soon. The website is still under construction. More information will be provided soon. ', 3, '', 50),
(15, 'ABIDING GROUP', 'We are devoted to make your dreams real. We assist our clients in identifying their entire needs. We help our clients streamline their operations through strategic implementation. Our mission is to work with our clients to develop the best possible habitat. We are committed to helping our clients to turn there dreams into really. ', 3, '', 100),
(17, 'Unique Webers Ltd', 'Unique Webers team can assure you that we provide you quality software solution, our designs are innovative, 100% original and high quality custom website designs. Unique Webers have customized hosting plans for large, medium and small businesses. Unique Webers domain hosting rates are also affordable to all. ', 3, 'http://uwl.abidinggroupbd.com', 96),
(51, 'Abiding Building Systems Ltd', 'Abiding Building Systems Limited is (a sister concern of Abiding Group).Abiding Buildings System Limited is a growing pre-fabricated steel building manufacturer in Bangladesh with a group of experienced and self-recognized professionals. We are delighted to introduce ourselves as one of the organization doing complete solution of design, detailing, Fabrication, supply and installation of modern Pre-Engineered total Building Systems.\r\n\r\nAbiding Building Systems Ltd. is a Pre-Engineered Steel Building System doing it\'s activities for long time. We have immense experience in the field of creation from all type of Design, Fabrication, Supply and Erection of Pre-Fabricated Steel Structure, Civil Construction Works etc. ABSL is designing for both (Civil & Steel) and working with our skill personal.\r\n\r\nThe company was established in the year 2009 and since our establishment we have been successfully working on several projects in the Architectural & Engineering arena. We have already completed industrial building projects, numerous apartment buildings, through which we have gained comprehensive experience and attained goodwill.', 3, 'http://abs.abidinggroupbd.com', 99);

-- --------------------------------------------------------

--
-- Table structure for table `imgtype`
--

CREATE TABLE `imgtype` (
  `id` int(10) UNSIGNED NOT NULL,
  `imgtype` varchar(5) NOT NULL,
  `phpcheck` varchar(15) NOT NULL
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
-- Table structure for table `management`
--

CREATE TABLE `management` (
  `img_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `management`
--

INSERT INTO `management` (`img_id`) VALUES
(6),
(7),
(8);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `img_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`img_id`) VALUES
(1),
(2),
(4),
(5),
(15),
(17),
(51);

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `img_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`img_id`) VALUES
(1),
(2),
(4),
(5),
(17);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `career`
--
ALTER TABLE `career`
  ADD KEY `FK_career_1` (`img_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD KEY `FK_contact_1` (`img_id`);

--
-- Indexes for table `fixedtext`
--
ALTER TABLE `fixedtext`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_img_1` (`imgtype_id`);

--
-- Indexes for table `imgtype`
--
ALTER TABLE `imgtype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `management`
--
ALTER TABLE `management`
  ADD KEY `FK_management_1` (`img_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD KEY `FK_slides_1` (`img_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD KEY `FK_units_1` (`img_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `imgtype`
--
ALTER TABLE `imgtype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `career`
--
ALTER TABLE `career`
  ADD CONSTRAINT `FK_career_1` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contact`
--
ALTER TABLE `contact`
  ADD CONSTRAINT `FK_contact_1` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `img`
--
ALTER TABLE `img`
  ADD CONSTRAINT `FK_img_1` FOREIGN KEY (`imgtype_id`) REFERENCES `imgtype` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `management`
--
ALTER TABLE `management`
  ADD CONSTRAINT `FK_management_1` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `FK_slides_1` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `FK_units_1` FOREIGN KEY (`img_id`) REFERENCES `img` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
