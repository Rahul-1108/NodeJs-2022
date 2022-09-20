-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 28, 2022 at 09:52 AM
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
-- Database: `db_showcase3`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cuisine`
--

CREATE TABLE `tbl_cuisine` (
  `cuisine_id` bigint(20) NOT NULL,
  `quesing_name` varchar(50) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_cuisine`
--

INSERT INTO `tbl_cuisine` (`cuisine_id`, `quesing_name`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Punjabi', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 'Gujrati', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 'Rajasthani', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 'Italian', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(5, 'Chinese', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(6, 'Drinks', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_dish`
--

CREATE TABLE `tbl_dish` (
  `dish_id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `cuisine_id` bigint(20) NOT NULL,
  `image` varchar(256) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `about` text NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_dish`
--

INSERT INTO `tbl_dish` (`dish_id`, `restaurant_id`, `cuisine_id`, `image`, `name`, `price`, `about`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 0, '1.png', 'Punjabi', '200.00', 'Delicious', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 2, 0, '2.png', 'Gujarati', '300.00', 'Delicious', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 3, 0, '3.png', 'Chinese', '400.00', 'Delicious', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 4, 0, '4.png', 'Italian', '500.00', 'Delicious', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(5, 5, 0, '5.png', 'Drinks', '100.00', 'Amazing', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order`
--

CREATE TABLE `tbl_order` (
  `order_id` bigint(20) NOT NULL,
  `order_no` int(11) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `dish_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `service_charge` double(8,2) NOT NULL,
  `total` int(11) NOT NULL,
  `discount_amount` int(11) NOT NULL,
  `grand_total` double(16,2) NOT NULL,
  `status` enum('Pending','Prepared','Out for deliver','Cancelled') NOT NULL,
  `promocode` varchar(32) NOT NULL,
  `payment_method` enum('Cash','Online') NOT NULL,
  `transaction_Id` varchar(256) NOT NULL,
  `rating` float(5,1) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order`
--

INSERT INTO `tbl_order` (`order_id`, `order_no`, `restaurant_id`, `dish_id`, `user_id`, `quantity`, `sub_total`, `service_charge`, `total`, `discount_amount`, `grand_total`, `status`, `promocode`, `payment_method`, `transaction_Id`, `rating`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 123456, 1, 1, 1, 2, 250.00, 50.00, 300, 50, 250.00, 'Prepared', 'AZXSDSG212521', 'Online', 'AHBAHKJHA256', 10.1, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 126565, 2, 2, 2, 4, 250.00, 100.00, 350, 50, 300.00, 'Pending', 'AZXSDSG2265645', 'Cash', 'AHBAHKJHA251', 9.1, 1, '2022-07-01 00:00:00', '2022-07-28 11:12:17'),
(3, 856555, 3, 3, 3, 2, 300.00, 150.00, 450, 50, 400.00, 'Pending', 'AZXSDSG2265645', 'Online', 'AHBAHKJHA25', 8.0, 1, '2022-07-01 00:00:00', '2022-07-28 11:12:17'),
(4, 896325, 4, 4, 4, 6, 300.00, 200.00, 500, 50, 450.00, 'Cancelled', 'AZXSDSG2265645', 'Cash', 'AHBAHKJHA25', 0.0, 1, '2022-07-01 00:00:00', '2022-07-28 11:17:38'),
(5, 896322, 5, 5, 5, 6, 600.00, 300.00, 900, 50, 850.00, 'Out for deliver', 'AZXSDSG2265645', 'Online', 'AHBAHKJHA2698', 10.0, 1, '2022-07-01 00:00:00', '2022-07-28 11:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_order_details`
--

CREATE TABLE `tbl_order_details` (
  `order_details_id` bigint(20) NOT NULL,
  `dish_id` bigint(20) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double(16,2) NOT NULL,
  `sub_total` double(16,2) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_order_details`
--

INSERT INTO `tbl_order_details` (`order_details_id`, `dish_id`, `quantity`, `price`, `sub_total`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 500.00, 500.00, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 2, 11, 800.00, 800.00, '2022-07-01 00:00:00', '2022-07-28 11:31:24'),
(3, 3, 12, 700.00, 700.00, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 4, 10, 600.00, 600.00, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(5, 5, 5, 500.00, 500.00, '2022-07-01 00:00:00', '2022-07-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_phone_verification`
--

CREATE TABLE `tbl_phone_verification` (
  `phone_verification_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `otp` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_phone_verification`
--

INSERT INTO `tbl_phone_verification` (`phone_verification_id`, `user_id`, `otp`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 2566, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 2, 2500, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 3, 3000, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(4, 4, 5000, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(5, 5, 8989, 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_restaurant_details`
--

CREATE TABLE `tbl_restaurant_details` (
  `restaurent_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(256) NOT NULL,
  `image` varchar(256) NOT NULL,
  `avg_rating` float(10,2) NOT NULL,
  `total_review` int(11) NOT NULL,
  `about` text NOT NULL,
  `latitude` varchar(256) NOT NULL,
  `longitude` varchar(256) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_restaurant_details`
--

INSERT INTO `tbl_restaurant_details` (`restaurent_id`, `name`, `location`, `image`, `avg_rating`, `total_review`, `about`, `latitude`, `longitude`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'khanakhalo', 'Ahmedabad', '1.png', 10.50, 10, 'Number One restaurent', '90 to 90', '-180 to 180', 1, '2022-06-06 00:00:00', '2022-07-06 00:00:00'),
(2, 'Bhukhlagi', 'Vadodra', '2.png', 10.10, 11, 'Number two restaurent', '91 to 92', '-183 to 184', 1, '2022-06-06 00:00:00', '2022-07-06 00:00:00'),
(3, 'Rotikhalo', 'Surat', '3.png', 10.20, 16, 'Number Three restaurent', '65 to 32', '-150 to 164', 1, '2022-06-06 00:00:00', '2022-07-06 00:00:00'),
(4, 'Vaibhav Restaurant', 'Ahmedabad', '4.png', 10.90, 50, 'Number Four restaurent', '1356464N4656', '-150 to 16123245S', 1, '2022-06-06 00:00:00', '2022-07-06 00:00:00'),
(5, 'ShivSakti Restaurant', 'bhuj', '5.png', 10.10, 60, 'Number Five restaurent', '1356464E4656', '-150 to 1612W3245S', 1, '2022-06-06 00:00:00', '2022-07-06 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_review`
--

CREATE TABLE `tbl_review` (
  `review_id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_review`
--

INSERT INTO `tbl_review` (`review_id`, `restaurant_id`, `user_id`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(2, 3, 5, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(3, 5, 3, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(4, 2, 4, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(5, 1, 1, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(6, 5, 5, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(7, 4, 4, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(8, 3, 3, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(9, 2, 2, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00'),
(10, 1, 1, 1, '2022-03-22 00:00:00', '2022-04-23 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_time`
--

CREATE TABLE `tbl_time` (
  `timing_id` bigint(20) NOT NULL,
  `restaurant_id` bigint(20) NOT NULL,
  `opning_time` datetime NOT NULL DEFAULT current_timestamp(),
  `closing_time` datetime NOT NULL DEFAULT current_timestamp(),
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_time`
--

INSERT INTO `tbl_time` (`timing_id`, `restaurant_id`, `opning_time`, `closing_time`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '2022-07-01 10:00:00', '2022-07-01 08:00:00', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(2, 2, '2022-07-01 10:00:00', '2022-07-01 08:00:00', 1, '2022-07-01 00:00:00', '2022-07-01 00:00:00'),
(3, 3, '2022-07-01 10:00:00', '2022-07-01 08:00:00', 1, '2022-07-01 00:00:00', '2022-07-28 10:25:35'),
(4, 4, '2022-07-01 10:00:00', '2022-07-01 08:00:00', 1, '2022-07-01 00:00:00', '2022-07-28 10:25:35'),
(5, 5, '2022-07-01 10:00:00', '2022-07-01 08:00:00', 1, '2022-07-01 00:00:00', '2022-07-28 10:25:35');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user`
--

CREATE TABLE `tbl_user` (
  `user_id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `mobile_no` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` enum('User') NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_user`
--

INSERT INTO `tbl_user` (`user_id`, `name`, `email`, `mobile_no`, `password`, `role`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Chintan', 'Chintan@gmail.com', '8141966232', 'Chintan123', 'User', 1, '2022-06-24 18:30:00', '2022-07-24 18:30:00'),
(2, 'Priyank', 'Priyank@gmail.com', '8141966231', 'Priyank123', 'User', 1, '2022-06-24 18:30:00', '2022-07-24 18:30:00'),
(3, 'Mayank', 'Mayank@gmail.com', '8141966230', 'Mayank123', 'User', 0, '2022-06-24 18:30:00', '2022-07-24 18:30:00'),
(4, 'Vijay', 'Vijay@gmail.com', '8141966239', 'Vijay123', 'User', 1, '2022-06-24 18:30:00', '2022-07-24 18:30:00'),
(5, 'Kishan', 'Kishan@gmail.com', '8141966234', 'Kishan123', 'User', 1, '2022-06-24 18:30:00', '2022-07-24 18:30:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cuisine`
--
ALTER TABLE `tbl_cuisine`
  ADD PRIMARY KEY (`cuisine_id`);

--
-- Indexes for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  ADD PRIMARY KEY (`dish_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `dish_id` (`dish_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `dish_id` (`dish_id`);

--
-- Indexes for table `tbl_phone_verification`
--
ALTER TABLE `tbl_phone_verification`
  ADD PRIMARY KEY (`phone_verification_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_restaurant_details`
--
ALTER TABLE `tbl_restaurant_details`
  ADD PRIMARY KEY (`restaurent_id`);

--
-- Indexes for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `restaurant_id` (`restaurant_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbl_time`
--
ALTER TABLE `tbl_time`
  ADD PRIMARY KEY (`timing_id`),
  ADD KEY `restaurant_id` (`restaurant_id`);

--
-- Indexes for table `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cuisine`
--
ALTER TABLE `tbl_cuisine`
  MODIFY `cuisine_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  MODIFY `dish_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order`
--
ALTER TABLE `tbl_order`
  MODIFY `order_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  MODIFY `order_details_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_phone_verification`
--
ALTER TABLE `tbl_phone_verification`
  MODIFY `phone_verification_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_restaurant_details`
--
ALTER TABLE `tbl_restaurant_details`
  MODIFY `restaurent_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_review`
--
ALTER TABLE `tbl_review`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_time`
--
ALTER TABLE `tbl_time`
  MODIFY `timing_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_dish`
--
ALTER TABLE `tbl_dish`
  ADD CONSTRAINT `tbl_dish_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant_details` (`restaurent_id`);

--
-- Constraints for table `tbl_order`
--
ALTER TABLE `tbl_order`
  ADD CONSTRAINT `tbl_order_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant_details` (`restaurent_id`),
  ADD CONSTRAINT `tbl_order_ibfk_2` FOREIGN KEY (`dish_id`) REFERENCES `tbl_dish` (`dish_id`),
  ADD CONSTRAINT `tbl_order_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_order_details`
--
ALTER TABLE `tbl_order_details`
  ADD CONSTRAINT `tbl_order_details_ibfk_1` FOREIGN KEY (`dish_id`) REFERENCES `tbl_dish` (`dish_id`);

--
-- Constraints for table `tbl_phone_verification`
--
ALTER TABLE `tbl_phone_verification`
  ADD CONSTRAINT `tbl_phone_verification_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_review`
--
ALTER TABLE `tbl_review`
  ADD CONSTRAINT `tbl_review_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant_details` (`restaurent_id`),
  ADD CONSTRAINT `tbl_review_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`);

--
-- Constraints for table `tbl_time`
--
ALTER TABLE `tbl_time`
  ADD CONSTRAINT `tbl_time_ibfk_1` FOREIGN KEY (`restaurant_id`) REFERENCES `tbl_restaurant_details` (`restaurent_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
