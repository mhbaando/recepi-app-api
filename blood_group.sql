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
-- Table structure for table `blood_group`
--

CREATE TABLE `blood_group` (
  `blood_group_id` int(11) NOT NULL,
  `blood_group_name` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `modified_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blood_group`
--

INSERT INTO `blood_group` (`blood_group_id`, `blood_group_name`, `created_at`, `modified_at`) VALUES
(1, 'A+', '2023-02-05 10:35:13.000000', '2023-02-05 10:35:13.000000'),
(2, 'A-', '2023-02-05 10:35:13.000000', '2023-02-05 10:35:13.000000'),
(3, 'O+', '2023-02-05 10:36:15.000000', '2023-02-05 10:36:15.000000'),
(4, 'B-', '2023-02-05 10:36:15.000000', '2023-02-05 10:36:15.000000'),
(5, 'O-', '2023-02-05 10:37:15.000000', '2023-02-05 10:37:15.000000'),
(6, 'AB+', '2023-02-05 10:37:32.000000', '2023-02-05 10:37:32.000000'),
(7, 'AB-', '2023-02-05 10:37:47.000000', '2023-02-05 10:37:47.000000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blood_group`
--
ALTER TABLE `blood_group`
  ADD PRIMARY KEY (`blood_group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blood_group`
--
ALTER TABLE `blood_group`
  MODIFY `blood_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
