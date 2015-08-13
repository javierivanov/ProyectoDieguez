-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 30, 2015 at 03:38 PM
-- Server version: 5.5.40-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ci`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=12 ;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`) VALUES
(1, '''Pol&iacute;tica de Seguridad'''),
(2, '''Organizaci&oacute;n de la Seguridad de la Informaci&oacute;n'''),
(3, '''Gesti&oacute;n de Activos'''),
(4, '''Seguridad de los Recursos Humanos'''),
(5, '''Seguridad F&iacute;sica y Ambiental'''),
(6, '''Gesti&oacute;n de las Comunicaciones y Operaciones'''),
(7, '''Control de Acceso'''),
(8, '''Adquisici&oacute;n y Desarrollo de Sistemas Inform&aacute;ticos'''),
(9, '''Gesti&oacute;n de incidentes en la seguridad de la Informaci&oacute;n'''),
(10, '''Gesti&oacute;n de Continuidad del Negocio'''),
(11, '''Cumplimiento''');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('4ba636bb5b0ba086399ff8e1d46e6c11', '192.168.56.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5', 1419625150, 'a:2:{s:11:"user_online";i:1;s:7:"user_id";s:1:"1";}'),
('62739cd6411cdb10ec6e09fdaabd1f03', '192.168.56.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5', 1419612641, 'a:3:{s:9:"user_data";s:0:"";s:11:"user_online";i:1;s:7:"user_id";s:1:"1";}'),
('f588b43c818fdf2b252e205de2a202e8', '192.168.56.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/600.2.5 (KHTML, like Gecko) Version/8.0.2 Safari/600.2.5', 1419642592, '');

-- --------------------------------------------------------

--
-- Table structure for table `cuestionarios`
--

CREATE TABLE IF NOT EXISTS `cuestionarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `cuestionarios`
--

INSERT INTO `cuestionarios` (`id`, `nombre`, `fecha`) VALUES
(1, 'Cuestionario de prueba', '2014-12-23 16:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `historial_logins`
--

CREATE TABLE IF NOT EXISTS `historial_logins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `historial_logins`
--

INSERT INTO `historial_logins` (`id`, `uid`, `dt`) VALUES
(1, 1, '2014-12-23 18:25:44'),
(2, 1, '2014-12-26 13:18:30'),
(3, 1, '2014-12-26 17:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `keys_usuarios`
--

CREATE TABLE IF NOT EXISTS `keys_usuarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `generated_key` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `normas`
--

CREATE TABLE IF NOT EXISTS `normas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `norma` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `normas`
--

INSERT INTO `normas` (`id`, `norma`) VALUES
(1, 'GUI'),
(2, 'ISO'),
(3, 'D83');

-- --------------------------------------------------------

--
-- Table structure for table `normas_en_preguntas`
--

CREATE TABLE IF NOT EXISTS `normas_en_preguntas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) NOT NULL,
  `nid` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=213 ;

--
-- Dumping data for table `normas_en_preguntas`
--

INSERT INTO `normas_en_preguntas` (`id`, `pid`, `nid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 4, 1),
(5, 6, 1),
(6, 6, 2),
(7, 14, 1),
(8, 15, 1),
(9, 15, 2),
(10, 17, 1),
(11, 18, 1),
(12, 18, 2),
(13, 18, 3),
(14, 19, 1),
(15, 25, 1),
(16, 26, 1),
(17, 27, 1),
(18, 30, 1),
(19, 38, 1),
(20, 38, 2),
(21, 38, 3),
(22, 39, 1),
(23, 39, 2),
(24, 39, 3),
(25, 40, 1),
(26, 41, 1),
(27, 44, 1),
(28, 45, 1),
(29, 48, 1),
(30, 49, 1),
(31, 53, 1),
(32, 53, 2),
(33, 53, 3),
(34, 54, 1),
(35, 54, 2),
(36, 55, 1),
(37, 55, 2),
(38, 56, 1),
(39, 56, 2),
(40, 57, 1),
(41, 57, 2),
(42, 57, 3),
(43, 58, 1),
(44, 58, 2),
(45, 59, 1),
(46, 59, 2),
(47, 60, 1),
(48, 60, 2),
(49, 61, 1),
(50, 61, 2),
(51, 61, 3),
(52, 62, 1),
(53, 63, 1),
(54, 63, 2),
(55, 66, 1),
(56, 66, 2),
(57, 95, 1),
(58, 95, 2),
(59, 96, 1),
(60, 96, 2),
(61, 102, 1),
(62, 102, 2),
(63, 115, 1),
(64, 115, 2),
(65, 119, 1),
(66, 120, 1),
(67, 127, 1),
(68, 127, 2),
(69, 127, 3),
(70, 128, 1),
(71, 129, 1),
(72, 130, 1),
(73, 142, 1),
(74, 142, 2),
(75, 142, 3),
(76, 145, 1),
(77, 145, 2),
(78, 167, 1),
(79, 167, 2),
(80, 168, 1),
(81, 168, 2),
(82, 168, 3),
(83, 169, 1),
(84, 169, 2),
(85, 170, 1),
(86, 170, 2),
(87, 173, 1),
(88, 173, 2),
(89, 174, 1),
(90, 174, 2),
(91, 175, 1),
(92, 175, 2),
(93, 179, 1),
(94, 179, 2),
(95, 224, 1),
(96, 224, 2),
(97, 224, 3),
(98, 225, 1),
(99, 225, 2),
(100, 225, 3),
(101, 253, 1),
(102, 253, 2),
(103, 279, 1),
(104, 279, 2),
(105, 279, 3),
(106, 280, 1),
(107, 280, 2),
(108, 283, 1),
(109, 283, 2),
(110, 284, 1),
(111, 284, 2),
(112, 288, 1),
(113, 288, 2),
(114, 289, 1),
(115, 289, 2),
(116, 289, 3),
(117, 298, 1),
(118, 299, 1),
(119, 300, 1),
(120, 304, 1),
(121, 304, 2),
(122, 327, 1),
(123, 327, 2),
(124, 331, 1),
(125, 331, 2),
(126, 331, 3),
(127, 333, 1),
(128, 338, 1),
(129, 341, 1),
(130, 354, 1),
(131, 354, 2),
(132, 355, 1),
(133, 356, 1),
(134, 358, 1),
(135, 358, 2),
(136, 358, 3),
(137, 359, 1),
(138, 359, 2),
(139, 359, 3),
(140, 360, 1),
(141, 361, 1),
(142, 372, 1),
(143, 372, 2),
(144, 376, 1),
(145, 376, 2),
(146, 377, 1),
(147, 354, 1),
(148, 379, 1),
(149, 379, 2),
(150, 380, 1),
(151, 380, 2),
(152, 383, 1),
(153, 383, 2),
(154, 385, 1),
(155, 385, 2),
(156, 388, 1),
(157, 389, 1),
(158, 389, 2),
(159, 390, 1),
(160, 390, 2),
(161, 391, 1),
(162, 391, 2),
(163, 392, 1),
(164, 392, 2),
(165, 395, 1),
(166, 395, 2),
(167, 398, 1),
(168, 399, 1),
(169, 404, 1),
(170, 423, 1),
(171, 423, 2),
(172, 423, 3),
(173, 424, 1),
(174, 424, 2),
(175, 424, 3),
(176, 426, 1),
(177, 426, 2),
(178, 426, 3),
(179, 427, 1),
(180, 428, 1),
(181, 428, 2),
(182, 428, 3),
(183, 430, 1),
(184, 431, 1),
(185, 431, 2),
(186, 431, 3),
(187, 432, 1),
(188, 432, 2),
(189, 432, 3),
(190, 433, 1),
(191, 433, 2),
(192, 433, 3),
(193, 434, 1),
(194, 434, 2),
(195, 434, 3),
(196, 435, 1),
(197, 436, 1),
(198, 436, 2),
(199, 436, 3),
(200, 437, 1),
(201, 437, 2),
(202, 437, 3),
(203, 454, 1),
(204, 454, 2),
(205, 454, 3),
(206, 455, 1),
(207, 455, 2),
(208, 455, 3),
(209, 457, 1),
(210, 457, 2),
(211, 457, 3),
(212, 458, 1);

-- --------------------------------------------------------

--
-- Table structure for table `organizaciones`
--

CREATE TABLE IF NOT EXISTS `organizaciones` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `mail` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `organizaciones`
--

INSERT INTO `organizaciones` (`id`, `nombre`, `mail`) VALUES
(1, 'Organizaci&oacute;n de prueba', '123@123.com');

-- --------------------------------------------------------

--
-- Table structure for table `preguntas`
--

