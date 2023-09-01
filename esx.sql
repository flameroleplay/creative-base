-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.34 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para esx
CREATE DATABASE IF NOT EXISTS `esx` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `esx`;

-- Copiando estrutura para tabela esx.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.addon_account: ~8 rows (aproximadamente)
INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('bank_savings', 'Poupança', 0),
	('caution', 'Reserva', 0),
	('society_ambulance', 'Samu', 1),
	('society_banker', 'Banco', 1),
	('society_cardealer', 'Concessionaria', 1),
	('society_mechanic', 'Mecanica', 1),
	('society_police', 'Policia', 1),
	('society_taxi', 'Uber', 1);

-- Copiando estrutura para tabela esx.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.addon_account_data: ~8 rows (aproximadamente)
INSERT INTO `addon_account_data` (`id`, `account_name`, `money`, `owner`) VALUES
	(1, 'society_cardealer', 1000000, NULL),
	(2, 'society_police', 1000000, NULL),
	(3, 'society_ambulance', 0, NULL),
	(4, 'society_mechanic', 250000, NULL),
	(5, 'society_taxi', 0, NULL),
	(9, 'society_banker', 0, NULL);

-- Copiando estrutura para tabela esx.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.addon_inventory: ~5 rows (aproximadamente)
INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_ambulance', 'EMS', 1),
	('society_cardealer', 'Cardealer', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1);

