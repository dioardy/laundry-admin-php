-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 27, 2020 at 08:55 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(12) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@toguide.com', 'root');

-- --------------------------------------------------------

--
-- Table structure for table `layanan`
--

CREATE TABLE `layanan` (
  `id_service` int(12) NOT NULL,
  `name_service` varchar(30) NOT NULL,
  `price_service` int(11) NOT NULL,
  `type_service` enum('kiloan','satuan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `layanan`
--

INSERT INTO `layanan` (`id_service`, `name_service`, `price_service`, `type_service`) VALUES
(1, 'Reguler', 6000, 'kiloan'),
(2, 'Express', 8000, 'kiloan'),
(3, 'Selimut', 12000, 'satuan'),
(4, 'Karpet', 20000, 'satuan'),
(5, 'Boneka', 15000, 'satuan'),
(6, 'Jaket', 20000, 'satuan');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_cust` int(12) NOT NULL,
  `name_cust` varchar(50) NOT NULL,
  `phone_cust` varchar(20) NOT NULL,
  `address_cust` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_cust`, `name_cust`, `phone_cust`, `address_cust`) VALUES
(1, 'Faiq Ardyanto', '082297000555', 'Griya Bandung Asri 1, Bandung'),
(2, 'Ignatius Euynicho', '081380924752', 'Griya Indonesia, Medan'),
(3, 'Dafa Putro', '081746384732', 'Griya Mekar, Aceh'),
(4, 'Aurellius Siregar', '085284729182', 'Griya Griya Griya, Balikpapan'),
(5, 'Steven Eric', '089573263312', 'Griya Besar, Riau');

-- --------------------------------------------------------

--
-- Table structure for table `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id_outcome` int(12) NOT NULL,
  `type_outcome` varchar(20) NOT NULL,
  `date_outcome` date NOT NULL,
  `total_outcome` int(11) NOT NULL,
  `desc_outcome` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengeluaran`
--

INSERT INTO `pengeluaran` (`id_outcome`, `type_outcome`, `date_outcome`, `total_outcome`, `desc_outcome`) VALUES
(1, 'Listrik', '2020-05-18', 200000, NULL),
(2, 'Deterjen', '2020-05-18', 400000, NULL),
(3, 'Gaji Karyawan', '2020-05-18', 900000, NULL),
(4, 'Pembelian Procuremen', '2020-05-27', 500000, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `id_order` int(12) NOT NULL,
  `invoice_order` varchar(20) NOT NULL,
  `qty_order` int(11) NOT NULL,
  `total_order` int(11) NOT NULL,
  `date_order` date NOT NULL,
  `status_order` enum('pending','pencucian','selesai') NOT NULL DEFAULT 'pending',
  `pay_order` enum('belum','sudah') NOT NULL DEFAULT 'belum',
  `desc_order` varchar(20) NOT NULL,
  `id_cust` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`id_order`, `invoice_order`, `qty_order`, `total_order`, `date_order`, `status_order`, `pay_order`, `desc_order`, `id_cust`) VALUES
(1, 'E180520201', 4, 24000, '2020-05-18', 'pencucian', 'belum', 'Reguler', 1),
(2, 'E180520202', 2, 40000, '2020-05-18', 'selesai', 'sudah', 'Karpet', 3),
(3, 'E180520203', 1, 15000, '2020-05-18', 'pending', 'belum', 'Boneka', 4),
(4, 'E180520204', 1, 8000, '2020-05-18', 'selesai', 'sudah', 'Express', 2),
(5, 'E180520205', 1, 12000, '2020-05-18', 'pencucian', 'sudah', 'Selimut', 1),
(6, 'E270520201', 2, 40000, '2020-05-27', 'pending', 'sudah', 'Karpet', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `layanan`
--
ALTER TABLE `layanan`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_cust`);

--
-- Indexes for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id_outcome`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_cust` (`id_cust`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `layanan`
--
ALTER TABLE `layanan`
  MODIFY `id_service` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_cust` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id_outcome` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id_order` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
