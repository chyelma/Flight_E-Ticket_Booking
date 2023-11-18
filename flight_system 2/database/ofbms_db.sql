-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2022 at 04:12 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ofbms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_uname` varchar(20) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_pwd` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_uname`, `admin_email`, `admin_pwd`) VALUES
(1, 'admin', 'admin@mail.com', '$2y$10$AFMhdlwEaWjjBzoCfdq62uNQqopNGW4vk8GXrDBNGKPAgB0mON0TC');

-- --------------------------------------------------------

--
-- Table structure for table `airline`
--

CREATE TABLE `airline` (
  `airline_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `seats` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airline`
--

INSERT INTO `airline` (`airline_id`, `name`, `seats`) VALUES
(1, 'US Bangla', 200),
(2, 'Biman Bangla Airlines', 350),
(3, 'Regent Airways', 180),
(4, 'Emirates', 300);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `city` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`city`) VALUES
('Dhaka'),
('Barisal'),
('Sylhet'),
('Khulna'),
('Jessore'),
('Calcutta'),
('New Delhi'),
('Mumbai'),
('New York'),
('Washington DC'),
('Paro'),
('Goa'),
('Kuala Lampur'),
('Chittagong'),
('Toronto');

-- --------------------------------------------------------

--
-- Table structure for table `feedback`
--

CREATE TABLE `feedback` (
  `feed_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `q1` varchar(250) NOT NULL,
  `q2` varchar(20) NOT NULL,
  `q3` varchar(250) NOT NULL,
  `rate` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

CREATE TABLE `flight` (
  `flight_id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `arrivale` datetime NOT NULL,
  `departure` datetime NOT NULL,
  `Destination` varchar(20) NOT NULL,
  `source` varchar(20) NOT NULL,
  `airline` varchar(50) NOT NULL,
  `Seats` varchar(110) NOT NULL,
  `duration` varchar(20) NOT NULL,
  `Price` int(11) NOT NULL,
  `status` varchar(6) DEFAULT NULL,
  `issue` varchar(50) DEFAULT NULL,
  `last_seat` varchar(5) DEFAULT '',
  `bus_seats` int(11) DEFAULT 20,
  `last_bus_seat` varchar(5) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `admin_id`, `arrivale`, `departure`, `Destination`, `source`, `airline`, `Seats`, `duration`, `Price`, `status`, `issue`, `last_seat`, `bus_seats`, `last_bus_seat`) VALUES
(1, 1, '2022-11-22 07:00:00', '2022-11-22 06:00:00', 'Dhaka', 'Chittagong', 'Emirates', '350', '1 Hour', 4500, '', '', '', 20, ''),
(2, 1, '2022-11-22 08:30:00', '2022-11-22 07:30:00', 'Dhaka', 'Chittagong', 'Biman Bangladesh Airlines', '171', '1 Hour', 3500, '', '', '22C', 20, ''),
(3, 1, '2022-11-21 16:00:00', '2022-11-21 15:00:00', 'Chittagong', 'Barisal', 'Regent Airways', '350', '1 Hour', 4800, '', 'solved', '', 20, ''),
(4, 1, '2022-11-21 15:30:00', '2022-11-21 14:30:00', 'Sylhet', 'Barisal', 'Emirates', '195', '1 Hour', 3800, 'arr', '', '21E', 20, ''),
(5, 1, '2022-11-21 17:00:00', '2022-11-21 16:00:00', 'Barisal', 'Sylhet', 'US Bangla', '192', '1 Hour', 2500, 'issue', '60', '22B', 20, ''),
(7, 1, '2022-11-22 19:00:00', '2022-11-22 18:00:00', 'Sylhet', 'Khulna', 'US Bangla', '350', '1 Hour', 3800, '', '', '', 20, '');

-- --------------------------------------------------------

--
-- Table structure for table `passenger_profile`
--

CREATE TABLE `passenger_profile` (
  `passenger_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `mobile` varchar(110) NOT NULL,
  `dob` datetime NOT NULL,
  `f_name` varchar(20) DEFAULT NULL,
  `m_name` varchar(20) DEFAULT NULL,
  `l_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger_profile`
--

INSERT INTO `passenger_profile` (`passenger_id`, `user_id`, `flight_id`, `mobile`, `dob`, `f_name`, `m_name`, `l_name`) VALUES
(1, 5, 5, '9123564789', '1997-06-23 00:00:00', 'Mark', 'D', 'Cooper'),
(2, 5, 2, '9123654789', '1997-06-23 00:00:00', 'Mark', 'D', 'Cooper'),
(4, 5, 2, '9123564879', '1997-10-14 00:00:00', 'Jane ', 'C', 'Cooper'),
(5, 5, 2, '9654123897', '1990-07-15 00:00:00', 'Mike', 'C', 'Williams');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `card_no` varchar(16) NOT NULL,
  `user_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `expire_date` varchar(5) DEFAULT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`card_no`, `user_id`, `flight_id`, `expire_date`, `amount`) VALUES
('1234321211112222', 5, 5, '06/27', 2500),
('1234654456455', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('4616182753905953', 5, 2, '06/27', 3500),
('111112333311', 5, 2, '01/25', 3500);

-- --------------------------------------------------------

--
-- Table structure for table `pwdreset`
--

CREATE TABLE `pwdreset` (
  `pwd_reset_id` int(11) NOT NULL,
  `pwd_reset_email` varchar(50) NOT NULL,
  `pwd_reset_selector` varchar(80) NOT NULL,
  `pwd_reset_token` varchar(120) NOT NULL,
  `pwd_reset_expires` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `ticket_id` int(11) NOT NULL,
  `passenger_id` int(11) NOT NULL,
  `flight_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `seat_no` varchar(10) NOT NULL,
  `cost` int(11) NOT NULL,
  `class` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`ticket_id`, `passenger_id`, `flight_id`, `user_id`, `seat_no`, `cost`, `class`) VALUES
