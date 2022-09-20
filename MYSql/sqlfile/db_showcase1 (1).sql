-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2022 at 08:14 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.2.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_showcase1`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place`
--

CREATE TABLE `tbl_place` (
  `place_id` bigint(20) NOT NULL,
  `location` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `latitude` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `longitude` varchar(32) CHARACTER SET utf8mb4 NOT NULL,
  `about` text CHARACTER SET utf8mb4 NOT NULL,
  `avg_rating` float(5,1) NOT NULL,
  `totalreview` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_place`
--

INSERT INTO `tbl_place` (`place_id`, `location`, `latitude`, `longitude`, `about`, `avg_rating`, `totalreview`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Ahmedabad', '41°24\'12.2\"N', '2°10\'26.5\"E', 'ok', 5.0, 1, 1, '2022-07-25', '2022-07-25'),
(2, 'Vadodra', '41 24.2028', ' 2 10.4418.', 'ok', 6.0, 1, 1, '2022-07-25', '2022-07-25'),
(3, 'Surat', ' 41.40338', '2.17403', 'ok', 7.0, 1, 1, '2022-07-25', '2022-07-25'),
(4, 'Junagdh', '41°24\'12.2\"N', '2°10\'26.5\"E.', 'ok', 8.0, 1, 1, '2022-07-25', '2022-07-25'),
(5, 'Mahesana', ' 41 24.2028', '2 10.4418.', 'ok', 9.0, 1, 1, '2022-07-25', '2022-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_place_image`
--

CREATE TABLE `tbl_place_image` (
  `id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_place_image`
--

INSERT INTO `tbl_place_image` (`id`, `place_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '6.jpeg', '2022-07-25', '2022-07-25'),
(2, 3, '7.jpeg', '2022-07-25', '2022-07-25'),
(3, 1, '8.jpeg', '2022-07-25', '2022-07-25'),
(4, 5, '9.jpeg', '2022-07-25', '2022-07-25'),
(5, 4, '10.jpeg', '2022-07-25', '2022-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `place_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `user_id`, `place_id`, `is_active`, `created_at`, `updated`) VALUES
(1, 1, 1, 1, '2022-07-25', '2022-07-25'),
(2, 5, 5, 1, '2022-07-25', '2022-07-25'),
(3, 5, 5, 1, '2022-07-24', '2022-07-24'),
(4, 3, 2, 1, '2022-07-23', '2022-07-23'),
(5, 5, 3, 1, '2022-07-22', '2022-07-22');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(256) CHARACTER SET utf8mb4 NOT NULL,
  `profile_image` varchar(64) CHARACTER SET utf8mb4 NOT NULL,
  `about` text CHARACTER SET utf8mb4 NOT NULL,
  `role` enum('User') CHARACTER SET utf8mb4 NOT NULL,
  `social_id` text CHARACTER SET utf8mb4 NOT NULL,
  `login_type` enum('S','F','G') CHARACTER SET utf8mb4 NOT NULL COMMENT 'S-> Simple Signup, F-> Facebook Signup, G-> Google Signup',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `email`, `password`, `profile_image`, `about`, `role`, `social_id`, `login_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Rahul', 'rahul@gmail.com', '1234', '1.jpeg', 'ok', 'User', 'Rahul_11', 'S', 1, '2022-07-25', '2022-07-25'),
(2, 'Chintan', 'Chintan@gmail.com', '1234', '2.jpeg', 'ok', 'User', 'Chintan_11', 'F', 1, '2022-07-25', '2022-07-25'),
(3, 'Vijay', 'Vijay@gmail.com', '7896', '3.jpeg', 'ok', 'User', 'Chintan_11', 'G', 1, '2022-07-25', '2022-07-25'),
(4, 'Mahesh', 'Mahesh@gmail.com', '7896', '4.jpeg', 'ok', 'User', 'Mahesh_11', 'S', 1, '2022-07-25', '2022-07-25'),
(5, 'Kishan', 'Kishan@gmail.com', '8888', '5.jpeg', 'ok', 'User', 'Mahesh_11', 'F', 1, '2022-07-25', '2022-07-25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_place`
--
ALTER TABLE `tbl_place`
  ADD PRIMARY KEY (`place_id`);

--
-- Indexes for table `tbl_place_image`
--
ALTER TABLE `tbl_place_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `place_id` (`place_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_place`
--
ALTER TABLE `tbl_place`
  MODIFY `place_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_place_image`
--
ALTER TABLE `tbl_place_image`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_place_image`
--
ALTER TABLE `tbl_place_image`
  ADD CONSTRAINT `tbl_place_image_ibfk_1` FOREIGN KEY (`place_id`) REFERENCES `tbl_place` (`place_id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  ADD CONSTRAINT `tbl_review_ibfk_2` FOREIGN KEY (`place_id`) REFERENCES `tbl_place` (`place_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
