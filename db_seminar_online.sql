-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2024 at 05:21 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_seminar_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Usernama` varchar(50) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Imail` varchar(100) NOT NULL,
  `Telepon` varchar(20) NOT NULL,
  `Jabatan` varchar(50) NOT NULL,
  `Alamat` varchar(50) NOT NULL,
  `Profile` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `Updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_pendaftaran`
--

CREATE TABLE `tb_pendaftaran` (
  `Id_Pendaftaran` int(11) NOT NULL,
  `Id_Peserta` int(11) NOT NULL,
  `Id_Seminar` int(11) NOT NULL,
  `Status` enum('Terdaftar','Dikonfirmasi','Batal') NOT NULL,
  `Tanggal_Daftar` datetime NOT NULL DEFAULT current_timestamp(),
  `Metode_Pembayaran` enum('Transfer','Cash','Gratis') NOT NULL,
  `Jumlah_Bayar` int(11) NOT NULL,
  `Bukti_Pembayaran` varchar(255) NOT NULL,
  `Catatan` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_peserta`
--

CREATE TABLE `tb_peserta` (
  `Id_Peserta` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Telepon` varchar(15) NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `Posisi` varchar(50) NOT NULL,
  `Kategori` enum('Umum','Mahasiswa','Dosen') NOT NULL,
  `Kehadiran` enum('Hadir','Tidak Hadir') NOT NULL,
  `Upload_file` varchar(255) NOT NULL,
  `Dibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_peserta`
--

INSERT INTO `tb_peserta` (`Id_Peserta`, `Nama`, `Email`, `Telepon`, `Alamat`, `Posisi`, `Kategori`, `Kehadiran`, `Upload_file`, `Dibuat`) VALUES
(4, 'Mohammad Qudsi HM - Gulukmanjung Bluto Sumenep', 'admin@gmail.com', '085156390652', 'asakska', 'peserta', 'Mahasiswa', 'Hadir', 'Purple and Orange Illustrative 3D Social Media Marketing Instagram Post (2).png', '2024-12-18 16:05:24');

-- --------------------------------------------------------

--
-- Table structure for table `tb_seminar`
--

CREATE TABLE `tb_seminar` (
  `ID` int(11) NOT NULL,
  `Judul` varchar(200) NOT NULL,
  `Deskripsi` text NOT NULL,
  `Tanggal` date NOT NULL,
  `Lokasi` varchar(255) NOT NULL,
  `Kapasitas` int(11) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Kategori` varchar(100) NOT NULL,
  `Narasumber` varchar(100) NOT NULL,
  `Dibuat` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_seminar`
--

INSERT INTO `tb_seminar` (`ID`, `Judul`, `Deskripsi`, `Tanggal`, `Lokasi`, `Kapasitas`, `Harga`, `Kategori`, `Narasumber`, `Dibuat`) VALUES
(1, 'Pablic spiking', 'Benefit yang kamu dapatkan :\r\n Dapat Esertifikat\r\n More relation!', '2024-12-30', 'Via zoom', 250, 25, 'Pendidikan', 'Siti S.kom', '2024-12-17 09:59:30'),
(2, 'Worshop digital agus sedih', 'Pelajari teknik-taknik baru', '2024-12-01', 'Jakarta', 100, 500000, '', 'John Doe', '2024-12-18 00:16:41'),
(5, 'tes judul', 'tes deskripsi', '2024-12-18', 'palembang', 20, 3000, '', 'agus sedih', '2024-12-18 16:02:49');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `Id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin',' Pimpinan','User') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`Id`, `username`, `password`, `role`) VALUES
(1, 'Asmara', 'Seminar', 'Admin'),
(2, 'Ranti', 'Online', ' Pimpinan'),
(3, 'Ranti', '$2y$10$FUvsltX9w9PSSioAWJB7guMuAaMWLEHMXe3SkUYD3/ot/9jkyO4TS', 'Admin'),
(4, 'Ranti', '$2y$10$JlMcM9KPKe0XRitf35hpEu3i/Yx2WIYx1ToapoRtN2nbQA6vJYyP6', 'Admin'),
(5, 'Ranti', '$2y$10$/vNgux1iVR2kp3kZgsT/8uAjvGbEBIg/YTodtaRjtOwQyCb2.RQ5.', 'Admin'),
(6, 'dika', '$2y$10$ppEoMooE9QYnraPQxY14aeNbPJcSFOlL1SQnC8KqwOkk0DyOlFYv.', 'Admin'),
(7, 'didi', '$2y$10$/jW382iZ9EkOo.boEzvkZuDdLblHU7J4mwUsrSS0PbjxFr07VfpB6', 'Admin'),
(8, 'kiki', '$2y$10$HmvwRM7cEELTrUudeKxzS.Fkt6I4CAzRDQicF1WTGdC92HtwoLaV.', 'User'),
(9, 'pipi', '$2y$10$oTxcNo/hSTrJpmsT7q/3heSMJAyTW5TOeXB3QS6z7AYQtzqYA/N3y', 'User'),
(10, 'qiqi', '$2y$10$RX9fhZAv/nNU6rO5eyOWUu25LVKTWgjKZ7AYOXhvHyNs/wNBwQcwC', 'User'),
(11, 'zizi', '$2y$10$mqaFgDHuxdE9EDL.fs84mOz9dbWT7xlvIMy05X4GCP73cIja5W3QC', 'User'),
(12, 'admin', '$2y$10$3CH.rjooAezPByrqKsribeOV8jBzvwbYQqTvlHryz6bjE17EQzOY2', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_pendaftaran`
--
ALTER TABLE `tb_pendaftaran`
  ADD PRIMARY KEY (`Id_Pendaftaran`);

--
-- Indexes for table `tb_peserta`
--
ALTER TABLE `tb_peserta`
  ADD PRIMARY KEY (`Id_Peserta`);

--
-- Indexes for table `tb_seminar`
--
ALTER TABLE `tb_seminar`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_pendaftaran`
--
ALTER TABLE `tb_pendaftaran`
  MODIFY `Id_Pendaftaran` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_peserta`
--
ALTER TABLE `tb_peserta`
  MODIFY `Id_Peserta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_seminar`
--
ALTER TABLE `tb_seminar`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
