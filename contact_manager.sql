-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 06, 2025 at 02:18 PM
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
-- Database: `contact_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `user_id`, `name`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 14, 'Carl Lauro Castillo', '09938782896', 'carllauro06@gmail.com', '2025-05-05 08:54:56', '2025-05-05 08:54:56'),
(2, 13, 'Carl Lauro Castillo', '09938782896', 'carllauro07@gmail.com', '2025-05-05 11:21:08', '2025-05-05 11:22:15'),
(3, 13, 'Trisha Nicole Oribello', '0912223333', 'trish123@gmail.com', '2025-05-05 11:21:55', '2025-05-05 11:21:55'),
(4, 13, 'Benelyn Andaya', '09938743567', 'benelynandaya02@gmail.com', '2025-05-05 11:22:34', '2025-05-05 11:22:34'),
(5, 13, 'Blessie De Guzman', '09986864521', 'blesi3dguz@gmail.com', '2025-05-05 11:23:15', '2025-05-05 11:23:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `is_verified` tinyint(1) DEFAULT 0,
  `verification_code` varchar(6) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `is_verified`, `verification_code`, `created_at`) VALUES
(13, 'Carl Lauro Castillo', 'carllauro06@gmail.com', '$2y$10$E0eviYK8rMKyr00vAhokL.AKX66Csglu616Py7J/P26WGazjJewLy', 1, NULL, '2025-05-05 08:41:53'),
(14, 'Lorena Castillo', 'kastilyo.el23@gmail.com', '$2y$10$O7uUmgcVwcbeY5/qZvLlue9ZauBl/jtUm/frXQbuwsktql4wznv3y', 1, NULL, '2025-05-05 08:45:08'),
(15, 'Benelyn Andaya', 'benelynandaya02@gmail.com', '$2y$10$MPrsVZESB4paAw4f8oqJEejApfKsE.fVva3re0H2BCnGoIYtyv2UK', 1, NULL, '2025-05-05 11:08:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
  ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
