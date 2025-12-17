-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-12-2025 a las 04:30:13
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pet_shop`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'comida'),
(2, 'juguete'),
(3, 'ropa'),
(4, 'accesorio'),
(5, 'cama'),
(6, 'aseo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `metodo_pago` enum('tarjeta','paypal','transferencia') NOT NULL,
  `numero_tarjeta` varchar(20) DEFAULT NULL,
  `expiracion` varchar(5) DEFAULT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `numero_cuenta` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('preparando','enviando','recibido') DEFAULT 'preparando'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`id_pago`, `id_usuario`, `metodo_pago`, `numero_tarjeta`, `expiracion`, `paypal_email`, `banco`, `numero_cuenta`, `fecha`, `estado`) VALUES
(2, 3, 'tarjeta', '1234-5678-9012-3456', '2025-', '', '', '', '2025-11-19 05:37:26', 'recibido'),
(3, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-03 03:09:48', 'preparando'),
(4, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-03 03:10:04', 'preparando'),
(5, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-03 03:11:41', 'enviando'),
(6, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-03 03:12:04', 'preparando'),
(7, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-03 04:29:41', 'preparando'),
(8, 3, 'tarjeta', '1234-5678-9012-3456', '2026-', '', '', '', '2025-12-09 05:29:51', 'preparando'),
(9, 1, 'paypal', '', '', 'cliente@paypal.com', '', '', '2025-12-10 02:38:47', 'preparando'),
(10, 8, 'paypal', '', '', 'julieta@paypal.com', '', '', '2025-12-10 03:30:31', 'preparando'),
(11, 1, 'transferencia', '', '', '', 'bcp', '23235326356323', '2025-12-17 00:03:39', 'preparando');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id_permiso` int(11) NOT NULL,
  `nombre_permiso` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id_permiso`, `nombre_permiso`, `descripcion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'ver_usuarios', 'Permite visualizar la lista de usuarios', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24'),
