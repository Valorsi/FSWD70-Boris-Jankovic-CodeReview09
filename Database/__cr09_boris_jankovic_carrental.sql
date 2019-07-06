-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2019 at 09:23 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.1.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `  cr09_boris_jankovic_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `street_name` varchar(35) DEFAULT NULL,
  `house_nr` int(11) DEFAULT NULL,
  `zip` varchar(8) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `door_nr` varchar(10) DEFAULT NULL,
  `address_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`street_name`, `house_nr`, `zip`, `city`, `country`, `door_nr`, `address_id`) VALUES
('Lange Gasse', 22, '1080', 'Vienna', 'Austria', '24', 1),
('Beckmanngasse', 33, '1150', 'Vienna', 'Austria', '12', 2),
('Johnstrasse', 7, '1150', 'Vienna', 'Austria', '11', 3),
('Alserstrasse', 88, '1080', 'Vienna', 'Austria', '16', 4);

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_from` date DEFAULT NULL,
  `booking_to` date DEFAULT NULL,
  `fk_customer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_from`, `booking_to`, `fk_customer`) VALUES
(1, '2019-01-02', '2019-04-05', 1),
(2, '2019-07-01', '2019-07-05', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(11) NOT NULL,
  `manufacturer` varchar(30) DEFAULT NULL,
  `model` varchar(40) DEFAULT NULL,
  `horsepower` int(11) DEFAULT NULL,
  `color` varchar(20) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `construction_year` date DEFAULT NULL,
  `seats` int(11) DEFAULT NULL,
  `fuel_type` varchar(20) DEFAULT NULL,
  `carrying_capacity` varchar(30) DEFAULT NULL,
  `availability` tinyint(1) DEFAULT NULL,
  `fk_insurance` int(11) DEFAULT NULL,
  `fk_booking` int(11) DEFAULT NULL,
  `fk_location` int(11) DEFAULT NULL,
  `fk_clean` int(11) DEFAULT NULL,
  `fk_service` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `manufacturer`, `model`, `horsepower`, `color`, `price`, `construction_year`, `seats`, `fuel_type`, `carrying_capacity`, `availability`, `fk_insurance`, `fk_booking`, `fk_location`, `fk_clean`, `fk_service`) VALUES
(1, 'BMW', '2er Cabrio', 252, 'Red', 150, '2013-01-01', 4, 'Benzin', '1910kg', 1, 3, 1, 1, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `clean`
--

CREATE TABLE `clean` (
  `clean_id` int(11) NOT NULL,
  `car_clean` tinyint(1) DEFAULT NULL,
  `car_clean_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clean`
--

INSERT INTO `clean` (`clean_id`, `car_clean`, `car_clean_date`) VALUES
(1, 1, '2019-07-06'),
(2, 0, '2019-07-05'),
(3, 1, '2019-07-04');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_store` int(11) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `phone_nr` varchar(14) DEFAULT NULL,
  `driver_license` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `fk_address`, `fk_store`, `first_name`, `last_name`, `email`, `phone_nr`, `driver_license`) VALUES
(1, 4, 1, 'First', 'Customer', 'here@comes.themoney', '0044182142', 1);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `first_name` varchar(30) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `fk_address`, `first_name`, `last_name`, `hire_date`) VALUES
(1, 3, 'Boris', 'Jankovic', '2019-05-05'),
(2, 3, 'Christina', 'Renieris', '2019-02-02');

-- --------------------------------------------------------

--
-- Table structure for table `insurance`
--

