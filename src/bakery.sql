-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 16, 2022 at 08:20 AM
-- Server version: 8.0.28-0ubuntu0.20.04.3
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nombre`) VALUES
(1, 'Panes'),
(2, 'Bolleria');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220121093251', '2022-01-21 10:33:41', 4081),
('DoctrineMigrations\\Version20220124082209', '2022-01-24 09:22:19', 6531),
('DoctrineMigrations\\Version20220124083848', '2022-01-24 09:38:55', 5534),
('DoctrineMigrations\\Version20220124084059', '2022-01-24 09:41:06', 20046),
('DoctrineMigrations\\Version20220126080249', '2022-01-26 09:02:55', 4860),
('DoctrineMigrations\\Version20220202093707', '2022-02-02 10:37:17', 7049),
('DoctrineMigrations\\Version20220202093812', '2022-02-02 10:38:15', 21795),
('DoctrineMigrations\\Version20220204075359', '2022-02-04 08:54:35', 7496);

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `observaciones` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `producto_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int NOT NULL,
  `nombre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `precio` double NOT NULL,
  `categoria_id` int DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `nombre`, `descripcion`, `precio`, `categoria_id`, `foto`) VALUES
(1, 'Pan Rústico', 'Pan ', 2, 1, 'imagenes/panrustico.jpg'),
(2, 'Tortada de almendra', 'Tortada de almendra', 16, 2, 'imagenes/coca.jpg'),
(3, 'Coca pasas y nueces', 'coca pasas y nueces', 2, 2, 'imagenes/cocanueces.jpg'),
(4, 'Pannetone', 'pannetone', 15, 2, 'imagenes/pannetone.jpg'),
(5, 'Hogaza', 'Hogaza', 2.2, 1, 'imagenes/hogaza.jpg'),
(6, 'Rollitos anis', 'Rollitos anis', 3, 2, 'imagenes/rollitoanis.jpg'),
(7, 'Madalenas', 'Madalenas', 0.4, 2, 'imagenes/madalena.jpg'),
(8, 'Coca de Tomate', 'Coca de Tomate', 1.8, 2, 'imagenes/cocatomate.jpg'),
(9, 'Banderilla', 'Banderilla', 0.9, 1, 'imagenes/banderilla.jpg'),
(10, 'Pan de Agua', 'Pan de Agua', 0.9, 1, 'imagenes/pandeagua.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'a@a.com', '[]', '$2y$13$MvZXdIAP86Lo3c6oiTnVo.7zXE6uVA1t.EFxj0QFtgG6yHBwpYZoy'),
(2, 'b@b.com', '[]', '$2y$13$gshc09D8ZALReK/ofhzPzOYJ3M062e1CrFHxB3fXmPK3k0WCnDPfi'),
(3, 'c@c.com', '[]', '$2y$13$7okHYtlahUdXr1XnJn14/.8VeeR/0QXUsNcwHQIhQIUZGQcdDpO5a');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_C4EC16CE7645698E` (`producto_id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A7BB06153397707A` (`categoria_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `FK_C4EC16CE7645698E` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `FK_A7BB06153397707A` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
