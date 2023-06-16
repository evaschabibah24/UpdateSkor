-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 16, 2023 at 09:04 AM
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
-- Database: `itsklasemen`
--

-- --------------------------------------------------------

--
-- Table structure for table `pertandingan`
--

CREATE TABLE `pertandingan` (
  `id` int(12) NOT NULL,
  `peserta_1` varchar(255) NOT NULL,
  `peserta_2` varchar(255) NOT NULL,
  `skor_peserta_1` int(12) NOT NULL,
  `skor_peserta_2` int(12) NOT NULL,
  `meja` varchar(255) NOT NULL,
  `jam` varchar(12) NOT NULL,
  `grup` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pertandingan`
--

INSERT INTO `pertandingan` (`id`, `peserta_1`, `peserta_2`, `skor_peserta_1`, `skor_peserta_2`, `meja`, `jam`, `grup`) VALUES
(1, 'Abdillah Rizki', 'Dzulfikar Fahmi', 3, 2, '2', '12:30', 'A'),
(2, 'Dzulfikar Fahmi', 'Yoga Kusuma', 3, 1, '10', '14:30', 'A'),
(3, 'Yoga Kusuma', 'Abdillah Rizki', 2, 3, '3', '16:00', 'A'),
(4, 'Yoga Kusuma', 'Mukhlis Rifqy', 2, 1, '4', '18:30', 'A'),
(5, 'Abdillah Rizki', 'Mukhlis Rifqy', 3, 2, '5', '20:00', 'A'),
(6, 'Atika Rahma', 'Abid Hammam', 1, 2, '10', '13:00', 'B'),
(7, 'Abid Hammam', 'Dwi Fajar', 2, 1, '2', '15:30', 'B'),
(8, 'Atika Rahma', 'Dwi Fajar', 3, 2, '3', '17:00', 'B'),
(9, 'Muhammad Fathoni', 'Abid Hammam', 4, 1, '4', '19:30', 'B'),
(10, 'Muhammad Fathoni', 'Dwi Fajar', 2, 3, '5', '21:00', 'B'),
(11, 'Andika Alif', 'Alfath Thoriq', 2, 3, '1', '13:30', 'C'),
(12, 'Hazmi Auzan', 'Farista Dhika', 1, 4, '2', '15:30', 'C'),
(13, 'Alfath Thoriq', 'Hazmi Auzan', 3, 2, '3', '17:30', 'C'),
(14, 'Farista Dhika', 'Andika Alif', 1, 2, '4', '19:30', 'C'),
(15, 'Hazmi Auzan', 'Farista Dhika', 4, 3, '5', '21:30', 'C'),
(16, 'Abdul Main', 'Sammuel Rizal', 3, 1, '1', '14:00', 'D'),
(17, 'Abdul Main', 'Karina Suwanto', 4, 2, '2', '16:00', 'D'),
(18, 'Sammuel Rizal', 'Ahmad Soleh', 2, 3, '3', '18:00', 'D'),
(19, 'Karina Suwanto', 'Abdul Main', 1, 4, '4', '20:00', 'D'),
(20, 'Sammuel Rizal', 'Karina Suwanto', 3, 2, '5', '22:00', 'D');

-- --------------------------------------------------------

--
-- Table structure for table `peserta`
--

CREATE TABLE `peserta` (
  `id` int(12) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `grup` varchar(32) NOT NULL,
  `menang` int(12) NOT NULL,
  `kalah` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `peserta`
--

INSERT INTO `peserta` (`id`, `nama`, `grup`, `menang`, `kalah`) VALUES
(1, 'Abdillah Rizki', 'A', 2, 2),
(2, 'Dzulfikar Fahmi', 'A', 5, 2),
(3, 'Yoga Kusuma', 'A', 1, 4),
(4, 'Mukhlis Rifqy', 'A', 2, 3),
(5, 'Atika Rahma', 'B', 1, 2),
(6, 'Muhammad Fathoni', 'B', 3, 1),
(7, 'Abid Hammam', 'B', 2, 2),
(8, 'Dwi Fajar', 'B', 4, 1),
(9, 'Hazmi Auzan', 'C', 2, 3),
(10, 'Alfath Thoriq', 'C', 1, 4),
(11, 'Andika Alif', 'C', 3, 2),
(12, 'Farista Dhika', 'C', 4, 1),
(13, 'Ahmad Soleh', 'D', 3, 1),
(14, 'Abdul Main', 'D', 4, 2),
(15, 'Karina Suwanto', 'D', 2, 4),
(16, 'Sammuel Rizal', 'D', 1, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pertandingan`
--
ALTER TABLE `pertandingan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `peserta`
--
ALTER TABLE `peserta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pertandingan`
--
ALTER TABLE `pertandingan`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `peserta`
--
ALTER TABLE `peserta`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
