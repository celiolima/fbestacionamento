CREATE TABLE IF NOT EXISTS `dispositivos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome_dispositivo` varchar(100) NOT NULL,
  `serial_dispositivo` varchar(100) NOT NULL,
  `tipo_dispositivo` enum('Central','Camera') NOT NULL DEFAULT 'Camera',
  `status_dispositivo` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = Inativo, 1 = Ativo',
  `data_criacao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_alteracao` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial_dispositivo` (`serial_dispositivo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
