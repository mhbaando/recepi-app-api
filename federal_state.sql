-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2023 at 09:58 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrls`
--

-- --------------------------------------------------------

--
-- Table structure for table `federal_state`
--

CREATE TABLE `federal_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `federal_state`
--

INSERT INTO `federal_state` (`state_id`, `state_name`, `created_at`, `modified_at`) VALUES
(1, 'Banaadir', '2023-02-05 10:38:37.000000', '2023-02-05 10:38:37.000000'),
(2, 'Hirshabeelle', '2023-02-05 10:38:37.000000', '2023-02-05 10:38:37.000000'),
(3, 'Koonfur Galbeed', '2023-02-05 10:39:28.000000', '2023-02-05 10:39:28.000000'),
(4, 'Galmudug', '2023-02-05 10:39:49.000000', '2023-02-05 10:39:49.000000'),
(5, 'Puntland', '2023-02-05 10:40:07.000000', '2023-02-05 10:40:07.000000'),
(6, 'Jubba land', '2023-02-05 10:40:21.000000', '2023-02-05 10:40:21.000000'),
(7, 'Somali land', '2023-02-05 10:40:31.000000', '2023-02-05 10:40:31.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `federal_state`
--
ALTER TABLE `federal_state`
  ADD PRIMARY KEY (`state_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `federal_state`
--
ALTER TABLE `federal_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