(2, 'editar_usuarios', 'Permite editar información de usuarios', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24'),
(3, 'eliminar_usuarios', 'Permite eliminar usuarios del sistema', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24'),
(4, 'ver_reportes', 'Permite acceder a reportes del sistema', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` varchar(300) NOT NULL,
  `precio` float NOT NULL,
  `stock` int(11) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `nombre`, `descripcion`, `precio`, `stock`, `imagen`, `id_categoria`) VALUES
(1, 'Rico can', 'comida para perro adulto 8 kg', 77.9, 20, '../uploads/69370af99cc76_comida8kg.jpg', 1),
(2, 'Purina (pro plan)', ' Pro plan Piel Sensible Adulto Cordero Todas las Razas 15kg', 359, 20, '../uploads/69370ba27e6d7_purina.jpg', 1),
(7, 'Platos Dog', 'plato de comida metal para perros', 20, 50, '../uploads/69370a06b787e_plato metal.jpg', 4),
(9, 'Super cat', 'Alimento para Gatos SUPERCAT Adultos Sardina Atún Trucha Bolsa 1Kg', 13, 40, 'supercat.jpg', 1),
(11, 'Dentalife', 'Dentalife Large Dog Treat Cuidado Oral Diario', 26.9, 13, 'dentallife.jpg', 6),
(12, 'Klinkat', ' Arena Para Gato Klinkat Arena Para Gatos', 22.9, 20, 'arena.jpg', 4),
(14, 'Hydra Plex', 'Limpieza delicada corporal y facial. Sin Lágrimas. Libre de Sulfatos, DEA, Siliconas, Fragancias y Ciliconas.', 69.9, 40, 'shampoo.jpg', 6),
(15, 'Tidy', 'Shampoo seco para gatos', 20, 10, 'tidy.jpg', 6),
(16, 'Leeby', 'Leeby Good cuna para perros con estampado de erizos, tiene base antideslizante y bordes elevados.', 129.9, 5, 'leby.jpg', 5),
(17, 'Leeby', 'Iglú anti estrés para gatos, tiene forma de cabeza de gato, incluye un cojín reversible y desenfundable.', 99.9, 15, 'cama.jpg', 5),
(18, 'The Cat Band', 'Pelota plástica color entero con cascabel en el interior. ', 3.9, 30, 'pelota.jpg', 2),
(19, 'Leeby', 'Leeby Good cama suave para perros. Es de un elegante tono beige, tiene base antideslizante y bordes elevados.', 169.9, 40, 'cam.jpg', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 'Administrador', 'Acceso total al sistema', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24'),
(2, 'Usuario', 'Acceso básico a las funciones principales', 1, '2025-10-29 09:44:24', '2025-10-29 09:44:24');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `dni` varchar(15) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `Provincia` varchar(30) NOT NULL,
  `foto_perfil` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1,
  `ultimo_acceso` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `id_rol`, `nombre`, `apellido`, `correo`, `usuario`, `clave`, `telefono`, `dni`, `direccion`, `Provincia`, `foto_perfil`, `estado`, `ultimo_acceso`, `fecha_creacion`, `fecha_actualizacion`) VALUES
(1, 1, 'Benjamín', 'Huanca', 'admin@midominio.com', 'admin', '240be518fabd2724ddb6f04eeb1da5967448d7e831c08c8fa822809f74c720a9', '923456789', '25346789', 'las palmeras nro 206', 'lima', NULL, 1, NULL, '2025-10-29 09:44:24', '2025-12-16 19:03:39'),
(3, 2, 'Juan', 'Pérez', 'cliente@ejemplo.com', 'cliente', '09a31a7001e261ab1e056182a71d3cf57f582ca9a29cff5eb83be0f0549730a9', '972382901', '83633828', 'avenida las flores nr:230', 'villa maria', NULL, 1, NULL, '2025-11-02 00:02:59', '2025-12-09 00:29:51'),
(8, 2, 'Julieta', 'Rojas', 'julieta@gmail.com', 'julieta', '43dcbb6e23ae924c1e40b44e58c05836e758502bf2801a9d4bb31cbb76b67ece', '923567890', '23451234', 'av benavides nr 202', 'lima', NULL, 1, NULL, '2025-12-09 22:28:51', '2025-12-09 22:30:31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id_venta` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `provincia` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `numero_tarjeta` varchar(30) DEFAULT NULL,
  `expiracion` date DEFAULT NULL,
  `paypal_email` varchar(100) DEFAULT NULL,
  `banco` varchar(100) DEFAULT NULL,
  `numero_cuenta` varchar(50) DEFAULT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id_venta`, `id_usuario`, `id_producto`, `cantidad`, `precio_unitario`, `total`, `direccion`, `provincia`, `dni`, `telefono`, `metodo_pago`, `numero_tarjeta`, `expiracion`, `paypal_email`, `banco`, `numero_cuenta`, `fecha`) VALUES
(1, 3, 1, 1, 77.90, 77.90, 'avenida las flores nr:230', 'villa maria', '83633828', '972382901', 'tarjeta', '1234-5678-9012-3456', '2025-10-23', '', '', '', '2025-11-18 05:29:51'),
(2, 3, 2, 1, 359.00, 359.00, 'avenida las flores nr:230', 'villa maria', '83633828', '972382901', 'tarjeta', '1234-5678-9012-3456', '2025-09-18', '', '', '', '2025-12-09 05:29:51'),
(3, 3, 7, 1, 20.00, 20.00, 'avenida las flores nr:230', 'villa maria', '83633828', '972382901', 'tarjeta', '1234-5678-9012-3456', '2025-12-01', '', '', '', '2025-12-09 05:29:51'),
(4, 1, 12, 1, 22.90, 22.90, 'juliaca la repuclica 123', 'lima', '90243523', '904234567', 'paypal', '', '0000-00-00', 'cliente@paypal.com', '', '', '2025-12-10 02:38:47'),
(5, 1, 11, 1, 26.90, 26.90, 'juliaca la repuclica 123', 'lima', '90243523', '904234567', 'paypal', '', '0000-00-00', 'cliente@paypal.com', '', '', '2025-12-10 02:38:47'),
(6, 8, 1, 1, 77.90, 77.90, 'av benavides nr 202', 'lima', '23451234', '923567890', 'paypal', '', '0000-00-00', 'julieta@paypal.com', '', '', '2025-12-10 03:30:31'),
(7, 8, 2, 1, 359.00, 359.00, 'av benavides nr 202', 'lima', '23451234', '923567890', 'paypal', '', '0000-00-00', 'julieta@paypal.com', '', '', '2025-12-10 03:30:31'),
(8, 1, 16, 1, 129.90, 129.90, 'las palmeras nro 206', 'lima', '25346789', '923456789', 'transferencia', '', '0000-00-00', '', 'bcp', '23235326356323', '2025-12-17 00:03:39'),
(9, 1, 17, 1, 99.90, 99.90, 'las palmeras nro 206', 'lima', '25346789', '923456789', 'transferencia', '', '0000-00-00', '', 'bcp', '23235326356323', '2025-12-17 00:03:39');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id_permiso`),
  ADD UNIQUE KEY `nombre_permiso` (`nombre_permiso`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`),
  ADD UNIQUE KEY `nombre_rol` (`nombre_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD UNIQUE KEY `usuario` (`usuario`),
  ADD KEY `fk_usuario_rol` (`id_rol`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id_permiso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_productos`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
