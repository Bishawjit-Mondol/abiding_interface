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
-- Database: `abidingg_afl`
--

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
(1, 'Abiding Furniture Limited'),
(2, 'ABIDING FURNITURE LTD.'),
(3, 'Abiding Furniture Limited is Committed to the commitment of providing world class Doors and Furniture to you. We are committed to turn your dreams into really. '),
(4, 'afl.abidinggroupbd.com'),
(5, 'afl@abidinggroupbd.com'),
(6, 'Committed to commitment');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `id` int(10) UNSIGNED NOT NULL,
  `caption` text NOT NULL,
  `imgtype_id` int(10) UNSIGNED NOT NULL,
  `link` varchar(200) NOT NULL,
  `priority` int(3) UNSIGNED NOT NULL DEFAULT 50
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `img`
--

INSERT INTO `img` (`id`, `caption`, `imgtype_id`, `link`, `priority`) VALUES
(1, 'AFL-0001', 1, '', 99),
(2, 'AFL-0002', 1, '', 98),
(3, 'AFL-0003', 1, '', 97),
(4, 'AFL-0004', 1, '', 96),
(5, 'AFL-0005', 1, '', 95),
(6, 'AFL-0006', 1, '', 94),
(7, 'AFL-0007', 1, '', 93),
(8, 'AFL-0008', 1, '', 92),
(9, 'AFL-0009', 1, '', 91),
(10, 'AFL-0010', 1, '', 90),
(11, 'AFL-0011', 1, '', 89),
(12, 'AFL-0012', 1, '', 88),
(13, 'AFL-0013', 1, '', 87),
(14, 'AFL-0014', 1, '', 86),
(15, 'AFL-0015', 1, '', 85),
(16, 'AFL-0016', 1, '', 84),
(17, 'AFL-0017', 1, '', 83),
(18, 'AFL-0018', 1, '', 82),
(19, 'AFL-0019', 1, '', 81),
(20, 'AFL-0020', 1, '', 80);

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

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `imgtype`
--
ALTER TABLE `imgtype`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
