-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 31, 2019 at 07:10 AM
-- Server version: 10.3.16-MariaDB
-- PHP Version: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `datama2_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `emp_lname` varchar(50) NOT NULL,
  `emp_mi` varchar(5) DEFAULT NULL,
  `emp_fname` varchar(50) NOT NULL,
  `emp_cont` varchar(50) NOT NULL,
  `emp_add` varchar(50) NOT NULL,
  `emp_eadd` varchar(50) NOT NULL,
  `team_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `emp_lname`, `emp_mi`, `emp_fname`, `emp_cont`, `emp_add`, `emp_eadd`, `team_name`) VALUES
(1, 'Meanwell', 'Y', 'Isidore', '09175226480', '040 Crownhardt Avenue', 'imeanwell0@eepurl.com', 'Layo'),
(2, 'Menelaws', 'Y', 'Selig', '09166018837', '59558 Continental Court', 'smenelaws1@oracle.com', 'Ntags'),
(3, 'Blodgett', 'N', 'Susannah', '09166018837', '2 Vahlen Terrace', 'sblodgett2@wiley.com', 'Yodo'),
(4, 'Clampton', 'U', 'Nicholle', '09175226480', '09633 Hooker Pass', 'nclampton3@uol.com.br', 'Ozu'),
(5, 'Franca', 'G', 'Dick', '09166018837', '187 Canary Court', 'dfranca4@last.fm', 'Voolia');

-- --------------------------------------------------------

--
-- Stand-in structure for view `employeetransactions`
-- (See below for the actual view)
--
CREATE TABLE `employeetransactions` (
`emp_lname` varchar(50)
,`team_name` varchar(50)
,`tran_type` varchar(6)
,`tran_date` date
);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_desc` varchar(50) NOT NULL,
  `order_pick_up` varchar(50) NOT NULL,
  `order_drop_off` varchar(50) NOT NULL,
  `order_is_complete` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_date`, `order_desc`, `order_pick_up`, `order_drop_off`, `order_is_complete`) VALUES
(1, '2016-01-17', 'relocation-paid', '66494 Rieder Court', '46701 Johnson Drive', 1),
(2, '2015-11-27', 'delivery-paid', '32 Nobel Plaza', '8792 Kenwood Way', 1),
(3, '2016-05-15', 'delivery-paid', '55 Westridge Pass', '7 Northview Plaza', 1),
(4, '2015-12-15', 'delivery-unpaid', '73932 Barby Avenue', '4759 Rutledge Avenue', 0),
(5, '2018-06-08', 'delivery-unpaid', '61127 Crest Line Hill', '03 Myrtle Way', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders_in_vehicle`
--

CREATE TABLE `orders_in_vehicle` (
  `id` int(11) NOT NULL,
  `veh_id` int(11) NOT NULL,
  `orders_id` int(11) NOT NULL,
  `veh_plate_num` varchar(50) NOT NULL,
  `order_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders_in_vehicle`
--

INSERT INTO `orders_in_vehicle` (`id`, `veh_id`, `orders_id`, `veh_plate_num`, `order_date`) VALUES
(1, 1, 1, 'XXQ-036', '2018-07-12'),
(2, 2, 2, 'XMG-441', '2019-05-22'),
(3, 3, 3, 'TZA-286', '2019-02-22'),
(4, 4, 4, 'KAW-964', '2017-07-05'),
(5, 5, 5, 'KGB-535', '2019-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int(11) NOT NULL,
  `team_name` varchar(50) NOT NULL,
  `team_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `team_name`, `team_type`) VALUES
(1, 'Layo', 'Product Management'),
(2, 'Quatz', 'Support'),
(3, 'Voomm', 'Legal'),
(4, 'Mybuzz', 'Training'),
(5, 'Ntags', 'Services');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(11) NOT NULL,
  `tran_type` varchar(6) DEFAULT NULL,
  `tran_date` date DEFAULT NULL,
  `cust_lname` varchar(50) DEFAULT NULL,
  `emp_lname` varchar(50) DEFAULT NULL,
  `order_type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `tran_type`, `tran_date`, `cust_lname`, `emp_lname`, `order_type`) VALUES
(1, 'cash', '2010-10-31', 'Menelaws', 'Clampton', 'relocation'),
(2, 'credit', '2013-02-25', 'Brislan', 'Padell', 'relocation'),
(3, 'debit', '2013-06-09', 'Stealey', 'Webermann', 'relocation'),
(4, 'cash', '2016-12-02', 'Cotte', 'Jewitt', 'delivery'),
(5, 'debit', '2019-07-09', 'Gorgler', 'Franca', 'delivery');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle`
--

CREATE TABLE `vehicle` (
  `id` int(11) NOT NULL,
  `veh_color` varchar(50) NOT NULL,
  `veh_brand` varchar(50) NOT NULL,
  `veh_plate_num` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `vehicle`
--

INSERT INTO `vehicle` (`id`, `veh_color`, `veh_brand`, `veh_plate_num`) VALUES
(1, 'Teal', 'Audi', 'XZU-486'),
(2, 'Khaki', 'Mercedes-Benz', 'RUS-000'),
(3, 'Fuscia', 'Honda', 'DCR-084'),
(4, 'Turquoise', 'Volkswagen', 'OYX-472'),
(5, 'Purple', 'Pontiac', 'NTP-195');

-- --------------------------------------------------------

--
-- Stand-in structure for view `vehicle_x_orders`
-- (See below for the actual view)
--
CREATE TABLE `vehicle_x_orders` (
`vehicle` varchar(50)
,`orders` date
);

-- --------------------------------------------------------

--
-- Structure for view `employeetransactions`
--
DROP TABLE IF EXISTS `employeetransactions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `employeetransactions`  AS  select `employee`.`emp_lname` AS `emp_lname`,`employee`.`team_name` AS `team_name`,`transactions`.`tran_type` AS `tran_type`,`transactions`.`tran_date` AS `tran_date` from (`employee` join `transactions`) where `employee`.`emp_lname` = `transactions`.`emp_lname` ;

-- --------------------------------------------------------

--
-- Structure for view `vehicle_x_orders`
--
DROP TABLE IF EXISTS `vehicle_x_orders`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vehicle_x_orders`  AS  select `vehicle`.`veh_plate_num` AS `vehicle`,`orders`.`order_date` AS `orders` from ((`vehicle` join `orders`) join `orders_in_vehicle`) where `vehicle`.`id` = `orders_in_vehicle`.`veh_id` and `orders`.`id` = `orders_in_vehicle`.`orders_id` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `team_name` (`team_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_in_vehicle`
--
ALTER TABLE `orders_in_vehicle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vehicle`
--
ALTER TABLE `vehicle`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders_in_vehicle`
--
ALTER TABLE `orders_in_vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `vehicle`
--
ALTER TABLE `vehicle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
