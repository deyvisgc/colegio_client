-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 08-04-2022 a las 15:48:03
-- Versión del servidor: 10.3.32-MariaDB
-- Versión de PHP: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_colegio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `id_curso` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `curso`
--

INSERT INTO `curso` (`id_curso`, `nombre`) VALUES
(30, 'Matematicas'),
(33, 'Fundamentos de programacion'),
(34, 'Comunicacion'),
(35, 'Ingles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grado`
--

CREATE TABLE `grado` (
  `id_grado` int(11) NOT NULL,
  `descripcion` varchar(20) DEFAULT NULL,
  `seccion` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grado`
--

INSERT INTO `grado` (`id_grado`, `descripcion`, `seccion`) VALUES
(10, 'Primero', 'A'),
(13, 'Primero', 'B'),
(14, 'Primero', 'C'),
(15, 'Primero', 'D'),
(16, 'Segundo', 'A'),
(17, 'Segundo', 'D');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `id_nota` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `nota_1` decimal(15,2) DEFAULT 0.00,
  `nota_2` decimal(15,2) DEFAULT 0.00,
  `nota_3` decimal(15,2) DEFAULT 0.00,
  `nota_4` decimal(15,2) DEFAULT 0.00,
  `promedio` decimal(15,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas`
--

INSERT INTO `notas` (`id_nota`, `id_persona`, `id_curso`, `nota_1`, `nota_2`, `nota_3`, `nota_4`, `promedio`) VALUES
(8, 84, 34, '15.50', '0.00', '0.00', '0.00', '3.88'),
(10, 84, 30, '15.50', '0.00', '0.00', '0.00', '3.88');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas_periodo`
--

CREATE TABLE `notas_periodo` (
  `id_periodo` int(11) NOT NULL,
  `promedio_trimestral` decimal(15,2) DEFAULT 0.00,
  `year` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `notas_periodo`
--

INSERT INTO `notas_periodo` (`id_periodo`, `promedio_trimestral`, `year`, `id_nota`) VALUES
(4, '3.88', 2022, 8),
(6, '3.88', 2022, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(55) DEFAULT NULL,
  `apellidos` varchar(50) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `codigo_interno` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `id_grado` int(11) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `id_tipo_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellidos`, `image`, `codigo_interno`, `email`, `id_grado`, `fecha_creacion`, `id_tipo_persona`) VALUES
(79, 'Deyvis Ronald', 'Garcia Cercado', '', 'FFFFFF', 'deyvis@gmail.com', 13, '2022-04-05 23:43:19', 0),
(81, 'Ronald', 'Garcia Cercado', '', 'RRRRRR', 'deyvis@gmail.com', 13, '2022-04-05 23:45:00', 0),
(83, 'Reyna ', 'Gonzales', '', 'RRRRRR', 'reyna@gmail.com', 13, '2022-04-05 23:52:02', 0),
(84, 'Yerri', 'Aguirre', '', 'YYYY', 'yerri@gmail.com', 13, '2022-04-05 23:52:30', 0),
(85, 'Anibal', 'Garcia Cercado', '', 'GGGGG', 'anibal@gmail.com', 13, '2022-04-07 09:26:53', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_curso`
--

CREATE TABLE `persona_curso` (
  `id_persona_curso` int(11) NOT NULL,
  `id_curso` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `is_aprobado` int(11) DEFAULT NULL,
  `promedio_final` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_curso`
--

INSERT INTO `persona_curso` (`id_persona_curso`, `id_curso`, `id_persona`, `is_aprobado`, `promedio_final`) VALUES
(13, 34, 83, 0, '0.00'),
(14, 30, 84, 0, '0.00'),
(15, 34, 84, 0, '0.00'),
(16, 30, 83, 0, '0.00'),
(17, 30, 85, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id_rol`, `nombre_rol`) VALUES
(3, 'Admin'),
(4, 'Usuario'),
(5, 'Docente'),
(6, 'Estudiante');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `id_tipo_persona` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `id_persona` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `id_rol`, `id_persona`) VALUES
(46, 'deyvisgc', 'deyvis', 3, 79),
(48, 'ronald', '12345', 4, 81),
(50, 'Reyna', '12345', 5, 83),
(51, 'Yerri', '12345', 6, 84),
(52, 'anibal', '12345', 6, 85);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`id_curso`);

--
-- Indices de la tabla `grado`
--
ALTER TABLE `grado`
  ADD PRIMARY KEY (`id_grado`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_curso` (`id_curso`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `notas_periodo`
--
ALTER TABLE `notas_periodo`
  ADD PRIMARY KEY (`id_periodo`),
  ADD KEY `id_nota` (`id_nota`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD KEY `id_grado` (`id_grado`);

--
-- Indices de la tabla `persona_curso`
--
ALTER TABLE `persona_curso`
  ADD PRIMARY KEY (`id_persona_curso`),
  ADD KEY `id_grado` (`id_curso`),
  ADD KEY `id_persona` (`id_persona`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`id_tipo_persona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `usuario_usuario_uindex` (`usuario`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `id_persona` (`id_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `curso`
--
ALTER TABLE `curso`
  MODIFY `id_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT de la tabla `grado`
--
ALTER TABLE `grado`
  MODIFY `id_grado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `notas`
--
ALTER TABLE `notas`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `notas_periodo`
--
ALTER TABLE `notas_periodo`
  MODIFY `id_periodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de la tabla `persona_curso`
--
ALTER TABLE `persona_curso`
  MODIFY `id_persona_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `id_tipo_persona` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`),
  ADD CONSTRAINT `notas_ibfk_4` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `notas_ibfk_5` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `notas_periodo`
--
ALTER TABLE `notas_periodo`
  ADD CONSTRAINT `notas_periodo_ibfk_1` FOREIGN KEY (`id_nota`) REFERENCES `notas` (`id_nota`);

--
-- Filtros para la tabla `persona_curso`
--
ALTER TABLE `persona_curso`
  ADD CONSTRAINT `persona_curso_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `persona_curso_ibfk_2` FOREIGN KEY (`id_curso`) REFERENCES `curso` (`id_curso`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
