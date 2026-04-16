-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 15/04/2026 às 23:46
-- Versão do servidor: 5.7.33-0ubuntu0.18.04.1
-- Versão do PHP: 8.3.30

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

-- --------------------------------------------------------

--
-- Estrutura para tabela `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('d0b28647dfdb85bdeb0173ef58d4f9e82af2e8fb', '172.18.0.1', 1776205736, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230353733363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('9ffb11f8b345cc73e9ff94bb0d0928d516952dbc', '172.18.0.1', 1776206108, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230363130383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('2062c6e348f2e3977fa545a2adea043d6ddb552e', '172.18.0.1', 1776207286, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230373238363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('6c6ef16b01593394d2b4d9dce1b45b463332a76c', '172.18.0.1', 1776207820, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230373832303b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('7c6ed708165455f9440c937d1529cd19ea31718c', '172.18.0.1', 1776208319, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230383331393b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('11b0658eca4d5faeaa431eb9eb24a06b824c88cd', '172.18.0.1', 1776208708, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230383730383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('80dc7ea24272f6e8cc92358868844f5b4f0bad16', '172.18.0.1', 1776209213, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230393231333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('f02a9d0ae3179027f8d1f19d27d75bd2b0341219', '172.18.0.1', 1776209753, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363230393735333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('873dc81e9932f7335b1c9e17d47278ac91d1cb53', '172.18.0.1', 1776210102, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231303130323b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('60cdd181d48e2ac1fc20495b31467a9b5ec4e8ef', '172.18.0.1', 1776210472, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231303437323b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('d567bbf0a06964e84a4cb475afcc047392071507', '172.18.0.1', 1776210788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231303738383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('14a1eefa225fe18878fa2b009b47b1685ca25c8d', '172.18.0.1', 1776211336, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231313333363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('c2737b38940d89790daa3abd2fb19ef1f2e4ff02', '172.18.0.1', 1776211643, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231313634333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('cb4e21c97dbb9267e60c2b3bd082cf336cfb0830', '172.18.0.1', 1776211944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231313934343b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('c5edf12bb4c18ea4af1dc8c7d14ad4399eafa94b', '172.18.0.1', 1776212313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231323331333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('574cfd97a0975e07a2826b1f9155b6d2288d8b1f', '172.18.0.1', 1776212313, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363231323331333b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736313637343333223b6c6173745f636865636b7c693a313737363230353733363b),
('19e84c93c99e785b8df835a9c6f139f01b675902', '172.18.0.1', 1776273629, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363237333632393b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323035373336223b6c6173745f636865636b7c693a313737363237333632393b),
('7a58910f6377ffc8d137a4dfbf5ca2576b3197bf', '172.18.0.1', 1776273947, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363237333934373b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323035373336223b6c6173745f636865636b7c693a313737363237333632393b),
('5fa600058b6c0ef13fa8c801b999755a8bf7d8e4', '172.18.0.1', 1776274053, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363237333934373b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323035373336223b6c6173745f636865636b7c693a313737363237333632393b),
('87520ddf8731b0818f2e9b852532096afee69d37', '172.18.0.1', 1776293916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239333931363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323733363239223b6c6173745f636865636b7c693a313737363239333931363b),
('b994f0d3cb4d1a891425414b55efa13541497e6d', '172.18.0.1', 1776293918, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239333931383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323933393136223b6c6173745f636865636b7c693a313737363239333931383b),
('a7007395078931cf52158390bcb98e0b8c93b721', '172.18.0.1', 1776294228, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239343232383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323933393136223b6c6173745f636865636b7c693a313737363239333931383b),
('34eea29a2ffcb6cdae83db3d9afb453ba92eaa39', '172.18.0.1', 1776294661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239343636313b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323933393136223b6c6173745f636865636b7c693a313737363239333931383b),
('6d227f8fcd65f37b5195619e6e6c194dfaf6e9ab', '172.18.0.1', 1776295088, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239353038383b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323933393136223b6c6173745f636865636b7c693a313737363239333931383b),
('c49705a125d810970f40fb4f0ab0c42cc0e215f1', '172.18.0.1', 1776295546, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239353534363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373736323933393136223b6c6173745f636865636b7c693a313737363239333931383b),
('e5d7923583cb921d2e598ac01c6bedb977a14f88', '172.18.0.1', 1776295740, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239353734303b6964656e746974797c733a31393a226174656e64656e746540676d61696c2e636f6d223b656d61696c7c733a31393a226174656e64656e746540676d61696c2e636f6d223b757365725f69647c733a323a223134223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353833383733383832223b6c6173745f636865636b7c693a313737363239353734303b),
('d3ea4a4899639107fb2be42fd22071e4d5279243', '172.18.0.1', 1776296078, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239363037383b6964656e746974797c733a31393a226174656e64656e746540676d61696c2e636f6d223b656d61696c7c733a31393a226174656e64656e746540676d61696c2e636f6d223b757365725f69647c733a323a223134223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353833383733383832223b6c6173745f636865636b7c693a313737363239353734303b),
('d404ce2394ee9c855fccef0c2d8fba95c0491591', '172.18.0.1', 1776296427, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239363432373b6964656e746974797c733a31393a226174656e64656e746540676d61696c2e636f6d223b656d61696c7c733a31393a226174656e64656e746540676d61696c2e636f6d223b757365725f69647c733a323a223134223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353833383733383832223b6c6173745f636865636b7c693a313737363239353734303b),
('15f2c66b7dda8d13bf781453f965eba1b0b66ea7', '172.18.0.1', 1776296590, 0x5f5f63695f6c6173745f726567656e65726174657c693a313737363239363432373b6964656e746974797c733a31393a226174656e64656e746540676d61696c2e636f6d223b656d61696c7c733a31393a226174656e64656e746540676d61696c2e636f6d223b757365725f69647c733a323a223134223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231353833383733383832223b6c6173745f636865636b7c693a313737363239353734303b);

-- --------------------------------------------------------

--
-- Estrutura para tabela `estacionar`
--

CREATE TABLE `estacionar` (
  `estacionar_id` int(11) NOT NULL,
  `estacionar_precificacao_id` int(11) NOT NULL,
  `estacionar_valor_hora` varchar(20) NOT NULL,
  `estacionar_numero_vaga` int(11) NOT NULL,
  `estacionar_placa_veiculo` varchar(8) NOT NULL,
  `estacionar_marca_veiculo` varchar(30) NOT NULL,
  `estacionar_modelo_veiculo` varchar(20) NOT NULL,
  `estacionar_data_entrada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estacionar_data_saida` datetime DEFAULT NULL,
  `estacionar_tempo_decorrido` varchar(20) DEFAULT NULL,
  `estacionar_valor_devido` varchar(30) DEFAULT NULL,
  `estacionar_forma_pagamento_id` int(11) DEFAULT NULL,
  `estacionar_status` tinyint(1) NOT NULL,
  `estacionar_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `estacionar`
