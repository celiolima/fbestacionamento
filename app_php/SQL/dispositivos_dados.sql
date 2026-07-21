-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 21/07/2026 às 00:48
-- Versão do servidor: 5.7.33-0ubuntu0.18.04.1
-- Versão do PHP: 8.3.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `estacionamento_mysql`
--

--
-- Despejando dados para a tabela `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `nome_dispositivo`, `serial_dispositivo`, `tipo_dispositivo`, `status_dispositivo`, `data_criacao`, `data_alteracao`) VALUES
(1, 'Central', '5c:cf:7f:1b:61:58', 'Central', 0, '2026-07-19 20:42:41', '2026-07-20 21:09:22'),
(2, 'Cam 01', 'a8:42:e3:4a:b3:38', 'Camera', 1, '2026-07-19 21:30:06', '2026-07-19 21:30:06'),
(3, 'Cam 02', 'a4:f0:0f:74:f4:30', 'Camera', 1, '2026-07-20 14:08:55', '2026-07-20 14:08:55');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