(1, 1, 5, 5, '22A', 2500, 'E'),
(3, 1, 2, 5, '21A', 3500, 'E'),
(9, 3, 2, 5, '22B', 3500, 'E'),
(10, 5, 2, 5, '22C', 3500, 'E');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`) VALUES
(1, 'Jisa', 'jisa@mail.com', '1111'),
(2, 'Elma', 'elma@mail.com', '2222'),
(4, 'Radia', 'radia@mail.com', '3333'),
(5, 'Nushaiba', 'nush@mail.com', '4444'),
(6, 'Sajid', 'sajid@gmail.com', '$2y$10$UqMGnIqka1PU6sC7PtlG0.5bgqloYoAg5oCl9hOxG.nVMsdGk0vEe'),
(7, 'Jabir', 'jabir@gmail.com', '$2y$10$J.89p4.U28GydVBWR5VP2etz4026Nxkiwxr8mUa6phoIUnqErj/D.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `airline`
--
ALTER TABLE `airline`
  ADD PRIMARY KEY (`airline_id`);

--
-- Indexes for table `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feed_id`);

--
-- Indexes for table `flight`
--
ALTER TABLE `flight`
  ADD PRIMARY KEY (`flight_id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD PRIMARY KEY (`passenger_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`);

--
-- Indexes for table `pwdreset`
--
ALTER TABLE `pwdreset`
  ADD PRIMARY KEY (`pwd_reset_id`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `flight_id` (`flight_id`),
  ADD KEY `passenger_id` (`passenger_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `airline`
--
ALTER TABLE `airline`
  MODIFY `airline_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feed_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `flight`
--
ALTER TABLE `flight`
  MODIFY `flight_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  MODIFY `passenger_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pwdreset`
--
ALTER TABLE `pwdreset`
  MODIFY `pwd_reset_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`admin_id`);

--
-- Constraints for table `passenger_profile`
--
ALTER TABLE `passenger_profile`
  ADD CONSTRAINT `passenger_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `passenger_profile_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
