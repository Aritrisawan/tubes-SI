-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2023 at 05:32 PM
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
-- Database: `tubes`
--

-- --------------------------------------------------------

--
-- Table structure for table `biaya produksi`
--

CREATE TABLE `biaya produksi` (
  `ID biaya` varchar(10) NOT NULL,
  `Nama Barang` varchar(20) NOT NULL,
  `Harga satuan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data bahan`
--

CREATE TABLE `data bahan` (
  `ID bahan` varchar(10) NOT NULL,
  `Bahan` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `data barang`
--

CREATE TABLE `data barang` (
  `ID barang` varchar(10) NOT NULL,
  `Nama Barang` char(10) NOT NULL,
  `Stok barang` int(11) NOT NULL,
  `Kategori` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gudang barang`
--

CREATE TABLE `gudang barang` (
  `ID barang` varchar(10) NOT NULL,
  `Nama barang` varchar(20) NOT NULL,
  `Barang Siap` int(11) NOT NULL,
  `Barang Proses` int(11) NOT NULL,
  `Nama bahan` varchar(10) NOT NULL,
  `Bahan tersedia` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `ID kategori` varchar(10) NOT NULL,
  `Kategori` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outlet`
--

CREATE TABLE `outlet` (
  `ID outlet` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `No hp` varchar(20) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Nama produk` varchar(20) NOT NULL,
  `Stock` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pegawai`
--

CREATE TABLE `pegawai` (
  `ID karyawan` varchar(10) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `NoTlp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `ID pengguna` varchar(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `Id Produksi` varchar(10) NOT NULL,
  `Alat Produksi` varchar(50) NOT NULL,
  `Produksi` int(50) NOT NULL,
  `ID barang` varchar(10) NOT NULL,
  `bahan produksi` varchar(50) NOT NULL,
  `Biaya produksi` int(11) NOT NULL,
  `Tanggal produksi` date DEFAULT NULL,
  `Karyawan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `ID_stok` varchar(10) NOT NULL,
  `stok bahan` int(11) NOT NULL,
  `Stok barang` int(11) NOT NULL,
  `Nama barang` varchar(50) NOT NULL,
  `Nama bahan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenaga kerja`
--

CREATE TABLE `tenaga kerja` (
  `ID pegawai` varchar(10) NOT NULL,
  `Nama pegawai` varchar(20) NOT NULL,
  `Bagian Produksi` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `biaya produksi`
--
ALTER TABLE `biaya produksi`
  ADD PRIMARY KEY (`ID biaya`);

--
-- Indexes for table `data bahan`
--
ALTER TABLE `data bahan`
  ADD PRIMARY KEY (`ID bahan`),
  ADD KEY `data 2` (`Bahan`);

--
-- Indexes for table `data barang`
--
ALTER TABLE `data barang`
  ADD PRIMARY KEY (`ID barang`);

--
-- Indexes for table `gudang barang`
--
ALTER TABLE `gudang barang`
  ADD PRIMARY KEY (`ID barang`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`ID kategori`);

--
-- Indexes for table `outlet`
--
ALTER TABLE `outlet`
  ADD PRIMARY KEY (`ID outlet`);

--
-- Indexes for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`ID karyawan`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`ID pengguna`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`Id Produksi`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`ID_stok`);

--
-- Indexes for table `tenaga kerja`
--
ALTER TABLE `tenaga kerja`
  ADD PRIMARY KEY (`ID pegawai`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `biaya produksi`
--
ALTER TABLE `biaya produksi`
  ADD CONSTRAINT `biaya produksi_ibfk_1` FOREIGN KEY (`ID biaya`) REFERENCES `produksi` (`Id Produksi`),
  ADD CONSTRAINT `biaya produksi_ibfk_2` FOREIGN KEY (`ID biaya`) REFERENCES `pelanggan` (`ID pengguna`);

--
-- Constraints for table `data bahan`
--
ALTER TABLE `data bahan`
  ADD CONSTRAINT `data 1` FOREIGN KEY (`ID bahan`) REFERENCES `stok` (`ID_stok`),
  ADD CONSTRAINT `data 2` FOREIGN KEY (`Bahan`) REFERENCES `produksi` (`Id Produksi`);

--
-- Constraints for table `data barang`
--
ALTER TABLE `data barang`
  ADD CONSTRAINT `data barang_ibfk_1` FOREIGN KEY (`ID barang`) REFERENCES `stok` (`ID_stok`);

--
-- Constraints for table `gudang barang`
--
ALTER TABLE `gudang barang`
  ADD CONSTRAINT `gudang barang_ibfk_1` FOREIGN KEY (`ID barang`) REFERENCES `data bahan` (`ID bahan`);

--
-- Constraints for table `kategori`
--
ALTER TABLE `kategori`
  ADD CONSTRAINT `kategori_ibfk_1` FOREIGN KEY (`ID kategori`) REFERENCES `data barang` (`ID barang`);

--
-- Constraints for table `outlet`
--
ALTER TABLE `outlet`
  ADD CONSTRAINT `outlet_ibfk_1` FOREIGN KEY (`ID outlet`) REFERENCES `pelanggan` (`ID pengguna`),
  ADD CONSTRAINT `outlet_ibfk_2` FOREIGN KEY (`ID outlet`) REFERENCES `gudang barang` (`ID barang`);

--
-- Constraints for table `pegawai`
--
ALTER TABLE `pegawai`
  ADD CONSTRAINT `pegawai_ibfk_1` FOREIGN KEY (`ID karyawan`) REFERENCES `tenaga kerja` (`ID pegawai`);

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `pelanggan_ibfk_1` FOREIGN KEY (`ID pengguna`) REFERENCES `gudang barang` (`ID barang`),
  ADD CONSTRAINT `pelanggan_ibfk_2` FOREIGN KEY (`ID pengguna`) REFERENCES `pegawai` (`ID karyawan`),
  ADD CONSTRAINT `pelanggan_ibfk_3` FOREIGN KEY (`ID pengguna`) REFERENCES `outlet` (`ID outlet`),
  ADD CONSTRAINT `pelanggan_ibfk_4` FOREIGN KEY (`ID pengguna`) REFERENCES `produksi` (`Id Produksi`);

--
-- Constraints for table `produksi`
--
ALTER TABLE `produksi`
  ADD CONSTRAINT `produksi_ibfk_1` FOREIGN KEY (`Id Produksi`) REFERENCES `data bahan` (`ID bahan`),
  ADD CONSTRAINT `produksi_ibfk_2` FOREIGN KEY (`Id Produksi`) REFERENCES `tenaga kerja` (`ID pegawai`);

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`ID_stok`) REFERENCES `produksi` (`Id Produksi`),
  ADD CONSTRAINT `stok_ibfk_2` FOREIGN KEY (`ID_stok`) REFERENCES `gudang barang` (`ID barang`);

--
-- Constraints for table `tenaga kerja`
--
ALTER TABLE `tenaga kerja`
  ADD CONSTRAINT `tenaga kerja_ibfk_1` FOREIGN KEY (`ID pegawai`) REFERENCES `produksi` (`Id Produksi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
