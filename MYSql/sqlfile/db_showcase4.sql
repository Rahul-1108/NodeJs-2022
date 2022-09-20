-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 29, 2022 at 12:40 PM
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
-- Database: `db_showcase4`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_categories`
--

CREATE TABLE `tbl_product_categories` (
  `product_categories_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_categories`
--

INSERT INTO `tbl_product_categories` (`product_categories_id`, `store_id`, `product_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4, 'Milk', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(2, 3, 'Ice-cream', 0, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(3, 2, 'Bread', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(4, 1, 'Biscuit', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_product_item`
--

CREATE TABLE `tbl_product_item` (
  `product_item_id` bigint(20) NOT NULL,
  `product_categories_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `about` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_product_item`
--

INSERT INTO `tbl_product_item` (`product_item_id`, `product_categories_id`, `name`, `image`, `about`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 4, 'paramalat milk', 'paramalatmilk.png', 'So nice Milk', '100.00', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(2, 1, 'Shakti milk', 'Shakti milk.png', 'So Amazing Milk', '200.00', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(3, 3, 'Venila Ice-cream', 'Venila Ice-cream.png', 'So nice Ice-crea,', '300.00', 0, '2022-07-01 00:00:00', '2022-07-02 00:00:00'),
(4, 2, 'Chocolate Ice-cream', 'Chocolate Ice-cream.png', 'So Amazing Ice-cream', '400.00', 1, '2022-07-01 00:00:00', '2022-07-02 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_rating`
--

CREATE TABLE `tbl_rating` (
  `rating_id` bigint(20) NOT NULL,
  `store_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `avg_rating` decimal(10,2) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_rating`
--

INSERT INTO `tbl_rating` (`rating_id`, `store_id`, `user_id`, `avg_rating`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 4, '10.20', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 4, 3, '9.10', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 3, 2, '10.60', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 2, 1, '8.00', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(5, 1, 1, '1.00', 1, '2022-07-29 16:06:40', '2022-07-29 16:06:40'),
(6, 1, 2, '10.00', 1, '2022-07-29 16:06:40', '2022-07-29 16:06:40');

--
-- Triggers `tbl_rating`
--
DELIMITER $$
CREATE TRIGGER `Rating` AFTER INSERT ON `tbl_rating` FOR EACH ROW UPDATE tbl_store SET avg_rating=(SELECT AVG(avg_rating) FROM tbl_rating WHERE tbl_rating.store_id=tbl_store.store_id) WHERE  store_id=NEW.store_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store`
--

CREATE TABLE `tbl_store` (
  `store_id` bigint(20) NOT NULL,
  `store_categories_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `image` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `latitude` varchar(50) NOT NULL,
  `longitude` varchar(50) NOT NULL,
  `avg_rating` decimal(10,1) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_no` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store`
--

INSERT INTO `tbl_store` (`store_id`, `store_categories_id`, `name`, `image`, `location`, `latitude`, `longitude`, `avg_rating`, `email`, `phone_no`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Walmart', 'walmart.png', 'Ahmedabad', ' 48.1667° N ', '100.1667° W', '7.1', 'Walmart@gmail.com', '9635214556', 1, '2022-07-01 00:00:00', '2022-07-29 16:07:28'),
(2, 3, 'Foodery', 'Foodery.png', 'Washingtone', ' 205.305° N ', '520.250° W', '4.8', 'royalacserve@gmail.com', '9156885624', 0, '2022-07-01 00:00:00', '2022-07-29 14:51:32'),
(3, 2, 'American home shield', 'American home shield.png', 'Washingtone', '58.202N', '20.301S', '4.8', 'Americanhomeshield@gmail.com', '8521234567', 1, '2022-07-29 14:53:24', '2022-07-29 14:53:24'),
(4, 4, 'Pharmasift', 'Pharmasift.png', 'BlueCardion', '5682.258S', '35698.01E', '10.0', 'Pharmasift@gmail.com', '7411325889', 1, '2022-07-29 14:53:24', '2022-07-29 14:53:24');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_store_categories`
--

CREATE TABLE `tbl_store_categories` (
  `store_categories_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_store_categories`
--

INSERT INTO `tbl_store_categories` (`store_categories_id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'HouseHold', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 'Grocery', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 'Furniture', 0, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 'Pharmacy', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role` enum('User','Vendor') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `phone_no`, `email`, `password`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Mahesh', '1234567890', 'Mahesh@gmail.com', 'Mahesh@123', 'User', 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(2, 'Virat', '1234567891', 'Virat@gmail.com', 'Virat@123', 'User', 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(3, 'Akshay', '1234567892', 'Akshay@gmail.com', 'Akshay@123', 'Vendor', 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(4, 'Rishabh', '1234567893', 'Rishabh@gmail.com', 'Rishabh@123', 'Vendor', 0, '2022-07-29 00:00:00', '2022-07-29 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_verify`
--

CREATE TABLE `tbl_verify` (
  `verify_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `otp` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_verify`
--

INSERT INTO `tbl_verify` (`verify_id`, `user_id`, `otp`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2568, 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(2, 3, 2538, 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(3, 2, 2548, 1, '2022-07-29 00:00:00', '2022-07-29 00:00:00'),
(4, 4, 2558, 0, '2022-07-29 00:00:00', '2022-07-29 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD PRIMARY KEY (`product_categories_id`),
  ADD KEY `store_id` (`store_id`);

--
-- Indexes for table `tbl_product_item`
--
ALTER TABLE `tbl_product_item`
  ADD PRIMARY KEY (`product_item_id`),
  ADD KEY `product_categories_id` (`product_categories_id`);

--
-- Indexes for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD PRIMARY KEY (`rating_id`),
  ADD KEY `store_id` (`store_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `store_categories_id` (`store_categories_id`);

--
-- Indexes for table `tbl_store_categories`
--
ALTER TABLE `tbl_store_categories`
  ADD PRIMARY KEY (`store_categories_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_verify`
--
ALTER TABLE `tbl_verify`
  ADD PRIMARY KEY (`verify_id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  MODIFY `product_categories_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_product_item`
--
ALTER TABLE `tbl_product_item`
  MODIFY `product_item_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  MODIFY `rating_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_store`
--
ALTER TABLE `tbl_store`
  MODIFY `store_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_store_categories`
--
ALTER TABLE `tbl_store_categories`
  MODIFY `store_categories_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbl_verify`
--
ALTER TABLE `tbl_verify`
  MODIFY `verify_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_product_categories`
--
ALTER TABLE `tbl_product_categories`
  ADD CONSTRAINT `tbl_product_categories_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `tbl_store` (`store_id`);

--
-- Constraints for table `tbl_product_item`
--
ALTER TABLE `tbl_product_item`
  ADD CONSTRAINT `tbl_product_item_ibfk_1` FOREIGN KEY (`product_categories_id`) REFERENCES `tbl_product_categories` (`product_categories_id`);

--
-- Constraints for table `tbl_rating`
--
ALTER TABLE `tbl_rating`
  ADD CONSTRAINT `tbl_rating_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `tbl_store` (`store_id`),
  ADD CONSTRAINT `tbl_rating_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_store`
--
ALTER TABLE `tbl_store`
  ADD CONSTRAINT `tbl_store_ibfk_1` FOREIGN KEY (`store_categories_id`) REFERENCES `tbl_store_categories` (`store_categories_id`);

--
-- Constraints for table `tbl_verify`
--
ALTER TABLE `tbl_verify`
  ADD CONSTRAINT `tbl_verify_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `db_showcase3`.`tbl_user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
