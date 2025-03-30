/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 10.4.32-MariaDB : Database - ppvs
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ppvs` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `ppvs`;

/*Table structure for table `address` */

DROP TABLE IF EXISTS `address`;

CREATE TABLE `address` (
  `addressId` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY (`addressId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `address` */

insert  into `address`(`addressId`,`address`) values 
(1,'asdasd'),
(2,'sadas');

/*Table structure for table `applicant` */

DROP TABLE IF EXISTS `applicant`;

CREATE TABLE `applicant` (
  `applicantID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) NOT NULL,
  `middleName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) NOT NULL,
  `dateOfBirth` date NOT NULL,
  `gender` enum('Male','Female','Others') NOT NULL,
  `nID` int(11) DEFAULT NULL,
  `contactID` int(11) NOT NULL,
  `addressID` int(11) NOT NULL,
  PRIMARY KEY (`applicantID`),
  KEY `nID` (`nID`),
  CONSTRAINT `applicant_ibfk_1` FOREIGN KEY (`nID`) REFERENCES `nationality` (`nID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `applicant` */

insert  into `applicant`(`applicantID`,`firstName`,`middleName`,`lastName`,`dateOfBirth`,`gender`,`nID`,`contactID`,`addressID`) values 
(1,'asdasd','asdasd','asdasd','2025-03-30','Male',1,1,1),
(2,'asdsadsad','asdsdas','sasdasd','2025-03-30','Male',1,2,2);

/*Table structure for table `application` */

DROP TABLE IF EXISTS `application`;

CREATE TABLE `application` (
  `applicationID` int(11) NOT NULL AUTO_INCREMENT,
  `applicantID` int(11) DEFAULT NULL,
  `submittion_date` datetime DEFAULT NULL,
  `status` enum('waiting','approved','rejected','cancelled') DEFAULT NULL,
  PRIMARY KEY (`applicationID`),
  KEY `applicantID` (`applicantID`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`applicantID`) REFERENCES `applicant` (`applicantID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `application` */

insert  into `application`(`applicationID`,`applicantID`,`submittion_date`,`status`) values 
(1,1,'2025-03-30 15:58:53','rejected'),
(2,2,'2025-03-30 15:59:28','approved');

/*Table structure for table `applicationdocuments` */

DROP TABLE IF EXISTS `applicationdocuments`;

CREATE TABLE `applicationdocuments` (
  `applicationID` int(11) NOT NULL,
  `passportID` int(11) NOT NULL,
  `documentID` int(11) DEFAULT NULL,
  KEY `passportID` (`passportID`),
  KEY `personalID` (`applicationID`),
  CONSTRAINT `applicationdocuments_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `applicant` (`applicantID`),
  CONSTRAINT `applicationdocuments_ibfk_2` FOREIGN KEY (`passportID`) REFERENCES `passportdetails` (`passportID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `applicationdocuments` */

insert  into `applicationdocuments`(`applicationID`,`passportID`,`documentID`) values 
(1,1,1),
(2,2,2);

/*Table structure for table `contact` */

DROP TABLE IF EXISTS `contact`;

CREATE TABLE `contact` (
  `contactId` int(11) NOT NULL AUTO_INCREMENT,
  `contact` varchar(255) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `contact` */

insert  into `contact`(`contactId`,`contact`,`type`) values 
(1,'sad',NULL),
(2,'asd',NULL);

/*Table structure for table `documents` */

DROP TABLE IF EXISTS `documents`;

CREATE TABLE `documents` (
  `documentID` int(11) NOT NULL AUTO_INCREMENT,
  `documentName` varchar(255) NOT NULL,
  `documentServerPath` varchar(255) NOT NULL,
  `uploadDate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`documentID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `documents` */

insert  into `documents`(`documentID`,`documentName`,`documentServerPath`,`uploadDate`) values 
(1,'1743321533_043.jpg','C:/xampp/htdocs/TourAndTravel/PPVS/server/documents/1743321533_043.jpg','2025-03-30 15:58:53'),
(2,'1743321568_044.jpg','C:/xampp/htdocs/TourAndTravel/PPVS/server/documents/1743321568_044.jpg','2025-03-30 15:59:28');

/*Table structure for table `email` */

DROP TABLE IF EXISTS `email`;

CREATE TABLE `email` (
  `emailID` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `applicantID` int(11) NOT NULL,
  PRIMARY KEY (`emailID`),
  KEY `applicantID` (`applicantID`),
  CONSTRAINT `email_ibfk_1` FOREIGN KEY (`applicantID`) REFERENCES `applicant` (`applicantID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `email` */

insert  into `email`(`emailID`,`email`,`applicantID`) values 
(1,'asdasd',1),
(2,'asd',2);

/*Table structure for table `issuing_country` */

DROP TABLE IF EXISTS `issuing_country`;

CREATE TABLE `issuing_country` (
  `countryID` int(11) NOT NULL AUTO_INCREMENT,
  `countryName` varchar(50) DEFAULT NULL,
  `country_code` varchar(3) NOT NULL,
  PRIMARY KEY (`countryID`),
  UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `issuing_country` */

insert  into `issuing_country`(`countryID`,`countryName`,`country_code`) values 
(1,'Afghanistan','AFG'),
(2,'Albania','ALB'),
(3,'Algeria','DZA'),
(4,'Andorra','AND'),
(5,'Angola','AGO'),
(6,'Antigua and Barbuda','ATG'),
(7,'Argentina','ARG'),
(8,'Armenia','ARM'),
(9,'Australia','AUS'),
(10,'Austria','AUT'),
(11,'Azerbaijan','AZE'),
(12,'Bahamas, The','BHS'),
(13,'Bahrain','BHR'),
(14,'Bangladesh','BGD'),
(15,'Barbados','BRB'),
(16,'Belarus','BLR'),
(17,'Belgium','BEL'),
(18,'Belize','BLZ'),
(19,'Benin','BEN'),
(20,'Bhutan','BTN'),
(21,'Bolivia','BOL'),
(22,'Bosnia and Herzegovina','BIH'),
(23,'Botswana','BWA'),
(24,'Brazil','BRA'),
(25,'Brunei','BRN'),
(26,'Bulgaria','BGR'),
(27,'Burkina Faso','BFA'),
(28,'Burundi','BDI'),
(29,'Cambodia','KHM'),
(30,'Cameroon','CMR'),
(31,'Canada','CAN'),
(32,'Cape Verde','CPV'),
(33,'Central African Republic','CAF'),
(34,'Chad','TCD'),
(35,'Chile','CHL'),
(36,'China','CHN'),
(37,'Colombia','COL'),
(38,'Comoros','COM'),
(39,'Congo','COG'),
(40,'Congo (Democratic Republic)','COD'),
(41,'Costa Rica','CRI'),
(42,'Croatia','HRV'),
(43,'Cuba','CUB'),
(44,'Cyprus','CYP'),
(45,'Czechia','CZE'),
(46,'Denmark','DNK'),
(47,'Djibouti','DJI'),
(48,'Dominica','DMA'),
(49,'Dominican Republic','DOM'),
(50,'East Timor','TLS'),
(51,'Ecuador','ECU'),
(52,'Egypt','EGY'),
(53,'El Salvador','SLV'),
(54,'Equatorial Guinea','GNQ'),
(55,'Eritrea','ERI'),
(56,'Estonia','EST'),
(57,'Eswatini','SWZ'),
(58,'Ethiopia','ETH'),
(59,'Fiji','FJI'),
(60,'Finland','FIN'),
(61,'France','FRA'),
(62,'Gabon','GAB'),
(63,'Gambia, The','GMB'),
(64,'Georgia','GEO'),
(65,'Germany','DEU'),
(66,'Ghana','GHA'),
(67,'Greece','GRC'),
(68,'Grenada','GRD'),
(69,'Guatemala','GTM'),
(70,'Guinea','GIN'),
(71,'Guinea-Bissau','GNB'),
(72,'Guyana','GUY'),
(73,'Haiti','HTI'),
(74,'Honduras','HND'),
(75,'Hungary','HUN'),
(76,'Iceland','ISL'),
(77,'India','IND'),
(78,'Indonesia','IDN'),
(79,'Iran','IRN'),
(80,'Iraq','IRQ'),
(81,'Ireland','IRL'),
(82,'Israel','ISR'),
(83,'Italy','ITA'),
(84,'Ivory Coast','CIV'),
(85,'Jamaica','JAM'),
(86,'Japan','JPN'),
(87,'Jordan','JOR'),
(88,'Kazakhstan','KAZ'),
(89,'Kenya','KEN'),
(90,'Kiribati','KIR'),
(91,'Kosovo','XKX'),
(92,'Kuwait','KWT'),
(93,'Kyrgyzstan','KGZ'),
(94,'Laos','LAO'),
(95,'Latvia','LVA'),
(96,'Lebanon','LBN'),
(97,'Lesotho','LSO'),
(98,'Liberia','LBR'),
(99,'Libya','LBY'),
(100,'Liechtenstein','LIE'),
(101,'Lithuania','LTU'),
(102,'Luxembourg','LUX'),
(103,'Madagascar','MDG'),
(104,'Malawi','MWI'),
(105,'Malaysia','MYS'),
(106,'Maldives','MDV'),
(107,'Mali','MLI'),
(108,'Malta','MLT'),
(109,'Marshall Islands','MHL'),
(110,'Mauritania','MRT'),
(111,'Mauritius','MUS'),
(112,'Mexico','MEX'),
(113,'Federated States of Micronesia','FSM'),
(114,'Moldova','MDA'),
(115,'Monaco','MCO'),
(116,'Mongolia','MNG'),
(117,'Montenegro','MNE'),
(118,'Morocco','MAR'),
(119,'Mozambique','MOZ'),
(120,'Myanmar (Burma)','MMR'),
(121,'Namibia','NAM'),
(122,'Nauru','NRU'),
(123,'Nepal','NPL'),
(124,'Netherlands','NLD'),
(125,'New Zealand','NZL'),
(126,'Nicaragua','NIC'),
(127,'Niger','NER'),
(128,'Nigeria','NGA'),
(129,'North Korea','PRK'),
(130,'North Macedonia','MKD'),
(131,'Norway','NOR'),
(132,'Oman','OMN'),
(133,'Pakistan','PAK'),
(134,'Palau','PLW'),
(135,'Panama','PAN'),
(136,'Papua New Guinea','PNG'),
(137,'Paraguay','PRY'),
(138,'Peru','PER'),
(139,'Philippines','PHL'),
(140,'Poland','POL'),
(141,'Portugal','PRT'),
(142,'Qatar','QAT'),
(143,'Romania','ROU'),
(144,'Russia','RUS'),
(145,'Rwanda','RWA'),
(146,'St Kitts and Nevis','KNA'),
(147,'St Lucia','LCA'),
(148,'St Vincent','VCT'),
(149,'Samoa','WSM'),
(150,'San Marino','SMR'),
(151,'Sao Tome and Principe','STP'),
(152,'Saudi Arabia','SAU'),
(153,'Senegal','SEN'),
(154,'Serbia','SRB'),
(155,'Seychelles','SYC'),
(156,'Sierra Leone','SLE'),
(157,'Singapore','SGP'),
(158,'Slovakia','SVK'),
(159,'Slovenia','SVN'),
(160,'Solomon Islands','SLB'),
(161,'Somalia','SOM'),
(162,'South Africa','ZAF'),
(163,'South Korea','KOR'),
(164,'South Sudan','SSD'),
(165,'Spain','ESP'),
(166,'Sri Lanka','LKA'),
(167,'Sudan','SDN'),
(168,'Suriname','SUR'),
(169,'Sweden','SWE'),
(170,'Switzerland','CHE'),
(171,'Syria','SYR'),
(172,'Tajikistan','TJK'),
(173,'Tanzania','TZA'),
(174,'Thailand','THA'),
(175,'Togo','TGO'),
(176,'Tonga','TON'),
(177,'Trinidad and Tobago','TTO'),
(178,'Tunisia','TUN'),
(179,'Turkey','TUR'),
(180,'Turkmenistan','TKM'),
(181,'Tuvalu','TUV'),
(182,'Uganda','UGA'),
(183,'Ukraine','UKR'),
(184,'United Arab Emirates','ARE'),
(185,'United Kingdom','GBR'),
(186,'United States','USA'),
(187,'Uruguay','URY'),
(188,'Uzbekistan','UZB'),
(189,'Vanuatu','VUT'),
(190,'Vatican City','VAT'),
(191,'Venezuela','VEN'),
(192,'Vietnam','VNM'),
(193,'Yemen','YEM'),
(194,'Zambia','ZMB'),
(195,'Zimbabwe','ZWE');

/*Table structure for table `nationality` */

DROP TABLE IF EXISTS `nationality`;

CREATE TABLE `nationality` (
  `nID` int(11) NOT NULL AUTO_INCREMENT,
  `nationality` varchar(30) NOT NULL,
  PRIMARY KEY (`nID`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `nationality` */

insert  into `nationality`(`nID`,`nationality`) values 
(1,'Afghan'),
(2,'Albanian'),
(3,'Algerian'),
(4,'Andorran'),
(5,'Angolan'),
(6,'Citizen of Antigua and Barbuda'),
(7,'Argentine'),
(8,'Armenian'),
(9,'Australian'),
(10,'Austrian'),
(11,'Azerbaijani'),
(12,'Bahamian'),
(13,'Bahraini'),
(14,'Bangladeshi'),
(15,'Barbadian'),
(16,'Belarusian'),
(17,'Belgian'),
(18,'Belizean'),
(19,'Beninese'),
(20,'Bhutanese'),
(21,'Bolivian'),
(22,'Citizen of Bosnia and Herzegov'),
(23,'Botswanan'),
(24,'Brazilian'),
(25,'Bruneian'),
(26,'Bulgarian'),
(27,'Burkinabe'),
(28,'Burundian'),
(29,'Cambodian'),
(30,'Cameroonian'),
(31,'Canadian'),
(32,'Cape Verdean'),
(33,'Central African'),
(34,'Chadian'),
(35,'Chilean'),
(36,'Chinese'),
(37,'Colombian'),
(38,'Comorian'),
(39,'Congolese'),
(40,'Congolese (DRC)'),
(41,'Costa Rican'),
(42,'Croatian'),
(43,'Cuban'),
(44,'Cypriot'),
(45,'Czech'),
(46,'Danish'),
(47,'Djiboutian'),
(48,'Dominiquet'),
(49,'Dominican'),
(50,'East Timorese'),
(51,'Ecuadorean'),
(52,'Egyptian'),
(53,'Salvadoran'),
(54,'Equatorial Guinean'),
(55,'Eritrean'),
(56,'Estonian'),
(57,'Swazi'),
(58,'Ethiopian'),
(59,'Fijian'),
(60,'Finnish'),
(61,'French'),
(62,'Gabonese'),
(63,'Gambian'),
(64,'Georgian'),
(65,'German'),
(66,'Ghanaian'),
(67,'Greek'),
(68,'Grenadian'),
(69,'Guatemalan'),
(70,'Guinean'),
(71,'Guinea-Bissauan'),
(72,'Guyanese'),
(73,'Haitian'),
(74,'Honduran'),
(75,'Hungarian'),
(76,'Icelander'),
(77,'Indian'),
(78,'Indonesian'),
(79,'Iranian'),
(80,'Iraqi'),
(81,'Irish'),
(82,'Israeli'),
(83,'Italian'),
(84,'Ivorian'),
(85,'Jamaican'),
(86,'Japanese'),
(87,'Jordanian'),
(88,'Kazakh'),
(89,'Kenyan'),
(90,'Citizen of Kiribati'),
(91,'Kosovan'),
(92,'Kuwaiti'),
(93,'Kyrgyz'),
(94,'Lao'),
(95,'Latvian'),
(96,'Lebanese'),
(97,'Mosotho'),
(98,'Liberian'),
(99,'Libyan'),
(100,'Liechtensteiner'),
(101,'Lithuanian'),
(102,'Luxembourger'),
(103,'Malagasy'),
(104,'Malawian'),
(105,'Malaysian'),
(106,'Maldivian'),
(107,'Malian'),
(108,'Maltese'),
(109,'Marshallese'),
(110,'Mauritanian'),
(111,'Mauritian'),
(112,'Mexican'),
(113,'Micronesian'),
(114,'Moldovan'),
(115,'Monegasque'),
(116,'Mongolian'),
(117,'Montenegrin'),
(118,'Moroccan'),
(119,'Mozambican'),
(120,'Burmese'),
(121,'Namibian'),
(122,'Nauruan'),
(123,'Nepalese'),
(124,'Dutch'),
(125,'New Zealander'),
(126,'Nicaraguan'),
(127,'Nigerien'),
(128,'Nigerian'),
(129,'North Korean'),
(130,'Macedonian'),
(131,'Norwegian'),
(132,'Omani'),
(133,'Pakistani'),
(134,'Palauan'),
(135,'Panamanian'),
(136,'Papua New Guinean'),
(137,'Paraguayan'),
(138,'Peruvian'),
(139,'Filipino'),
(140,'Polish'),
(141,'Portuguese'),
(142,'Qatari'),
(143,'Romanian'),
(144,'Russian'),
(145,'Rwandan'),
(146,'Kittitian'),
(147,'Saint Lucian'),
(148,'Vincentian'),
(149,'Samoan'),
(150,'Sammarinese'),
(151,'Sao Tomean'),
(152,'Saudi Arabian'),
(153,'Senegalese'),
(154,'Serbian'),
(155,'Seychellois'),
(156,'Sierra Leonean'),
(157,'Singaporean'),
(158,'Slovak'),
(159,'Slovenian'),
(160,'Solomon Islander'),
(161,'Somali'),
(162,'South African'),
(163,'South Korean'),
(164,'South Sudanese'),
(165,'Spanish'),
(166,'Sri Lankan'),
(167,'Sudanese'),
(168,'Surinamese'),
(169,'Swedish'),
(170,'Swiss'),
(171,'Syrian'),
(172,'Tajik'),
(173,'Tanzanian'),
(174,'Thai'),
(175,'Togolese'),
(176,'Tongan'),
(177,'Trinidadian'),
(178,'Tunisian'),
(179,'Turkish'),
(180,'Turkmen'),
(181,'Tuvaluan'),
(182,'Ugandan'),
(183,'Ukrainian'),
(184,'Emirati'),
(185,'British'),
(186,'American'),
(187,'Uruguayan'),
(188,'Uzbek'),
(189,'Vanuatuan'),
(190,'Vatican citizen'),
(191,'Venezuelan'),
(192,'Vietnamese'),
(193,'Yemeni'),
(194,'Zambian'),
(195,'Zimbabwean');

/*Table structure for table `passportdetails` */

DROP TABLE IF EXISTS `passportdetails`;

CREATE TABLE `passportdetails` (
  `passportID` int(11) NOT NULL AUTO_INCREMENT,
  `passportNumber` varchar(20) NOT NULL,
  `passportType` char(1) NOT NULL,
  `countryID` int(11) NOT NULL,
  `dateOfIssue` date NOT NULL,
  `dateOfExpiry` date NOT NULL,
  PRIMARY KEY (`passportID`),
  KEY `countryID` (`countryID`),
  CONSTRAINT `passportdetails_ibfk_2` FOREIGN KEY (`countryID`) REFERENCES `issuing_country` (`countryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `passportdetails` */

insert  into `passportdetails`(`passportID`,`passportNumber`,`passportType`,`countryID`,`dateOfIssue`,`dateOfExpiry`) values 
(1,'asdasd','P',1,'2025-03-30','2025-03-30'),
(2,'asdasd','P',1,'2025-03-30','2025-03-30');

/*Table structure for table `rejections` */

DROP TABLE IF EXISTS `rejections`;

CREATE TABLE `rejections` (
  `rejectionID` int(11) NOT NULL AUTO_INCREMENT,
  `applicationID` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rejectionID`),
  KEY `applicationID` (`applicationID`),
  CONSTRAINT `rejections_ibfk_1` FOREIGN KEY (`applicationID`) REFERENCES `application` (`applicationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `rejections` */

insert  into `rejections`(`rejectionID`,`applicationID`,`description`) values 
(1,1,'asdasdsd');

/* Procedure structure for procedure `insertApplication` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertApplication` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertApplication`(
	IN p_firstName VARCHAR(50),
	IN p_middleName VARCHAR(50),
	IN p_lastName VARCHAR(50),
	IN p_dateOfBirth DATE,
	IN p_gender ENUM("Male","Female", "Others"),
	IN p_nationalityID INT,
	IN p_address VARCHAR(255),
	IN p_email VARCHAR(255),
	IN p_contact VARCHAR(11),
	IN p_documentName VARCHAR(255),
	IN p_documentServerPath VARCHAR(255),
	IN p_passportNumber VARCHAR(20),
	IN p_passportType CHAR(1),
	IN p_issuingCountryID INT,
	IN p_dateOfIssue DATE,
	IN p_dateOfExpiry DATE	
)
BEGIN
	DECLARE new_addressId INT;
	DECLARE new_contactId INT;
	DECLARE new_emailId INT;
	DECLARE new_applicantId INT;
	DECLARE new_applicationId INT;
	DECLARE new_documentId INT;
	DECLARE new_passportId INT;

	-- START TRANSACTION
	START TRANSACTION;

	-- Insert into address
	INSERT INTO address(address) VALUES (p_address);
	SET new_addressId = LAST_INSERT_ID();
	
	-- Insert into contact
	INSERT INTO contact(contact) VALUES (p_contact);
	SET new_contactId = LAST_INSERT_ID();
	
	-- Insert into applicant
	INSERT INTO applicant(firstName, middleName, lastName, dateOfBirth, gender, nID, contactID, addressID) 
	VALUES (p_firstName, p_middleName, p_lastName, p_dateOfBirth, p_gender, p_nationalityID, new_contactId, new_addressId);
	SET new_applicantId = LAST_INSERT_ID();
	
	-- Insert into email
	INSERT INTO email(email, applicantID) VALUES (p_email, new_applicantId);
	SET new_emailId = LAST_INSERT_ID();
	
	-- Insert into application
	INSERT INTO application(applicantID, submittion_date, `STATUS`) 
	VALUES (new_applicantId, NOW(), "waiting");
	SET new_applicationId = LAST_INSERT_ID();
	
	-- Insert into documents
	INSERT INTO documents(documentName, documentServerPath) 
	VALUES (p_documentName, p_documentServerPath);
	SET new_documentId = LAST_INSERT_ID();
	
	-- Insert into passportdetails
	INSERT INTO passportdetails(passportNumber, passportType, countryID, dateOfIssue, dateOfExpiry) 
	VALUES (p_passportNumber, p_passportType, p_issuingCountryID, p_dateOfIssue, p_dateOfExpiry);
	SET new_passportId = LAST_INSERT_ID();
	
	-- Insert into applicationdocuments
	INSERT INTO applicationdocuments(applicationID, passportID, documentID)
	VALUES (new_applicationId, new_passportId, new_documentId);

	-- COMMIT TRANSACTION
	COMMIT;

END */$$
DELIMITER ;

/* Procedure structure for procedure `resetDB` */

/*!50003 DROP PROCEDURE IF EXISTS  `resetDB` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `resetDB`()
BEGIN
	SET FOREIGN_KEY_CHECKS = 0;
	
	TRUNCATE TABLE email;
	TRUNCATE TABLE application;
	TRUNCATE TABLE applicant;
	TRUNCATE TABLE applicationdocuments;	
	TRUNCATE table address;
	TRUNCATE TABLE contact;
	TRUNCATE TABLE documents;
	TRUNCATE TABLE passportdetails;
	TRUNCATE TABLE rejections;
	SET FOREIGN_KEY_CHECKS = 1;
	
END */$$
DELIMITER ;

/*Table structure for table `getcustomerdocuments` */

DROP TABLE IF EXISTS `getcustomerdocuments`;

/*!50001 DROP VIEW IF EXISTS `getcustomerdocuments` */;
/*!50001 DROP TABLE IF EXISTS `getcustomerdocuments` */;

/*!50001 CREATE TABLE  `getcustomerdocuments`(
 `applicationID` int(11) ,
 `documentID` int(11) ,
 `documentName` varchar(255) ,
 `documentServerPath` varchar(255) 
)*/;

/*Table structure for table `getpassportinfo` */

DROP TABLE IF EXISTS `getpassportinfo`;

/*!50001 DROP VIEW IF EXISTS `getpassportinfo` */;
/*!50001 DROP TABLE IF EXISTS `getpassportinfo` */;

/*!50001 CREATE TABLE  `getpassportinfo`(
 `applicationID` int(11) ,
 `passportID` int(11) ,
 `passportNumber` varchar(20) ,
 `status` enum('waiting','approved','rejected','cancelled') ,
 `firstName` varchar(50) ,
 `middleName` varchar(50) ,
 `lastName` varchar(50) ,
 `dateOfBirth` date ,
 `gender` enum('Male','Female','Others') ,
 `nationality` varchar(30) 
)*/;

/*Table structure for table `getpassportlist` */

DROP TABLE IF EXISTS `getpassportlist`;

/*!50001 DROP VIEW IF EXISTS `getpassportlist` */;
/*!50001 DROP TABLE IF EXISTS `getpassportlist` */;

/*!50001 CREATE TABLE  `getpassportlist`(
 `applicationID` int(11) ,
 `documentID` int(11) ,
 `passportID` int(11) ,
 `passportNumber` varchar(20) ,
 `status` enum('waiting','approved','rejected','cancelled') 
)*/;

/*View structure for view getcustomerdocuments */

/*!50001 DROP TABLE IF EXISTS `getcustomerdocuments` */;
/*!50001 DROP VIEW IF EXISTS `getcustomerdocuments` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getcustomerdocuments` AS select `ad`.`applicationID` AS `applicationID`,`d`.`documentID` AS `documentID`,`d`.`documentName` AS `documentName`,`d`.`documentServerPath` AS `documentServerPath` from (`documents` `d` join `applicationdocuments` `ad` on(`d`.`documentID` = `ad`.`documentID`)) */;

/*View structure for view getpassportinfo */

/*!50001 DROP TABLE IF EXISTS `getpassportinfo` */;
/*!50001 DROP VIEW IF EXISTS `getpassportinfo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getpassportinfo` AS select `ad`.`applicationID` AS `applicationID`,`ps`.`passportID` AS `passportID`,`ps`.`passportNumber` AS `passportNumber`,`ap`.`status` AS `status`,`a`.`firstName` AS `firstName`,`a`.`middleName` AS `middleName`,`a`.`lastName` AS `lastName`,`a`.`dateOfBirth` AS `dateOfBirth`,`a`.`gender` AS `gender`,`n`.`nationality` AS `nationality` from ((((`passportdetails` `ps` join `applicationdocuments` `ad` on(`ps`.`passportID` = `ad`.`passportID`)) join `application` `ap` on(`ap`.`applicationID` = `ad`.`applicationID`)) join `applicant` `a` on(`a`.`applicantID` = `ap`.`applicantID`)) join `nationality` `n` on(`a`.`nID` = `n`.`nID`)) */;

/*View structure for view getpassportlist */

/*!50001 DROP TABLE IF EXISTS `getpassportlist` */;
/*!50001 DROP VIEW IF EXISTS `getpassportlist` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `getpassportlist` AS select `ad`.`applicationID` AS `applicationID`,`ad`.`documentID` AS `documentID`,`ps`.`passportID` AS `passportID`,`ps`.`passportNumber` AS `passportNumber`,`ap`.`status` AS `status` from ((`passportdetails` `ps` join `applicationdocuments` `ad` on(`ps`.`passportID` = `ad`.`passportID`)) join `application` `ap` on(`ap`.`applicationID` = `ad`.`applicationID`)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
