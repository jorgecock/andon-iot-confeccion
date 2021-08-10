-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-08-2021 a las 21:53:11
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `controldeestados1`
--
CREATE DATABASE IF NOT EXISTS `controldeestados1` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `controldeestados1`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dispositivosiot`
--

CREATE TABLE IF NOT EXISTS `dispositivosiot` (
  `iddispositivoIoT` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` int(11) NOT NULL,
  `tipodispositivoIoT` int(11) NOT NULL,
  `firmware` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `idusuario` int(11) NOT NULL,
  PRIMARY KEY (`iddispositivoIoT`),
  KEY `idmodulo` (`modulo`),
  KEY `tipodispositivoIoT` (`tipodispositivoIoT`),
  KEY `fk_dispositivosiot_usuario` (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE IF NOT EXISTS `estados` (
  `idestado` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`idestado`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`idestado`, `estado`) VALUES
(1, 'En programación'),
(2, 'En validación'),
(3, 'En proceso'),
(4, 'Pausado Supervisor'),
(5, 'Parado Línea'),
(6, 'Terminado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosordenproduccion`
--

CREATE TABLE IF NOT EXISTS `estadosordenproduccion` (
  `idestadoordenproduccion` int(11) NOT NULL AUTO_INCREMENT,
  `estado` varchar(10) COLLATE utf8_spanish_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idestadoordenproduccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estadosordenproduccion`
--

INSERT INTO `estadosordenproduccion` (`idestadoordenproduccion`, `estado`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Inscrita', 1, '2020-05-25 17:22:06', NULL, NULL),
(2, 'En Proceso', 1, '2020-05-25 17:22:06', NULL, NULL),
(3, 'Pausada', 1, '2020-05-25 17:22:52', NULL, NULL),
(4, 'Cancelada', 1, '2020-05-25 17:22:52', NULL, NULL),
(5, 'Terminada', 1, '2020-05-25 17:23:08', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modulos`
--

CREATE TABLE IF NOT EXISTS `modulos` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombremodulo` varchar(40) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `ordendeprod` int(11) NOT NULL DEFAULT 0,
  `itemaproducir` int(11) NOT NULL DEFAULT 0,
  `unidadesesperadas` int(11) NOT NULL,
  `tiempocicloesperado` float NOT NULL,
  `minutosprogramados` float NOT NULL,
  `productoshechos` int(11) NOT NULL DEFAULT 0,
  `momentodeinicio` int(11) NOT NULL,
  `momentodepausa` int(11) NOT NULL,
  `momentoinidespausa` int(11) NOT NULL,
  `tiemporegistro` int(11) NOT NULL,
  `tiemporegistroanterior` int(11) NOT NULL,
  `ultimotiempodeproduccion` float NOT NULL,
  `tiempoacumulado` int(11) NOT NULL DEFAULT 0,
  `tiempopausado` int(11) NOT NULL DEFAULT 0,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `voltage` float NOT NULL,
  `prodhechosdespausaini` int(11) NOT NULL,
  `eficienciaacumulada` float NOT NULL,
  `pausashechas` int(11) NOT NULL,
  `tiempoacumtrabajo` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`),
  KEY `idestado` (`estado`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modulos`
--

INSERT INTO `modulos` (`idmodulo`, `nombremodulo`, `descripcion`, `estado`, `ordendeprod`, `itemaproducir`, `unidadesesperadas`, `tiempocicloesperado`, `minutosprogramados`, `productoshechos`, `momentodeinicio`, `momentodepausa`, `momentoinidespausa`, `tiemporegistro`, `tiemporegistroanterior`, `ultimotiempodeproduccion`, `tiempoacumulado`, `tiempopausado`, `created_at`, `updated_at`, `deleted_at`, `status`, `voltage`, `prodhechosdespausaini`, `eficienciaacumulada`, `pausashechas`, `tiempoacumtrabajo`) VALUES
(1, 'Modulo 1 Camisas Polo', 'Modulo Camisas Polo', 3, 22, 9, 10, 1, 10, 0, 1628187658, 0, 1628187658, 1628187658, 0, 0, 0, 0, '2021-08-05 11:30:35', '2021-08-05 20:15:40', NULL, 1, 0, 0, 0, 0, 0),
(2, 'Modulo 2 Ropa Deportiva', 'Ropa Deportiva', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2021-08-05 11:33:23', NULL, NULL, 1, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenesproduccion`
--

CREATE TABLE IF NOT EXISTS `ordenesproduccion` (
  `idordenproduccion` int(11) NOT NULL AUTO_INCREMENT,
  `numeroordenproduccion` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `fechaprogramacion` date DEFAULT NULL,
  `fechapausa` date DEFAULT NULL,
  `fechacontinuacion` date DEFAULT NULL,
  `fechacierre` date DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `idestadoordenproduccion` int(11) NOT NULL DEFAULT 1,
  `status` int(11) NOT NULL DEFAULT 1,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`idordenproduccion`),
  KEY `idestadoordenproduccion` (`idestadoordenproduccion`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `ordenesproduccion`
--

INSERT INTO `ordenesproduccion` (`idordenproduccion`, `numeroordenproduccion`, `fechaprogramacion`, `fechapausa`, `fechacontinuacion`, `fechacierre`, `created_at`, `updated_at`, `deleted_at`, `descripcion`, `idestadoordenproduccion`, `status`, `usuario_id`) VALUES
(22, '10001', '2021-08-05', NULL, NULL, NULL, '2021-08-05 12:05:02', NULL, NULL, 'Polos Rojas', 1, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE IF NOT EXISTS `producto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `referencia` varchar(30) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(100) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idproducto`, `nombre`, `referencia`, `descripcion`, `created_at`, `updated_at`, `deleted_at`, `status`, `usuario_id`) VALUES
(9, 'Camisa Polo Niño xs', '1234', 'Polo Verde', '2021-08-05 13:19:32', NULL, NULL, 1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroeficiencias`
--

CREATE TABLE IF NOT EXISTS `registroeficiencias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ordendeprod` int(11) NOT NULL,
  `itemaproducir` int(11) NOT NULL,
  `cantidadesperada` int(11) NOT NULL,
  `cantidadhecha` int(11) NOT NULL,
  `eficiencia` float NOT NULL,
  `fechahora` datetime NOT NULL DEFAULT current_timestamp(),
  `modulo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_registroeficiencias_ordenesproduccion` (`ordendeprod`),
  KEY `fk_registroeficiencias_producto` (`itemaproducir`),
  KEY `fk_registroeficiencias_modulos` (`modulo`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registrotiempos`
--

CREATE TABLE IF NOT EXISTS `registrotiempos` (
  `idregistro` int(11) NOT NULL AUTO_INCREMENT,
  `ordendeprod` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `itemaproducir` varchar(25) COLLATE utf8_spanish_ci NOT NULL,
  `idmodulo` int(11) NOT NULL,
  `horaderegistro` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idregistro`)
) ENGINE=InnoDB AUTO_INCREMENT=400 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE IF NOT EXISTS `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `rol` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `rol`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Admin', 1, NULL, NULL, NULL),
(2, 'Supervisor', 1, NULL, NULL, NULL),
(3, 'Operario', 1, NULL, NULL, NULL),
(4, 'Gerente', 1, NULL, NULL, NULL),
(5, 'Administrador', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiposdispositivosiot`
--

CREATE TABLE IF NOT EXISTS `tiposdispositivosiot` (
  `idtipodispositivoiot` int(11) NOT NULL AUTO_INCREMENT,
  `tipodispositivoIoT` varchar(20) COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(200) COLLATE utf8_spanish_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idtipodispositivoiot`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tiposdispositivosiot`
--

INSERT INTO `tiposdispositivosiot` (`idtipodispositivoiot`, `tipodispositivoIoT`, `descripcion`, `created_at`, `updated_at`, `deleted_at`, `status`) VALUES
(1, '1A', 'Caja Wifi con botones: verde de aceptar y rojo de paro, con opción de medir corriente', '2020-09-04 19:16:59', '2020-11-27 15:37:13', NULL, 1),
(2, '2A', 'Caja Wifi con  monitoreo de corriente y opción de apagar máquinas', '2020-09-04 19:19:45', '2020-11-27 15:37:05', '2021-07-16 10:23:44', 1),
(8, 'Lector codigo Barras', 'Referencia 1.2.1.', '2021-07-28 19:20:42', NULL, NULL, 1),
(9, 'Lector RFID', 'Lector RFID V1.1', '2021-07-28 19:22:17', NULL, NULL, 1),
(10, 'Celular', 'Android', '2021-07-28 19:54:18', NULL, NULL, 1),
(11, 'tableta', 'tableta', '2021-07-28 19:55:21', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `idusuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) COLLATE utf8_spanish_ci DEFAULT NULL,
  `correo` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `usuario` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `clave` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `rol` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `rol` (`rol`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`, `rol`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Jorge Andrés Cock Ramírez', 'jcock@sena.edu.co', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1, 1, '2020-11-27 09:52:55', NULL, NULL),
(2, 'Gustavo Carvajal Ramírez', 'gcarvajal@sena.edu.co.com', 'gcarvajal', '827ccb0eea8a706c4c34a16891f84e7b', 2, 1, '2020-11-27 09:53:03', '2020-11-27 16:01:10', NULL),
(3, 'Karolina Paniagua Gómez', 'kpaniagua@sena.edu.co', 'kpaniagua', '827ccb0eea8a706c4c34a16891f84e7b', 3, 1, '2020-11-27 09:53:14', NULL, NULL),
(4, 'Marisol Osorio Beltran', 'marosorio@sena.edu.co', 'marosorio', '827ccb0eea8a706c4c34a16891f84e7b', 2, 1, '2020-11-27 09:53:18', NULL, NULL),
(21, 'Fabio Andrés Gaviria', 'fgaviria@sena.edu.co', 'fgaviria', '827ccb0eea8a706c4c34a16891f84e7b', 3, 0, '2020-11-27 10:05:30', '2020-11-27 16:06:59', '2020-11-27 10:07:13'),
(22, 'Filiberto', 'filiberto@filiberto', 'filiberto', '13b1c60ea8ad6db4ea5a08e86d65235b', 4, 0, '2021-07-20 14:09:55', NULL, '2021-07-20 14:10:58');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `dispositivosiot`
--
ALTER TABLE `dispositivosiot`
  ADD CONSTRAINT `dispositivosiot_ibfk_2` FOREIGN KEY (`tipodispositivoIoT`) REFERENCES `tiposdispositivosiot` (`idtipodispositivoiot`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dispositivosiot_ibfk_3` FOREIGN KEY (`modulo`) REFERENCES `modulos` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dispositivosiot_ibfk_4` FOREIGN KEY (`tipodispositivoIoT`) REFERENCES `tiposdispositivosiot` (`idtipodispositivoiot`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_dispositivosiot_usuario` FOREIGN KEY (`idusuario`) REFERENCES `usuario` (`idusuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `modulos`
--
ALTER TABLE `modulos`
  ADD CONSTRAINT `modulos_ibfk_1` FOREIGN KEY (`estado`) REFERENCES `estados` (`idestado`);

--
-- Filtros para la tabla `ordenesproduccion`
--
ALTER TABLE `ordenesproduccion`
  ADD CONSTRAINT `fk_ordenesproduccion_estadosordenproduccion` FOREIGN KEY (`idestadoordenproduccion`) REFERENCES `estadosordenproduccion` (`idestadoordenproduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `registroeficiencias`
--
ALTER TABLE `registroeficiencias`
  ADD CONSTRAINT `fk_registroeficiencias_modulos` FOREIGN KEY (`modulo`) REFERENCES `modulos` (`idmodulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registroeficiencias_ordenesproduccion` FOREIGN KEY (`ordendeprod`) REFERENCES `ordenesproduccion` (`idordenproduccion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_registroeficiencias_producto` FOREIGN KEY (`itemaproducir`) REFERENCES `producto` (`idproducto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rol`) REFERENCES `rol` (`idrol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
