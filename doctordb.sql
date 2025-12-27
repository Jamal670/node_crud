-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 27, 2025 at 06:29 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctordb`
--

-- --------------------------------------------------------

--
-- Table structure for table `details`
--

CREATE TABLE `details` (
  `id` int(11) NOT NULL,
  `specialization` varchar(150) NOT NULL,
  `sub_specialty` varchar(150) DEFAULT NULL,
  `certName` varchar(255) DEFAULT NULL,
  `InstName` varchar(255) DEFAULT NULL,
  `YearOfCert` year(4) DEFAULT NULL,
  `institute` varchar(255) DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `details`
--

INSERT INTO `details` (`id`, `specialization`, `sub_specialty`, `certName`, `InstName`, `YearOfCert`, `institute`, `from`, `to`, `country`, `state`, `created_at`, `updated_at`) VALUES
(2, 'Cardiology', 'Pediatric Cardiology', 'Diploma in Cardiology', 'ABC University', '2020', 'ABC Institute', '2020-01-01', '2020-12-31', 'Pakistan', 'Punjab', '2025-12-27 17:07:49', '2025-12-27 17:07:49');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `lname` varchar(100) NOT NULL,
  `city` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `phno` varchar(20) DEFAULT NULL,
  `gender` enum('male','female','other') DEFAULT NULL,
  `language` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `fname`, `lname`, `city`, `email`, `phno`, `gender`, `language`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Muhammad', 'Jamal', 'Lahore', 'jamal123@test.com', '03001234567', 'male', 'English', '$2b$10$.CLpXWhVmJA8hUTzGE38dOElUz1Sx56CXF5tql/IcoTcCbxw43diO', '2025-12-27 15:57:55', '2025-12-27 15:57:55'),
(2, 'Muhammad', 'Jamal', 'Lahore', 'jamalobaid2@gmail.com', '03486760916', 'male', NULL, '$2b$10$0qXO.0K55TKIo/PZ15FmPuHmEy1rJ4xvG4IFkZkCOP6/WBQb.huZ.', '2025-12-27 17:09:37', '2025-12-27 17:09:37');

-- --------------------------------------------------------

--
-- Table structure for table `subdetails`
--

CREATE TABLE `subdetails` (
  `id` int(11) NOT NULL,
  `specialization` varchar(150) NOT NULL,
  `sub_specialty` varchar(150) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `detail_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subdetails`
--

INSERT INTO `subdetails` (`id`, `specialization`, `sub_specialty`, `country`, `state`, `detail_id`, `created_at`, `updated_at`) VALUES
(3, 'Cardiology', 'Pediatric Cardiology', 'Pakistan', 'Punjab', 2, '2025-12-27 17:07:49', '2025-12-27 17:07:49'),
(4, 'Cardiology', 'Pediatric Cardiology', 'Pakistan', 'Sindh', 2, '2025-12-27 17:07:49', '2025-12-27 17:07:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `subdetails`
--
ALTER TABLE `subdetails`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_detail` (`detail_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `details`
--
ALTER TABLE `details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `subdetails`
--
ALTER TABLE `subdetails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `subdetails`
--
ALTER TABLE `subdetails`
  ADD CONSTRAINT `fk_detail` FOREIGN KEY (`detail_id`) REFERENCES `details` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