CREATE TABLE IF NOT EXISTS `preguntas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `caid` int(10) NOT NULL,
  `cuid` int(10) NOT NULL,
  `scid` int(10) NOT NULL,
  `codigo` varchar(100) CHARACTER SET latin1 NOT NULL,
  `dependencia` int(10) DEFAULT NULL,
  `pregunta` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caid` (`caid`),
  KEY `cuid` (`cuid`),
  KEY `scid` (`scid`),
  KEY `cod` (`codigo`),
  KEY `dependencia` (`dependencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci AUTO_INCREMENT=459 ;

--
-- Dumping data for table `preguntas`
--

INSERT INTO `preguntas` (`id`, `caid`, `cuid`, `scid`, `codigo`, `dependencia`, `pregunta`) VALUES
(1, 1, 1, 1, '1.1', 0, '''&iquest;Hay una pol&iacute;tica de seguridad documentada?'''),
(2, 1, 1, 1, '1.2', 0, '''&iquest;El documento se publica y comunica a todos los empleados?'''),
(3, 1, 1, 1, '1.3', 0, '''&iquest;El documento de publica y comunica a todas las entidades externas relevantes?'''),
(4, 1, 1, 1, '1.4', 0, '''&iquest;Se relaciona la pol&iacute;tica de seguridad con los objetivos institucionales?'''),
(5, 1, 1, 1, '1.5', 0, '''&iquest;Se relaciona la pol&iacute;tica de seguridad con leyes y regulaciones relevantes?'''),
(6, 1, 1, 1, '1.6', 0, '''&iquest;Existe una emisi&oacute;n y mantenimiento (actualizaci&oacute;n) de un documento de la pol&iacute;tica de seguridad de la informaci&oacute;n?'''),
(7, 1, 1, 1, '1.7', 0, '''&iquest;Los cambios introducidos dicen relaci&oacute;n a la pertinencia, eficiencia y efectividad de las medidas de seguridad?'''),
(8, 1, 1, 1, '1.8', 0, '''&iquest;La actualizaci&oacute;n ocurre a lo menos cada 3 a&ntilde;os?'''),
(9, 1, 1, 1, '1.9', 0, '''&iquest;Est&aacute; previsto que la actualizaci&oacute;n debe ocurrir anticipadamente si hay cambios que lo justifiquen?'''),
(10, 1, 1, 1, '1.10', 0, '''&iquest;Queda expl&iacute;cito en la pol&iacute;tica de seguridad la frecuencia de revisi&oacute;n del documento?'''),
(11, 1, 1, 1, '1.11', 0, '''&iquest;Existe una definici&oacute;n de documento electr&oacute;nico y su seguridad como parte de la pol&iacute;tica de seguridad?'''),
(12, 2, 1, 2, '2.1', 0, '''&iquest;Los planes operacionales incluyen directivas o establecimiento de objetivos en t&eacute;rminos de seguridad de la informaci&oacute;n?'''),
(13, 2, 1, 2, '2.2', 0, '''&iquest;La direcci&oacute;n denota un compromiso real con la seguridad de la informaci&oacute;n en t&eacute;rminos de dedicaci&oacute;n temporal, recursos, participaci&oacute;n?'''),
(14, 2, 1, 2, '2.3', 0, '''&iquest;Hay comit&eacute;s para la seguridad de informaci&oacute;n?'''),
(15, 2, 1, 2, '2.4', 0, '''&iquest;Hay roles relacionados a seguridad de la informaci&oacute;n?'''),
(16, 2, 1, 2, '2.5', 0, '''&iquest;Hay asignaci&oacute;n formal de profesionales a cumplir los roles en seguridad de la informaci&oacute;n? '''),
(17, 2, 1, 2, '2.6', 0, '''&iquest;Qui&eacute;nes cumples roles de seguridad son los miembros del comit&eacute; de seguridad?'''),
(18, 2, 1, 2, '2.7', 0, '''&iquest;Hay un responsable de la seguridad de la informaci&oacute;n?'''),
(19, 2, 1, 2, '2.8', 0, '''&iquest;El responsable de seguridad de la informaci&oacute;n est&aacute; asignado por resoluci&oacute;n?'''),
(20, 2, 1, 2, '2.9', 0, '''&iquest;La asignaci&oacute;n del responsable de seguridad incluye la mantenci&oacute;n de la pol&iacute;tica de seguridad, su control y correcta implementaci&oacute;n?'''),
(21, 2, 1, 2, '2.10', 0, '''&iquest;La asignaci&oacute;n del responsable de seguridad incluye la coordinaci&oacute;n de respuestas a incidencias computacionales?'''),
(22, 2, 1, 2, '2.11', 0, '''&iquest;La asignaci&oacute;n del responsable de seguridad incluye actalizarse en tendencias en seguridad?'''),
(23, 2, 1, 2, '2.12', 0, '''&iquest;La asignaci&oacute;n del responsable de seguridad incluye mantenerse en contacto con otros encargados de seguridad y especialistas en la materia?'''),
(24, 2, 1, 2, '2.13', 0, '''&iquest;El encargado de seguridad act&uacute;a como asesor del Jefe de Servicio?'''),
(25, 2, 1, 2, '2.14', 0, '''&iquest;Se ha evaluado la necesidad de contar con una consultor&iacute;a interna sobre seguridad de la informaci&oacute;n al interior de la organizaci&oacute;n?'''),
(26, 2, 1, 2, '2.15', 0, '''Siendo positiva la evaluaci&oacute;n anterior, &iquest;se cuenta con dicha consultor&iacute;a disponible al interior de la organizaci&oacute;n?'''),
(27, 2, 1, 2, '2.16', 0, '''&iquest;Se promueve que los integrantes del comit&eacute; de seguridad pertenezcan a distintas disciplinas de conocimiento?'''),
(28, 2, 1, 2, '2.17', 0, '''&iquest;Los intergrantes del comit&eacute; de seguridad poseen cargos relevantes al interior de la organizaci&oacute;n?'''),
(29, 2, 1, 2, '2.18', 0, '''&iquest;Los integrantes del comit&eacute; de seguridad representan todas las &aacute;reas de la organizaci&oacute;n?'''),
(30, 2, 1, 2, '2.19', 0, '''&iquest;Los miembros del comit&eacute; de seguridad son efectivamente un grupo interdisciplinario?'''),
(31, 2, 1, 2, '2.20', 0, '''&iquest;Existe un procedimiento definido para la autorizaci&oacute;n (puesta en marcha) de los nuevos medios de procesamiento de informaci&oacute;n (incluye hardware, software y servicios de procesamiento externo?'''),
(32, 2, 1, 2, '2.21', 0, '''&iquest;El procedimiento anterior incluye la gesti&oacute;n de los acuerdos de confidencialidad?'''),
(33, 2, 1, 2, '2.22', 0, '''&iquest;La revis&oacute;n de la organizaci&oacute;n de la seguridad -incuye objetivos, pol&iacute;tica, procesos, procedimientos - se realiza de manera independiente ?'''),
(34, 2, 1, 3, '2.23', 0, '''&iquest;Se identifican los riesgos asociados a la informaci&oacute;n en t&eacute;rminos de confidencialidad?'''),
(35, 2, 1, 3, '2.24', 0, '''&iquest;Se identifican los riesgos asociados a los sistemas de procesamiento de la informaci&oacute;n?'''),
(36, 2, 1, 3, '2.25', 0, '''&iquest;Existe un procedimiento para otorgar acceso a entidades externas a la informaci&oacute;n de la organizaci&oacute;n?'''),
(37, 2, 1, 3, '2.26', 0, '''&iquest;El procedimiento para otorgar acceso a entidades externas es seguido y la documentaci&oacute;n est&aacute; disponible?'''),
(38, 3, 1, 4, '3.1', 0, '''&iquest;Existe un instructivo para clasificar la informaci&oacute;n de la organizaci&oacute;n (esquema de clasificaci&oacute;n de la seguridad de la informaci&oacute;n)?'''),
(39, 3, 1, 4, '3.2', 0, '''&iquest;La clasificaci&oacute;n de la informaci&oacute;n incluye el valor para la organizaci&oacute;n (necesidad), requerimientos legales, confidencialidad (grado de protecci&oacute;n) y grado cr&iacute;tico (prioridad) para la organizaci&oacute;n?'''),
(40, 3, 1, 4, '3.3', 0, '''&iquest;Los documentos electr&oacute;nicos est&aacute;n identificados, clasificados y etiquetados de acuerdo a necesidad, grado de protecci&oacute;n y prioridad para la organizaci&oacute;n? '''),
(41, 3, 1, 4, '3.4', 0, '''&iquest;Los sistemas de procesamiento de la informaci&oacute;n est&aacute;n identificados, clasificados y etiquetados de acuerdo a necesidad, grado de protecci&oacute;n y prioridad para la organizaci&oacute;n? '''),
(42, 3, 1, 4, '3.5', 0, '''&iquest;Existe la definici&oacute;n de uno o varios procedimientos cuyo objetivo sea aplicar el esquema de clasificaci&oacute;n de la seguridad de la informaci&oacute;n a los documentos de la organizaci&oacute;n?'''),
(43, 3, 1, 4, '3.6', 0, '''&iquest;Existe evidencia que el procedimiento anterior se ha seguido para los documentos electr&oacute;nicos de la organizaci&oacute;n?'''),
(44, 3, 1, 4, '3.7', 0, '''&iquest;Cada sistema de informaci&oacute;n existente tiene formalmente asignado un responsable?'''),
(45, 3, 1, 4, '3.8', 0, '''&iquest;Los sistemas de informaci&oacute;n en cuanto productos de software y datos est&aacute;n debidamente inventariados?'''),
(46, 3, 1, 4, '3.9', 0, '''&iquest;El responsable del sistema de informaci&oacute;n ha sido quien lo ha clasificado y etiquetado?'''),
(47, 3, 1, 4, '3.10', 0, '''&iquest;El responsable de seguridad conoce y aplica el sistema de etiquetado de acuerdo al decreto 26 de 2001 de la Secretar&iacute;a General de La Presidencia?'''),
(48, 3, 1, 4, '3.11', 0, '''&iquest;Existe un instructivo que identifique impl&iacute;cita o expl&iacute;citamente a los responsables de los documentos electr&oacute;nicos?'''),
(49, 3, 1, 4, '3.12', 0, '''&iquest;Existe un instructivo que identifique impl&iacute;cita o expl&iacute;citamente a los responsables de los sistemas de informaci&oacute;n?'''),
(50, 3, 1, 4, '3.13', 0, '''&iquest;El encargado de seguridad se encarga de generar, distribuir y actualizar este instructivo?'''),
(51, 3, 1, 4, '3.14', 0, '''&iquest;El instructivo incluye el detalle de qu&eacute; hacer para las acciones de copiado, almacenamiento, env&iacute;o por medios electr&oacute;nicos y destrucci&oacute;n?'''),
(52, 3, 1, 4, '3.15', 0, '''&iquest;Todos los documentos reservados o secretos est&aacute;n correspondientemente etiquetados, incluyendo las salidas por pantallas, impresiones de sistemas de informaci&oacute;n, y adjuntos de correo electr&oacute;nico?'''),
(53, 4, 1, 5, '4.1', 0, '''&iquest;Se han definido los roles y responsabilidades en seguridad de los empleados de acuerdo a las pol&iacute;ticas de seguridad?'''),
(54, 4, 1, 5, '4.2', 0, '''&iquest;Se han definido los roles y responsabilidades en seguridad de contratistas y terceros de acuerdo a las pol&iacute;ticas de seguridad?'''),
(55, 4, 1, 5, '4.3', 0, '''&iquest;Est&aacute;n identificados los riesgos de seguridad de la informaci&oacute;n asociados a los roles del personal en la organizaci&oacute;n, asociados a la funci&oacute;n y clasificaci&oacute;n de la documentaci&oacute;n correspondiente?'''),
(56, 4, 1, 5, '4.4', 0, '''&iquest;Existe un listado de los riesgos de seguridad de la informaci&oacute;n asociados a &aacute;reas de actividad de la organizaci&oacute;n?'''),
(57, 4, 1, 5, '4.5', 0, '''&iquest;Se verifican los antecedentes de todos los candidatos a un empleo de acuerdo a la legislaci&oacute;n y regulaci&oacute;nes internas al hacer una selecci&oacute;n de personal en proporci&oacute;n a los riesgos de seguridad identificados para su rol?'''),
(58, 4, 1, 5, '4.6', 0, '''&iquest;Se recogen antecedentes de todos los candidatos a un empleo en concordancia a un comportamiento &eacute;tico en t&eacute;rminos de seguridad de la informaci&oacute;n acorde a los riesgos identificados para su rol?'''),
(59, 4, 1, 5, '4.7', 0, '''&iquest;Se recogen antecedentes de todos los postulantes a un contrato externo de acuerdo a leyes y regulaciones seg&uacute;n los riesgos asociados identificados a las &aacute;reas de actividad de la organizaci&oacute;n que tendr&aacute; acceso?'''),
(60, 4, 1, 5, '4.8', 0, '''&iquest;Se recogen antecedentes &eacute;ticos de todos los postulantes a un contrato externo seg&uacute;n los riesgos asociados identificados a las &aacute;reas de actividad de la organizaci&oacute;n que tendr&aacute; acceso?'''),
(61, 4, 1, 5, '4.9', 0, '''&iquest;Los t&eacute;rminos de los contratos de empleo incluyen los aspectos de seguridad de la informaci&oacute;n, es decir, obligaciones del empleado y de la organizaci&oacute;n a este respecto?'''),
(62, 4, 1, 5, '4.9.1', 61, '''&iquest;Los aspectos de seguridad de la informaci&oacute;n son claramente informados a los candidatos antes de la contrataci&oacute;n?'''),
(63, 4, 1, 5, '4.10', 0, '''&iquest;Los t&eacute;rminos de los contratos de terceros incluyen los aspectos de seguridad de la informaci&oacute;n, es decir, obligaciones del empleado y de la organizaci&oacute;n a este respecto?'''),
(64, 4, 1, 6, '4.11', 0, '''&iquest;Existen procedimientos definidos para verificar que los empleados est&aacute;n cumpliendo con las recomendaciones de seguridad de la informaci&oacute;n asociados a su rol?'''),
(65, 4, 1, 6, '4.12', 0, '''&iquest;Existen procedimientos definidos para verificar que los contratistas est&aacute;n cumpliendo con las recomendaciones de seguridad de la informaci&oacute;n asociados a su contrato?'''),
(66, 4, 1, 6, '4.13', 0, '''&iquest;Los empleados tienen una adecuada inducci&oacute;n a los temas de seguridad de la informaci&oacute;n asociados a su rol?'''),
(67, 4, 1, 6, '4.14', 0, '''&iquest;Est&aacute; definido un procedimiento de auditor&iacute;a permanente para detectar cumplimiento de las reglamentaciones de seguridad?'''),
(68, 4, 1, 6, '4.15', 0, '''&iquest;Existe un proceso formal que defina la forma en que se entregan los identificadores (usuarios/claves) de los Sistemas Inform&aacute;ticos?'''),
(69, 4, 1, 6, '4.15.1', 68, '''&iquest;El procedimiento formal para entegar identificadores exige que sea el jefe del solicitante el que se responsabiliza de la petici&oacute;n?'''),
(70, 4, 1, 6, '4.15.2', 68, '''&iquest;Este procedimiento formal incluye: la obligaci&oacute;n de mantener confidencial los identificadores?'''),
(71, 4, 1, 6, '4.15.3', 68, '''&iquest;Este procedimiento formal incluye: la obligaci&oacute;n de no registrar los identificadores en papel?'''),
(72, 4, 1, 6, '4.15.4', 68, '''&iquest;Este procedimiento formal incluye: la prohibici&oacute;n de no almacenar identificadores en computadores de manera no protegida?'''),
(73, 4, 1, 6, '4.15.5', 68, '''&iquest;Este procedimiento formal incluye: el deber de no compartir los identificadores de usuarios individuales?'''),
(74, 4, 1, 6, '4.15.6', 68, '''&iquest;Este procedimiento formal incluye: el mandato de no incluir los identificadores como parte de una sesi&oacute;n de inicio de un proceso autom&aacute;tico?'''),
(75, 4, 1, 6, '4.15.7', 68, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores cuando hay indicios de un compromiso del identificador del sistema (hackeo)?'''),
(76, 4, 1, 6, '4.15.8', 68, '''&iquest;Este procedimiento formal incluye: la recomendaci&oacute;n de elegir identificadores (claves) seguros -no uso de fechas cl&aacute;sicas, nombres de la familia, longitud m&iacute;nima, etc?'''),
(77, 4, 1, 6, '4.15.9', 68, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores a intervalos regulares?'''),
(78, 4, 1, 6, '4.15.10', 68, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores a intervalos regulares?'''),
(79, 4, 1, 6, '4.15.11', 68, '''&iquest;Este procedimiento formal incluye: normas para evitar el reciclaje de identificadores ya usados?'''),
(80, 4, 1, 6, '4.15.12', 68, '''&iquest;Este procedimiento formal incluye: una forma segura de entregar el identificador por primera vez (no terceras partes, no uso de email)?'''),
(81, 4, 1, 6, '4.15.13', 68, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar el primer identificador (temporal) al iniciar la primera sesi&oacute;n?'''),
(82, 4, 1, 6, '4.15.14', 68, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n que los usuarios deben dajar constancia de su recepci&oacute;n?'''),
(83, 4, 1, 6, '4.15.15', 68, '''&iquest;Este procedimiento formal incluye el caso de usuarios con m&uacute;ltiples identificadores y la exigencia que debe usar identificadores distintos en cada caso?'''),
(84, 4, 1, 6, '4.15.16', 68, '''&iquest;Todos los sistemas inform&aacute;ticos est&aacute;n programados de tal manera que los usuarios se ven compelidos -obligados- a cumplir las normas anteriores?'''),
(85, 4, 1, 6, '4.16', 0, '''&iquest;Se incentiva a los usuarios a configurar sus sistemas (operativos) para cerrar las sesiones activas al final de la labor?'''),
(86, 4, 1, 6, '4.17', 0, '''&iquest;Se incentiva a los usuarios a configurar sus sistemas (operativos) para cerrar las sesiones de los computadores principales cuando la sesi&oacute;n finaliza?'''),
(87, 4, 1, 6, '4.18', 0, '''&iquest;Se incentiva a los usuarios a configurar sus sistemas (operativos) para que en los momentos que no se use queden bloqueados -por ejemplo claves en el refrescador de pantalla-?'''),
(88, 4, 1, 6, '4.19', 0, '''&iquest;Se incentiva y facilita el uso de certificados de firma electr&oacute;nica'''),
(89, 4, 1, 6, '4.20', 0, '''Cuando se detectan carencias o falencias en la gesti&oacute;n de la seguridad por parte de los empleados, &iquest;se realiza una capacitaci&oacute;n al respecto?'''),
(90, 4, 1, 6, '4.21', 0, '''Cuando se detectan carencias o falencias en la gesti&oacute;n de la seguridad por parte de los contratistas &iquest;se realiza una capacitaci&oacute;n al respecto?'''),
(91, 4, 1, 6, '4.22', 0, '''&iquest;Est&aacute;n definido el procedimiento disicplinario para violaciones de la reglamentaci&oacute;n de la seguridad de la informaci&oacute;n para el caso de los empleados?'''),
(92, 4, 1, 6, '4.23', 0, '''&iquest;Est&aacute;n definido el procedimiento a seguir para violaciones de la reglamentaci&oacute;n de la seguridad de la informaci&oacute;n para el caso de los contratistas?'''),
(93, 4, 1, 6, '4.24', 0, '''&iquest;El procedimiento disciplinario a violaciones de la seguridad de la informaci&oacute;n se ha aplicado a los empleados cuando ha correspondido?'''),
(94, 4, 1, 6, '4.25', 0, '''&iquest;El procedimiento a violaciones de la seguridad de la informaci&oacute;n se ha aplicado a los contratistas cuando ha correspondido?'''),
(95, 4, 1, 7, '4.26', 0, '''&iquest;Existe un procedimiento que defina de manera general o particular por roles las acciones a considerar respecto de seguridad de la informaci&oacute;n en los cambios de roles al interior de la organizaci&oacute;n (licencias, renuncias, permisos, termino de contrato)?'''),
(96, 4, 1, 7, '4.27', 0, '''&iquest;Existe un procedimiento que defina las acciones a considerar respecto de seguridad de la informaci&oacute;n en el t&eacute;rmino del trabajo de un contratista?'''),
(97, 4, 1, 7, '4.28', 0, '''&iquest;Existe un cat&aacute;logo de sofware autorizado para instalar en la organizaci&oacute;n?'''),
(98, 4, 1, 7, '4.29', 0, '''&iquest;El procedimiento para los empleados considera la prohibici&oacute;n de instalaci&oacute;n de software no autorizado?'''),
(99, 4, 1, 7, '4.30', 0, '''&iquest;Existe un instructivo espec&iacute;fico en t&eacute;rminos de seguridad de la informaci&oacute;n para el uso  de correo electr&oacute;nico?'''),
(100, 4, 1, 7, '4.31', 0, '''&iquest;Existe un instructivo en t&eacute;rminos de seguridad de la informaci&oacute;n para el acceso compartido a recursos electr&oacute;nicos por parte de la organizaci&oacute;n?'''),
(101, 4, 1, 7, '4.32', 0, '''&iquest;Existe un instructivo espec&iacute;fico en t&eacute;rminos de seguridad de la informaci&oacute;n para el uso seguro de servicios de mensajer&iacute;a y comunicaci&oacute;n remota ?'''),
(102, 4, 1, 7, '4.33', 0, '''&iquest;El procedimiento para los empleados considera la devoluci&oacute;n de activos o destrucci&oacute;n de copias de documentos electr&oacute;nicos cuando corresponde?'''),
(103, 4, 1, 7, '4.34', 0, '''&iquest;El procedimiento para los contratistas considera la devoluci&oacute;n de activos o destrucci&oacute;n de copias de documentos electr&oacute;nicos cuando corresponde?'''),
(104, 4, 1, 7, '4.35', 0, '''&iquest;El procedimiento para los empleados considera la devoluci&oacute;n de activos o destrucci&oacute;n de copias de documentos electr&oacute;nicos cuando corresponde?'''),
(105, 4, 1, 7, '4.36', 0, '''&iquest;El procedimiento para los contratistas considera la devoluci&oacute;n de activos o destrucci&oacute;n de copias de documentos electr&oacute;nicos cuando corresponde?'''),
(106, 4, 1, 7, '4.37', 0, '''&iquest;El procedimiento para los empleados incluye cambios de reglas de acceso a la informaci&oacute;n seg&uacute;n corresponda?'''),
(107, 4, 1, 7, '4.38', 0, '''&iquest;El procedimiento para los contratistas asegura que los permisos de acceso caducan?'''),
(108, 4, 1, 7, '4.39', 0, '''&iquest;El procedimiento para los empleados se ha aplicado cuando ha correspondido?'''),
(109, 4, 1, 7, '4.40', 0, '''&iquest;El procedimiento para los contratistas se ha aplicado cuando ha correspondido?'''),
(110, 4, 1, 7, '4.41', 0, '''&iquest;Existe un cat&aacute;logo de los Sistemas Inform&aacute;ticos de la organizaci&oacute;n?'''),
(111, 4, 1, 7, '4.42', 0, '''&iquest;Los procedimientos de seguridad incluyen la transimisi&oacute;n de datos, almacenamiento y procesamiento de la informaci&oacute;n de los Sistemas Inform&aacute;ticos de la organizaci&oacute;n?'''),
(112, 4, 1, 7, '4.43', 0, '''&iquest;Se reitera y queda claro que tanto los procedimientos como los instructivos es una iniciativa de la Jefatura del Servicio?'''),
(113, 4, 1, 7, '4.44', 0, '''&iquest;Existe un procedimiento para reportar los incidentes de seguridad?'''),
(114, 4, 1, 7, '4.45', 0, '''&iquest;El procedimiento para reportar los incidentes de seguridad se ha usado cuando ha correspondido?'''),
(115, 5, 1, 8, '5.1', 0, '''&iquest;Existe una pol&iacute;tica de seguridad f&iacute;sica en la empresa y est&aacute; actualizada?'''),
(116, 5, 1, 8, '5.1.1', 115, '''&iquest;Esta pol&iacute;tica de seguridad f&iacute;sica incluye el consumo de bebidas, comida, tabaco en las carcan&iacute;as de instalaciones inform&aacute;ticas?'''),
(117, 5, 1, 8, '5.1.2', 115, '''&iquest;Esta pol&iacute;tica de seguridad f&iacute;sica incluye condiciones ambientales y climatol&oacute;gicas que podr&iacute;an alterar el buen funcionamiento de sistemas inform&aacute;ticos? (campos magn&eacute;ticos, estufas, …)'''),
(118, 5, 1, 8, '5.1.3', 115, '''&iquest;Esta pol&iacute;tica de seguridad f&iacute;sica promociona una pr&aacute;ctica de escritorio limpio? '''),
(119, 5, 1, 8, '5.1.4', 115, '''&iquest;La pol&iacute;tica de seguridad incluye el caso de computadores port&aacute;tiles y su protecci&oacute;n fuera de la organizaci&oacute;n?'''),
(120, 5, 1, 8, '5.1.5', 115, '''&iquest;La pol&iacute;tica de seguridad incluye la adecuada protecci&oacute;n de los cableados de red de datos?'''),
(121, 5, 1, 8, '5.1.6', 115, '''&iquest;La pol&iacute;tica de seguridad incluye una normativa para el caso de traslado de infraestructura inform&aacute;tica fuera de la organizaci&oacute;n?'''),
(122, 5, 1, 8, '5.1.7', 115, '''&iquest;La pol&iacute;tica de seguridad es debidamente difundida entre los usuarios?'''),
(123, 5, 1, 8, '5.2', 0, '''&iquest;Existe y se difunden los planes de contingencia/emergencia?'''),
(124, 5, 1, 8, '5.3', 0, '''&iquest;Existe un registro de todos los incidentes de seguridad y est&aacute;n clasificados seg&uacute;n su gravedad?'''),
(125, 5, 1, 8, '5.4', 0, '''&iquest;Se dan conferencias de seguridad f&iacute;sica a todos los empleados al incorporarse al trabajo y de forma peri&oacute;dica?'''),
(126, 5, 1, 8, '5.5', 0, '''En los contratos de comunicaciones, &iquest;est&aacute;n claramente reflejados los par&aacute;metros  que definen la calidad de servicio, como ancho de banda, CIR, tiempo de respuesta de aver&iacute;as, etc.?'''),
(127, 5, 1, 8, '5.6', 0, '''&iquest;Se ha hecho un an&aacute;lisis de los riesgos de seguridad f&iacute;sica?'''),
(128, 5, 1, 8, '5.6.1', 127, '''&iquest;Todos los documentos caracterizados como reservados o secretos est&aacute;n protegidos con barreras f&iacute;sicas?'''),
(129, 5, 1, 8, '5.6.2', 127, '''&iquest;Todos los documentos caracterizados como reservados o secretos est&aacute;n protegidos adem&aacute;s de f&iacute;sicamente con los procedimientos de acceso que resguarden su intervenci&oacute;n por personas no autorizadas?'''),
(130, 5, 1, 8, '5.6.3', 127, '''&iquest;Los resguardos fisicos y de procedimiento de acceso est&aacute;n acorde a los riesgos de seguridad f&iacute;sica identificados?'''),
(131, 5, 1, 8, '5.7', 0, '''&iquest;Tiene todo el personal disponible un listado con los n&uacute;meros de tel&eacute;fono m&aacute;s importantes en caso de emergencia?'''),
(132, 5, 1, 8, '5.8', 0, '''&iquest;Se realizan simulacros / ejercicios en caso de emergencia?'''),
(133, 5, 1, 8, '5.9', 0, '''&iquest;Tiene la empresa contratados seguros generales?'''),
(134, 5, 1, 8, '5.10', 0, '''&iquest;Tiene la empresa contratados seguros espec&iacute;ficos de las tecnolog&iacute;as de la informaci&oacute;n?'''),
(135, 5, 1, 8, '5.11', 0, '''&iquest;tiene la empresa un seguro espec&iacute;fico de responsabilidad civil?'''),
(136, 5, 1, 8, '5.12', 0, '''&iquest;Existen un contrato / seguro que garantice la continuidad del negocio en caso de emergencia?'''),
(137, 5, 1, 8, '5.13', 0, '''&iquest;Existen planos de las rutas de emergencia?'''),
(138, 5, 1, 8, '5.14', 0, ''' &iquest;Est&aacute;n bien se&ntilde;alizadas las rutas y salidas de emergencia?'''),
(139, 5, 1, 8, '5.15', 0, '''&iquest;La ubicaci&oacute;n del Centro de Procesamiento de Datos (CPD) est&aacute; estudiada y documentada de tal manera de minimizar efectos negativos de percances y descuidos?'''),
(140, 5, 1, 8, '5.16', 0, '''&iquest;Se ha evaluado el riesgo del edificio y zonas aleda&ntilde;as?'''),
(141, 5, 1, 8, '5.17', 0, '''&iquest;Existe un estudio de las condiciones estructurales del edificio (tipo y espesor de paredes, vigas, suelos y techos? '''),
(142, 5, 1, 8, '5.18', 0, '''&iquest;Hay una separaci&oacute;n f&iacute;sica del Centro de Procesamiento de Datos por medio de Barreras o Paredes?'''),
(143, 5, 1, 8, '5.19', 0, '''&iquest;Existen planos de todas las conducciones y est&aacute;n actualizados (climatizaci&oacute;n, agua, el&eacute;ctrica, comunicaciones…)? '''),
(144, 5, 1, 8, '5.20', 0, '''&iquest;Tiene el edificio escaleras de emergencia?'''),
(145, 5, 1, 8, '5.21', 0, '''&iquest;Las salas de ordenadores est&aacute;n alejadas y aisladas de los ruidos y vibraciones?'''),
(146, 5, 1, 8, '5.22', 0, '''&iquest;el tiempo de respuesta de los servicios de emergencia (bomberos, ambulancia, polic&iacute;a, etc.) es inferior a 15 minutos?'''),
(147, 5, 1, 8, '5.23', 0, '''&iquest;Existe un sistema de climatizaci&oacute;n adecuado?'''),
(148, 5, 1, 8, '5.24', 0, '''&iquest;Existe un sistema de climatizaci&oacute;n de emergencia?'''),
(149, 5, 1, 8, '5.25', 0, '''&iquest;Hay un sistema de vigilancia de la instalaci&oacute;n, de climatizaci&oacute;n y de medida de las caracter&iacute;sticas ambientales (humedad, temperatura, part&iacute;culas en suspensi&oacute;n…)?'''),
(150, 5, 1, 8, '5.26', 0, '''&iquest;Se realiza un mantenimiento adecuado del sistema de climatizaci&oacute;n (inspecciones, cambio de filtros, limpieza de conductos…)?'''),
(151, 5, 1, 8, '5.27', 0, '''&iquest;Se ha realizado un estudio de riesgo de intrusi&oacute;n en el edificio?'''),
(152, 5, 1, 8, '5.28', 0, '''&iquest;Se ha realizado un an&aacute;lisis de riesgos de acceso al CPD?'''),
(153, 5, 1, 8, '5.29', 0, '''&iquest;El CPD est&aacute; completamente aislado del resto del edificio y sus accesos controlados?'''),
(154, 5, 1, 8, '5.30', 0, '''&iquest;Existe un circuito cerrado de TV que controle el acceso al CPD y las puertas de emergencia?'''),
(155, 5, 1, 8, '5.31', 0, '''&iquest;Existe un registro escrito o impreso de todos los accesos a todas las salas de equipos inform&aacute;ticos?'''),
(156, 5, 1, 8, '5.32', 0, '''&iquest;Existe un sistema de control de acceso biom&eacute;trico?'''),
(157, 5, 1, 8, '5.33', 0, '''&iquest;Todas las personas con acceso autorizado tienen una tarjeta de identificaci&oacute;n  y est&aacute;n controlados?'''),
(158, 5, 1, 8, '5.34', 0, '''&iquest;toda la persona, ajeno o no a la empresa, exhibe de forma clara la tarjeta de identificaci&oacute;n?'''),
(159, 5, 1, 8, '5.35', 0, '''&iquest;Se utiliza un sistema de control de acceso autom&aacute;tico para el acceso al CPD?'''),
(160, 5, 1, 8, '5.36', 0, '''&iquest;El acceso al CPD est&aacute; auditado, tanto para la entrada como para la salida?'''),
(161, 5, 1, 8, '5.37', 0, '''&iquest;Existen procedimientos espec&iacute;ficos de control de acceso para el personal ajeno a la empresa?'''),
(162, 5, 1, 8, '5.38', 0, '''&iquest;Existe una vigilancia exterior por medio de detectores de intrusi&oacute;n, conectado a un puesto permanente de vigilancia?'''),
(163, 5, 1, 8, '5.39', 0, '''&iquest;Existe una vigilancia interior  por medio de detectores de intrusi&oacute;n, conectado a un puesto permanente de vigilancia?'''),
(164, 5, 1, 8, '5.40', 0, '''&iquest;Todas las salidas de emergencia est&aacute;n equipadas con un dispositivo de control, unido a un puesto permanente de vigilancia  que alerte su apertura?'''),
(165, 5, 1, 8, '5.41', 0, '''&iquest;Las oficinas se cierran con llave y se verifica su cierre al terminar la jornada laboral?'''),
(166, 5, 1, 8, '5.42', 0, '''&iquest;Se aplica en la empresa una pol&iacute;tica de mesas vac&iacute;as?'''),
(167, 5, 1, 8, '5.43', 0, '''&iquest;Se ha verificado la resistencia de los muros del edificio ante un intento de intrusi&oacute;n?'''),
(168, 5, 1, 8, '5.44', 0, '''&iquest;Se ha verificado la resistencia de las puertas (calidad de los marcos, resistencia de la puerta, calidad de los cerrojos y cerraduras, etc.)?'''),
(169, 5, 1, 8, '5.45', 0, '''&iquest;Se ha verificado la resistencia de las ventanas?'''),
(170, 5, 1, 8, '5.46', 0, '''&iquest;Las ventanas de las plantas bajas disponen de rejas o barrotes y se ha verificado su resistencia?'''),
(171, 5, 1, 8, '5.47', 0, '''&iquest;Se necesita un permiso expreso para acceder al CPD?'''),
(172, 5, 1, 8, '5.48', 0, '''&iquest;Se notifican al CPD con suficiente antelaci&oacute;n las visitas previstas?'''),
(173, 5, 1, 8, '5.49', 0, '''&iquest;Hay un control y archivo diarios de las grabaciones del sistema de vigilancia?'''),
(174, 5, 1, 8, '5.50', 0, '''&iquest;Existe un servicio de vigilantes de seguridad?'''),
(175, 5, 1, 8, '5.51', 0, '''&iquest;Existe un procedimiento de rondas y de verificaci&oacute;n de la seguridad f&iacute;sica?'''),
(176, 5, 1, 8, '5.52', 0, '''&iquest;Existe un procedimiento de recepci&oacute;n de materiales, que garanticen su inspecci&oacute;n antes de su traslado al interior del edificio?'''),
(177, 5, 1, 8, '5.53', 0, '''&iquest;Existe un control de entrada y salida de material?'''),
(178, 5, 1, 8, '5.54', 0, '''&iquest;Existe un sistema de detecci&oacute;n de metales?'''),
(179, 5, 1, 8, '5.55', 0, '''&iquest;Existe un procedimiento espec&iacute;fico de control de acceso del personal de limpieza?'''),
(180, 5, 1, 9, '5.56', 0, '''&iquest;Se ha realizado un estudio de los riesgos de incendio que cubra tanto la prevenci&oacute;n c&oacute;mo la protecci&oacute;n?'''),
(181, 5, 1, 9, '5.57', 0, '''&iquest;Los tabiques y revestimientos de muros, techos y suelos est&aacute;n fabricados con materiales ign&iacute;fugos?'''),
(182, 5, 1, 9, '5.58', 0, '''&iquest;Existe un sistema autom&aacute;tico de detecci&oacute;n de incendios y est&aacute; conectado a una central de alarmas?'''),
(183, 5, 1, 9, '5.59', 0, '''&iquest;Los conductos de aire acondicionado/ventilaci&oacute;n est&aacute;n equipados con v&aacute;lvulas autom&aacute;ticas contra incendios?'''),
(184, 5, 1, 9, '5.60', 0, '''&iquest;Se activa autom&aacute;ticamente el sistema de corte de energ&iacute;a el&eacute;ctrica tras la detecci&oacute;n de un incendio?'''),
(185, 5, 1, 9, '5.61', 0, '''&iquest;Hay barreras como puertas anti fuego y barra / cortinas anti humo en los lugares susceptibles de ser utilizadas?'''),
(186, 5, 1, 9, '5.62', 0, '''&iquest;Las puertas cortafuegos se cierran autom&aacute;ticamente al saltar la alarma?'''),
(187, 5, 1, 9, '5.63', 0, '''&iquest;Existe un instalaci&oacute;n fija de contra incendios  en el CPD?'''),
(188, 5, 1, 9, '5.64', 0, '''&iquest;Existe un suministro adecuado de agua para los sistemas de extinci&oacute;n de incendios?'''),
(189, 5, 1, 9, '5.65', 0, '''&iquest;La instalaci&oacute;n de detecci&oacute;n autom&aacute;tica de incendios est&aacute; compuesta por al menos dos tipos de detectores (por ejemplo: detectores de humo i&oacute;nico y &oacute;ptico)?'''),
(190, 5, 1, 9, '5.66', 0, '''&iquest;Existe un indicador luminoso y sonoro fuera del CPD cuando el sistema contra incendios se dispara?'''),
(191, 5, 1, 9, '5.67', 0, '''&iquest;Estas instalaciones son revisadas peri&oacute;dicamente conforme a la reglamentaci&oacute;n y tienen un mantenimiento adecuado?'''),
(192, 5, 1, 9, '5.68', 0, '''&iquest;El n&uacute;mero de distribuci&oacute;n de dispositivos de alarma contra incendios es el adecuado?'''),
(193, 5, 1, 9, '5.69', 0, '''&iquest;Las instalaciones de extinci&oacute;n autom&aacute;tica est&aacute;n realizadas seg&uacute;n la normativa vigente y estar certificadas como tales?'''),
(194, 5, 1, 9, '5.70', 0, '''&iquest;Las instalaciones de extinci&oacute;n autom&aacute;tica se verifican peri&oacute;dicamente de acuerdo a la normativa y su mantenimiento se realiza regularmente?'''),
(195, 5, 1, 9, '5.71', 0, '''Cuando las instalaciones de extinci&oacute;n autom&aacute;tica se quedan fuera de servicio, &iquest;se se&ntilde;aliza autom&aacute;ticamente en un puesto permanente de vigilancia ocupado por dos personas como m&iacute;nimo?'''),
(196, 5, 1, 9, '5.72', 0, '''&iquest;Existe una instalaci&oacute;n de extintores port&aacute;tiles en el conjunto de los locales inform&aacute;ticos y el equipamiento del entorno?'''),
(197, 5, 1, 9, '5.73', 0, '''&iquest;la instalaci&oacute;n de extintores port&aacute;tiles cumple la normativa vigente?'''),
(198, 5, 1, 9, '5.74', 0, '''&iquest;Existen indicaciones claramente visibles acerca de las condiciones de uso de los extintores?'''),
(199, 5, 1, 9, '5.75', 0, '''&iquest;Los extintores port&aacute;tiles se verifican peri&oacute;dicamente de acuerdo con la normativa y su mantenimiento se realiza adecuadamente?'''),
(200, 5, 1, 9, '5.76', 0, '''&iquest;Se utilizan solo papeleras met&aacute;licas en el edificio y papeleras ignifugas con sus correspondientes tapas en las salas de ordenadores?'''),
(201, 5, 1, 9, '5.77', 0, '''&iquest;La cantidad de papel almacenada en las salas de impresi&oacute;n es inferior a las necesidades de un d&iacute;a de producci&oacute;n?'''),
(202, 5, 1, 9, '5.78', 0, '''Los productos diversos de mantenimiento, f&aacute;cilmente inflamables, &iquest;se almacenan fuera del CPD?'''),
(203, 5, 1, 9, '5.79', 0, '''&iquest;Los documentos o soportes inform&aacute;ticos de inter&eacute;s para la empresa se guardan en armarios ign&iacute;fugos?'''),
(204, 5, 1, 9, '5.80', 0, '''&iquest;Est&aacute; prohibido fumar en el CPD y se respeta la prohibici&oacute;n?'''),
(205, 5, 1, 9, '5.81', 0, '''&iquest;Se efect&uacute;a una limpieza peri&oacute;dica de los espacios ocultos (bajo el falso suelo, escaleras, etc.)?'''),
(206, 5, 1, 9, '5.82', 0, '''&iquest;Se evita la acumulaci&oacute;n de material innecesario en el CPD?'''),
(207, 5, 1, 9, '5.83', 0, '''&iquest;Se utilizan contenedores de basura resistentes al fuego?'''),
(208, 5, 1, 9, '5.84', 0, '''&iquest;Existe un procedimiento de contingencia para caso de inundaciones?'''),
(209, 5, 1, 9, '5.85', 0, '''Los problemas relacionados con el agua (lluvia, goteras, agua presi&oacute;n de dispositivos contra incendios, inundaciones…), &iquest;han sido tratados adecuadamente (filtraci&oacute;n, drenaje, sifones, sumideros…)?'''),
(210, 5, 1, 9, '5.86', 0, '''&iquest;Existe un plan de contingencia para el caso de inundaciones o filtraciones de agua?'''),
(211, 5, 1, 9, '5.87', 0, '''&iquest;Se ha hecho un estudio acerca de la posibilidad de inundaciones en la zona?'''),
(212, 5, 1, 9, '5.88', 0, '''&iquest;El techo de la sala donde se encuentran los equipos inform&aacute;ticos es impermeable?'''),
(213, 5, 1, 9, '5.89', 0, '''&iquest;Existe un sistema autom&aacute;tico de detecci&oacute;n de fugas de agua (en los locales superiores al CPD)?'''),
(214, 5, 1, 9, '5.90', 0, '''&iquest;Existen planos actualizados con la situaci&oacute;n de todas las tuber&iacute;as (agua potable, desag&uuml;es, aire acondicionado?'''),
(215, 5, 1, 9, '5.91', 0, '''&iquest;Existe un sistema de llaves de paso, as&iacute; como planos claros, actualizados y f&aacute;cilmente disponibles de las canalizaciones?'''),
(216, 5, 1, 9, '5.92', 0, '''&iquest;Existe un sistema de drenaje adecuado en falso suelo y en salas adyacentes al CPD?'''),
(217, 5, 1, 9, '5.93', 0, '''&iquest;Hay instaladas bombas de achique por si fueran necesarias?'''),
(218, 5, 1, 9, '5.94', 0, '''&iquest;Se realiza una revisi&oacute;n peri&oacute;dica del estado de las tuber&iacute;as, llaves de paso y canalizaciones?'''),
(219, 5, 1, 9, '5.95', 0, '''&iquest;Existen detectores de humedad/agua en el falso suelo?'''),
(220, 5, 1, 9, '5.96', 0, '''&iquest;Est&aacute;n los sistemas de detecci&oacute;n conectados con un puesto permanente de vigilancia con al menos 2 personas?'''),
(221, 5, 1, 9, '5.97', 0, '''&iquest;Se revisan peri&oacute;dicamente los detectores?'''),
(222, 5, 1, 9, '5.98', 0, '''&iquest;Todo el sistema de cableado est&aacute; protegido contra inundaciones / humedad?'''),
(223, 5, 1, 9, '5.99', 0, '''&iquest;Hay instaladas bombas de achique como mecanismo de emergencia en caso de inundaci&oacute;n?'''),
(224, 5, 1, 10, '5.100', 0, '''&iquest;La instalaciones el&eacute;ctricas respetan la norma NCh 4/2003 de seguridad de instalaciones el&eacute;ctricas ?'''),
(225, 5, 1, 10, '5.101', 0, '''&iquest;Existe un sistema de vigilancia de la calidad y continuidad del suministro el&eacute;ctrico?'''),
(226, 5, 1, 10, '5.102', 0, '''&iquest;Existe un sistema de alimentaci&oacute;n ininterrumpida (SAI)?'''),
(227, 5, 1, 10, '5.102.1', 226, '''&iquest;El tipo de SAI y el mantenimiento de este es adecuado (inspecciones, pruebas, revisiones de bater&iacute;as…)?'''),
(228, 5, 1, 10, '5.102.2', 226, '''&iquest;La autonom&iacute;a proporcionada por el SAI es suficiente para bajar los servicios de manera segura?'''),
(229, 5, 1, 10, '5.103', 0, '''&iquest;Existe un sistema aut&oacute;nomo de generaci&oacute;n de energ&iacute;a el&eacute;ctrica?'''),
(230, 5, 1, 10, '5.103.1', 229, '''La capacidad de generaci&oacute;n de estos grupos electr&oacute;genos, &iquest;es suficiente para garantizar la seguridad de los edificios y el funcionamiento de los equipos inform&aacute;ticos?'''),
(231, 5, 1, 10, '5.104', 0, '''&iquest;Se realizan pruebas peri&oacute;dicas de las instalaciones de los grupos electr&oacute;genos?'''),
(232, 5, 1, 10, '5.105', 0, '''&iquest;Los paneles de control de energ&iacute;a el&eacute;ctrica est&aacute;n cerrados con llave?'''),
(233, 5, 1, 10, '5.106', 0, '''&iquest;se realizan inspecciones peri&oacute;dicas de todas las instalaciones de suministro el&eacute;ctrico?'''),
(234, 5, 1, 10, '5.107', 0, '''&iquest;Existen elementos de protecci&oacute;n contra sobretensi&oacute;n?'''),
(235, 5, 1, 10, '5.108', 0, '''&iquest;Existe un dispositivo de corte manual de energ&iacute;a para emergencia (machete corte)?'''),
(236, 5, 1, 10, '5.108.1', 235, ''' &iquest;se verifica su funcionamiento?'''),
(237, 5, 1, 10, '5.109', 0, '''&iquest;Se encuentran los interruptores de emergencia ubicados cerca de las salidas de emergencia?'''),
(238, 5, 1, 10, '5.110', 0, '''&iquest;Est&aacute; restringido el acceso a los tableros de alimentaci&oacute;n?'''),
(239, 5, 1, 10, '5.111', 0, '''&iquest;Est&aacute;n claramente indicados los locales o puntos de riesgo de descarga el&eacute;ctrica?'''),
(240, 5, 1, 10, '5.112', 0, '''&iquest;Est&aacute; el personal instruido y existen carteles claramente visibles sobre las acciones a tomar en caso de descarga el&eacute;ctrica?'''),
(241, 5, 1, 10, '5.113', 0, '''&iquest;Tiene los equipos inform&aacute;ticos placas para que el personal se descargue de la electricidad est&aacute;tica?'''),
(242, 6, 1, 11, '6.1', 0, '''&iquest;Existe un catastro de los procedimientos de operaci&oacute;n?'''),
(243, 6, 1, 11, '6.1.1', 242, '''&iquest;Estos procedimientos est&aacute;n debidamente detallados en cuanto a sus etapas?'''),
(244, 6, 1, 11, '6.1.2', 242, '''&iquest;Estos procediminientos se difunden adecuadamente a los usuarios que los necesiten?'''),
(245, 6, 1, 11, '6.1.3', 242, '''&iquest;Estos procedimientos tienen un mecanismo definido de mantenci&oacute;n (actualizaci&oacute;n)?'''),
(246, 6, 1, 11, '6.1.3.1', 245, '''&iquest;El procedimiento de actualizaci&oacute;n considera la incorporaci&oacute;n de expertos en la materia?'''),
(247, 6, 1, 11, '6.2', 0, '''&iquest;Existe un procedimiento que define la forma de desarrollar los cambios en la infraestructura de Tecnolog&iacute;as de Informaci&oacute;n?'''),
(248, 6, 1, 11, '6.2.1', 247, '''&iquest;Este procedimiento incluye un registro del origen de las peticiones?'''),
(249, 6, 1, 11, '6.2.2', 247, '''&iquest;Este procedimiento incluye trazabilidad de las etapas de acuerdo al procedimiento definido?'''),
(250, 6, 1, 11, '6.2.3', 247, '''&iquest;En el caso de c&oacute;dificaci&oacute;n, se dispone de un sistema de gesti&oacute;n de versiones de productos de software?'''),
(251, 6, 1, 11, '6.2.4', 247, '''&iquest;Este procedimiento incluye cambios directos de datos sobre bases de datos corporativas?'''),
(252, 6, 1, 11, '6.2.5', 247, '''&iquest;Este procedimiento incluye la geti&oacute;n de cambios a nivel de hardware e infraestructura de comunicaciones?'''),
(253, 6, 1, 11, '6.3', 0, '''&iquest;Los procedimientos de operaci&oacute;n tienen responsables separados y asignados por la jefatura del servicio?'''),
(254, 6, 1, 11, '6.3.1', 253, '''&iquest;Cada sistema de informaci&oacute;n tiene un encargado de operaci&oacute;n el que es debidamente comunicado a los usuarios?'''),
(255, 6, 1, 11, '6.4', 0, '''Independiente del responsable, &iquest;el registro de trazabilidad de los cambios incluye la identificaci&oacute;n de la persona que ejecuta los pasos administrativos correspondientes?'''),
(256, 6, 1, 11, '6.5', 0, '''&iquest;Existe un procedimiento interno que especifique c&oacute;mo separar las etapas de desarrollo, prueba y explotaci&oacute;n de los sistemas inform&aacute;ticos?'''),
(257, 6, 1, 11, '6.6', 0, '''&iquest;La explotaci&oacute;n ocurre en equipos diferentes de los de testing y desarrollo?'''),
(258, 6, 1, 12, '6.7', 0, '''&iquest;Existe un procedimiento para aceptar y explotar (usar) los servicios inform&aacute;ticos provistos por terceros?'''),
(259, 6, 1, 12, '6.7.1', 258, '''&iquest;Este procedimiento incluye una secuencia de pasos para aceptar un nuevo servicio provisto por terceros?'''),
(260, 6, 1, 12, '6.7.2', 258, '''&iquest;Este procedimiento incluye monitoreo de la satisfacci&oacute;n de usuarios?'''),
(261, 6, 1, 12, '6.7.3', 258, '''&iquest;Este procedimiento incluye monitoreo de rendimiento del sistema inform&aacute;tico?'''),
(262, 6, 1, 12, '6.7.4', 258, '''&iquest;Este procedimiento incluye monitoreo de la integridad de la informaci&oacute;n?'''),
(263, 6, 1, 12, '6.7.5', 258, '''&iquest;Este procedimiento incluye monitoreo de la seguridad de la informaci&oacute;n?'''),
(264, 6, 1, 12, '6.8', 0, '''&iquest;Los servicios inform&aacute;ticos de terceros son auditados regularmente?'''),
(265, 6, 1, 12, '6.9', 0, '''&iquest;Existe un procedimiento para registrar los cambios en los servicios de terceros?'''),
(266, 6, 1, 12, '6.9.1', 265, '''&iquest;Este procedimiento permite registrar el motivo que origina el cambio?'''),
(267, 6, 1, 12, '6.9.2', 265, '''&iquest;Este procedimiento permite la trazabilidad de las acciones que permiten obtener finalmente el cambio deseado?'''),
(268, 6, 1, 12, '6.9.3', 265, '''&iquest;La trazabilidad incluye el registro de la persona que realiz&oacute; un cambio espec&iacute;fico?'''),
(269, 6, 1, 12, '6.9.4', 265, '''&iquest;Este procedimiento incluye la revisi&oacute;n y correcci&oacute;n del mismo -del mismo sistema de gesti&oacute;n de cambio-?'''),
(270, 6, 1, 12, '6.9.4.1', 269, '''&iquest;Esta actualizaci&oacute;n considera los cambios en las pol&iacute;ticas de seguridad?'''),
(271, 6, 1, 12, '6.9.4.2', 269, '''&iquest;Esta actualizaci&oacute;n considera la re-evaluaci&oacute;n de riesgos?'''),
(272, 6, 1, 12, '6.9.4.3', 269, '''&iquest;Esta actualizaci&oacute;n considera el grado cr&iacute;tico de la informaci&oacute;n en los sistemas subcontratados?'''),
(273, 6, 1, 13, '6.7', 0, '''&iquest;Los productos de software autorizados cuentan con las licencias respectivas debidamente registradas?'''),
(274, 6, 1, 13, '6.8', 0, '''&iquest;Se registra peri&oacute;dicamente el consumo de recursos de los diversos sistemas computacionales -CPU, disco, etc..?'''),
(275, 6, 1, 13, '6.9', 0, '''&iquest;El uso de los recursos de los sistemas se proyecta en el tiempo y se prev&eacute; necesidades de recursos adicionales?'''),
(276, 6, 1, 13, '6.10', 0, '''&iquest;La previsi&oacute;nso de uso de recursos incluye la puesta en marcha de nuevos sistemas inform&aacute;ticos?'''),
(277, 6, 1, 13, '6.11', 0, '''&iquest;El consumo de los recursos de los nuevos sistemas inform&aacute;ticos es probado durante su desarrollo y antes de su aceptaci&oacute;n?'''),
(278, 6, 1, 13, '6.12', 0, '''&iquest;La aceptaci&oacute;n de sistemas incluye la verificaci&oacute;n de requerimientos no funcionales como por ejemplo robustez, eficiencia, seguridad entre otros?'''),
(279, 6, 1, 14, '6.13', 0, '''&iquest;Existe un procedimiento establecido para protegerse contra software malicioso?'''),
(280, 6, 1, 14, '6.13.1', 279, '''&iquest;Este procedimiento incluye las acciones para detectar c&oacute;digo malicioso?'''),
(281, 6, 1, 14, '6.13.2', 279, '''&iquest;Este procedimiento incluye las acciones para prevenir la infecci&oacute;n de virus inform&aacute;ticos u otras formas de c&oacute;digo malicioso (malwares en general) siendo consciente de las diferentes v&iacute;as (email,downloading)?'''),
(282, 6, 1, 14, '6.13.3', 279, '''&iquest;Este procedimiento incluye la recuperaci&oacute;n ante eventos de intrusi&oacute;n de c&oacute;digo de malicioso tanto en computadores personales como los del CPD? '''),
(283, 6, 1, 14, '6.13.4', 279, '''&iquest;Este procedimiento incluye una difusi&oacute;n de buenas pr&aacute;cticas de protecci&oacute;n y prevensi&oacute;n ante los usuarios de la organizaci&oacute;n?'''),
(284, 6, 1, 14, '6.14', 0, '''&iquest;Existe un procedimiento establecido para velar por la seguridad de c&oacute;digos m&oacute;viles -funciones javascript, html, ajax, applets etc… -?'''),
(285, 6, 1, 14, '6.14.1', 284, '''&iquest;Este procedimiento incluye las condiciones para autorizar un determinado c&oacute;digo m&oacute;vil?'''),
(286, 6, 1, 14, '6.14.2', 284, '''&iquest;Existe un registro de todos los c&oacute;digos m&oacute;viles autorizados y el responsable de dicha autorizaci&oacute;n?'''),
(287, 6, 1, 14, '6.14.3', 284, '''&iquest;Este procedimiento incluye un mecanismo para evitar que se ejecute c&oacute;digo m&oacute;vil no apropiado?'''),
(288, 6, 1, 15, '6.15', 0, ''' &iquest;Existe un procedimiento que defina la pol&iacute;tica de respaldo de almacenamiento de la informaci&oacute;n?'''),
(289, 6, 1, 15, '6.16', 0, '''&iquest;Este procedimiento incluye una norma de registro y custodia de los respaldos?'''),
(290, 6, 1, 15, '6.17', 0, '''&iquest;Se considera una pol&iacute;tica de respaldos que considere por lo menos un respaldo anual para el caso de computadores personales?'''),
(291, 6, 1, 15, '6.18', 0, '''&iquest;Se considera una pol&iacute;tica de respaldos que considere por lo menos un respaldo mensual para el caso de computadores del CPD?'''),
(292, 6, 1, 15, '6.19', 0, '''&iquest;Es necesaria una autorizaci&oacute;n para permitir la salida de respaldos de su lugar de almacenamiento?'''),
(293, 6, 1, 15, '6.20', 0, '''&iquest;se registran y respetan los tiempos de vida medios de los soportes de respaldo y las condiciones de almacenamiento sugeridas por los fabricantes?'''),
(294, 6, 1, 15, '6.21', 0, '''&iquest;Existen mecanismos para verificar la integridad de los datos almacenados en los respaldos?'''),
(295, 6, 1, 15, '6.22', 0, '''&iquest;Los datos de los respaldos se mantienen por una cantidad fija de ciclos m&iacute;nimos de respaldo?'''),
(296, 6, 1, 15, '6.23', 0, '''&iquest;Existen al menos 2 copias de software de aplicaci&oacute;n y de base de datos almacenadas en lugares distintos a su utilizaci&oacute;n (al menos una de las copias) ?'''),
(297, 6, 1, 15, '6.24', 0, '''&iquest;La infraestructura es suficiente y est&aacute; dispoinble de tal manera que se permita, a&uacute;n despu&eacute;s de una falla general, poner en funcionamiento los sistemas?'''),
(298, 6, 1, 15, '6.25', 0, '''&iquest;Existe un procedimiento para recuperarse de fallas generales - procedimiento de reestablecimiiento -?'''),
(299, 6, 1, 15, '6.26', 0, '''&iquest;Este procedimiento incluye la necesidad de practicar restauraciones y comprobar su correcto funcionamiento?'''),
(300, 6, 1, 15, '6.26.1', 299, '''&iquest;Se han realizado pr&aacute;cticas de restauraci&oacute;n en los &uacute;ltimos dos a&ntilde;os?'''),
(301, 6, 1, 15, '6.27', 0, '''&iquest;Este procedimiento se almacena de manera remota junto con las copias de los respaldos de Sistemas Inform&aacute;ticos?'''),
(302, 6, 1, 15, '6.28', 0, '''&iquest;El almacenamiento remoto de los respaldos es lo suficientemente lejano que permita aislarse de un desastre en el sitio principal?'''),
(303, 6, 1, 15, '6.29', 0, '''&iquest;El almacenamiento remoto de respaldos sigue los mismos procedimientos de seguridad que el CPD?'''),
(304, 6, 1, 16, '6.30', 0, '''&iquest;Existe un procedimiento definido para la seguridad de redes?'''),
(305, 6, 1, 16, '6.31', 0, '''&iquest;Este procedimiento promueve la existentencia de sistemas de comunicaci&oacute;n alternativos en caso de aver&iacute;a o fallo?'''),
(306, 6, 1, 16, '6.32', 0, '''&iquest;Este procedimiento promueve la existencia de 2 proveedores de comunicaciones, o en su defecto de un &uacute;nico proveedor con dos puntos de acceso distintos y que recorran distintos caminos?'''),
(307, 6, 1, 16, '6.33', 0, '''En los contratos de comunicaciones, &iquest;est&aacute;n claramente reflejados los par&aacute;metros que definen la calidad de servicio, como ancho de banda, CIR, tiempo de respuestas de aver&iacute;as, etc.?'''),
(308, 6, 1, 16, '6.34', 0, '''&iquest;Existe alg&uacute;n plano de la instalaci&oacute;n del cableado y sistemas de comunicaciones en el edificio?'''),
(309, 6, 1, 16, '6.35', 0, '''&iquest;Se realizan pruebas peri&oacute;dicas para garantizar la calidad de las l&iacute;neas y sistemas de comunicaci&oacute;n?'''),
(310, 6, 1, 16, '6.36', 0, '''En cableado de comunicaciones, &iquest;es f&aacute;cilmente accesible para las labores de mantenimiento?'''),
(311, 6, 1, 16, '6.37', 0, '''El personal de mantenimiento, &iquest;es custodiado mientras realiza sus labores?'''),
(312, 6, 1, 16, '6.38', 0, '''Los paneles de control de las comunicaciones, &iquest;son revisados peri&oacute;dicamente?'''),
(313, 6, 1, 16, '6.39', 0, '''El cableado, &iquest;est&aacute; protegido frente a accesos no autorizados, sabotaje, interceptaci&oacute;n, etc.?'''),
(314, 6, 1, 16, '6.40', 0, '''Los equipos de comunicaciones, &iquest;se encuentran en un lugar de acceso restringido?'''),
(315, 6, 1, 16, '6.41', 0, '''&iquest;El cableado de comunicaciones est&aacute; separado de la instalaci&oacute;n el&eacute;ctrica?'''),
(316, 6, 1, 16, '6.42', 0, '''&iquest;Existe alguna protecci&oacute;n f&iacute;sica para los principales cables de conexi&oacute;n con el proveedor de comunicaciones?'''),
(317, 6, 1, 16, '6.43', 0, '''&iquest;Se he realizado un estudio sobre la problem&aacute;tica TEMPEST - seguridad de emisiones detectables -?''');
INSERT INTO `preguntas` (`id`, `caid`, `cuid`, `scid`, `codigo`, `dependencia`, `pregunta`) VALUES
(318, 6, 1, 16, '6.44', 0, '''&iquest;El procedimiento de seguridad en redes incluye ye una revisi&oacute;n y mejoramiento del mismo en plazos determinados?'''),
(319, 6, 1, 17, '6.45', 0, '''&iquest;Existe un procedimiento que regule la seguridad en torno a la divulgaci&oacute;n, modificaci&oacute;n, eliminaci&oacute;n y destrucci&oacute;n de medios de almacenamiento?'''),
(320, 6, 1, 17, '6.46', 0, '''&iquest;El procedimiento de seguridad de medios incluye una revisi&oacute;n y mejoramiento del mismo en plazos determinados?'''),
(321, 6, 1, 17, '6.47', 0, '''&iquest;Este procedimiento incluye el borrado seguro de los respaldos antes de ser reutilizados?'''),
(322, 6, 1, 17, '6.48', 0, '''&iquest;Este procedimiento incluye la destrucci&oacute;n de respaldos magn&eacute;ticos como parte previa de darlos de baja ?'''),
(323, 6, 1, 17, '6.49', 0, '''&iquest;Este procedimiento incluye una pol&iacute;tica que prohiba la libre circulaci&oacute;n de medios de almacenamiento - pendrives, discos, dvds?'''),
(324, 6, 1, 17, '6.50', 0, '''&iquest;Este procedimiento incluye una promoci&oacute;n de uso de sistemas de cifrado?'''),
(325, 6, 1, 17, '6.51', 0, '''&iquest;Este procedimiento incluye las pol&iacute;ticas de traslado de medios removibles (transportables) -por ejemplo a lugar seguro de almacenamiento de respaldos-?'''),
(326, 6, 1, 17, '6.52', 0, '''&iquest;Este procedimiento incluye una forma de verificar la integridad de la informaci&oacute;n de documentaci&oacute;n de los sistemas?'''),
(327, 6, 1, 18, '6.53', 0, '''&iquest;Existe un procedimiento formal para establecer acuerdos que regulen el intercambio de informaci&oacute;n y software con entidades externas?'''),
(328, 6, 1, 18, '6.54', 0, '''&iquest;Los acuerdos actuales de intercambio de informaci&oacute;n est&aacute;n registrados y regidos por alg&uacute;n convenio o acuerdo formal?'''),
(329, 6, 1, 18, '6.55', 0, '''&iquest;Existe un procedimiento para proteger los intercambios de informaci&oacute;n a trav&eacute;s de todos los tipos de transferencia de informaci&oacute;n?'''),
(330, 6, 1, 18, '6.56', 0, '''&iquest;Este procedimiento incluye las pol&iacute;ticas de traslado de medios removibles (transportables) -por ejemplo a lugar seguro de almacenamiento de respaldos-?'''),
(331, 6, 1, 18, '6.57', 0, '''&iquest;Este procedimiento incluye la forma de regular informaci&oacute;n v&iacute;a correo electr&oacute;nico - sobre todo re env&iacute;o - y otros medios de mensajer&iacute;a electr&oacute;nica?'''),
(332, 6, 1, 18, '6.58', 0, '''&iquest;Este procedimiento incluye la forma de resguardar la originalidad (no alteraci&oacute;n) de la informaci&oacute;n en p&aacute;ginas web?'''),
(333, 6, 1, 18, '6.59', 0, '''&iquest;Este procedimiento incluye advertencias sobre la vulnerabilidad de la informaci&oacute;n enviada en correos electr&oacute;nicos?'''),
(334, 6, 1, 18, '6.60', 0, '''&iquest;Este procedimiento incluye advertencias sobre el peligro asociado a los archivos adjuntos sean o no ejecutables?'''),
(335, 6, 1, 18, '6.61', 0, '''&iquest;Este procedimiento inlcluye advertencias sobre la inconveniencia de enviar claves de acceso mediante correos electr&oacute;nicos?'''),
(336, 6, 1, 18, '6.62', 0, '''&iquest;Este procedimiento incluye una recomendaci&oacute;n que los usuarios tengan un correo electr&oacute;nico diferente para su uso personal?'''),
(337, 6, 1, 18, '6.63', 0, '''&iquest;Este procedimiento prohibe el uso de correos electr&oacute;nicos grupales?'''),
(338, 6, 1, 18, '6.64', 0, '''&iquest;Este procedimiento incluye un listado de situaciones en las cuales NO usar correo electr&oacute;nico?'''),
(339, 6, 1, 18, '6.65', 0, '''&iquest;Este procedimiento incluye una forma de inducir al tema de firma electr&oacute;nica?'''),
(340, 6, 1, 18, '6.66', 0, '''&iquest;Este procedimiento incluye una prevensi&oacute;n respecto de comprobar el origen, despacho, entrega y aceptaci&oacute;n mediante firma electr&oacute;nica?'''),
(341, 6, 1, 18, '6.67', 0, '''&iquest;Este procedimiento incluye una precisi&oacute;n de las responsabilidades en caso de comprometer a la instituci&oacute;n mediante correos electr&oacute;nicos - difamaci&oacute;n, hostigamiento, acoso, compras no autorizadas - ?'''),
(342, 6, 1, 19, '6.68', 0, '''&iquest;Se registran sistem&aacute;ticamente las excepciones de los Sistemas Inform&aacute;ticos?'''),
(343, 6, 1, 19, '6.69', 0, '''&iquest;Se registran sistem&aacute;ticamente las irrupciones a las medidas de seguridad?'''),
(344, 6, 1, 19, '6.70', 0, '''&iquest;Existen actividades de auditor&iacute;a sistem&aacute;ticas y son debidamente registradas?'''),
(345, 6, 1, 19, '6.71', 0, '''&iquest;Los resultados de las auditor&iacute;as son mantenidos por periodos de tiempo suficiente permitiendo su an&aacute;lisis posterior?'''),
(346, 6, 1, 19, '6.72', 0, '''&iquest;Se han establecido los procedimientos para monitorear permanentemente los Sistemas de Informaci&oacute;n?'''),
(347, 6, 1, 19, '6.73', 0, '''&iquest;Las operaciones (comandos) tanto de los adminitradores de sistema como de los operadores forman parte de la informaci&oacute;n de monitoreo?'''),
(348, 6, 1, 19, '6.74', 0, '''&iquest;Los registros del procedimiento de monitoreo se revisan peri&oacute;dicamente como parte de un procedimiento ?'''),
(349, 6, 1, 19, '6.75', 0, '''&iquest;Los resultados de las auditor&iacute;as se protegen bajo reglas de control de acceso adecuadas?'''),
(350, 6, 1, 19, '6.76', 0, '''&iquest;Los resultados del monitoreo de los sistemas (logs) se protegen bajo reglas de acceso adecuadas?'''),
(351, 6, 1, 19, '6.77', 0, '''&iquest;Los registros de las auditor&iacute;as y de monitoreo forman parte de la informaci&oacute;n que se respalda?'''),
(352, 6, 1, 19, '6.78', 0, '''&iquest;Existe un procedimiento (sistema) para registrar, trazar y resolver las fallas de los sistemas inform&aacute;ticos?'''),
(353, 6, 1, 19, '6.79', 0, '''&iquest;Los relojes de los diferentes sistemas operativos que sostienen sistemas est&aacute;n coordinados en base a una fuente &uacute;nica?'''),
(354, 7, 1, 20, '7.1', 0, '''&iquest;Existe una pol&iacute;tica documentada de control de acceso a los sistemas inform&aacute;ticos?'''),
(355, 7, 1, 20, '7.2', 0, '''&iquest;Esta pol&iacute;tica incluye el ciclo de vida completo, desde la asignaci&oacute;n hasta la caducaci&oacute;n?'''),
(356, 7, 1, 20, '7.3', 0, '''&iquest;Esta pol&iacute;tica trata de manera separada agregando restricciones especiales cuando se trata de usuarios con claves de accesos con privilegios que permitir&iacute;an acciones de riesgo para los sistemas?'''),
(357, 7, 1, 20, '7.4', 0, '''&iquest;Esta pol&iacute;tica tiene un proceso de revisi&oacute;n per&iacute;odico tendiente a su actualizaci&oacute;n?'''),
(358, 7, 1, 21, '7.5', 0, '''&iquest;Existe un proceso formal que defina la forma en que se entregan los identificadores (usuarios/claves) de los Sistemas Inform&aacute;ticos?'''),
(359, 7, 1, 21, '7.6', 0, '''&iquest;Existe una recomendaci&oacute;n formal de seguir buenas pr&aacute;cticas en el uso de las claves e identificadores?'''),
(360, 7, 1, 22, '7.7', 0, '''&iquest;Los t&eacute;rminos de los contratos de empleo incluyen los aspectos de seguridad de la informaci&oacute;n, es decir, obligaciones del empleado y de la organizaci&oacute;n a este respecto?'''),
(361, 7, 1, 22, '7.8', 0, '''&iquest;Este procedimiento formal incluye: la obligaci&oacute;n de mantener confidencial los identificadores?'''),
(362, 7, 1, 22, '7.9', 0, '''&iquest;Este procedimiento formal incluye: la obligaci&oacute;n de no registrar los identificadores en papel?'''),
(363, 7, 1, 22, '7.10', 0, '''&iquest;Este procedimiento formal incluye: la prohibici&oacute;n de no almacenar identificadores en computadores de manera no protegida?'''),
(364, 7, 1, 22, '7.11', 0, '''&iquest;Este procedimiento formal incluye: el deber de no compartir los identificadores de usuarios individuales?'''),
(365, 7, 1, 22, '7.12', 0, '''&iquest;Este procedimiento formal incluye: el mandato de no incluir los identificadores como parte de una sesi&oacute;n de inicio de un proceso autom&aacute;tico?'''),
(366, 7, 1, 22, '7.13', 0, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores cuando hay indicios de un compromiso del identificador del sistema (hackeo)?'''),
(367, 7, 1, 22, '7.14', 0, '''&iquest;Este procedimiento formal incluye: la recomendaci&oacute;n de elegir identificadores (claves) seguros -no uso de fechas cl&aacute;sicas, nombres de la familia, longitud m&iacute;nima, etc?'''),
(368, 7, 1, 22, '7.15', 0, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores a intervalos regulares?'''),
(369, 7, 1, 22, '7.16', 0, '''&iquest;Este procedimiento formal incluye: la indicaci&oacute;n de cambiar los identificadores a intervalos regulares?'''),
(370, 7, 1, 22, '7.17', 0, '''&iquest;Este procedimiento formal incluye: normas para evitar el reciclaje de identificadores ya usados?'''),
(371, 7, 1, 22, '7.18', 0, '''&iquest;Este procedimiento considera el registro de los usuarios y sus privilegios en sistemas inform&aacute;ticos espec&iacute;ficos?'''),
(372, 7, 1, 22, '7.19', 0, '''&iquest;Existe un procedimiento de auditor&iacute;a permanente que verifique que los accesos a los sistemas corresponden a los privilegios otorgados?'''),
(373, 7, 1, 22, '7.20', 0, '''&iquest;Existe una pol&iacute;tica para equipo desatendido'''),
(374, 7, 1, 22, '7.20.1', 373, '''&iquest;Se incentiva a los usuarios a configurar sus sistemas (operativos) para cerrar las sesiones de los computadores principales cuando la sesi&oacute;n finaliza?'''),
(375, 7, 1, 22, '7.20.2', 373, '''&iquest;Se incentiva a los usuarios a configurar sus sistemas (operativos) para que en los momentos que no se use queden bloqueados -por ejemplo claves en el refrescador de pantalla-?'''),
(376, 7, 1, 22, '7.21', 0, '''&iquest;Existe un pr&aacute;ctica de escritorio limpio que inclye medios removibles y pantalla limpia para equipos de procesamiento de datos?'''),
(377, 7, 1, 22, '7.21.1', 376, '''&iquest;Esta pol&iacute;tica de seguridad f&iacute;sica promociona una pr&aacute;ctica de escritorio limpio? '''),
(378, 7, 1, 23, '7.22', 0, '''&iquest;Existe una pol&iacute;tica documentada de control de acceso a los sistemas inform&aacute;ticos?'''),
(379, 7, 1, 23, '7.22.1', 378, '''&iquest;Esta pol&iacute;tica de control de acceso considera el acceso a las redes?'''),
(380, 7, 1, 23, '7.22.2', 378, '''&iquest;Se considera m&eacute;todos de autenticaci&oacute;n para usuarios remotos?'''),
(381, 7, 1, 23, '7.22.3', 378, '''&iquest;Se considera la identificaci&oacute;n del equipo c&oacute;mo parte del acceso remoto?'''),
(382, 7, 1, 23, '7.22.4', 378, '''&iquest;El acceso a puertos de diagn&oacute;stico y configuraci&oacute;n (f&iacute;sicos y l&oacute;gicos) est&aacute;n bajo control y monitoreo?'''),
(383, 7, 1, 23, '7.23', 0, '''&iquest;Existe una pol&iacute;tica de segregaci&oacute;n de redes de acuerdo a riesgos identificados y rendimiento?'''),
(384, 7, 1, 23, '7.23.1', 383, '''&iquest;Esta pol&iacute;tica se ejecuta con los registros correspondientes?'''),
(385, 7, 1, 23, '7.23.2', 383, '''&iquest;Se restringe el acceso a los usuarios a las redes compartidas de acuerdo a esta pol&iacute;tica de seguridad?'''),
(386, 7, 1, 23, '7.23.3', 383, '''&iquest;Esta pol&iacute;tica de seguridad incluye el monitoreo de routers y equipos de comunicaci&oacute;n?'''),
(387, 7, 1, 23, '7.23.4', 383, '''&iquest;Este monitoreo se ejecuta con los registros correspondientes?'''),
(388, 7, 1, 23, '7.23.5', 383, '''&iquest;Existe un sistema de monitoreo que detecte intentos fallidos de acceso?'''),
(389, 7, 1, 24, '7.24', 0, '''&iquest;Se utiliza alg&uacute;n m&eacute;todo de acceso a S.O. con autentificaci&oacute;n segura?'''),
(390, 7, 1, 24, '7.24.1', 389, '''&iquest;Este procedimiento est&aacute; formalizado en procedimientos o pol&iacute;tica?'''),
(391, 7, 1, 24, '7.24.2', 389, '''Para el acceso a los Sistemas Operativos, &iquest;Cada usuario tiene un identificador &uacute;nico y exclusivo?'''),
(392, 7, 1, 24, '7.24.3', 389, '''&iquest;Este hecho est&aacute; formalizado en procedimientos o pol&iacute;tica?'''),
(393, 7, 1, 24, '7.25', 0, '''&iquest;Se utiliza un sistema de gesti&oacute;n de claves que asegura claves de buena calidad en los Sistemas Operativos?'''),
(394, 7, 1, 24, '7.26', 0, '''&iquest;Existe un procedimiento norma que regule la instalaci&oacute;n de utilidades en el Sistema Operativo (Personales o del CPD) de manera de evitar la acci&oacute;n de software de protecci&oacute;n o de monitoreo?'''),
(395, 7, 1, 24, '7.27', 0, '''&iquest;Se limita el acceso remoto de tal manera que ante tiempos m&aacute;ximos de inactividad se produce una desconexi&oacute;n del Sistema Operativo?'''),
(396, 7, 1, 24, '7.27.1', 395, '''&iquest;Lo anterior est&aacute; formalizado en la pol&iacute;tica de seguridad u otra norma?'''),
(397, 7, 1, 25, '7.28', 0, '''&iquest;Los sistemas con informaci&oacute;n sensible corren de manera dedicada (aislada)?'''),
(398, 7, 1, 25, '7.29', 0, '''&iquest;Todos los sistemas de informaci&oacute;n de nivel de aplicaci&oacute;n tienen control de acceso?'''),
(399, 7, 1, 25, '7.30', 0, '''&iquest;Existe un sistema de alarmas sobre intentos o irrupciones a la seguridad?'''),
(400, 7, 1, 26, '7.31', 0, '''&iquest;Existe una pol&iacute;tica o norma que regule el teletrabajo?'''),
(401, 7, 1, 26, '7.32', 0, '''&iquest;Existe una pol&iacute;tica o norma que regule el desarrollo, prueba y uso de los sistemas inform&aacute;ticos que pueden ser accedidos por medio de dispositivos m&oacute;viles?'''),
(402, 7, 1, 26, '7.33', 0, '''&iquest;Existe una restricci&oacute;n de uso de computadores de propiedad de las personas?'''),
(403, 8, 1, 27, '8.1', 0, '''&iquest;Se incluye la seguridad en las especificaciones de Sistemas nuevos?'''),
(404, 8, 1, 27, '8.2', 0, '''&iquest;Los requerimientos de seguridad son acordados, justificados y documentados en las especificaciones de los sistemas a desarrollar?'''),
(405, 8, 1, 28, '8.3', 0, '''&iquest;Se realizan pruebas estructuradas a los sistemas?'''),
(406, 8, 1, 28, '8.3.1', 405, '''&iquest;Es parte del procedimiento asegurar que los datos de prueba son correctos y apropiados?'''),
(407, 8, 1, 28, '8.3.2', 405, '''&iquest;Se prueban los sistemas activando procedimientos de verificaci&oacute;n que tiendan a detectar corrupciones o itnervenciones de terceros en los datos?'''),
(408, 8, 1, 28, '8.3.3', 405, '''&iquest;Para el caso de los sistemas se incluyen los requerimientos para asegurar la integridad de los mensajes cuando los hay?'''),
(409, 8, 1, 28, '8.3.4', 405, '''&iquest;Existe un procedimiento para asegurar que los datos de prueba son correctos y apropiados?'''),
(410, 8, 1, 28, '8.3.5', 405, '''&iquest;Es parte del procedimiento asegurar que los datos de salida corresponden a los datos de entrada procesados?'''),
(411, 8, 1, 29, '8.4', 0, '''&iquest;El procedimiento para especificar sistemas incluye requerimientos de criptograf&iacute;a para manejo de informaci&oacute;n sensible cuando corresponde?'''),
(412, 8, 1, 29, '8.5', 0, '''&iquest;Se especifica en los requerimientos control de acceso para los nuevos sistemas?'''),
(413, 8, 1, 29, '8.6', 0, '''&iquest;Este procesamiento esta formalizado?'''),
(414, 8, 1, 30, '8.7', 0, '''&iquest;Se controla la instalaci&oacute;n de software?'''),
(415, 8, 1, 30, '8.8', 0, '''&iquest;Los sets de pruebas de sistemas permanecen protegidos?'''),
(416, 8, 1, 30, '8.9', 0, '''&iquest;Los c&oacute;digo fuentes de los programas estpan debidamente protegidos?'''),
(417, 8, 1, 30, '8.10', 0, '''&iquest;Existen procedimientos formalizados de control de cambios de los sistemas desarrollados ad hoc?'''),
(418, 8, 1, 30, '8.11', 0, '''&iquest;Las condiciones para activar cambios en los sistemas est&aacute;n restringidos y existe un procedimiento que aprueba s&oacute;lo cambios espec&iacute;ficos?'''),
(419, 8, 1, 30, '8.12', 0, '''Los productos cuyos desarrollos son externalizados &iquest;son debidamente supervisados y monitorizados durante el desarrollo?'''),
(420, 8, 1, 30, '8.14', 0, '''Existe un procedimiento que permita detectar las vulnerabilidades de los sistemas inform&aacute;ticos desarrollados para la organizaci&oacute;n'''),
(421, 8, 1, 30, '8.14.1', 420, '''&iquest;Se evaluan estas vulnerabilidades e identifican los riesgos para la organizaci&oacute;n de las respectivas exposiciones de informaci&oacute;n?'''),
(422, 8, 1, 30, '8.14.2', 420, '''&iquest;Se toman las medidas adecuadas para superar estas vulnerabilidades?'''),
(423, 9, 1, 31, '9.1', 0, '''&iquest;Se registran las incidencias de seguridad de la informaci&oacute;n?'''),
(424, 9, 1, 31, '9.2', 0, '''&iquest;Las incidencias de seguridad de la informaci&oacute;n se reporten a la gerencia de manera r&aacute;pida (jefatura de servicio)?'''),
(425, 9, 1, 31, '9.2', 0, '''&iquest;Los procedimientos formales requieren a los usuarios que reporten las fallas a la seguridad de la informaci&oacute;n?'''),
(426, 9, 1, 31, '9.4', 0, '''&iquest;Est&aacute;n definido un procedimiento formal sobre el cual la autoridad se gu&iacute;e para responder r&aacute;pidamente a los incidentes de seguridad?'''),
(427, 9, 1, 31, '9.4.1', 426, '''&iquest;Este procedimiento es debidamente difundido a todos los funcionarios y se conocen sus pasos y consecuencias?'''),
(428, 9, 1, 31, '9.5', 0, '''&iquest;Existen los mecanismos para permitir cuantificar y monitorear los tiempos, vol&uacute;menes y costos de los incidentes en la seguridad de la informaci&oacute;n?'''),
(429, 9, 1, 31, '9.6', 0, '''&iquest;El procedimiento para dirimir las incidencias de seguridad de la informaci&oacute;n considera las evidencias correspondientemente a cada caso?'''),
(430, 9, 1, 31, '9.7', 0, '''&iquest;Este procedimiento considera revisarse y mejorarse de manera continua?'''),
(431, 10, 1, 32, '10.1', 0, '''&iquest;La continuidad operativa o continuidad del negocio es un concepto difundido al interior de la organizaci&oacute;n?'''),
(432, 10, 1, 32, '10.2', 0, '''&iquest;La continuidad operativa, o continuidad del negocio es una preocupaci&oacute;n del jefe de servicio?'''),
(433, 10, 1, 32, '10.3', 0, '''&iquest;La continuidad operativa forma parte de una pol&iacute;tica de seguridad de la organzaci&oacute;n?'''),
(434, 10, 1, 32, '10.4', 0, '''&iquest;Se han identificado los procesos cr&iacute;ticos (y m&iacute;nimos) los cuales, de estar operando, se puede afirmar que la organizaci&oacute;n est&aacute; desarrollando su funci&oacute;n?'''),
(435, 10, 1, 32, '10.5', 0, '''&iquest;Se han estudiado las fallas de seguridad, p&eacute;rdida del servicio y disponibilidad del servicio en cuanto a su impacto en los procesos cr&iacute;ticos?'''),
(436, 10, 1, 32, '10.6', 0, '''&iquest;Existe un pol&iacute;tica de proteger estos procesos cr&iacute;ticos en cuanto a respaldar la documentaci&oacute;n que indique c&oacute;mo deben llevarse a cabo (descripci&oacute;n del proceso)?'''),
(437, 10, 1, 32, '10.7', 0, '''&iquest;Existe la pol&iacute;tica de mantener estos procesos cr&iacute;ticos operando tomando las precauciones necesarias para que esto ocurra as&iacute; (reemplazos, restauraci&oacute;n de estado de los procesos) ?'''),
(438, 10, 1, 32, '10.8', 0, '''&iquest;La pol&iacute;tica de respaldos incluye de manera diferenciada el respaldo de informaci&oacute;n de los procesos cr&iacute;ticos de la organizaci&oacute;n?'''),
(439, 10, 1, 32, '10.9', 0, '''&iquest;Existe una pol&iacute;tica que &iacute;ndique que deben realizarse pruebas de restauraci&oacute;n de los procesos cr&iacute;ticos?'''),
(440, 10, 1, 32, '10.10', 0, '''&iquest;Existe evidencia de pr&aacute;cticas en la restauraci&oacute;n de los procesos cr&iacute;ticos?'''),
(441, 11, 1, 33, '11.1', 0, '''&iquest;Se tienen identificados los reglamentos, normas y leyes que regulan la operaci&oacute;n de la organzaci&oacute;n y sistemas de informaci&oacute;n?'''),
(442, 11, 1, 33, '11.2', 0, '''Estos reglamentos, estatutos, normas y leyes, &iquest;se mantienen disponibles y actualizados?'''),
(443, 11, 1, 33, '11.3', 0, '''&iquest;Se han implantado los procedimientos administrativos que aseguren el cumplimiento de los requerimientos legislativos - derechos de copia, patentes de software, propiedad intelectual en general?'''),
(444, 11, 1, 33, '11.4', 0, '''&iquest;Se categorizan los datos en la organizaci&oacute;n de acuerdo a su requerimiento en t&eacute;rminos legales, estatutarios, normativo y contraactuales?'''),
(445, 11, 1, 33, '11.5', 0, '''&iquest;Existe una pol&iacute;tica de protecci&oacute;n de datos acuerdo a estas categor&iacute;as?'''),
(446, 11, 1, 33, '11.6', 0, '''&iquest;Existe una pol&iacute;tica de preservaci&oacute;n y destrucci&oacute;n de datos de acuerdo a estas categor&iacute;as?'''),
(447, 11, 1, 33, '11.7', 0, '''&iquest;Esta pol&iacute;tica de preservaci&oacute;n y destrucci&oacute;n se ha traducido en procedimientos que se aplican regularmente?'''),
(448, 11, 1, 33, '11.8', 0, '''Durante per&iacute;odo de preservaci&oacute;n, &iquest;existen los controles adecuados para proteger los datos de p&eacute;rdidas, destrucci&oacute;n o falsificaci&oacute;n?'''),
(449, 11, 1, 33, '11.9', 0, '''Para la destrucci&oacute;n, &iquest;existen los controles adecuados que permitan asegurar la pertinencia de dicha destrucci&oacute;n?'''),
(450, 11, 1, 34, '11.10', 0, '''&iquest;Se difunde a los usuarios sobre las limitaciones de su rango de acci&oacute;n en los accesos a sistemas?'''),
(451, 11, 1, 34, '11.11', 0, '''&iquest;Se difunde a los usuarios sobre la existencia de sistemas de monitorizaci&oacute;n sobre sus acciones en los sistemas de informaci&oacute;n?'''),
(452, 11, 1, 34, '11.12', 0, '''&iquest;Los monitoreos incluyen inspecci&oacute;n de contenidos, prevenci&oacute;n y detecci&oacute;n de intrusiones al sistema?'''),
(453, 11, 1, 34, '11.13', 0, '''&iquest;Las t&eacute;cnicas de protecci&oacute;n y criptograf&iacute;a est&aacute;n de acuerdo a la ley?'''),
(454, 11, 1, 34, '11.14', 0, '''&iquest;Existe una revisi&oacute;n peri&oacute;dica que verifique el cumplimiento de los procedimientos y normas internas de seguridad?'''),
(455, 11, 1, 34, '11.15', 0, '''&iquest;Existe una verificaci&oacute;n peri&oacute;dica que los sistemas cumplen con los requerimientos internos de seguridad, especialmente (pero no limitado a) pruebas de penetraci&oacute;n y evaluaci&oacute;n de vulnerabilidades?'''),
(456, 11, 1, 34, '11.16', 0, '''&iquest;Las pol&iacute;ticas de recolecci&oacute;n de datos y procedimintos de auditor&iacute;a se han dise&ntilde;ado para que tengan un impacto m&iacute;nimo en el normal uso de los sistemas y procedimientos?'''),
(457, 11, 1, 34, '11.17', 0, '''&iquest;El acceso a informaci&oacute;n y herramientas de auditor&iacute;a est&aacute; limitado de acuerdo a privilegios y seguridad establecidos?'''),
(458, 11, 1, 34, '11.18', 0, '''&iquest;Las actividades relacionadas a \\"Cumplimiento\\" son asesoradas por personas calificadas en derecho ya sean externos o internos?''');

-- --------------------------------------------------------

--
-- Table structure for table `respuestas`
--

CREATE TABLE IF NOT EXISTS `respuestas` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL,
  `pid` int(10) DEFAULT NULL,
  `respuesta` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `pid` (`pid`),
  KEY `respuestas_cst_1` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categorias`
--

CREATE TABLE IF NOT EXISTS `sub_categorias` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL,
  `sub_categoria` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cid_idx` (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci AUTO_INCREMENT=35 ;

--
-- Dumping data for table `sub_categorias`
--

INSERT INTO `sub_categorias` (`id`, `cid`, `sub_categoria`) VALUES
(1, 1, 'Pol&iacute;tica de Seguridad de la Informaci&oacute;n'),
(2, 2, 'Organizaci&oacute;n Interna'),
(3, 2, 'Entidades Externas'),
(4, 3, 'Responsabilidad por los Activos'),
(5, 4, 'Antes del Empleo'),
(6, 4, 'Durante del Empleo'),
(7, 4, 'Terminaci&oacute;n o cambio de empleo'),
(8, 5, '&Aacute;reas Seguras'),
(9, 5, 'Seguridad del Equipo'),
(10, 5, 'Suministro El&eacute;ctrico'),
(11, 6, 'Procedimientos y responsabilidades operacionales'),
(12, 6, 'Gesti&oacute;n de la entrega de servicios de terceros'),
(13, 6, 'Planeaci&oacute;n y aceptaci&oacute;n de Sistemas'),
(14, 6, 'Protecci&oacute;n contra software malicioso y c&oacute;digo m&oacute;vil'),
(15, 6, 'Pol&iacute;tica de respaldos'),
(16, 6, 'Gesti&oacute;n de Seguridad de Redes'),
(17, 6, 'Gesti&oacute;n de Medios'),
(18, 6, 'Intercambio de Informaci&oacute;n'),
(19, 6, 'Monitoreo'),
(20, 7, 'Requerimiento comercial para el control de acceso'),
(21, 7, 'Gesti&oacute;n del acceso del usuario'),
(22, 7, 'Responsabilidad del Usuario'),
(23, 7, 'Control de acceso a redes'),
(24, 7, 'Control de acceso a Sistemas Operativos'),
(25, 7, 'Control de acceso a la aplicaci&oacute;n o informaci&oacute;n'),
(26, 7, 'Computaci&oacute;n M&oacute;vil y Teletrabajo'),
(27, 8, 'Requerimiento de la Seguridad de los Sistemas'),
(28, 8, 'Procesamiento correcto de las aplicaciones'),
(29, 8, 'Controles Criptogr&aacute;ficos'),
(30, 8, 'Serguridad de los archivos de los sistemas'),
(31, 9, 'Gesti&oacute;n de incidentes en la seguridad de la Informaci&oacute;n'),
(32, 10, 'Gesti&oacute;n de Continuidad del Negocio '),
(33, 11, 'Cumplimientos legales'),
(34, 11, 'Prevenci&oacute;n de mal uso de informaci&oacute;n');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `oid` int(10) NOT NULL,
  `user` varchar(50) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `cargo` varchar(50) DEFAULT NULL,
  `mail` varchar(50) DEFAULT NULL,
  `last_update` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oid` (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `oid`, `user`, `passwd`, `nombre`, `apellidos`, `cargo`, `mail`, `last_update`) VALUES
(1, 1, 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'Usuario de prueba', 'Usuario de prueba', 'Tester', '123@123.com', '2014-11-26 04:15:17');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `historial_logins`
--
ALTER TABLE `historial_logins`
  ADD CONSTRAINT `historial_logins_cs_1` FOREIGN KEY (`uid`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `keys_usuarios`
--
ALTER TABLE `keys_usuarios`
  ADD CONSTRAINT `keys_usuarios_cst_1` FOREIGN KEY (`uid`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `normas_en_preguntas`
--
ALTER TABLE `normas_en_preguntas`
  ADD CONSTRAINT `normas_en_preguntas_cst_1` FOREIGN KEY (`pid`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `normas_en_preguntas_cst_2` FOREIGN KEY (`nid`) REFERENCES `normas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_cst_1` FOREIGN KEY (`caid`) REFERENCES `categorias` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `preguntas_cst_2` FOREIGN KEY (`cuid`) REFERENCES `cuestionarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `preguntas_cst_3` FOREIGN KEY (`scid`) REFERENCES `sub_categorias` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `respuestas`
--
ALTER TABLE `respuestas`
  ADD CONSTRAINT `respuestas_cst_1` FOREIGN KEY (`uid`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `respuestas_cst_2` FOREIGN KEY (`pid`) REFERENCES `preguntas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categorias`
--
ALTER TABLE `sub_categorias`
  ADD CONSTRAINT `sub_categorias_cs_1` FOREIGN KEY (`cid`) REFERENCES `categorias` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`oid`) REFERENCES `organizaciones` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