--

INSERT INTO `estacionar` (`estacionar_id`, `estacionar_precificacao_id`, `estacionar_valor_hora`, `estacionar_numero_vaga`, `estacionar_placa_veiculo`, `estacionar_marca_veiculo`, `estacionar_modelo_veiculo`, `estacionar_data_entrada`, `estacionar_data_saida`, `estacionar_tempo_decorrido`, `estacionar_valor_devido`, `estacionar_forma_pagamento_id`, `estacionar_status`, `estacionar_data_alteracao`) VALUES
(2, 2, '16,00', 5, 'ATA-9S52', 'Ford', 'Focus Titaniun', '2020-03-11 15:00:00', '2020-03-12 18:13:42', '27.13', '434.08', 2, 1, '2020-03-12 21:13:42'),
(3, 1, '10,00', 1, 'ATA-9S51', 'Honda', 'Civic 2020', '2020-03-12 16:39:08', '2020-03-13 15:21:29', '22.42', '224.2', 1, 1, '2020-03-13 18:21:29'),
(4, 2, '20,00', 6, 'ATT-1212', 'Subaru', 'Imprenza 2020', '2020-03-12 17:29:26', '2020-03-12 18:13:28', '0.43', '8.6', 3, 1, '2020-03-12 21:13:28'),
(8, 1, '10,00', 1, 'ATA-9S51', 'Honda', 'Civic 2020', '2020-03-13 18:37:27', '2020-03-16 14:59:03', '68.21', '682.1', 2, 1, '2020-03-16 17:59:03'),
(9, 2, '8,00', 3, 'KIA-9999', 'Ford', 'Titan 250', '2020-03-13 18:38:31', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(10, 1, '10,00', 30, 'SDD-5252', 'Fiat', 'Palio ', '2020-03-16 14:43:57', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(11, 3, '20,00', 12, 'TUA-9090', 'Honda', '2000', '2020-03-16 14:53:12', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(12, 5, '8,00', 12, 'JUJ-4545', 'Fiat', 'Palio', '2020-03-16 14:56:30', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(13, 1, '10,00', 12, 'GUA-8989', 'Fiat', 'Fiat 147', '2020-03-19 18:14:19', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00'),
(14, 2, '8,00', 1, 'PIO-1A11', 'FIAT', 'TORO', '2026-01-31 22:59:40', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `formas_pagamentos`
--

CREATE TABLE `formas_pagamentos` (
  `forma_pagamento_id` int(11) NOT NULL,
  `forma_pagamento_nome` varchar(30) NOT NULL,
  `forma_pagamento_ativa` tinyint(1) NOT NULL,
  `forma_pagamento_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `formas_pagamentos`
--

INSERT INTO `formas_pagamentos` (`forma_pagamento_id`, `forma_pagamento_nome`, `forma_pagamento_ativa`, `forma_pagamento_data_alteracao`) VALUES
(1, 'Cartão de crédito', 1, '2020-03-11 19:12:01'),
(2, 'Cartão de débito', 1, '2020-03-11 19:17:22'),
(3, 'Dinheiro', 1, '0000-00-00 00:00:00'),
(6, 'Boleto bancário', 1, '0000-00-00 00:00:00'),
(7, 'Cheque', 0, '2020-03-20 01:25:38'),
(8, 'Grátis', 0, '2020-03-20 01:25:32');

-- --------------------------------------------------------

--
-- Estrutura para tabela `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem_carro`
--

CREATE TABLE `imagem_carro` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `dirImage` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `imagem_carro`
--

INSERT INTO `imagem_carro` (`id`, `name`, `created_at`, `updated_at`, `dirImage`, `type`) VALUES
(8, 'entrada cam1 13-04-2026_15:50:45.jpg', '2026-04-13 18:50:45', '2026-04-13 18:50:45', 'public/uploads/entrada cam1 13-04-2026_15:50:45.jpg', 'saida'),
(13, 'entrada cam1 13-04-2026_19:31:31.jpg', '2026-04-13 22:31:31', '2026-04-13 22:31:31', 'public/uploads/entrada cam1 13-04-2026_19:31:31.jpg', 'entrada'),
(14, 'entrada cam1 13-04-2026_19:31:39.jpg', '2026-04-13 22:31:39', '2026-04-13 22:31:39', 'public/uploads/entrada cam1 13-04-2026_19:31:39.jpg', 'entrada'),
(15, 'entrada cam1 13-04-2026_19:31:57.jpg', '2026-04-13 22:31:57', '2026-04-13 22:31:57', 'public/uploads/entrada cam1 13-04-2026_19:31:57.jpg', 'entrada'),
(16, 'entrada cam1 13-04-2026_19:32:21.jpg', '2026-04-13 22:32:21', '2026-04-13 22:32:21', 'public/uploads/entrada cam1 13-04-2026_19:32:21.jpg', 'entrada'),
(17, 'entrada cam1 13-04-2026_19:32:32.jpg', '2026-04-13 22:32:32', '2026-04-13 22:32:32', 'public/uploads/entrada cam1 13-04-2026_19:32:32.jpg', 'entrada'),
(18, 'entrada cam1 13-04-2026_19:33:07.jpg', '2026-04-13 22:33:07', '2026-04-13 22:33:07', 'public/uploads/entrada cam1 13-04-2026_19:33:07.jpg', 'entrada'),
(19, 'entrada cam1 13-04-2026_19:33:20.jpg', '2026-04-13 22:33:20', '2026-04-13 22:33:20', 'public/uploads/entrada cam1 13-04-2026_19:33:20.jpg', 'entrada'),
(20, 'entrada cam1 13-04-2026_19:33:29.jpg', '2026-04-13 22:33:29', '2026-04-13 22:33:29', 'public/uploads/entrada cam1 13-04-2026_19:33:29.jpg', 'entrada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensalidades`
--

CREATE TABLE `mensalidades` (
  `mensalidade_id` int(11) NOT NULL,
  `mensalidade_mensalista_id` int(11) NOT NULL,
  `mensalidade_precificacao_id` int(11) NOT NULL,
  `mensalidade_valor_mensalidade` varchar(20) NOT NULL,
  `mensalidade_mensalista_dia_vencimento` int(11) NOT NULL,
  `mensalidade_data_vencimento` date NOT NULL,
  `mensalidade_data_pagamento` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `mensalidade_status` tinyint(1) NOT NULL,
  `mensalidade_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `mensalidades`
--

INSERT INTO `mensalidades` (`mensalidade_id`, `mensalidade_mensalista_id`, `mensalidade_precificacao_id`, `mensalidade_valor_mensalidade`, `mensalidade_mensalista_dia_vencimento`, `mensalidade_data_vencimento`, `mensalidade_data_pagamento`, `mensalidade_status`, `mensalidade_data_alteracao`) VALUES
(1, 30, 5, '80,00', 31, '2020-03-31', '2020-03-17 22:58:48', 1, '2020-03-18 01:58:48'),
(2, 2, 5, '80,00', 10, '2020-03-10', '2020-03-19 22:05:12', 1, '2020-03-20 01:05:12'),
(3, 1, 1, '130,00', 31, '2020-03-18', '2020-03-19 23:06:45', 0, '2020-03-20 02:06:45');

-- --------------------------------------------------------

--
-- Estrutura para tabela `mensalistas`
--

CREATE TABLE `mensalistas` (
  `mensalista_id` int(11) NOT NULL,
  `mensalista_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `mensalista_tipo` tinyint(1) DEFAULT NULL,
  `mensalista_nome` varchar(45) NOT NULL,
  `mensalista_sobrenome` varchar(150) NOT NULL,
  `mensalista_data_nascimento` date DEFAULT NULL,
  `mensalista_cpf_cnpj` varchar(20) NOT NULL,
  `mensalista_rg_ie` varchar(20) NOT NULL,
  `mensalista_email` varchar(50) NOT NULL,
  `mensalista_telefone_fixo` varchar(20) DEFAULT NULL,
  `mensalista_telefone_movel` varchar(20) NOT NULL,
  `mensalista_cep` varchar(10) NOT NULL,
  `mensalista_endereco` varchar(155) NOT NULL,
  `mensalista_numero_endereco` varchar(20) NOT NULL,
  `mensalista_bairro` varchar(45) NOT NULL,
  `mensalista_cidade` varchar(105) NOT NULL,
  `mensalista_estado` varchar(2) NOT NULL,
  `mensalista_complemento` varchar(145) NOT NULL,
  `mensalista_ativo` tinyint(1) NOT NULL,
  `mensalista_dia_vencimento` int(11) NOT NULL,
  `mensalista_obs` tinytext,
  `mensalista_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `mensalistas`
--

INSERT INTO `mensalistas` (`mensalista_id`, `mensalista_data_cadastro`, `mensalista_tipo`, `mensalista_nome`, `mensalista_sobrenome`, `mensalista_data_nascimento`, `mensalista_cpf_cnpj`, `mensalista_rg_ie`, `mensalista_email`, `mensalista_telefone_fixo`, `mensalista_telefone_movel`, `mensalista_cep`, `mensalista_endereco`, `mensalista_numero_endereco`, `mensalista_bairro`, `mensalista_cidade`, `mensalista_estado`, `mensalista_complemento`, `mensalista_ativo`, `mensalista_dia_vencimento`, `mensalista_obs`, `mensalista_data_alteracao`) VALUES
(1, '2020-03-13 22:00:02', 1, 'Lucio', 'Souza', '2020-03-13', '359.731.420-19', '334.44644-12', 'lucio@gmail.com', '', '(41) 9999-9999', '80530-000', 'Rua de Curitiba', '45', 'Centro', 'Curitiba', 'PR', '', 1, 31, '', '2020-03-17 23:33:25'),
(2, '2020-03-16 18:32:17', 1, 'João', 'Antonio', '1984-03-13', '964.222.370-81', '33.036.268-9', 'joao@gmail.com', '', '', '80120-000', 'Rua do Trabalho', 'sem número', 'Centro', 'Curitiba', 'PR', '', 0, 10, '', '2020-03-20 02:47:42'),
(30, '2020-03-16 18:45:01', 2, 'Maria', 'da Fonseca', '1992-03-11', '58.553.593/0001-01', '284.686.842.876', 'maria@gmail.com', '(41) 3232-3030', '(41) 9999-7777', '80120-000', 'Rua do Rosário', '414', 'Santa Catarina', 'Joinvile', 'SC', '', 1, 31, '', '2020-03-17 00:19:07');

-- --------------------------------------------------------

--
-- Estrutura para tabela `precificacoes`
--

CREATE TABLE `precificacoes` (
  `precificacao_id` int(11) NOT NULL,
  `precificacao_categoria` varchar(50) NOT NULL,
  `precificacao_valor_hora` varchar(50) NOT NULL,
  `precificacao_valor_mensalidade` varchar(20) NOT NULL,
  `precificacao_numero_vagas` int(11) NOT NULL,
  `precificacao_ativa` tinyint(1) NOT NULL,
  `precificacao_data_alteracao` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Despejando dados para a tabela `precificacoes`
--

INSERT INTO `precificacoes` (`precificacao_id`, `precificacao_categoria`, `precificacao_valor_hora`, `precificacao_valor_mensalidade`, `precificacao_numero_vagas`, `precificacao_ativa`, `precificacao_data_alteracao`) VALUES
(1, 'Veículo pequeno', '10,00', '130,00', 30, 1, '2020-03-20 01:29:59'),
(2, 'Veículo médio', '8,00', '140,00', 30, 1, '2020-03-19 21:47:59'),
(3, 'Veículo grande', '20,00', '200,00', 30, 1, '2020-03-19 21:49:14'),
(5, 'Moto', '8,00', '80,00', 30, 1, '2020-03-20 01:04:56');

-- --------------------------------------------------------

--
-- Estrutura para tabela `sistema`
--

CREATE TABLE `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_txt_ordem_servico` tinytext,
  `sistema_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Despejando dados para a tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_txt_ordem_servico`, `sistema_data_alteracao`) VALUES
(1, 'Park Now System', 'Park Now', '80.838.809/0001-26', '683.90228-49', '(41) 3232-3030', '(41) 9999-9999', 'parknow@contato.com.br', 'http://parknow.com.br', '80510-000', 'Rua da Programação', '54', 'Curitiba', 'PR', 'Park Now - Seu veículo em boas mãos.', '2020-03-10 18:01:36');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `user_data_alteracao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `user_data_alteracao`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$j1N9yShSErZduxQT0dUCieljuLHaWN4lE4WN5gk887L.yDppGiA5i', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1776293918, 1, 'Admin', 'istrator', 'ADMIN', '0', '2026-04-15 22:58:38'),
(14, '127.0.0.1', 'atendente', '$2y$10$rps/0Q9e/x8ZAFAhRQZJ0e8FE32KI2wVMumK3o4PlyKmTViQSIkh.', 'atendente@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1583873532, 1776295740, 1, 'atendente', 'Souza', NULL, NULL, '2026-04-15 23:29:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(21, 14, 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos_qtd`
--

CREATE TABLE `veiculos_qtd` (
  `id` int(10) UNSIGNED NOT NULL,
  `total_carro_mes` int(10) UNSIGNED DEFAULT NULL,
  `total_carro` int(10) UNSIGNED DEFAULT NULL,
  `total_moto_mes` int(10) UNSIGNED DEFAULT NULL,
  `total_moto` int(10) UNSIGNED DEFAULT NULL,
  `total_carro_entrada` int(10) UNSIGNED DEFAULT NULL,
  `total_carro_saida` int(10) UNSIGNED DEFAULT NULL,
  `total_moto_entrada` int(10) UNSIGNED DEFAULT NULL,
  `total_moto_saida` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `veiculos_qtd`
--

INSERT INTO `veiculos_qtd` (`id`, `total_carro_mes`, `total_carro`, `total_moto_mes`, `total_moto`, `total_carro_entrada`, `total_carro_saida`, `total_moto_entrada`, `total_moto_saida`, `created_at`) VALUES
(1, 113, 267, 63, 263, 12, 8, 5, 2, '2026-04-09 18:07:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Índices de tabela `estacionar`
--
ALTER TABLE `estacionar`
  ADD PRIMARY KEY (`estacionar_id`);

--
-- Índices de tabela `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  ADD PRIMARY KEY (`forma_pagamento_id`);

--
-- Índices de tabela `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagem_carro`
--
ALTER TABLE `imagem_carro`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `mensalidades`
--
ALTER TABLE `mensalidades`
  ADD PRIMARY KEY (`mensalidade_id`);

--
-- Índices de tabela `mensalistas`
--
ALTER TABLE `mensalistas`
  ADD PRIMARY KEY (`mensalista_id`);

--
-- Índices de tabela `precificacoes`
--
ALTER TABLE `precificacoes`
  ADD PRIMARY KEY (`precificacao_id`);

--
-- Índices de tabela `sistema`
--
ALTER TABLE `sistema`
  ADD PRIMARY KEY (`sistema_id`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Índices de tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `estacionar`
--
ALTER TABLE `estacionar`
  MODIFY `estacionar_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `formas_pagamentos`
--
ALTER TABLE `formas_pagamentos`
  MODIFY `forma_pagamento_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `imagem_carro`
--
ALTER TABLE `imagem_carro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `mensalidades`
--
ALTER TABLE `mensalidades`
  MODIFY `mensalidade_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `mensalistas`
--
ALTER TABLE `mensalistas`
  MODIFY `mensalista_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `precificacoes`
--
ALTER TABLE `precificacoes`
  MODIFY `precificacao_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `sistema`
--
ALTER TABLE `sistema`
  MODIFY `sistema_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de tabela `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
