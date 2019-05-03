-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-05-2019 a las 08:52:53
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `nCveAdmin` int(11) NOT NULL,
  `sContrasenia` varchar(15) NOT NULL,
  `sNombre` varchar(20) NOT NULL,
  `sApePaterno` varchar(20) NOT NULL,
  `sApeMaterno` varchar(20) NOT NULL,
  `sEmail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`nCveAdmin`, `sContrasenia`, `sNombre`, `sApePaterno`, `sApeMaterno`, `sEmail`) VALUES
(1, '1234', 'Pedro de Jesús', 'González', 'Palafox', 'palafox@gmail.com'),
(2, '4321', 'Adolfo', 'Meza', 'Romero', 'adolfo@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `nCveCompra` int(11) NOT NULL,
  `nCveProd` int(11) NOT NULL,
  `nCveUsu` int(11) NOT NULL,
  `dFecha` date NOT NULL,
  `nCantidad` int(11) NOT NULL,
  `sEstado` varchar(15) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`nCveCompra`, `nCveProd`, `nCveUsu`, `dFecha`, `nCantidad`, `sEstado`) VALUES
(1, 1, 1, '2019-04-26', 1, 'Pendiente'),
(3, 7, 1, '2019-04-26', 1, 'Pendiente'),
(4, 13, 1, '2019-04-27', 1, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `nCveProd` int(11) NOT NULL,
  `sNomProducto` varchar(120) NOT NULL,
  `nPrecio` decimal(10,2) NOT NULL,
  `sTallas` varchar(15) NOT NULL,
  `sTamanos` varchar(10) NOT NULL,
  `sColores` varchar(20) NOT NULL,
  `sTipo` varchar(25) NOT NULL,
  `sEquipo` varchar(30) NOT NULL,
  `sDisciplina` varchar(30) NOT NULL,
  `nCantidad` int(11) NOT NULL,
  `sGenero` varchar(20) NOT NULL,
  `sImg` varchar(100) NOT NULL,
  `nCveAdmin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`nCveProd`, `sNomProducto`, `nPrecio`, `sTallas`, `sTamanos`, `sColores`, `sTipo`, `sEquipo`, `sDisciplina`, `nCantidad`, `sGenero`, `sImg`, `nCveAdmin`) VALUES