CREATE TABLE `insurance` (
  `insurance_id` int(11) NOT NULL,
  `insurance_type` varchar(20) DEFAULT NULL,
  `insurance_price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `insurance`
--

INSERT INTO `insurance` (`insurance_id`, `insurance_type`, `insurance_price`) VALUES
(1, 'basic', 50),
(2, 'advanced', 75),
(3, 'full', 100);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(11) NOT NULL,
  `fk_rental_store` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `fk_rental_store`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `manager`
--

CREATE TABLE `manager` (
  `manager_id` int(11) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `hire_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manager`
--

INSERT INTO `manager` (`manager_id`, `first_name`, `last_name`, `fk_address`, `hire_date`) VALUES
(1, 'Alex', 'Sirigos', 4, '2018-01-01'),
(2, 'Valentina', 'Panetta', 1, '2015-02-05');

-- --------------------------------------------------------

--
-- Table structure for table `rental_store`
--

CREATE TABLE `rental_store` (
  `store_id` int(11) NOT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_manager` int(11) DEFAULT NULL,
  `fk_employee` int(11) DEFAULT NULL,
  `phone_nr` varchar(14) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `fk_cars` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rental_store`
--

INSERT INTO `rental_store` (`store_id`, `fk_address`, `fk_manager`, `fk_employee`, `phone_nr`, `email`, `fk_cars`) VALUES
(1, 4, 2, 1, '06643978821', 'car@dummy.store', 1);

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `service_id` int(11) NOT NULL,
  `last_service` date DEFAULT NULL,
  `next_service` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`service_id`, `last_service`, `next_service`) VALUES
(1, '2018-06-07', '2019-06-07'),
(2, '2018-05-05', '2019-05-05'),
(3, '2018-11-10', '2019-11-10');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `fk_customer` (`fk_customer`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`),
  ADD KEY `fk_insurance` (`fk_insurance`),
  ADD KEY `fk_booking` (`fk_booking`),
  ADD KEY `fk_location` (`fk_location`),
  ADD KEY `fk_clean` (`fk_clean`),
  ADD KEY `fk_service` (`fk_service`);

--
-- Indexes for table `clean`
--
ALTER TABLE `clean`
  ADD PRIMARY KEY (`clean_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_store` (`fk_store`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `insurance`
--
ALTER TABLE `insurance`
  ADD PRIMARY KEY (`insurance_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `fk_rental_store` (`fk_rental_store`);

--
-- Indexes for table `manager`
--
ALTER TABLE `manager`
  ADD PRIMARY KEY (`manager_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `rental_store`
--
ALTER TABLE `rental_store`
  ADD PRIMARY KEY (`store_id`),
  ADD KEY `fk_address` (`fk_address`),
  ADD KEY `fk_manager` (`fk_manager`),
  ADD KEY `fk_employee` (`fk_employee`),
  ADD KEY `fk_cars` (`fk_cars`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`service_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`customer_id`);

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`fk_insurance`) REFERENCES `insurance` (`insurance_id`),
  ADD CONSTRAINT `cars_ibfk_2` FOREIGN KEY (`fk_booking`) REFERENCES `booking` (`booking_id`),
  ADD CONSTRAINT `cars_ibfk_3` FOREIGN KEY (`fk_location`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `cars_ibfk_4` FOREIGN KEY (`fk_clean`) REFERENCES `clean` (`clean_id`),
  ADD CONSTRAINT `cars_ibfk_5` FOREIGN KEY (`fk_service`) REFERENCES `service` (`service_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_store`) REFERENCES `rental_store` (`store_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `location`
--
ALTER TABLE `location`
  ADD CONSTRAINT `location_ibfk_1` FOREIGN KEY (`fk_rental_store`) REFERENCES `rental_store` (`store_id`);

--
-- Constraints for table `manager`
--
ALTER TABLE `manager`
  ADD CONSTRAINT `manager_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`);

--
-- Constraints for table `rental_store`
--
ALTER TABLE `rental_store`
  ADD CONSTRAINT `rental_store_ibfk_1` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`),
  ADD CONSTRAINT `rental_store_ibfk_2` FOREIGN KEY (`fk_manager`) REFERENCES `manager` (`manager_id`),
  ADD CONSTRAINT `rental_store_ibfk_3` FOREIGN KEY (`fk_employee`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `rental_store_ibfk_4` FOREIGN KEY (`fk_cars`) REFERENCES `cars` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