-- Copiando estrutura para tabela esx.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.addon_inventory_items: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.banking
CREATE TABLE IF NOT EXISTS `banking` (
  `identifier` varchar(46) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `time` bigint DEFAULT NULL,
  `ID` int NOT NULL AUTO_INCREMENT,
  `balance` int DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Copiando dados para a tabela esx.banking: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `sender` varchar(60) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.billing: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;


-- Copiando estrutura para tabela esx.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.datastore: ~9 rows (aproximadamente)
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('property', 'Property', 0),
	('society_ambulance', 'EMS', 1),
	('society_mechanic', 'Mechanic', 1),
	('society_police', 'Police', 1),
	('society_taxi', 'Taxi', 1),
	('user_ears', 'Ears', 0),
	('user_glasses', 'Glasses', 0),
	('user_helmet', 'Helmet', 0),
	('user_mask', 'Mask', 0);

-- Copiando estrutura para tabela esx.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  `data` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;


-- Copiando estrutura para tabela esx.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `category` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.fine_types: ~52 rows (aproximadamente)
INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Uso indevido de uma buzina', 30, 0),
	(2, 'Cruzando ilegalmente uma linha contínua', 40, 0),
	(3, 'Dirigir do lado errado da estrada', 250, 0),
	(4, 'Illegal U-Turn', 250, 0),
	(5, 'Condução ilegal fora de estrada', 170, 0),
	(6, 'Recusar um Comando Legal', 30, 0),
	(7, 'Parar ilegalmente um veículo', 150, 0),
	(8, 'Estacionamento proibido', 70, 0),
	(9, 'Não ceder à direita', 70, 0),
	(10, 'Descumprimento das Informações do Veículo', 90, 0),
	(11, 'Não parar em um sinal de parada', 105, 0),
	(12, 'Não parar em um sinal vermelho', 130, 0),
	(13, 'Ultrapassagem ilegal', 100, 0),
	(14, 'Dirigindo um veiculo ilegal', 100, 0),
	(15, 'Condução sem CNH', 1500, 0),
	(16, 'Bater e correr', 800, 0),
	(17, 'Excesso de velocidade < 10 km/h', 90, 0),
	(18, 'Excesso de velocidade < 40-60 km/h', 120, 0),
	(19, 'Excesso de velocidade < 60-80 km/h', 180, 0),
	(20, 'Excesso de velocidade > 120 km/h', 300, 0),
	(21, 'Impedindo o fluxo de tráfego', 110, 1),
	(22, 'Intoxicação pública', 90, 1),
	(23, 'Conduta inadequada', 90, 1),
	(24, 'Obstrução da justiça', 130, 1),
	(25, 'Insultos contra Civis', 75, 1),
	(26, 'Desacato', 110, 1),
	(27, 'Ameaça verbal contra um civil', 90, 1),
	(28, 'Ameaça verbal contra um funcionario publico', 150, 1),
	(29, 'Promover fake news', 250, 1),
	(30, 'Tentativa de Corrupção', 1500, 1),
	(31, 'Brandindo uma arma nos limites da cidade', 120, 2),
	(32, 'Brandindo uma arma letal nos limites da cidade', 300, 2),
	(33, 'Sem licença de armas de fogo', 600, 2),
	(34, 'Posse de arma ilegal', 700, 2),
	(35, 'Posse de ferramentas de roubo', 300, 2),
	(36, 'Roubo de veiculos', 1800, 2),
	(37, 'Intenção de vender/distruir uma substância ilegal', 1500, 2),
	(38, 'Frabricação de uma substância ilegal', 1500, 2),
	(39, 'Posse de Substância Ilegal', 650, 2),
	(40, 'Sequestro de um Civil', 1500, 2),
	(41, 'Sequestro de um funcionario publico', 2000, 2),
	(42, 'Roubo', 650, 2),
	(43, 'Roubo à mão armada de uma loja', 650, 2),
	(44, 'Assalto à mão armada a um banco', 1500, 2),
	(45, 'Agressão a um civil', 2000, 3),
	(46, 'Agressão a um funcionario publico', 2500, 3),
	(47, 'Tentativa de Homicídio de Civil', 3000, 3),
	(48, 'Tentativa de Homicídio de funcionario publico', 5000, 3),
	(49, 'Assassinato de um civil', 10000, 3),
	(50, 'Assassinato de um funcionario publico', 30000, 3),
	(51, 'Homicídio culposo', 1800, 3),
	(52, 'Fraude', 2000, 2);

-- Copiando estrutura para tabela esx.insto_accounts
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela esx.insto_accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.insto_instas
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `realUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela esx.insto_instas: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.insto_likes
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authorId` int DEFAULT NULL,
  `inapId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela esx.insto_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int NOT NULL DEFAULT '1',
  `rare` tinyint NOT NULL DEFAULT '0',
  `can_remove` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.items: ~33 rows (aproximadamente)
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
	('alive_chicken', 'Frango vivo', 1, 0, 1),
	('bandage', 'Bandagem', 2, 0, 1),
	('blowpipe', 'Blowtorch', 2, 0, 1),
	('bread', 'Pão', 1, 0, 1),
	('cannabis', 'Maconha', 3, 0, 1),
	('carokit', 'Body Kit', 3, 0, 1),
	('carotool', 'Ferramentas', 2, 0, 1),
	('clothe', 'Roupa', 1, 0, 1),
	('copper', 'Cobre', 1, 0, 1),
	('cutted_wood', 'Madeira cortada', 1, 0, 1),
	('diamond', 'Diamond', 1, 0, 1),
	('essence', 'Gas', 1, 0, 1),
	('fabric', 'Tecido', 1, 0, 1),
	('fish', 'Peixe', 1, 0, 1),
	('fixkit', 'Kit de reparo', 3, 0, 1),
	('fixtool', 'Ferramentas de reparo', 2, 0, 1),
	('gazbottle', 'Gas Bottle', 2, 0, 1),
	('gold', 'Ouro', 1, 0, 1),
	('iron', 'Ferro', 1, 0, 1),
	('marijuana', 'Marijuana', 2, 0, 1),
	('medikit', 'Kit medico', 2, 0, 1),
	('packaged_chicken', 'Chicken fillet', 1, 0, 1),
	('packaged_plank', 'Packaged wood', 1, 0, 1),
	('petrol', 'Petroleo', 1, 0, 1),
	('petrol_raffin', 'Petroleo Refinado', 1, 0, 1),
	('phone', 'Celular', 1, 0, 1),
	('radio', 'Radio', 1, 0, 1),
	('slaughtered_chicken', 'Frango abatido', 1, 0, 1),
	('stone', 'Pedra', 1, 0, 1),
	('washed_stone', 'Pedra lavada', 1, 0, 1),
	('water', 'Agua', 1, 0, 1),
	('wood', 'Madeira', 1, 0, 1),
	('wool', 'Lã', 1, 0, 1);

-- Copiando estrutura para tabela esx.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.jobs: ~13 rows (aproximadamente)
INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
	('ambulance', 'Samu', 0),
	('banker', 'Bancario', 0),
	('cardealer', 'Concessionaria', 0),
	('fisherman', 'Pescador', 0),
	('fueler', 'Frentista', 0),
	('lumberjack', 'Lenhador', 0),
	('mechanic', 'Mecanico', 0),
	('miner', 'Mineirador', 0),
	('police', 'Policia', 0),
	('reporter', 'Reporter', 0),
	('slaughterer', 'Açougueiro', 0),
	('tailor', 'Alfaiate', 0),
	('taxi', 'Uber', 0),
	('unemployed', 'Desempregado', 0);

-- Copiando estrutura para tabela esx.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.job_grades: ~55 rows (aproximadamente)
INSERT INTO `job_grades` (`id`, `job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	(1, 'unemployed', 0, 'unemployed', 'Vagabundo', 200, '{}', '{}'),
	(2, 'police', 0, 'recruit', 'Militar - Soldado', 20, '{}', '{}'),
	(3, 'police', 1, 'officer', 'Militar - Cabo', 40, '{}', '{}'),
	(4, 'police', 2, 'sergeant', 'Militar - Sargento', 60, '{}', '{}'),
	(5, 'police', 3, 'lieutenant', 'Militar - Tenente', 85, '{}', '{}'),
	(6, 'police', 20, 'boss', 'Comandante Geral', 3500, '{}', '{}'),
	(11, 'cardealer', 0, 'recruit', 'Estagiario', 10, '{}', '{}'),
	(12, 'cardealer', 1, 'novice', 'Vendedor', 25, '{}', '{}'),
	(13, 'cardealer', 2, 'experienced', 'Gerente', 40, '{}', '{}'),
	(14, 'cardealer', 3, 'boss', 'Dono', 0, '{}', '{}'),
	(15, 'lumberjack', 0, 'employee', 'Empregado', 0, '{}', '{}'),
	(16, 'fisherman', 0, 'employee', 'Empregado', 0, '{}', '{}'),
	(17, 'fueler', 0, 'employee', 'Empregado', 0, '{}', '{}'),
	(18, 'reporter', 0, 'employee', 'Empregado', 0, '{}', '{}'),
	(19, 'tailor', 0, 'employee', 'Empregado', 0, '{"mask_1":0,"arms":1,"glasses_1":0,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":0,"torso_1":24,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":0,"lipstick_2":0,"chain_1":0,"tshirt_1":0,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":36,"tshirt_2":0,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":48,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}', '{"mask_1":0,"arms":5,"glasses_1":5,"hair_color_2":4,"makeup_1":0,"face":19,"glasses":0,"mask_2":0,"makeup_3":0,"skin":29,"helmet_2":0,"lipstick_4":0,"sex":1,"torso_1":52,"makeup_2":0,"bags_2":0,"chain_2":0,"ears_1":-1,"bags_1":0,"bproof_1":0,"shoes_2":1,"lipstick_2":0,"chain_1":0,"tshirt_1":23,"eyebrows_3":0,"pants_2":0,"beard_4":0,"torso_2":0,"beard_2":6,"ears_2":0,"hair_2":0,"shoes_1":42,"tshirt_2":4,"beard_3":0,"hair_1":2,"hair_color_1":0,"pants_1":36,"helmet_1":-1,"bproof_2":0,"eyebrows_4":0,"eyebrows_2":0,"decals_1":0,"age_2":0,"beard_1":5,"shoes":10,"lipstick_1":0,"eyebrows_1":0,"glasses_2":0,"makeup_4":0,"decals_2":0,"lipstick_3":0,"age_1":0}'),
	(20, 'miner', 0, 'employee', 'Empregado', 0, '{"tshirt_2":1,"ears_1":8,"glasses_1":15,"torso_2":0,"ears_2":2,"glasses_2":3,"shoes_2":1,"pants_1":75,"shoes_1":51,"bags_1":0,"helmet_2":0,"pants_2":7,"torso_1":71,"tshirt_1":59,"arms":2,"bags_2":0,"helmet_1":0}', '{}'),
	(21, 'slaughterer', 0, 'employee', 'Empregado', 0, '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":67,"pants_1":36,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":0,"torso_1":56,"beard_2":6,"shoes_1":12,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":15,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":0,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}', '{"age_1":0,"glasses_2":0,"beard_1":5,"decals_2":0,"beard_4":0,"shoes_2":0,"tshirt_2":0,"lipstick_2":0,"hair_2":0,"arms":72,"pants_1":45,"skin":29,"eyebrows_2":0,"shoes":10,"helmet_1":-1,"lipstick_1":0,"helmet_2":0,"hair_color_1":0,"glasses":0,"makeup_4":0,"makeup_1":0,"hair_1":2,"bproof_1":0,"bags_1":0,"mask_1":0,"lipstick_3":0,"chain_1":0,"eyebrows_4":0,"sex":1,"torso_1":49,"beard_2":6,"shoes_1":24,"decals_1":0,"face":19,"lipstick_4":0,"tshirt_1":9,"mask_2":0,"age_2":0,"eyebrows_3":0,"chain_2":0,"glasses_1":5,"ears_1":-1,"bags_2":0,"ears_2":0,"torso_2":0,"bproof_2":0,"makeup_2":0,"eyebrows_1":0,"makeup_3":0,"pants_2":0,"beard_3":0,"hair_color_2":4}'),
	(22, 'ambulance', 0, 'ambulance', 'Enfermeiro', 20, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(23, 'ambulance', 1, 'doctor', 'Medico', 40, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(24, 'ambulance', 2, 'chief_doctor', 'Cirurgião Chefe', 60, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(25, 'ambulance', 3, 'boss', 'Diretor', 80, '{"tshirt_2":0,"hair_color_1":5,"glasses_2":3,"shoes":9,"torso_2":3,"hair_color_2":0,"pants_1":24,"glasses_1":4,"hair_1":2,"sex":0,"decals_2":0,"tshirt_1":15,"helmet_1":8,"helmet_2":0,"arms":92,"face":19,"decals_1":60,"torso_1":13,"hair_2":0,"skin":34,"pants_2":5}', '{"tshirt_2":3,"decals_2":0,"glasses":0,"hair_1":2,"torso_1":73,"shoes":1,"hair_color_2":0,"glasses_1":19,"skin":13,"face":6,"pants_2":5,"tshirt_1":75,"pants_1":37,"helmet_1":57,"torso_2":0,"arms":14,"sex":1,"glasses_2":0,"decals_1":0,"hair_2":0,"helmet_2":0,"hair_color_1":0}'),
	(26, 'mechanic', 0, 'recrue', 'Estagiario', 12, '{}', '{}'),
	(27, 'mechanic', 1, 'novice', 'Novato', 24, '{}', '{}'),
	(28, 'mechanic', 2, 'experimente', 'Experiente', 36, '{}', '{}'),
	(29, 'mechanic', 3, 'chief', 'Gerente', 48, '{}', '{}'),
	(30, 'mechanic', 4, 'boss', 'Dono', 0, '{}', '{}'),
	(31, 'taxi', 0, 'recrue', 'Estagiario', 12, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(32, 'taxi', 1, 'novice', 'Motorista', 24, '{"hair_2":0,"hair_color_2":0,"torso_1":32,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":0,"age_2":0,"glasses_2":0,"ears_2":0,"arms":27,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(33, 'taxi', 2, 'experimente', 'Experiente', 36, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(34, 'taxi', 3, 'uber', 'Chefe', 48, '{"hair_2":0,"hair_color_2":0,"torso_1":26,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":57,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":11,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(35, 'taxi', 4, 'boss', 'Patrão', 0, '{"hair_2":0,"hair_color_2":0,"torso_1":29,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":31,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":4,"age_2":0,"glasses_2":0,"ears_2":0,"arms":1,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":0,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":0,"bproof_1":0,"mask_1":0,"decals_1":0,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":4,"eyebrows_1":0,"face":0,"shoes_1":10,"pants_1":24}', '{"hair_2":0,"hair_color_2":0,"torso_1":57,"bags_1":0,"helmet_2":0,"chain_2":0,"eyebrows_3":0,"makeup_3":0,"makeup_2":0,"tshirt_1":38,"makeup_1":0,"bags_2":0,"makeup_4":0,"eyebrows_4":0,"chain_1":0,"lipstick_4":0,"bproof_2":0,"hair_color_1":0,"decals_2":0,"pants_2":1,"age_2":0,"glasses_2":0,"ears_2":0,"arms":21,"lipstick_1":0,"ears_1":-1,"mask_2":0,"sex":1,"lipstick_3":0,"helmet_1":-1,"shoes_2":0,"beard_2":0,"beard_1":0,"lipstick_2":0,"beard_4":0,"glasses_1":5,"bproof_1":0,"mask_1":0,"decals_1":1,"hair_1":0,"eyebrows_2":0,"beard_3":0,"age_1":0,"tshirt_2":0,"skin":0,"torso_2":0,"eyebrows_1":0,"face":0,"shoes_1":49,"pants_1":11}'),
	(36, 'banker', 0, 'advisor', 'Consultante', 10, '{}', '{}'),
	(37, 'banker', 1, 'banker', 'Banqueiro', 20, '{}', '{}'),
	(38, 'banker', 2, 'business_banker', 'Banqueiro Investidor', 30, '{}', '{}'),
	(39, 'banker', 3, 'trader', 'Acionista', 40, '{}', '{}'),
	(40, 'banker', 4, 'boss', 'Dono', 0, '{}', '{}'),
	(41, 'police', 4, 'boss', 'Comandante', 3500, '{}', '{}'),
	(42, 'police', 4, 'boss', 'Comandante', 3500, '{}', '{}'),
	(43, 'police', 4, 'boss', 'Comandante', 3500, '{}', '{}'),
	(44, 'police', 4, 'boss', 'Comandante', 3500, '{}', '{}'),
	(45, 'police', 4, 'major', 'Militar - Major', 90, '{}', '{}'),
	(46, 'police', 5, 'boperecruit', 'Bope - Soldado', 85, '{}', '{}'),
	(47, 'police', 6, 'bopeofficer', 'Bope - Cabo', 85, '{}', '{}'),
	(48, 'police', 7, 'bopesergeant', 'Bope - Sargento', 85, '{}', '{}'),
	(49, 'police', 8, 'bopelieutenant', 'Bope - Tenente', 85, '{}', '{}'),
	(50, 'police', 9, 'bopemajor', 'Bope - Major', 85, '{}', '{}'),
	(51, 'police', 10, 'agente', 'Civil - Agente', 85, '{}', '{}'),
	(52, 'police', 11, 'investigador', 'Civil - Investigador', 85, '{}', '{}'),
	(53, 'police', 12, 'escrivao', 'Civil - Escrivão', 85, '{}', '{}'),
	(54, 'police', 13, 'civilgrr', 'Civil:GRR', 85, '{}', '{}'),
	(55, 'police', 14, 'delegado', 'Civil - Delegado', 85, '{}', '{}'),
	(56, 'police', 15, 'federalaluno', 'Federal - Aluno', 85, '{}', '{}'),
	(57, 'police', 16, 'federalagente', 'Federal - Agente', 85, '{}', '{}'),
	(58, 'police', 17, 'federalescrivao', 'Federal - Escrivão', 85, '{}', '{}'),
	(59, 'police', 18, 'prf', 'Federal Rodoviaria', 85, '{}', '{}'),
	(60, 'police', 19, 'federaldiretor', 'Federal - Diretor', 85, '{}', '{}');

-- Copiando estrutura para tabela esx.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.licenses: ~6 rows (aproximadamente)
INSERT INTO `licenses` (`type`, `label`) VALUES
	('boat', 'Licensa para barcos'),
	('dmv', 'CNH B'),
	('drive', 'Licensa de motorista'),
	('drive_bike', 'CNH A'),
	('drive_truck', 'CNH D'),
	('weapon', 'Weapon License'),
	('weed_processing', 'Licensa de produtor');

-- Copiando estrutura para tabela esx.multicharacter_slots
CREATE TABLE IF NOT EXISTS `multicharacter_slots` (
  `identifier` varchar(46) NOT NULL,
  `slots` int NOT NULL,
  PRIMARY KEY (`identifier`) USING BTREE,
  KEY `slots` (`slots`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.multicharacter_slots: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(46) DEFAULT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint NOT NULL DEFAULT '0',
  `parking` varchar(60) DEFAULT NULL,
  `pound` varchar(60) DEFAULT NULL,
  `mileage` float DEFAULT '0',
  `glovebox` longtext,
  `trunk` longtext,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;


-- Copiando estrutura para tabela esx.ox_inventory
CREATE TABLE IF NOT EXISTS `ox_inventory` (
  `owner` varchar(60) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `data` longtext,
  `lastupdated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  UNIQUE KEY `owner` (`owner`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.ox_inventory: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.phone_app_chat: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner` varchar(46) DEFAULT NULL,
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `accepts` int NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.phone_calls: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `isRead` int NOT NULL DEFAULT '0',
  `owner` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.phone_messages: 0 rows
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Copiando estrutura para tabela esx.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.phone_users_contacts: 0 rows
/*!40000 ALTER TABLE `phone_users_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_users_contacts` ENABLE KEYS */;

-- Copiando estrutura para tabela esx.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int NOT NULL,
  `rent_price` int NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.rented_vehicles: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int NOT NULL AUTO_INCREMENT,
  `identifier` varchar(46) DEFAULT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.society_moneywash: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '0',
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela esx.twitter_accounts: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authorId` int DEFAULT NULL,
  `tweetId` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Copiando dados para a tabela esx.twitter_likes: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `authorId` int NOT NULL,
  `realUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `likes` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela esx.twitter_tweets: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(46) NOT NULL,
  `accounts` longtext,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int DEFAULT '0',
  `loadout` longtext,
  `metadata` longtext,
  `position` longtext,
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int DEFAULT NULL,
  `skin` longtext,
  `status` longtext,
  `is_dead` tinyint(1) DEFAULT '0',
  `id` int NOT NULL AUTO_INCREMENT,
  `disabled` tinyint(1) DEFAULT '0',
  `last_property` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `last_seen` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `phone_number` varchar(20) DEFAULT NULL,
  `pincode` int DEFAULT NULL,
  PRIMARY KEY (`identifier`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;


-- Copiando estrutura para tabela esx.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(46) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.user_licenses: ~0 rows (aproximadamente)
INSERT INTO `user_licenses` (`id`, `type`, `owner`) VALUES
	(1, 'dmv', 'char1:112f6747d461f41ce72962af8e16c7a9eb217203');

-- Copiando estrutura para tabela esx.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.vehicles: ~43 rows (aproximadamente)
INSERT INTO `vehicles` (`name`, `model`, `price`, `category`) VALUES
	('Nissan 350z', '350z', 80000, 'sports'),
	('Acura NSX', 'acuransx', 200000, 'sportsclassics'),
	('Audi R8', 'audir8', 300000, 'super'),
	('Audi RS6', 'audirs6', 400000, 'super'),
	('Bentley Bacalar', 'bentleybacalar', 200000, 'coupes'),
	('Aston Martin DBS', 'astonmartindbs', 200000, 'coupes'),
	('BMW I8', 'bmwi8', 100000, 'super'),
	('BMW M1 WB', 'bmwm1wb', 210000, 'super'),
	('BMW M4 GTS', 'bmwm4gts', 200000, 'super'),
	('BMW M5 E34', 'bmwm5e34', 120000, 'super'),
	('Bmw R1200', 'bmwr1200', 80000, 'motorcycles'),
	('Bugatti Atlantic', 'bugattiatlantic', 500000, 'super'),
	('Chevrolet Camaro', 'camaro', 200000, 'muscle'),
	('Honda Civic Type R', 'civictyper', 200000, 'sports'),
	('Chevrolet Corvette C7', 'corvettec7', 170000, 'super'),
	('Dodge charger 70', 'dodgecharger1970', 200000, 'muscle'),
	('Dodge charger 2014', 'dodgecharger2014', 200000, 'muscle'),
	('Dodge charger RT 69', 'dodgechargerrt69', 200000, 'muscle'),
	('Cadillac Escalade', 'escalade2021', 150000, 'suvs'),
	('Cadillac Escalade GT900', 'escaladegt900', 200000, 'suvs'),
	('Ferrari 812', 'ferrari812', 530000, 'super'),
	('Ferrari F12', 'ferrarif12', 500000, 'super'),
	('Ferrari F40', 'ferrarif40', 1000000, 'sportsclassics'),
	('Ferrari Italia', 'ferrariitalia', 600000, 'super'),
	('Ford Mustang', 'fordmustang', 200000, 'muscle'),
	('Vw Golf GTI', 'golfgti', 80000, 'sports'),
	('Vw Golf mk7', 'golfmk7', 50000, 'sports'),
	('BMW M8 Competition', 'm8competition', 350000, 'super'),
	('Porsche Panamera', 'panameramansory', 320000, 'super'),
	('Porsche 911', 'porsche911', 300000, 'super'),
	('Skyline r34', 'skyliner34', 250000, 'sports'),
	('Subaru BRZ', 'subarubrz', 200000, 'sports'),
	('Subaru Impreza WRX', 'subaruimpreza', 190000, 'sports'),
	('Toyota Supra', 'toyotasupra', 200000, 'sports'),
	('Vw Touareg', 'vwtouareg', 50000, 'suvs'),
	('Lamborghuini Aventador', 'aventador', 400000, 'super'),
	('Lancer Evolution 9', 'lancerevolution9', 170000, 'sports'),
	('Lancer Evolution X', 'lancerevolutionx', 180000, 'sports'),
	('Mercedes AMG G63', 'mercedesamg63', 300000, 'super'),
	('Nissan GTR', 'nissangtr', 170000, 'super'),
	('Aston Martin DBS', 'jeepcherokee', 80000, 'suvs'),
	('Yamaha R1', 'r1', 85000, 'motorcycles');

-- Copiando estrutura para tabela esx.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.vehicle_categories: ~11 rows (aproximadamente)
INSERT INTO `vehicle_categories` (`name`, `label`) VALUES
	('compacts', 'Compactos'),
	('coupes', 'Coupés'),
	('motorcycles', 'Motos'),
	('muscle', 'Muscle'),
	('offroad', 'Off Road'),
	('sedans', 'Sedans'),
	('sports', 'Esportivos'),
	('sportsclassics', 'Esportivos Classicos'),
	('super', 'Super Carros'),
	('suvs', 'SUVs'),
	('vans', 'Vans');

-- Copiando estrutura para tabela esx.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `id` int NOT NULL AUTO_INCREMENT,
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.vehicle_sold: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.whitelist
CREATE TABLE IF NOT EXISTS `whitelist` (
  `identifier` varchar(46) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Copiando dados para a tabela esx.whitelist: ~0 rows (aproximadamente)

-- Copiando estrutura para tabela esx.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `firstname` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Copiando dados para a tabela esx.yellow_tweets: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