(1, 'Balon Golden State Warriors ', '899.00', 'NA', 'NA', 'Amarillo y azul', 'Balon', 'Golden State Warriors', 'Basquetbol', 10, 'NA', 'media/productos/BP1_balon.jpg', 1),
(2, 'Llavero de Plata Golden State Warriors', '1200.00', 'NA', 'Mediano', 'Plata,azul,amarillo', 'Souvenir', 'Golden State Warriors', 'Basquetbol', 50, 'NA', 'media/productos/BP1_llavero.jpg', 1),
(3, 'Playera Golden State Warriors', '500.00', 'Mediana', 'NA', 'Blanco,azul', 'Ropa', 'Golden State Warriors', 'Basquetbol', 14, 'Masculino', 'media/productos/BP1_playera.jpg', 2),
(4, 'Short Golden State Warriors', '650.00', 'Chico', 'NA', 'Amarillo y azul', 'Ropa', 'Golden State Warriors', 'Basquetbol', 16, 'Masculino', 'media/productos/BP1_short.jpg', 1),
(5, 'Taza Golden State Warriors', '360.00', 'NA', 'Grande', 'Amarillo', 'Souvenir', 'Golden State Warriors', 'Basquetbol', 6, 'NA', 'media/productos/BP1_taza.jpg', 1),
(6, 'Tenis Golden State Warriors', '1500.00', '28', 'NA', 'Azul y amarillo', 'Ropa', 'Golden State Warriors', 'Basquetbol', 20, 'Masculino', 'media/productos/BP1_tenis.jpg', 2),
(7, 'Balon Golden State Warriors 20 Aniversario', '2000.00', 'NA', 'Grande', 'Amarillo', 'Balon', 'Golden State Warriors', 'Basquetbol', 10, 'NA', 'media/productos/BP2_balon.jpg', 1),
(8, 'Llavero Golden State Warriors PRO', '500.00', 'NA', 'Grande', 'Azul', 'Souvenir', 'Golden State Warriors', 'Basquetbol', 11, 'NA', 'media/productos/BP2_llavero.jpg', 2),
(9, 'Short Conmemorativo Golden State Warriors', '2500.00', 'Mediana', 'NA', 'Blanco', 'Ropa', 'Golden State Warriors', 'Basquetbol', 12, 'Masculino', 'media/productos/BP2_short.jpg', 2),
(10, 'Taza termica Golden State Warriors ', '1000.00', 'NA', 'Grande', 'Gris', 'Souvenir', 'Golden State Warriors', 'Basquetbol', 10, 'NA', 'media/productos/BP2_taza.jpg', 1),
(11, 'Tenis Golden State Warriors-Under Armour', '2500.00', '26', 'NA', 'Amarillo', 'Ropa', 'Golden State Warriors', 'Basquetbol', 20, 'Masculino', 'media/productos/BP2_tenis.jpg', 1),
(12, 'Balon Basquetbol Golden State Warriors', '3000.00', 'NA', 'Mediano', 'Azul', 'Balon', 'Golden State Warriors', 'Basquetbol', 10, 'NA', 'media/productos/BP3_balon.jpg', 2),
(13, 'Playera Aniversario Golden State Warriors', '2300.00', 'Mediana', 'NA', 'Azul', 'Ropa', 'Golden State Warriors', 'Basquetbol', 14, 'Masculino', 'media/productos/BP3_playera.jpg', 2),
(14, 'Short NBA Golden State Warriors', '1800.00', 'Chico', 'NA', 'Negro', 'Ropa', 'Golden State Warriors', 'Basquetbol', 15, 'Masculino', 'media/productos/BP3_short.jpg', 1),
(15, 'Taza Ceramica Golden State Warriors', '620.00', 'NA', 'Grande', 'Amarillo', 'Souvenir', 'Golden State Warriors', 'Basquetbol', 13, 'NA', 'media/productos/BP3_taza.jpg', 1),
(16, 'Zapatillas Under Armour Golden State Warriors', '1300.00', '28', 'NA', 'Negro', 'Ropa', 'Golden State Warriors', 'Basquetbol', 17, 'Masculino', 'media/productos/BP3_tenis.jpg', 1),
(17, 'Balon Basquetbol Lakers', '2600.00', 'NA', 'Grande', 'Morado', 'Balon', 'Lakers', 'Basquetbol', 15, 'NA', 'media/productos/BP4_balon.jpg', 1),
(18, 'Llavero de metal Lakers', '300.00', 'NA', 'Chico', 'Amarillo', 'Souvenir', 'Lakers', 'Basquetbol', 20, 'NA', 'media/productos/BP4_llavero.jpg', 2),
(19, 'Playera Negra Golden State Warriors', '3000.00', 'Grande', 'NA', 'Negro', 'Ropa', 'Golden State Warriors', 'Basquetbol', 14, 'Femenino', 'media/productos/BP4_playera.jpg', 2),
(20, 'Short para mujer Lakers', '1600.00', 'Chico', 'NA', 'Morado', 'Ropa', 'Lakers', 'Básquetbol', 17, 'Femenino', 'media/productos/BP4_short.jpg', 1),
(21, 'Taza de cerámica, cambia de color-Golden State Warriors', '1000.00', 'NA', 'Mediano', 'Azul', 'Souvenir', 'Golden State Warriors', 'Básquetbol', 12, 'NA', 'media/productos/BP4_taza.jpg', 1),
(22, 'Tenis Nike - Lakers', '1400.00', '26', 'NA', 'Blanco', 'Ropa', 'Lakers', 'Básquetbol', 10, 'Femenino', 'media/productos/BP4_tenis.jpg', 2),
(23, 'Balón de Básquetbol Lakers Versión de Colección', '3000.00', 'NA', 'Grande', 'Amarillo', 'Balón', 'Lakers', 'Básquetbol', 9, 'NA', 'media/productos/BP5_balon.jpg', 1),
(24, 'Llavero de metal - Lakers', '200.00', 'NA', 'Chico', 'Plata', 'Souvenir', 'Lakers ', 'Básquetbol', 9, 'NA', 'media/productos/BP5_llavero.jpg', 2),
(25, 'Playera Wish-Lakers', '1800.00', 'Mediano', 'NA', 'Negro', 'Ropa', 'Lakers', 'Básquetbol', 9, 'Masculino', 'media/productos/BP5_playera.jpg', 1),
(26, 'Short NBA Lakers', '2500.00', 'Grande', 'NA', 'Morado', 'Short', 'Lakers', 'Básquetbol', 9, 'Femenino', 'media/productos/BP5_short.jpg', 2),
(27, 'Vaso de cristal - Lakers ', '800.00', 'NA', 'Grande', 'Transparente', 'Souvenir', 'Lakers', 'Básquetbol', 10, 'NA', 'media/productos/BP5_taza.jpg', 2),
(28, 'Tenis Adidas Lakers', '2800.00', '29', 'NA', 'Morado', 'Tenis', 'Lakers', 'Básquetbol', 8, 'Masculino', 'media/productos/BP5_tenis.jpg', 1),
(29, 'Balón Lakers Color Negro ', '500.00', 'NA', 'Grande', 'Negro', 'Balón', 'Lakers', 'Básquetbol', 6, 'NA', 'media/productos/BP6_balon.jpg', 2),
(30, 'Playera Lakers Color Amarillo', '1400.00', 'Chico', 'NA', 'Amarillo', 'Playera', 'Lakers', 'Básquetbol', 5, 'Masculino', 'media/productos/BP6_playera.jpg', 1),
(31, 'Taza de cerámica Equipo Lakers', '600.00', 'NA', 'Mediano', 'Azul', 'Souvenir', 'Lakers', 'Básquetbol', 4, 'NA', 'media/productos/BP6_taza.jpg', 2),
(32, 'Playera Lakers Versión de James', '2500.00', 'Grande', 'NA', 'Negro', 'Playera', 'Lakers', 'Básquetbol', 7, 'Femenino', 'media/productos/BP7_playera.jpg', 1),
(33, 'Termo de café Lakers ', '700.00', 'NA', 'Grande', 'Negro', 'Souvenir', 'Lakers', 'Básquetbol', 6, 'NA', 'media/productos/BP7_taza.jpg', 2),
(34, 'Balón Fútbol Americano Dallas Cowboys', '2000.00', 'NA', 'Grande', 'Plata', 'Balón', 'Dallas Cowboys', 'Fútbol Americano', 10, 'NA', 'media/productos/FAP1_balon_DC.jpg', 1),
(35, 'Llavero de casco Dallas Cowboys', '500.00', 'NA', 'Grande', 'Plata', 'Souvenir', 'Dallas Cowboys', 'Fútbol Americano', 8, 'NA', 'media/productos/FAP1_llavero_DC.jpg', 2),
(36, 'Playera Elliot-Dallas Cowboys', '1400.00', 'Chico', 'NA', 'Azul', 'Playera', 'Dallas Cowboys', 'Fútbol Americano', 15, 'Femenino', 'media/productos/FAP1_playera_DC.jpg', 2),
(37, 'Tenis Nike Dallas Cowboys', '1000.00', '27', 'NA', 'Gris', 'Tenis', 'Dallas Cowboys', 'Fútbol Americano', 14, 'Masculino', 'media/productos/FAP1_tenis_DC.jpg', 1),
(38, 'Balón de Lujo Dallas Cowboys', '2000.00', 'NA', 'Grande', 'Azul', 'Balón', 'Dallas Cowboys', 'Fútbol Americano', 20, 'NA', 'media/productos/FAP2_balon_DC.jpg', 1),
(39, 'Playera Prescott-Dallas Cowboys', '2000.00', 'Mediano', 'NA', 'Blanco', 'Playera', 'Dallas Cowboys', 'Fútbol Americano', 12, 'Masculino', 'media/productos/FAP2_playera_DC.jpg', 2),
(40, 'Tenis de mujer Dallas Cowboys', '2000.00', '25', 'NA', 'Gris', 'Tenis', 'Dallas Cowboys', 'Fútbol Americano', 10, 'Femenino', 'media/productos/FAP2_tenis_DC.jpg', 1),
(41, 'Balón de cuero Dallas Cowboys', '600.00', 'NA', 'Mediano', 'Café', 'Balón', 'Dallas Cowboys', 'Fútbol Americano', 10, 'NA', 'media/productos/FAP3_balon_DC.jpg', 1),
(42, 'Llavero de estrella Dallas Cowboys', '300.00', 'NA', 'Grande', 'Azul', 'Souvenir', 'Dallas Cowboys', 'Fútbol Americano', 13, 'NA', 'media/productos/FAP3_llavero_DC.jpg', 1),
(43, 'Playera ROMO-Dallas Cowboys', '1000.00', 'Grande', 'NA', 'Gris', 'Playera', 'Dallas Cowboys', 'Fútbol Americano', 15, 'Femenino', 'media/productos/FAP3_playera_DC.jpg', 2),
(44, 'Tenis Nike Denver Broncos', '5000.00', '28', 'NA', 'Azul', 'Tenis', 'Denver Broncos', 'Fútbol Americano', 20, 'Masculino', 'media/productos/FAP3_tenis_DB.jpg', 1),
(45, 'Balón Pardo Dallas Cowboys', '500.00', 'NA', 'Mediano', 'Azul', 'Balón', 'Dallas Cowboys', 'Fútbol Americano', 23, 'NA', 'media/productos/FAP4_balon_DC.jpg', 2),
(46, 'Llavero mascota Denver Broncos', '340.00', 'NA', 'Chico', 'Blanco', 'Souvenir', 'Denver Broncos', 'Fútbol Americano', 15, 'NA', 'media/productos/FAP4_llavero_DB.jpg', 1),
(47, 'Playera simple Dallas Cowboys', '500.00', 'Chico', 'NA', 'Blanco', 'Playera', 'Dallas Cowboys', 'Fútbol Americano', 20, 'Masculino', 'media/productos/FAP4_playera_DC.jpg', 2),
(48, 'Tenis Reebok-Denver Broncos', '1000.00', '27', 'NA', 'Naranja', 'Tenis', 'Denver Broncos', 'Fútbol Americano', 10, 'Masculino', 'media/productos/FAP4_tenis_DB.jpg', 2),
(49, 'Balón de lujo Denver Broncos', '5000.00', 'NA', 'Grande', 'Azul', 'Balón', 'Denver Broncos', 'Fútbol Americano', 15, 'NA', 'media/productos/FAP5_balon_DB.jpg', 1),
(50, 'Llavero guante Denver Broncos', '3000.00', 'NA', 'Chico', 'Naranja', 'Souvenir', 'Denver Broncos', 'Fútbol Americano', 20, 'NA', 'media/productos/FAP5_llavero_DB.jpg', 1),
(51, 'Playera Manning Denver Broncos', '3200.00', 'Mediano', 'NA', 'Blanco', 'Playera', 'Denver Broncos', 'Fútbol Americano', 22, 'Masculino', 'media/productos/FAP5_playera_BD.jpg', 1),
(52, 'Balón Americano Denver Broncos', '300.00', 'NA', 'Mediano', 'Café', 'Balón', 'Denver Broncos', 'Fútbol Americano', 20, 'NA', 'media/productos/FAP6_balon_DB.jpg', 2),
(53, 'Llavero edición sencilla Denver Broncos', '500.00', 'NA', 'Mediano', 'Azul', 'Souvenir', 'Denver Broncos', 'Fútbol Americano', 14, 'NA', 'media/productos/FAP6_llavero_DB.jpg', 2),
(54, 'Playera Manning Naranja-Denver Broncos', '3000.00', 'Grande', 'NA', 'Naranja', 'Playera', 'Denver Broncos', 'Fútbol Americano', 17, 'Masculino', 'media/productos/FAP6_playera_BD.jpg', 2),
(55, 'Balón NFL Denver Broncos', '900.00', 'NA', 'Grande', 'Azul', 'Balón', 'Denver Broncos', 'Fútbol Americano', 20, 'NA', 'media/productos/FAP7_balon_DB.jpg', 2),
(56, 'Playera Talib Denver Broncos', '4000.00', 'Chico', 'NA', 'Azul', 'Playera', 'Denver Broncos', 'Fútbol Americano', 30, 'Femenino', 'media/productos/FAP7_playera_BD.jpg', 2),
(57, 'Balón Edición Platino Real Madrid', '2000.00', 'NA', 'Grande', 'Blanco', 'Balón', 'Real Madrid', 'Fútbol', 24, 'NA', 'media/productos/FSP1_balon.jpg', 2),
(58, 'Balón Nike Barcelona', '3000.00', 'NA', 'Grande', 'Azul', 'Balón', 'Barcelona', 'Fútbol', 21, 'NA', 'media/productos/FSP1_balon_B.jpg', 2),
(59, 'Llavero de metal Real Madrid', '200.00', 'NA', 'Chico', 'Plata', 'Souvenir', 'Real Madrid', 'Fútbol', 30, 'NA', 'media/productos/FSP1_llavero.jpg', 1),
(60, 'Llavero uniforme Real Madrid', '480.00', 'NA', 'Mediano', 'Blanco', 'Souvenir', 'Real Madrid', 'Fútbol', 20, 'NA', 'media/productos/FSP1_llavero_B.jpg', 2),
(61, 'Playera para niño Barcelona', '600.00', 'Chico', 'NA', 'Azul', 'Playera', 'Barcelona', 'Fútbol', 20, 'Masculino', 'media/productos/FSP1_niño_B.jpg', 1),
(62, 'Camisa manga larga Real Madrid', '1200.00', 'Grande', 'NA', 'Blanco', 'Playera', 'Real Madrid', 'Fútbol', 10, 'Masculino', 'media/productos/FSP1_playera.jpg', 2),
(63, 'Playera Clásica Barcelona', '2000.00', 'Mediano', 'NA', 'Azul', 'Playera', 'Barcelona', 'Fútbol', 20, 'Masculino', 'media/productos/FSP1_playera_B.jpg', 1),
(64, 'Short Clásico Real Madrid', '2000.00', 'Mediano', 'NA', 'Blanco', 'Short', 'Real Madrid', 'Fútbol', 15, 'Masculino', 'media/productos/FSP1_short.jpg', 2),
(65, 'Taza para café Real Madrid', '400.00', 'NA', 'Grande', 'Blanco', 'Souvenir', 'Real Madrid', 'Fútbol', 30, 'NA', 'media/productos/FSP1_taza.jpg', 2),
(66, 'Taza para café grande Barcelona', '600.00', 'NA', 'Grande', 'Azul', 'Souvenir', 'Barcelona', 'Fútbol', 20, 'NA', 'media/productos/FSP1_taza_B.jpg', 1),
(67, 'Tenis Reebok Real Madrid', '4000.00', 'NA', '26', 'Negro', 'Tenis', 'Real Madrid', 'Fútbol', 10, 'Masculino', 'media/productos/FSP1_tenis.jpg', 2),
(68, 'Zapatillas profesionales Barcelona', '5000.00', '29', 'NA', 'Azul', 'Tenis', 'Barcelona', 'Fútbol', 22, 'Masculino', 'media/productos/FSP1_tenis_B.jpg', 2),
(69, 'Balón Real Madrid Versión Oscura', '3000.00', 'NA', 'Grande', 'Negro', 'Balón', 'Real Madrid', 'Fútbol', 15, 'NA', 'media/productos/FSP2_balon.jpg', 2),
(70, 'Balón sencillo Barcelona', '2000.00', 'NA', 'Mediano', 'Azul', 'Balón', 'Barcelona', 'Fútbol', 20, 'NA', 'media/productos/FSP2_balon_B.jpg', 2),
(71, 'Llavero dorado Real Madrid', '230.00', 'NA', 'Mediano', 'Dorado', 'Souvenir', 'Real Madrid', 'Fútbol', 12, 'NA', 'media/productos/FSP2_llavero.jpg', 1),
(72, 'Playera Nike Barcelona', '5000.00', 'Chico', 'NA', 'Vino', 'Playera', 'Barcelona', 'Fútbol', 19, 'Femenino', 'media/productos/FSP2_playera_B.jpg', 2),
(73, 'Short Real Madrid Adidas', '800.00', 'Mediano', 'NA', 'Verde', 'Short', 'Real Madrid', 'Fútbol', 18, 'Masculino', 'media/productos/FSP2_short.jpg', 1),
(75, 'Playera de mujer Real Madrid Fly', '3000.00', 'Mediano', 'NA', 'Negro', 'Playera', 'Real Madrid', 'Fútbol', 25, 'Femenino', 'media/productos/FSP4_playera.jpg', 2),
(76, 'Mallas de agua', '198.00', 'Chico', 'Femenino', 'Rojo', 'Ropa', 'Lakers', 'Natacion', 17, 'Femenino', '1541648060815.jpg', 2),
(77, 'Traje de baño', '990.50', 'Chico', 'Femenino', 'Rojo', 'Ropa', 'Lakers', 'Natacion', 29, 'Femenino', 'media/productos/Dj1BrzTU0AAyjBc.jpg', 2),
(78, 'Ojo de Thundera', '999.99', 'Mediano', 'Masculino', 'Rojo', 'Souvenir', 'Lakers', 'Natacion', 1, 'Masculino', 'media/productos/fondo2.jpg', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `nCveUsu` int(11) NOT NULL,
  `sContrasenia` varchar(15) NOT NULL,
  `sNombre` varchar(20) NOT NULL,
  `sApePaterno` varchar(20) NOT NULL,
  `sApeMaterno` varchar(20) NOT NULL,
  `nTelefono` bigint(20) NOT NULL,
  `sDireccion` varchar(40) NOT NULL,
  `sEmail` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`nCveUsu`, `sContrasenia`, `sNombre`, `sApePaterno`, `sApeMaterno`, `nTelefono`, `sDireccion`, `sEmail`) VALUES
(1, 'SR25TA25', 'Ana', 'Moreno', 'Soto', 2721000865, 'Calle 5 de mayo', 'ana_betty_97@hotmail.com'),
(6, '1234', 'Zuriel Yardley', 'García', 'Segura', 2721110000, 'Modelo', 'zuribasuri@gmail.com'),
(7, '1234', 'Raúl', 'Sánchez', 'Martínez', 2721114477, 'Jardín 1', 'rulosan@yahoo.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`nCveAdmin`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`nCveCompra`,`nCveProd`,`nCveUsu`) USING BTREE;

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`nCveProd`),
  ADD KEY `admin_addprod_fk` (`nCveAdmin`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`nCveUsu`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `nCveCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `nCveProd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `nCveUsu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `admin_addprod_fk` FOREIGN KEY (`nCveAdmin`) REFERENCES `administrador` (`nCveAdmin`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
