-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 18, 2024 at 03:44 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toolventory`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) DEFAULT NULL,
  `id_jenisbarang` int(11) DEFAULT NULL,
  `id_lokasi` int(11) DEFAULT NULL,
  `stok` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `id_jenisbarang`, `id_lokasi`, `stok`) VALUES
('BRG001', 'Meteran', 1, 1, 32),
('BRG002', 'Mistar', 1, 1, 15),
('BRG003', 'Busur Derajat', 1, 1, 15),
('BRG004', 'Gergaji', 2, 2, 43),
('BRG005', 'Pemotong Pipa ', 2, 2, 24),
('BRG006', 'Pemotong Logam', 2, 2, 30),
('BRG007', 'Bor Listrik', 3, 1, 15),
('BRG008', 'Kunci Inggris', 4, 2, 44),
('BRG009', 'Kunci Pipa', 4, 2, 55),
('BRG010', 'Gerinda', 5, 1, 18),
('BRG011', 'Palu', 6, 2, 42),
('BRG012', 'Tang', 7, 1, 27);

-- --------------------------------------------------------

--
-- Table structure for table `barang_keluar`
--

CREATE TABLE `barang_keluar` (
  `id_keluar` int(11) NOT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_keluar`
--

INSERT INTO `barang_keluar` (`id_keluar`, `id_barang`, `jumlah_barang`) VALUES
(1, 'BRG001', 54),
(2, 'BRG002', 21),
(3, 'BRG003', 27),
(4, 'BRG004', 35),
(5, 'BRG005', 66),
(6, 'BRG006', 50),
(7, 'BRG007', 36),
(8, 'BRG008', 31),
(9, 'BRG009', 32),
(10, 'BRG010', 16),
(11, 'BRG011', 47),
(12, 'BRG012', 59);

--
-- Triggers `barang_keluar`
--
DELIMITER $$
CREATE TRIGGER `update_stock_after_insert_out` AFTER INSERT ON `barang_keluar` FOR EACH ROW BEGIN
    UPDATE barang
    SET stok = stok - NEW.jumlah_barang
    WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang_masuk`
--

CREATE TABLE `barang_masuk` (
  `id_masuk` int(11) NOT NULL,
  `id_barang` varchar(10) DEFAULT NULL,
  `jumlah_barang` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang_masuk`
--

INSERT INTO `barang_masuk` (`id_masuk`, `id_barang`, `jumlah_barang`) VALUES
(1, 'BRG001', 86),
(2, 'BRG002', 36),
(3, 'BRG003', 42),
(4, 'BRG004', 78),
(5, 'BRG005', 90),
(6, 'BRG006', 80),
(7, 'BRG007', 51),
(8, 'BRG008', 75),
(9, 'BRG009', 87),
(10, 'BRG010', 34),
(11, 'BRG011', 89),
(12, 'BRG012', 86);

--
-- Triggers `barang_masuk`
--
DELIMITER $$
CREATE TRIGGER `update_stock_after_insert_in` AFTER INSERT ON `barang_masuk` FOR EACH ROW BEGIN
	UPDATE barang
    SET stok = stok + NEW.jumlah_barang
    WHERE id_barang = NEW.id_barang;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_barang`
--

CREATE TABLE `jenis_barang` (
  `id_jenisbarang` int(11) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jenis_barang`
--

INSERT INTO `jenis_barang` (`id_jenisbarang`, `jenis`) VALUES
(1, 'Alat Ukur'),
(2, 'Alat Potong'),
(3, 'Alat Bor'),
(4, 'Alat Kunci'),
(5, 'Alat Pengikir'),
(6, 'Alat Pemukul'),
(7, 'Alat Penjepit');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi_penyimpanan`
--

CREATE TABLE `lokasi_penyimpanan` (
  `id_lokasi` int(11) NOT NULL,
  `nama_lokasi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `lokasi_penyimpanan`
--

INSERT INTO `lokasi_penyimpanan` (`id_lokasi`, `nama_lokasi`) VALUES
(1, 'Ruang 101'),
(2, 'Ruang 102');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`username`, `password`) VALUES
('adminganteng', 'admin123'),
('', ''),
('manajerganteng', 'manajer123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`),
  ADD KEY `id_jenisbarang` (`id_jenisbarang`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD PRIMARY KEY (`id_keluar`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD PRIMARY KEY (`id_masuk`),
  ADD KEY `id_barang` (`id_barang`);

--
-- Indexes for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  ADD PRIMARY KEY (`id_jenisbarang`);

--
-- Indexes for table `lokasi_penyimpanan`
--
ALTER TABLE `lokasi_penyimpanan`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  MODIFY `id_keluar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  MODIFY `id_masuk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `jenis_barang`
--
ALTER TABLE `jenis_barang`
  MODIFY `id_jenisbarang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `lokasi_penyimpanan`
--
ALTER TABLE `lokasi_penyimpanan`
  MODIFY `id_lokasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`id_jenisbarang`) REFERENCES `jenis_barang` (`id_jenisbarang`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi_penyimpanan` (`id_lokasi`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `barang_keluar`
--
ALTER TABLE `barang_keluar`
  ADD CONSTRAINT `barang_keluar_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);

--
-- Constraints for table `barang_masuk`
--
ALTER TABLE `barang_masuk`
  ADD CONSTRAINT `barang_masuk_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
