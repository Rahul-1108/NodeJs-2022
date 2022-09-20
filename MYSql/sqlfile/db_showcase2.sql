-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 26, 2022 at 01:45 PM
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
-- Database: `db_showcase2`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_add_post`
--

CREATE TABLE `tbl_add_post` (
  `post_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `title` varchar(20) NOT NULL,
  `painting_type` enum('cubist','Chinese style') NOT NULL,
  `medium` enum('oil paints','watercolors','graphite pencils') NOT NULL,
  `styles` enum('Realism','Photorealism','Expressionism','Impressionism') NOT NULL,
  `for_sale` varchar(256) NOT NULL,
  `location` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_add_post`
--

INSERT INTO `tbl_add_post` (`post_id`, `user_id`, `title`, `painting_type`, `medium`, `styles`, `for_sale`, `location`, `description`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'naturel', 'cubist', 'oil paints', 'Realism', '10000', 'Bhuj', 'ok', 1, '2022-07-24', '2022-07-25'),
(2, 5, 'Hindu_temple', 'Chinese style', 'watercolors', 'Realism', '20000', 'Amreli', 'ok', 1, '2022-07-24', '2022-07-25'),
(3, 4, 'Muslim_temple', 'cubist', 'graphite pencils', 'Impressionism', '30000', 'Mahesana', 'ok', 1, '2022-07-24', '2022-07-25'),
(4, 3, 'Sikh_temple', 'Chinese style', 'watercolors', 'Photorealism', '40000', 'Junagadh', 'ok', 1, '2022-07-24', '2022-07-25'),
(5, 4, 'Natherland', 'cubist', 'graphite pencils', 'Expressionism', '50000', 'surat', 'ok', 1, '2022-07-24', '2022-07-25'),
(6, 2, 'Findland', 'cubist', 'oil paints', 'Impressionism', '60000', 'Ahmedabad', 'ok', 1, '2022-07-24', '2022-07-25');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_event`
--

CREATE TABLE `tbl_event` (
  `event_id` bigint(20) NOT NULL,
  `name` varchar(256) NOT NULL,
  `img_id` bigint(20) NOT NULL,
  `start_date` date NOT NULL DEFAULT current_timestamp(),
  `end_date` date NOT NULL DEFAULT current_timestamp(),
  `location` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_date` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_event`
--

INSERT INTO `tbl_event` (`event_id`, `name`, `img_id`, `start_date`, `end_date`, `location`, `description`, `is_active`, `created_date`, `updated_at`) VALUES
(2, 'kite_festival', 2, '2022-05-22', '2022-06-22', 'Punjab', 'ok', 1, '2022-06-22', '2022-06-23'),
(3, 'Diwali_festival', 3, '2022-05-22', '2022-06-22', 'Kashmir', 'ok', 1, '2022-06-22', '2022-06-23'),
(4, 'Holi_festival', 6, '2022-05-22', '2022-06-22', 'Banglore', 'ok', 1, '2022-06-22', '2022-06-23'),
(5, 'NewYear_festival', 5, '2022-05-22', '2022-06-22', 'Chennai', 'ok', 1, '2022-06-22', '2022-06-23'),
(6, 'Sikh_festival', 4, '2022-05-22', '2022-06-22', 'kolkata', 'ok', 1, '2022-06-22', '2022-06-23');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_img`
--

CREATE TABLE `tbl_img` (
  `img_id` bigint(20) NOT NULL,
  `post_id` bigint(20) NOT NULL,
  `image` varchar(256) NOT NULL,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_img`
--

INSERT INTO `tbl_img` (`img_id`, `post_id`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, '20.jpeg', '2022-07-25', '2022-07-26'),
(2, 6, '21.jpeg', '2022-07-20', '2022-07-26'),
(3, 2, '22.jpeg', '2022-07-25', '2022-07-26'),
(4, 3, '23.jpeg', '2022-07-25', '2022-07-26'),
(5, 5, '24.jpeg', '2022-07-21', '2022-07-26'),
(6, 1, '25.jpeg', '2022-07-22', '2022-07-26'),
(7, 4, '26.jpeg', '2022-07-24', '2022-07-26');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(128) NOT NULL,
  `profile_image` varchar(64) NOT NULL,
  `age` int(3) NOT NULL,
  `gender` enum('M','F') NOT NULL COMMENT '-> M ''Male'',F ''Female''',
  `about` text NOT NULL,
  `role` enum('User') NOT NULL,
  `social_id` varchar(20) NOT NULL,
  `login_type` enum('S','F','G') NOT NULL COMMENT '-> Simple Signup, Facebook Signup, Gmail Signup ',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` date NOT NULL DEFAULT current_timestamp(),
  `updated_at` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `email`, `password`, `profile_image`, `age`, `gender`, `about`, `role`, `social_id`, `login_type`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Akshaykumar', 'akshay@gmail.com', 'ak123', '1.jpeg', 20, 'M', 'Actor', 'User', 'akshay_14', 'S', 1, '2022-07-25', '2022-07-26'),
(2, 'AjayDevgan', 'AjayDevgan@gmail.com', 'Aj123', '2.jpeg', 22, 'M', 'Actor', 'User', 'Ajay_14', 'F', 1, '2022-07-25', '2022-07-26'),
(3, 'VarunDhavan', 'VarunDhavan@gmail.com', 'VarunDhavan186', '3.jpeg', 25, 'M', 'Actor', 'User', 'VarunDhavan_14', 'G', 1, '2022-07-25', '2022-07-26'),
(4, 'Sonam Kapoor', 'Sonam Kapoor@gmail.com', 'Sonam_Kapoor416', '4.jpeg', 21, 'F', 'Actress', 'User', 'Sonam_Kapoor46', 'F', 1, '2022-07-25', '2022-07-26'),
(5, 'Kriti Sanon', 'Kriti Sanon@gmail.com', 'KritiSanon426', '5.jpeg', 23, 'F', 'Actress', 'User', 'Kriti_Sanon11', 'G', 1, '2022-07-25', '2022-07-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_add_post`
--
ALTER TABLE `tbl_add_post`
  ADD PRIMARY KEY (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `img_id` (`img_id`);

--
-- Indexes for table `tbl_img`
--
ALTER TABLE `tbl_img`
  ADD PRIMARY KEY (`img_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_add_post`
--
ALTER TABLE `tbl_add_post`
  MODIFY `post_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_event`
--
ALTER TABLE `tbl_event`
  MODIFY `event_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_img`
--
ALTER TABLE `tbl_img`
  MODIFY `img_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_add_post`
--
ALTER TABLE `tbl_add_post`
  ADD CONSTRAINT `tbl_add_post_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_event`
--
ALTER TABLE `tbl_event`
  ADD CONSTRAINT `tbl_event_ibfk_1` FOREIGN KEY (`img_id`) REFERENCES `tbl_img` (`img_id`);

--
-- Constraints for table `tbl_img`
--
ALTER TABLE `tbl_img`
  ADD CONSTRAINT `tbl_img_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `tbl_add_post` (`post_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
