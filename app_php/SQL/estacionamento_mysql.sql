-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Tempo de geração: 21/07/2026 às 00:25
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
('c71fee053876fd281b51685e65da8b315191a04d', '172.18.0.1', 1784590836, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539303833363b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373834353637323934223b6c6173745f636865636b7c693a313738343539303833353b),
('c1d4f1ffb31e235a8fc2d3e3221ac6fc093587d9', '172.18.0.1', 1784592480, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323438303b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373834353637323934223b6c6173745f636865636b7c693a313738343539303833353b),
('9780f279e2a35d379172f10452b65631808ad0fc', '172.18.0.1', 1784592814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323831343b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373834353637323934223b6c6173745f636865636b7c693a313738343539303833353b),
('c7e656c082bf00b2c59171df4d491bc8e8717699', '172.18.0.1', 1784592497, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323439373b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('254fd12d8d265ef15ef4cb2e7c5e1c6d89c9b5df', '172.18.0.1', 1784592498, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323439383b6c6173745f69647c693a34323b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('c04eea5a1875c033c1b033bc1279229872e0b7cb', '172.18.0.1', 1784592499, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323439393b6c6173745f69647c693a34333b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('cdd3e93d19c0961234259b3071af7bb84d023714', '172.18.0.1', 1784592594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323539343b),
('295f1926b00b6e0a2fbeb465767e7f263772ad32', '172.18.0.1', 1784592594, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323539343b6c6173745f69647c693a34343b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('72668806fcd94da238385eb8f4b5e6fa894347a8', '172.18.0.1', 1784592598, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323539383b6c6173745f69647c693a34353b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('f06196b60231afba8db0e8eb150568277516e71c', '172.18.0.1', 1784592661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323636303b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('cff1c87dfd88a1aab5395333518820d9603aad61', '172.18.0.1', 1784592661, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323636313b6c6173745f69647c693a34363b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('b607d2281d9af641c664933afdd699b1fb450202', '172.18.0.1', 1784592662, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323636323b6c6173745f69647c693a34373b7375636573736f7c733a32353a224461646f732073616c766f7320636f6d207375636573736f21223b5f5f63695f766172737c613a313a7b733a373a227375636573736f223b733a333a226e6577223b7d),
('81bdb199185acc9f85b15e0fefe7ff45fb656f39', '172.18.0.1', 1784592814, 0x5f5f63695f6c6173745f726567656e65726174657c693a313738343539323831343b6964656e746974797c733a31353a2261646d696e4061646d696e2e636f6d223b656d61696c7c733a31353a2261646d696e4061646d696e2e636f6d223b757365725f69647c733a313a2231223b6f6c645f6c6173745f6c6f67696e7c733a31303a2231373834353637323934223b6c6173745f636865636b7c693a313738343539303833353b);

-- --------------------------------------------------------

--
-- Estrutura para tabela `dispositivos`
--

CREATE TABLE `dispositivos` (
  `id` int(11) NOT NULL,
  `nome_dispositivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial_dispositivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_dispositivo` enum('Central','Camera') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Camera',
  `status_dispositivo` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 = Inativo, 1 = Ativo',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `dispositivos`
--

INSERT INTO `dispositivos` (`id`, `nome_dispositivo`, `serial_dispositivo`, `tipo_dispositivo`, `status_dispositivo`, `data_criacao`, `data_alteracao`) VALUES
(1, 'Central', '5c:cf:7f:1b:61:58', 'Central', 0, '2026-07-19 20:42:41', '2026-07-20 21:09:22'),
(2, 'Cam 01', 'a8:42:e3:4a:b3:38', 'Camera', 1, '2026-07-19 21:30:06', '2026-07-19 21:30:06'),
(3, 'Cam 02', 'a4:f0:0f:74:f4:30', 'Camera', 1, '2026-07-20 14:08:55', '2026-07-20 14:08:55');

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
(28, 'entrada_cam01_20-07-2026_10-24-50.jpg', '2026-07-20 13:24:50', '2026-07-20 13:24:50', 'public/uploads/entrada_cam01_20-07-2026_10-24-50.jpg', 'entrada'),
(29, 'entrada_cam01_20-07-2026_10-25-43.jpg', '2026-07-20 13:25:43', '2026-07-20 13:25:43', 'public/uploads/entrada_cam01_20-07-2026_10-25-43.jpg', 'entrada'),
(30, 'entrada_cam01_20-07-2026_14-57-57.jpg', '2026-07-20 17:57:57', '2026-07-20 17:57:57', 'public/uploads/entrada_cam01_20-07-2026_14-57-57.jpg', 'entrada'),
(31, 'entrada_cam02_20-07-2026_15-01-37.jpg', '2026-07-20 18:01:37', '2026-07-20 18:01:37', 'public/uploads/entrada_cam02_20-07-2026_15-01-37.jpg', 'entrada'),
(32, 'entrada_cam01_20-07-2026_15-01-52.jpg', '2026-07-20 18:01:52', '2026-07-20 18:01:52', 'public/uploads/entrada_cam01_20-07-2026_15-01-52.jpg', 'entrada'),
(33, 'saida_cam02_20-07-2026_15-03-03.jpg', '2026-07-20 18:03:03', '2026-07-20 18:03:03', 'public/uploads/saida_cam02_20-07-2026_15-03-03.jpg', 'saida'),
(34, 'saida_cam01_20-07-2026_15-03-15.jpg', '2026-07-20 18:03:15', '2026-07-20 18:03:15', 'public/uploads/saida_cam01_20-07-2026_15-03-15.jpg', 'saida'),
(35, 'entrada_cam01_20-07-2026_16-03-05.jpg', '2026-07-20 19:03:05', '2026-07-20 19:03:05', 'public/uploads/entrada_cam01_20-07-2026_16-03-05.jpg', 'entrada'),
(36, 'entrada_cam02_20-07-2026_16-03-05.jpg', '2026-07-20 19:03:05', '2026-07-20 19:03:05', 'public/uploads/entrada_cam02_20-07-2026_16-03-05.jpg', 'entrada'),
(37, 'saida_cam01_20-07-2026_16-13-39.jpg', '2026-07-20 19:13:39', '2026-07-20 19:13:39', 'public/uploads/saida_cam01_20-07-2026_16-13-39.jpg', 'saida'),
(38, 'saida_cam02_20-07-2026_16-14-51.jpg', '2026-07-20 19:14:51', '2026-07-20 19:14:51', 'public/uploads/saida_cam02_20-07-2026_16-14-51.jpg', 'saida'),
(39, 'saida_cam01_20-07-2026_16-14-51.jpg', '2026-07-20 19:14:51', '2026-07-20 19:14:51', 'public/uploads/saida_cam01_20-07-2026_16-14-51.jpg', 'saida'),
(40, 'saida_cam01_20-07-2026_16-34-59.jpg', '2026-07-20 19:34:59', '2026-07-20 19:34:59', 'public/uploads/saida_cam01_20-07-2026_16-34-59.jpg', 'saida'),
(41, 'saida_cam02_20-07-2026_16-35-03.jpg', '2026-07-20 19:35:03', '2026-07-20 19:35:03', 'public/uploads/saida_cam02_20-07-2026_16-35-03.jpg', 'saida'),
(42, 'entrada_cam01_20-07-2026_21-08-18.jpg', '2026-07-21 00:08:18', '2026-07-21 00:08:18', 'public/uploads/entrada_cam01_20-07-2026_21-08-18.jpg', 'entrada'),
(43, 'entrada_cam02_20-07-2026_21-08-19.jpg', '2026-07-21 00:08:19', '2026-07-21 00:08:19', 'public/uploads/entrada_cam02_20-07-2026_21-08-19.jpg', 'entrada'),
(44, 'entrada_cam01_20-07-2026_21-09-54.jpg', '2026-07-21 00:09:54', '2026-07-21 00:09:54', 'public/uploads/entrada_cam01_20-07-2026_21-09-54.jpg', 'entrada'),
(45, 'entrada_cam02_20-07-2026_21-09-58.jpg', '2026-07-21 00:09:58', '2026-07-21 00:09:58', 'public/uploads/entrada_cam02_20-07-2026_21-09-58.jpg', 'entrada'),
(46, 'entrada_cam01_20-07-2026_21-11-01.jpg', '2026-07-21 00:11:01', '2026-07-21 00:11:01', 'public/uploads/entrada_cam01_20-07-2026_21-11-01.jpg', 'entrada'),
(47, 'entrada_cam02_20-07-2026_21-11-02.jpg', '2026-07-21 00:11:02', '2026-07-21 00:11:02', 'public/uploads/entrada_cam02_20-07-2026_21-11-02.jpg', 'entrada');

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
(1, '127.0.0.1', 'administrator', '$2y$12$j1N9yShSErZduxQT0dUCieljuLHaWN4lE4WN5gk887L.yDppGiA5i', 'admin@admin.com', NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1784590835, 1, 'Admin', 'istrator', 'ADMIN', '0', '2026-07-20 23:40:35'),
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
(1, 138, 292, 78, 278, 11, 2, 5, 2, '2026-04-09 18:07:35');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Índices de tabela `dispositivos`
--
ALTER TABLE `dispositivos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `serial_dispositivo` (`serial_dispositivo`);

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
-- AUTO_INCREMENT de tabela `dispositivos`
--
ALTER TABLE `dispositivos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

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
