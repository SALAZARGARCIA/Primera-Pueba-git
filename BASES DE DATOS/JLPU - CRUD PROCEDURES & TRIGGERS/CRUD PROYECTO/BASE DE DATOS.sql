-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2017 a las 00:03:21
-- Versión del servidor: 5.7.14
-- Versión de PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sidpla`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Actualizar_Producto` (IN `newCod_Producto` INT, IN `newNom_prod` VARCHAR(45), IN `newDesc_prod` VARCHAR(100), IN `newFoto_prod` VARCHAR(70), IN `newTipo_producto` INT, IN `newStok_min` INT, IN `newStok_max` INT, IN `newCantidad_exist` INT, IN `newCod_tamaño` INT, IN `newValor_prod` DECIMAL(10,2), IN `oldCod_Producto` INT)  BEGIN
 
 UPDATE PRODUCTO SET Cod_Producto=newCod_Producto,Nom_prod=newNom_prod,Desc_prod=newDesc_prod,
 Foto_prod=newFoto_prod,Tipo_producto=newTipo_producto,Stok_min=newStok_min,Stok_max=newStok_max,Cantidad_exist=newCantidad_exist WHERE Cod_Producto = oldCod_Producto;


 UPDATE PRODUCTO_HAS_TAMAÑO SET Producto_Cod_Producto=newCod_Producto,Tamaño_Cod_tamaño=newCod_tamaño,
 Valor_prod=newValor_prod WHERE Producto_Cod_Producto=oldCod_Producto;

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Domicilio` ()  BEGIN

 SELECT * FROM DOMICILIO; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Forma_Pago` ()  BEGIN

 SELECT * FROM Forma_Pago; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Opinion` ()  BEGIN

 SELECT T2.Cod_Opinion,T2.Opinion, T1.Num_Documento_per, T1.Primer_Nombre_per, T1.Primer_Apellido_per, T1.Correo_per FROM Opinion AS T2 INNER JOIN PERSONA 
 AS T1 ON (T2.Num_Documento_per=T1.Num_Documento_per); 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Persona` (IN `Num_Documento_per` VARCHAR(15))  BEGIN
 
 SELECT T1.Num_Documento_per, T2.Descripcion_tipo_doc,T3.Desc_rol,T4.Estado_rol_per,T1.Primer_Nombre_per,T1.Segundo_Nombre_per,T1.Primer_Apellido_per,
 T1.Segundo_Apellido_per,T1.Usuario_login,T1.Pass_login, T1.Tel_per, T1.Cel_per, T1.Direc_per, T1.Correo_per FROM PERSONA AS T1 INNER JOIN Tipo_Doc AS T2
 ON (T1.Cod_tipo_doc=T2.Cod_tipo_doc) INNER JOIN ROL_has_Persona AS T4 ON (T1.Num_Documento_per=T4.Persona_Num_Documento_per) INNER JOIN ROL AS T3 
 ON (T3.Cod_rol=T4.Rol_Cod_rol) WHERE T1.Num_Documento_per=Num_Documento_per;
 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Pizzeria` ()  BEGIN

 SELECT * FROM PIZZERIA; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Producto` (IN `Cod_Producto` INT)  BEGIN
 
 SELECT T1.Cod_Producto, T1.Nom_prod,T1.Desc_prod,T1.Foto_prod,T1.Stok_min,T1.Stok_max,T1.Cantidad_exist,
  T2.Valor_prod, T4.Desc_tamaño, T3.Desc_tipo_prod FROM PRODUCTO AS T1 INNER JOIN PRODUCTO_HAS_TAMAÑO AS T2 ON (T1.Cod_Producto=T2.Producto_Cod_Producto)
  INNER JOIN Tamaño AS T4 ON (T2.Tamaño_Cod_Tamaño=T4.Cod_Tamaño) 
  INNER JOIN Tipo_producto AS T3 ON (T1.Tipo_producto=T3.Cod_tipo_prod) WHERE T1.Cod_Producto=Cod_Producto;
 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Rol` ()  BEGIN

 SELECT * FROM ROL; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Tamaños` ()  BEGIN

 SELECT * FROM Tamaño; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Tipo_Doc` ()  BEGIN

 SELECT * FROM Tipo_Doc; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Consulta_Tipo_producto` ()  BEGIN

 SELECT * FROM Tipo_producto; 

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Domicilio` (IN `Persona_Num_Documento_Per` VARCHAR(15), IN `Persona_Cod_tipo_doc` INT, IN `Cod_Dom` INT, IN `Fecha_Dom` DATE, IN `Hora_Dom` DATETIME, IN `Valor_Total` DECIMAL(10,3), IN `Estado_Domicilio` INT, IN `NIT_Pizzeria` BIGINT, IN `Observacion_Dom` VARCHAR(123), IN `Cod_Forma_Pago` INT, IN `Monto` DECIMAL(10,3), IN `Producto_Cod_producto` INT, IN `Cantidad` INT(5), IN `Valor_subtotal` INT)  BEGIN
 
 INSERT INTO DOMICILIO VALUES (Cod_Opinion,Opinion,Num_Documento_per);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Forma_Pago` (IN `Desc_fpago` VARCHAR(45))  BEGIN

 INSERT INTO Forma_Pago (Desc_fpago) VALUES(Desc_fpago);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Opinion` (IN `Opinion` VARCHAR(200), IN `Num_Documento_per` VARCHAR(15))  BEGIN
 
 INSERT INTO OPINION (Opinion,Num_Documento_per) 
 VALUES (Opinion,Num_Documento_per);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Persona` (IN `Num_Documento_per` VARCHAR(15), IN `Cod_tipo_doc` INT, IN `Primer_Nombre_per` VARCHAR(45), IN `Segundo_Nombre_per` VARCHAR(45), IN `Primer_Apellido_per` VARCHAR(45), IN `Segundo_Apellido_per` VARCHAR(45), IN `Usuario_login` VARCHAR(45), IN `Pass_login` VARCHAR(45), IN `Tel_per` BIGINT(15), IN `Cel_per` BIGINT(15), IN `Direc_per` VARCHAR(45), IN `Correo_per` VARCHAR(45), IN `Rol_Cod_rol` INT)  BEGIN
 
 INSERT INTO PERSONA VALUES (Num_Documento_per, Cod_tipo_doc,
  Primer_Nombre_per, Segundo_Nombre_per, Primer_Apellido_per,
  Segundo_Apellido_per, Usuario_login, Pass_login, Tel_per,Cel_per,
  Direc_per, Correo_per);
 INSERT INTO ROL_has_PERSONA VALUES(Rol_Cod_rol,Num_Documento_per,
  Cod_tipo_doc,1);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Pizzeria` (IN `NIT_Pizzeria` BIGINT, IN `Nom_Pizzeria` VARCHAR(45), IN `Dir_Pizzeria` VARCHAR(50), IN `Tel_Pizzeria` BIGINT, IN `Cel_pzzeria` BIGINT, IN `Logo_pizzeria` VARCHAR(70))  BEGIN
 
 INSERT INTO PIZZERIA VALUES (NIT_Pizzeria,Nom_Pizzeria,Dir_Pizzeria,
 Tel_Pizzeria,Cel_pzzeria,Logo_pizzeria);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Producto` (IN `Cod_Producto` INT, IN `Nom_prod` VARCHAR(45), IN `Desc_prod` VARCHAR(100), IN `Foto_prod` VARCHAR(70), IN `Tipo_producto` INT, IN `Stok_min` INT, IN `Stok_max` INT, IN `Cantidad_exist` INT, IN `Cod_tamaño` INT, IN `Valor_prod` DECIMAL(10,2))  BEGIN
 
 INSERT INTO PRODUCTO VALUES (Cod_Producto,Nom_prod,Desc_prod,
 Foto_prod,Tipo_producto,Stok_min,Stok_max,Cantidad_exist
 );

 INSERT INTO PRODUCTO_HAS_TAMAÑO VALUES (Cod_Producto,Cod_tamaño,
 Valor_prod);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_ROL` (IN `Descripcion_ROL` VARCHAR(20))  BEGIN

 INSERT INTO Rol (Desc_rol) VALUES(Descripcion_ROL);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Tamaño` (IN `Descripcion_tamaño` VARCHAR(45))  BEGIN

 INSERT INTO TAMAÑO (Desc_tamaño) VALUES (Descripcion_tamaño);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Tipo_Doc` (IN `Descripcion_tipo_doc` VARCHAR(45))  BEGIN

 INSERT INTO Tipo_Doc (Descripcion_tipo_doc) 
 VALUES(Descripcion_tipo_doc);

 END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Tipo_Prod` (IN `Desc_tipo_prod` VARCHAR(25))  BEGIN

 INSERT INTO Tipo_producto (Desc_tipo_prod) VALUES (Desc_tipo_prod);

 END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `COD_AUDITORIA` int(11) NOT NULL,
  `USUARIO_AUD` varchar(200) DEFAULT NULL,
  `DESCRIPCION_AUD` text,
  `FECHA_AUD` datetime DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`COD_AUDITORIA`, `USUARIO_AUD`, `DESCRIPCION_AUD`, `FECHA_AUD`) VALUES
(1, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE PRODUCTO:prod_002DESC_PROD( PEPSI)POR( G PEPSI)\n     ', '2017-11-14 18:03:07'),
(2, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE PRODUCTO:prod_009DESC_PROD(Papas de pollo)POR(Papas  pollo)\n    VALOR_PROD(1400)POR(1500)\n    IMAGEN_PROD(FOTOS/PAPAS.PNG)POR(FOTOS/PAPAS1.PNG))\n    FECHA_INGRESO2017-11-14 17:30:15)POR(2017-11-14 17:30:15))\n     	TP_COD_TPRODCOMIDAS)POR(COMIDAS)', '2017-11-14 18:24:32'),
(3, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE USUARIO:1234DESC_PROD(JULIANA)POR(JULIANA)\n    VALOR_PROD(GERALDINE)POR(GARCIA)\n    IMAGEN_PROD(666666)POR(6666667)', '2017-11-14 18:49:14'),
(4, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE PRODUCTO:prod_001DESC_PROD(Papas  pollo)POR(Papas  pollo)\r\n    VALOR_PROD(1500)POR(1500)\r\n    IMAGEN_PROD(FOTOS/PAPAS1.PNG)POR(FOTOS/PAPAS1.PNG))\r\n    FECHA_INGRESO2017-11-14 17:30:15)POR(2017-11-14 17:30:15))\r\n     	TP_COD_TPRODCOMIDAS)POR(COMIDAS)', '2017-11-14 19:01:17'),
(5, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE PRODUCTO:prod_001COD_PROD(prod_009)POR(prod_001)', '2017-11-14 19:01:17'),
(6, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE USUARIO:123DESC_PROD(JULIANA)POR(JULIANA)\r\n    VALOR_PROD(GARCIA)POR(GARCIA)\r\n    IMAGEN_PROD(6666667)POR(6666667)', '2017-11-14 19:06:50'),
(7, 'root@localhost', 'SE MODIFICARON LOS SIGUIENTES DATOS DE USUARIO:123COD_PROD(1234)POR(123)', '2017-11-14 19:06:50'),
(8, 'root@localhost', 'SE INSERTARON  LOS SIGUIENTES DATOS DE USUARIO:234 NOMBRE(GERALDINE)\n    APELLIDO(CORREDOR)\n    CELULAR(77777)', '2017-11-14 19:16:36'),
(9, 'root@localhost', 'SE INSERTARON LOS SIGUIENTES DATOS DE ROL:NuevoDESCRIPCION DEL ROL(nuevo)', '2017-12-08 18:44:02'),
(10, 'root@localhost', 'SE ELIMINARON LOS SIGUIENTES DATOS DE ROL:NuevoDESCRIPCION DEL ROL(nuevo)', '2017-12-08 18:44:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `Cod_dom` varchar(45) NOT NULL COMMENT 'Es el codigo por el cual de identifica el domicilio.',
  `Fecha_Hora` date DEFAULT NULL COMMENT 'Es la fecha en la que se realizo el domicilio.',
  `Direc_Dom` varchar(60) NOT NULL COMMENT 'es la direccion del destino del domicilio a entregar',
  `Valor_Total` decimal(10,3) DEFAULT NULL COMMENT 'Es la suma de los valores subtotales.',
  `Estado_domicilio` varchar(45) NOT NULL,
  `Nit_Pizzeria` bigint(20) NOT NULL COMMENT 'Número de identificación de  la pizzería. ',
  `Observacion_dom` varchar(123) DEFAULT NULL COMMENT 'Observaciones acerca del domicilio. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio`
--

INSERT INTO `domicilio` (`Cod_dom`, `Fecha_Hora`, `Direc_Dom`, `Valor_Total`, `Estado_domicilio`, `Nit_Pizzeria`, `Observacion_dom`) VALUES
('1-DOM', '2017-11-29', 'Avenida siempre viva', '15.000', 'CANCELADO', 801145012, ' Hawaiana Sin jamon'),
('2-DOM', '2017-11-29', 'Calle falsa 123', '22.000', 'EN ESPERA', 801145012, NULL),
('3-DOM', '2017-11-30', 'CALLE 80', '182.000', 'ENTREGADO', 801145012, NULL),
('4-DOM', '2017-11-30', 'Cll 16 transversal 15', '129.000', 'ENTREGADO', 801145012, NULL),
('5-DOM', '2017-11-30', 'CALLE 17 #20 A', '90.100', 'EN ESPERA', 801145012, NULL),
('6-DOM', '2017-12-01', 'Cll 69 #10 h', '8.000', 'CANCELADO', 801145012, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio_has_persona`
--

CREATE TABLE `domicilio_has_persona` (
  `Persona_Num_Documento_per` varchar(15) NOT NULL,
  `Persona_Cod_tipo_doc` varchar(10) NOT NULL,
  `Domicilio_Cod_dom` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio_has_persona`
--

INSERT INTO `domicilio_has_persona` (`Persona_Num_Documento_per`, `Persona_Cod_tipo_doc`, `Domicilio_Cod_dom`) VALUES
('1014304616', 'C.C', '1-DOM'),
('1014304616', 'C.C', '5-DOM'),
('1031157939', 'C.C', '2-DOM'),
('1031178887', 'C.C', '4-DOM'),
('9900000001', 'T.I', '3-DOM'),
('9900000001', 'T.I', '6-DOM');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio_has_producto_has_tamaño`
--

CREATE TABLE `domicilio_has_producto_has_tamaño` (
  `Domicilio_Cod_dom` varchar(45) NOT NULL,
  `Cod_producto` varchar(45) NOT NULL,
  `P_has_T_Tamaño_Cod_Tamaño` varchar(45) NOT NULL,
  `Cantidad` int(5) NOT NULL,
  `Valor_Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `domicilio_has_producto_has_tamaño`
--

INSERT INTO `domicilio_has_producto_has_tamaño` (`Domicilio_Cod_dom`, `Cod_producto`, `P_has_T_Tamaño_Cod_Tamaño`, `Cantidad`, `Valor_Subtotal`) VALUES
('1-DOM', '1001-PIZHAW', '1-PEQUEÑA', 1, '15000.00'),
('2-DOM', '1002-PIZPEPPE', '1-MEDIANA', 1, '22000.00'),
('3-DOM', '1003-PIZPIZMEX', '1-FAMILIAR', 2, '64000.00'),
('3-DOM', '1004-PIZQUES', '1-GRANDE', 2, '54000.00'),
('3-DOM', '1005-PIZCHAM', '1-FAMILIAR', 2, '64000.00'),
('4-DOM', '1005-PIZCHAM', '1-FAMILIAR', 2, '64000.00'),
('4-DOM', '1008-BEBPEP', '2-ML-500', 3, '2800.00'),
('4-DOM', '1008-BEBPEP', '3-LT-2.5', 2, '6200.00'),
('5-DOM', '1001-PIZHAW', '1-MEDIANA', 1, '22000.00'),
('5-DOM', '1005-PIZCHAM', '1-GRANDE', 1, '27000.00'),
('5-DOM', '1010-LAS', '1-MEDIANA', 1, '15000.00'),
('5-DOM', '1017-PALDQUES', '1-MEDIANA', 2, '8000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_domicilio`
--

CREATE TABLE `estado_domicilio` (
  `Cod_Estado_dom` varchar(45) NOT NULL COMMENT 'Código del estado del domicilio. ',
  `Desc_estado_dom` varchar(45) NOT NULL COMMENT 'Describe el estado del domicilio (entregado, no entregado)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `estado_domicilio`
--

INSERT INTO `estado_domicilio` (`Cod_Estado_dom`, `Desc_estado_dom`) VALUES
('CANCELADO', 'PEDIDO CANCELADO'),
('EN ESPERA', 'PEDIDO PENDIENTE DE ENTREGAR'),
('ENTREGADO', 'PEDIDO REALIZADO ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago`
--

CREATE TABLE `forma_pago` (
  `Cod_Forma_pago` varchar(45) NOT NULL COMMENT 'Es el codigo por el cual se identifica la forma por la cual se va a pagar.',
  `Desc_fpago` varchar(45) NOT NULL COMMENT 'Describe la forma por la cual se va a pagar (Efectivo, tarjeta de credito, etc..)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `forma_pago`
--

INSERT INTO `forma_pago` (`Cod_Forma_pago`, `Desc_fpago`) VALUES
('EFECTIVO', 'PAGO EN DINERO EFECTIVO'),
('TARJETA CREDITO', 'PAGO CON TARJETA DE CREDITO A CUOTAS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forma_pago_has_domicilio1`
--

CREATE TABLE `forma_pago_has_domicilio1` (
  `Cod_Forma_pago` varchar(45) NOT NULL,
  `Cod_dom` varchar(45) NOT NULL,
  `Monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `forma_pago_has_domicilio1`
--

INSERT INTO `forma_pago_has_domicilio1` (`Cod_Forma_pago`, `Cod_dom`, `Monto`) VALUES
('EFECTIVO', '2-DOM', '22000.00'),
('EFECTIVO', '3-DOM', '182000.00'),
('TARJETA CREDITO', '1-DOM', '15000.00'),
('TARJETA CREDITO', '4-DOM', '129000.00'),
('TARJETA CREDITO', '5-DOM', '90100.00'),
('TARJETA CREDITO', '6-DOM', '80000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinion`
--

CREATE TABLE `opinion` (
  `Cod_Opinion` int(10) UNSIGNED NOT NULL COMMENT 'es el codigo  que identifica la opinion dada por la  persona ',
  `Opinion` varchar(200) NOT NULL COMMENT 'es la opinion dada por el cliente ',
  `Num_Documento_per` varchar(15) NOT NULL COMMENT 'es el numero de identificacion de la persona '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `opinion`
--

INSERT INTO `opinion` (`Cod_Opinion`, `Opinion`, `Num_Documento_per`) VALUES
(1, 'SEBASTIAN ES PRO', '1033815398'),
(2, 'DEACUERDO CON EL DE ARRIBA', '1031157939'),
(3, 'EL DE ARRIBA DICE LA VERDAD', '1031178887'),
(4, 'A mi me gustan mayores de  esos que llaman señores', '9900000001');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Num_Documento_per` varchar(15) NOT NULL COMMENT 'es el numero de identificacion de la persona ',
  `Cod_tipo_doc` varchar(10) NOT NULL,
  `Primer_Nombre_per` varchar(45) NOT NULL COMMENT 'es el nombre 1 de la persona ',
  `Segundo_Nombre_per` varchar(45) DEFAULT NULL COMMENT 'es el nombre 2 de la persona ',
  `Primer_Apellido_per` varchar(45) NOT NULL COMMENT 'es el apellido 1 de la persona',
  `Segundo_Apellido_per` varchar(45) NOT NULL COMMENT 'es el apellido 2 de la persona ',
  `Usuario_login` varchar(45) NOT NULL COMMENT 'es el nombre de usuario con el que se identifica la persona para ingresar al sistema ',
  `Pass_login` varchar(256) NOT NULL COMMENT 'es la contraseña con la que la persona ingresa al sistema ',
  `Tel_per` bigint(15) DEFAULT NULL COMMENT 'es el telefono en el que se pueda localizar a la persona ',
  `Cel_per` bigint(15) DEFAULT NULL COMMENT 'es el telefono celular en el que se puede localizar a la persona ',
  `Direc_per` varchar(60) NOT NULL COMMENT 'es la direccion de vivienda de la persona ',
  `Correo_per` varchar(45) DEFAULT NULL COMMENT 'es el correo electronico que utiliza la persona '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Num_Documento_per`, `Cod_tipo_doc`, `Primer_Nombre_per`, `Segundo_Nombre_per`, `Primer_Apellido_per`, `Segundo_Apellido_per`, `Usuario_login`, `Pass_login`, `Tel_per`, `Cel_per`, `Direc_per`, `Correo_per`) VALUES
('1014304616', 'C.C', 'JULIANA', 'GERALDIN', 'GARCIA', 'CORREDOR', 'JGGARCIA176', '1234', 4008888, 3157301391, 'CASA GERALDIN', 'JGGARCIA176@MISENA.EDU.CO'),
('1031157939', 'C.C', 'ALBERT', 'HERNAN', 'QUINTERO', 'VALENCIA', 'AQUINTERO939', '1234', 4008881, 3123654823, 'CASA ALBERT', 'AQUINTERO939@MISENA.EDU.CO'),
('1031178887', 'C.C', 'JEISON', 'ALEXANDER', 'DIAZ', 'DAZA', 'JADIAZ908', '1234', 4008888, 3203725972, 'CASA JEISON', 'JADIAZ908@MISENA.EDU.CO'),
('1033815398', 'C.C', 'JUAN', 'SEBASTIAN', 'RUIZ', 'CASTANEDA', 'JSRUIZ241', '1234', 400889, 3022608970, 'MI CASA', 'JSRUIZ241@MISENA.EDU.CO'),
('9900000001', 'T.I', 'FERNANDO', 'JOSE', 'PRADA', 'OTERO', 'PRADA6', '1234', 4008882, 3102878826, 'CASA FERNANDO', 'PRADA6@MISENA.EDU.CO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzeria`
--

CREATE TABLE `pizzeria` (
  `Nit_Pizzeria` bigint(20) NOT NULL COMMENT 'Número de identificación de  la pizzería. ',
  `Nom_Pizzeria` varchar(45) NOT NULL COMMENT 'Nombre de la pìzzería. ',
  `Dir_Pizzeria` varchar(50) NOT NULL COMMENT 'dirección de la pizzería. ',
  `Tel_Pizzeria` bigint(15) NOT NULL COMMENT 'Número Telefónico fijo de la pìzzería. ',
  `Cel_Pizzeria` bigint(15) DEFAULT NULL COMMENT 'Número de celular de la pizzería. ',
  `Logo_Pizzeria` varchar(70) NOT NULL COMMENT 'Logotipo de la pizzería. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pizzeria`
--

INSERT INTO `pizzeria` (`Nit_Pizzeria`, `Nom_Pizzeria`, `Dir_Pizzeria`, `Tel_Pizzeria`, `Cel_Pizzeria`, `Logo_Pizzeria`) VALUES
(801145012, 'PIZZERIA ABUELA', 'CALLE FALSA 13-31', 4008887, 3105320621, 'MEDIA/FOTO_P_ABUELA.JPG');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `Cod_producto` varchar(45) NOT NULL COMMENT 'Es el codigo por el cual se identifica el producto.',
  `Nom_prod` varchar(45) NOT NULL COMMENT 'Nombre por el que se identifica el producto.',
  `Desc_prod` varchar(100) NOT NULL COMMENT 'Descripción del producto.',
  `Foto_prod` varchar(70) NOT NULL COMMENT 'Imagen, foto por la que se identifica el producto.',
  `Tipo_producto` varchar(45) NOT NULL,
  `Stok_min` int(11) DEFAULT NULL COMMENT 'Cantidad minima que puede existir del producto',
  `Stok_max` int(11) DEFAULT NULL COMMENT 'Cantidad maxima  que puede existir del producto',
  `Cantidad_exist` int(11) DEFAULT NULL COMMENT 'Numero total de unidades existentes del producto'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`Cod_producto`, `Nom_prod`, `Desc_prod`, `Foto_prod`, `Tipo_producto`, `Stok_min`, `Stok_max`, `Cantidad_exist`) VALUES
('1001-PIZHAW', 'PIZZA HAWAIANA', 'PIZZA QUE CONTIENE UNA BASE DE QUESO FUNDIDO Y TOMATE QUE SE ALIÑAN CON JAMÓN Y PIÑA', 'MEDIA/HAWAIANA.JPG', 'PIZ', NULL, NULL, NULL),
('1002-PIZPEPPE', 'PIZZA PEPPERONI', 'PIZZA QUE CONTIENE PEPPERONI', 'MEDIA/PEPPERONI.JPG', 'PIZ', NULL, NULL, NULL),
('1003-PIZPIZMEX', 'PIZZA MEXICANA', 'PIZZA QUE CONTIENE TOMATE, FRIJOLES, JALAPEÑOS, CARNE PICADA Y QUESO CHEDDAR', 'MEDIA/MEXICANA.JPG', 'PIZ', NULL, NULL, NULL),
('1004-PIZQUES', 'PIZZA QUESO', 'DELICIOSA Y JUGOSA PIZZA REPLETA DE TUS QUESOS FAVORITOS', 'MEDIA/QUESO.JPG', 'PIZ', NULL, NULL, NULL),
('1005-PIZCHAM', 'PIZZA CHAMPIÑONES', 'DELICIOSA Y JUGOSA PIZZA REPLETA DE TUS CHAMPIÑONES FAVORITOS', 'MEDIA/CHAMPIÑONES.JPG', 'PIZ', NULL, NULL, NULL),
('1006-PIZVEGE', 'PIZZA VEGETARIANA', 'DELICIOSA PIZZA CON INGREDIENTES VEGETARIANOS IDEAL PARA REEMPLAZAR LA TRADICIONAL', 'MEDIA/VEGETARIANA.JPG', 'PIZ', NULL, NULL, NULL),
('1007-BEBCOCA', 'COCACOLA', 'DELICIOSA BEBIDA COCACOLA TRADICIONAL', 'MEDIA/COCACOLA.JPG', 'BEB', 20, 50, 20),
('1008-BEBPEP', 'PEPSI', 'DELICIOSA BEBIDA PEPSI TRADICIONAL', 'MEDIA/PEPSI.JPG', 'BEB', 20, 50, 20),
('1009-BEBJGNARA', 'JUGO NARANJA', 'DELICIOSO JUGO NARANJA', 'MEDIA/PEPSI.JPG', 'BEB', 20, 50, 20),
('1010-LAS', 'LASAÑA', 'PLATO QUE TIENE PASTA EN LÁMINAS INTERCALADAS CON CARNE Y BECHAMEL LLAMADO LASAÑA AL HORNO', 'MEDIA/LASAÑA.JPG', 'PAS', NULL, NULL, NULL),
('1011-LASCNCAR', 'LASAÑA CON CARNE', 'PLATO QUE TIENE PASTA EN LÁMINAS INTERCALADAS CON CARNE TERNERA', 'MEDIA/LASAÑACARNE.JPG', 'PAS', NULL, NULL, NULL),
('1012-LASCNPOL', 'LASAÑA CON POLLO', 'PLATO QUE TIENE PASTA EN LÁMINAS INTERCALADAS CON POLLO', 'MEDIA/LASAÑAPOLLO.JPG', 'PAS', NULL, NULL, NULL),
('1013-RAV', 'RAVIOLI', 'PASTA RELLENA CON DIFERENTES INGREDIENTES', 'MEDIA/RAVIOLI.JPG', 'PAS', NULL, NULL, NULL),
('1014-SPGH', 'SPAGHETTI A LA BOLOÑESA', 'PASTA ACOMPAÑADA CON SALSA BOLOÑESA', 'MEDIA/SPAGHETTI_BOLOÑESA.JPG', 'PAS', NULL, NULL, NULL),
('1015-ENSDPAS', 'ENSALADA DE PASTA, QUESO Y ALBAHACA', 'ENSALADA DE PASTA, QUESO Y ALBAHACA', 'MEDIA/ENSALADA_PQA.JPG', 'ENS', NULL, NULL, NULL),
('1016-ENSDPEP', 'ENSALADA DE PEPINO Y YOGURT GRIEGO', 'ENSALADA DE PEPINO Y YOGURT GRIEGO', 'MEDIA/ENSALADA_PYG.JPG', 'ENS', NULL, NULL, NULL),
('1017-PALDQUES', 'PALITOS DE QUESO', 'DELICIOSO HOJALDRE SUPERRELLENO DE QUESO DOBLE CREMA Y UN TOQUE SECRETO', 'MEDIA/PALITOS_QUESO.JPG', 'ACOM', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto_has_tamaño`
--

CREATE TABLE `producto_has_tamaño` (
  `Producto_Cod_producto` varchar(45) NOT NULL,
  `Tamaño_Cod_Tamaño` varchar(45) NOT NULL,
  `Valor_prod` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `producto_has_tamaño`
--

INSERT INTO `producto_has_tamaño` (`Producto_Cod_producto`, `Tamaño_Cod_Tamaño`, `Valor_prod`) VALUES
('1001-PIZHAW', '1-EXTRA GRANDE', '40000.00'),
('1001-PIZHAW', '1-FAMILIAR', '32000.00'),
('1001-PIZHAW', '1-GRANDE', '27000.00'),
('1001-PIZHAW', '1-MEDIANA', '22000.00'),
('1001-PIZHAW', '1-PEQUEÑA', '15000.00'),
('1002-PIZPEPPE', '1-EXTRA GRANDE', '40000.00'),
('1002-PIZPEPPE', '1-FAMILIAR', '32000.00'),
('1002-PIZPEPPE', '1-GRANDE', '27000.00'),
('1002-PIZPEPPE', '1-MEDIANA', '22000.00'),
('1002-PIZPEPPE', '1-PEQUEÑA', '15000.00'),
('1003-PIZPIZMEX', '1-EXTRA GRANDE', '40000.00'),
('1003-PIZPIZMEX', '1-FAMILIAR', '32000.00'),
('1003-PIZPIZMEX', '1-GRANDE', '27000.00'),
('1003-PIZPIZMEX', '1-MEDIANA', '22000.00'),
('1003-PIZPIZMEX', '1-PEQUEÑA', '15000.00'),
('1004-PIZQUES', '1-EXTRA GRANDE', '40000.00'),
('1004-PIZQUES', '1-FAMILIAR', '32000.00'),
('1004-PIZQUES', '1-GRANDE', '27000.00'),
('1004-PIZQUES', '1-MEDIANA', '22000.00'),
('1004-PIZQUES', '1-PEQUEÑA', '15000.00'),
('1005-PIZCHAM', '1-EXTRA GRANDE', '40000.00'),
('1005-PIZCHAM', '1-FAMILIAR', '32000.00'),
('1005-PIZCHAM', '1-GRANDE', '27000.00'),
('1005-PIZCHAM', '1-MEDIANA', '22000.00'),
('1005-PIZCHAM', '1-PEQUEÑA', '15000.00'),
('1006-PIZVEGE', '1-EXTRA GRANDE', '40000.00'),
('1006-PIZVEGE', '1-FAMILIAR', '32000.00'),
('1006-PIZVEGE', '1-GRANDE', '27000.00'),
('1006-PIZVEGE', '1-MEDIANA', '22000.00'),
('1006-PIZVEGE', '1-PEQUEÑA', '15000.00'),
('1007-BEBCOCA', '2-ML-250', '500.00'),
('1007-BEBCOCA', '2-ML-350', '1200.00'),
('1007-BEBCOCA', '2-ML-500', '1500.00'),
('1007-BEBCOCA', '3-LT-1', '1900.00'),
('1007-BEBCOCA', '3-LT-1.25', '2500.00'),
('1007-BEBCOCA', '3-LT-2.5', '3000.00'),
('1008-BEBPEP', '2-ML-350', '1100.00'),
('1008-BEBPEP', '2-ML-500', '1400.00'),
('1008-BEBPEP', '3-LT-1', '1900.00'),
('1008-BEBPEP', '3-LT-1.25', '2400.00'),
('1008-BEBPEP', '3-LT-2.5', '3100.00'),
('1009-BEBJGNARA', '2-ML-350', '1400.00'),
('1009-BEBJGNARA', '2-ML-500', '1700.00'),
('1009-BEBJGNARA', '3-LT-1', '2100.00'),
('1009-BEBJGNARA', '3-LT-1.25', '2900.00'),
('1010-LAS', '1-MEDIANA', '15000.00'),
('1011-LASCNCAR', '1-MEDIANA', '16000.00'),
('1012-LASCNPOL', '1-MEDIANA', '16000.00'),
('1013-RAV', '1-MEDIANA', '10000.00'),
('1014-SPGH', '1-MEDIANA', '16000.00'),
('1015-ENSDPAS', '1-MEDIANA', '8000.00'),
('1016-ENSDPEP', '1-MEDIANA', '8000.00'),
('1017-PALDQUES', '1-MEDIANA', '8000.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Cod_rol` varchar(45) NOT NULL COMMENT 'codigo que identifica el rol de la persona',
  `Desc_rol` varchar(45) NOT NULL COMMENT 'describe si el rol es cliente empleado o  gerente  '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Cod_rol`, `Desc_rol`) VALUES
('ADMINISTRADOR', 'ADMINISTRADOR'),
('CLIENTE', 'CLIENTE'),
('EMPLEADO', 'EMPLEADO');

--
-- Disparadores `rol`
--
DELIMITER $$
CREATE TRIGGER `DELETE_ROL` AFTER DELETE ON `rol` FOR EACH ROW INSERT INTO auditoria
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE ELIMINARON LOS SIGUIENTES DATOS DE ROL:',OLD.COD_Rol,
    'DESCRIPCION DEL ROL(',OLD.desc_rol,')'    ),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `INSERT_ROL` AFTER INSERT ON `rol` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE INSERTARON LOS SIGUIENTES DATOS DE ROL:',NEW.COD_Rol,
    'DESCRIPCION DEL ROL(',NEW.desc_rol,')'    ),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_ROL` AFTER UPDATE ON `rol` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE MODIFICARON LOS SIGUIENTES DATOS DE ROL:'
       
    'ROL(',OLD.cod_rol,')POR(',NEW.cod_ROL,')
    ESTADO ROL(',OLD.desc_ROL,')POR(',NEW.desc_ROL,
    ')'
       ),NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol_has_persona`
--

CREATE TABLE `rol_has_persona` (
  `Rol_Cod_rol` varchar(45) NOT NULL,
  `Persona_Num_Documento_per` varchar(15) NOT NULL,
  `Persona_Cod_tipo_doc` varchar(10) NOT NULL,
  `Estado_rol_per` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `rol_has_persona`
--

INSERT INTO `rol_has_persona` (`Rol_Cod_rol`, `Persona_Num_Documento_per`, `Persona_Cod_tipo_doc`, `Estado_rol_per`) VALUES
('ADMINISTRADOR', '1033815398', 'C.C', 1),
('CLIENTE', '1014304616', 'C.C', 1),
('CLIENTE', '9900000001', 'T.I', 1),
('EMPLEADO', '1031157939', 'C.C', 1),
('EMPLEADO', '1031178887', 'C.C', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tamaño`
--

CREATE TABLE `tamaño` (
  `Cod_Tamaño` varchar(45) NOT NULL COMMENT 'Codigo por el que se identifica el tamaño del producto elegido.',
  `Desc_tamaño` varchar(45) NOT NULL COMMENT 'Describe el tamaño del producto. '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tamaño`
--

INSERT INTO `tamaño` (`Cod_Tamaño`, `Desc_tamaño`) VALUES
('1-EXTRA GRANDE', 'EXTRA GRANDE'),
('1-FAMILIAR', 'FAMILIAR'),
('1-GRANDE', 'GRANDE'),
('1-MEDIANA', 'MEDIANA'),
('1-PEQUEÑA', 'PERSONAL'),
('2-ML-250', '250 ML'),
('2-ML-350', '350 ML'),
('2-ML-500', '500 ML'),
('3-LT-1', '1 LT'),
('3-LT-1.25', '1.25 LT'),
('3-LT-2.5', '2.5 LT');

--
-- Disparadores `tamaño`
--
DELIMITER $$
CREATE TRIGGER `DELETE_TAMAÑO` AFTER DELETE ON `tamaño` FOR EACH ROW INSERT INTO auditoria
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE ELIMINARON LOS SIGUIENTES DATOS DE ROL:',OLD.Cod_Tamaño,
    'DESCRIPCION DEL TAMAÑO(',OLD.Desc_tamaño,')'    ),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `INSERT_TAMAÑO` AFTER INSERT ON `tamaño` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE INSERTARON LOS SIGUIENTES DATOS DE ROL:',NEW.Cod_Tamaño,
    'DESCRIPCION DEL ROL(',NEW.DESC_tamaño,')'),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_TAMAÑO` AFTER UPDATE ON `tamaño` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE MODIFICARON LOS SIGUIENTES DATOS DE ROL:'
       
    'ROL(',OLD.Cod_Tamaño,')POR(',NEW.Cod_Tamaño,')
    ESTADO ROL(',OLD.Desc_tamaño,')POR(',NEW.Desc_tamaño,
    ')'
       ),NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_doc`
--

CREATE TABLE `tipo_doc` (
  `Cod_tipo_doc` varchar(10) NOT NULL COMMENT 'es el codigo del tipo de documento ',
  `Descripcion_tipo_doc` varchar(45) NOT NULL COMMENT 'describe si el documento es CC, TI, CE, etc.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_doc`
--

INSERT INTO `tipo_doc` (`Cod_tipo_doc`, `Descripcion_tipo_doc`) VALUES
('C.C', 'CEDULA DE CIUDADANIA'),
('C.E', 'CEDULA DE EXTRANGERIA'),
('T.I', 'TARGETA DE IDENTIDAD');

--
-- Disparadores `tipo_doc`
--
DELIMITER $$
CREATE TRIGGER `DELETE_tipo_doc` AFTER DELETE ON `tipo_doc` FOR EACH ROW INSERT INTO auditoria
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE ELIMINARON LOS SIGUIENTES DATOS DE TIPO_DOCUMENTO:',OLD.Cod_tipo_doc,
    'DESCRIPCION DEL TIPO_DOCUMENTO(',OLD.Descripcion_tipo_doc,')'    ),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `INSERT_tipo_doc` AFTER INSERT ON `tipo_doc` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE INSERTARON LOS SIGUIENTES DATOS DE TIPO_DOCUMENTO:',NEW.Cod_tipo_doc,
    'DESCRIPCION DEL TIPO_DOCUMENTO(',NEW.Descripcion_tipo_doc,')'),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_tipo_doc` AFTER UPDATE ON `tipo_doc` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE MODIFICARON LOS SIGUIENTES DATOS DE TIPO_DOCUMENTO:'
       
    'TIPO_DOCUMENTO(',OLD.COD_tipo_doc,')POR(',NEW.COD_tipo_doc,')
    DESCRIPCION TIPO_DOCUMENTO',OLD.Descripcion_tipo_doc,')POR(',NEW.Descripcion_tipo_doc,
    ')'
       ),NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `Cod_tipo_prod` varchar(45) NOT NULL COMMENT 'Codigo del tipo de producto',
  `Desc_tipo_prod` varchar(25) NOT NULL COMMENT 'Describe el tipo de producto (pizza, postre, bebida, etc).'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`Cod_tipo_prod`, `Desc_tipo_prod`) VALUES
('ACOM', 'ACOMPAÑANTES'),
('BEB', 'BEBIDA'),
('ENS', 'ENSALADA'),
('PAS', 'PASTAS'),
('PIZ', 'PIZZA');

--
-- Disparadores `tipo_producto`
--
DELIMITER $$
CREATE TRIGGER `DELETE_TIPO_PRODUCTO` AFTER DELETE ON `tipo_producto` FOR EACH ROW INSERT INTO auditoria
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE ELIMINARON LOS SIGUIENTES DATOS DE TIPO_PRODUCTO:',OLD.Cod_tipo_prod,
    'DESCRIPCION DEL TIPO_PRODUCTO(',OLD.Desc_tipo_prod,')'    ),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `INSERT_TIPO_PRODUCTO` AFTER INSERT ON `tipo_producto` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE INSERTARON LOS SIGUIENTES DATOS DE TIPO_PRODUCTO:',NEW.Cod_tipo_prod,
    'DESCRIPCION DEL TIPO_PRODUCTO(',NEW.Desc_tipo_prod,')'),NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `UPDATE_TIPO_PRODUCTO` AFTER UPDATE ON `tipo_producto` FOR EACH ROW INSERT INTO AUDITORIA
(USUARIO_AUD,
DESCRIPCION_AUD,
FECHA_AUD)
VALUE
(USER(),
CONCAT('SE MODIFICARON LOS SIGUIENTES DATOS DE TIPO_PRODUCTO:'
       
    'TIPO_PRODUCTO(',OLD.Cod_tipo_prod,')POR(',NEW.Cod_tipo_prod,')
    ESTADO TIPO_PRODUCTO',OLD.Desc_tipo_prod,')POR(',NEW.Desc_tipo_prod,
    ')'
       ),NOW())
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`COD_AUDITORIA`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`Cod_dom`,`Estado_domicilio`,`Nit_Pizzeria`),
  ADD KEY `FK_Nit_Pizzeria_idx` (`Nit_Pizzeria`),
  ADD KEY `fk_Domicilio_Estado_domicilio1_idx` (`Estado_domicilio`);

--
-- Indices de la tabla `domicilio_has_persona`
--
ALTER TABLE `domicilio_has_persona`
  ADD PRIMARY KEY (`Domicilio_Cod_dom`,`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`),
  ADD KEY `fk_Domicilio_has_Persona_Persona1_idx` (`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`),
  ADD KEY `fk_Domicilio_has_Persona_Domicilio1_idx` (`Domicilio_Cod_dom`);

--
-- Indices de la tabla `domicilio_has_producto_has_tamaño`
--
ALTER TABLE `domicilio_has_producto_has_tamaño`
  ADD PRIMARY KEY (`Domicilio_Cod_dom`,`Cod_producto`,`P_has_T_Tamaño_Cod_Tamaño`),
  ADD KEY `fk_Domicilio_has_Producto_has_Tamaño_Producto_has_Tamaño1_idx` (`Cod_producto`,`P_has_T_Tamaño_Cod_Tamaño`),
  ADD KEY `fk_Domicilio_has_Producto_has_Tamaño_Domicilio1_idx` (`Domicilio_Cod_dom`);

--
-- Indices de la tabla `estado_domicilio`
--
ALTER TABLE `estado_domicilio`
  ADD PRIMARY KEY (`Cod_Estado_dom`);

--
-- Indices de la tabla `forma_pago`
--
ALTER TABLE `forma_pago`
  ADD PRIMARY KEY (`Cod_Forma_pago`);

--
-- Indices de la tabla `forma_pago_has_domicilio1`
--
ALTER TABLE `forma_pago_has_domicilio1`
  ADD PRIMARY KEY (`Cod_Forma_pago`,`Cod_dom`),
  ADD KEY `fk_Forma_pago_has_Domicilio1_Domicilio1_idx` (`Cod_dom`),
  ADD KEY `fk_Forma_pago_has_Domicilio1_Forma_pago1_idx` (`Cod_Forma_pago`);

--
-- Indices de la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD PRIMARY KEY (`Cod_Opinion`,`Num_Documento_per`),
  ADD KEY `fk_Num_Documento_per_idx` (`Num_Documento_per`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Num_Documento_per`,`Cod_tipo_doc`),
  ADD UNIQUE KEY `Usuario_login_UNIQUE` (`Usuario_login`),
  ADD KEY `fk_Persona_Tipo_Doc1_idx` (`Cod_tipo_doc`);

--
-- Indices de la tabla `pizzeria`
--
ALTER TABLE `pizzeria`
  ADD PRIMARY KEY (`Nit_Pizzeria`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`Cod_producto`,`Tipo_producto`),
  ADD KEY `fk_Producto_Tipo_producto1_idx` (`Tipo_producto`);

--
-- Indices de la tabla `producto_has_tamaño`
--
ALTER TABLE `producto_has_tamaño`
  ADD PRIMARY KEY (`Producto_Cod_producto`,`Tamaño_Cod_Tamaño`),
  ADD KEY `fk_Producto_has_Tamaño_Tamaño1_idx` (`Tamaño_Cod_Tamaño`),
  ADD KEY `fk_Producto_has_Tamaño_Producto1_idx` (`Producto_Cod_producto`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Cod_rol`);

--
-- Indices de la tabla `rol_has_persona`
--
ALTER TABLE `rol_has_persona`
  ADD PRIMARY KEY (`Rol_Cod_rol`,`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`),
  ADD KEY `fk_Rol_has_Persona_Persona1_idx` (`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`),
  ADD KEY `fk_Rol_has_Persona_Rol1_idx` (`Rol_Cod_rol`);

--
-- Indices de la tabla `tamaño`
--
ALTER TABLE `tamaño`
  ADD PRIMARY KEY (`Cod_Tamaño`);

--
-- Indices de la tabla `tipo_doc`
--
ALTER TABLE `tipo_doc`
  ADD PRIMARY KEY (`Cod_tipo_doc`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`Cod_tipo_prod`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `COD_AUDITORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `opinion`
--
ALTER TABLE `opinion`
  MODIFY `Cod_Opinion` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'es el codigo  que identifica la opinion dada por la  persona ', AUTO_INCREMENT=5;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `FK_Nit_Pizzeria` FOREIGN KEY (`Nit_Pizzeria`) REFERENCES `pizzeria` (`Nit_Pizzeria`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Domicilio_Estado_domicilio1` FOREIGN KEY (`Estado_domicilio`) REFERENCES `estado_domicilio` (`Cod_Estado_dom`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `domicilio_has_persona`
--
ALTER TABLE `domicilio_has_persona`
  ADD CONSTRAINT `fk_Domicilio_has_Persona_Domicilio1` FOREIGN KEY (`Domicilio_Cod_dom`) REFERENCES `domicilio` (`Cod_dom`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Domicilio_has_Persona_Persona1` FOREIGN KEY (`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`) REFERENCES `persona` (`Num_Documento_per`, `Cod_tipo_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `domicilio_has_producto_has_tamaño`
--
ALTER TABLE `domicilio_has_producto_has_tamaño`
  ADD CONSTRAINT `fk_Domicilio_has_Producto_has_Tamaño_Domicilio1` FOREIGN KEY (`Domicilio_Cod_dom`) REFERENCES `domicilio` (`Cod_dom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Domicilio_has_Producto_has_Tamaño_Producto_has_Tamaño1` FOREIGN KEY (`Cod_producto`,`P_has_T_Tamaño_Cod_Tamaño`) REFERENCES `producto_has_tamaño` (`Producto_Cod_producto`, `Tamaño_Cod_Tamaño`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `forma_pago_has_domicilio1`
--
ALTER TABLE `forma_pago_has_domicilio1`
  ADD CONSTRAINT `fk_Forma_pago_has_Domicilio1_Domicilio1` FOREIGN KEY (`Cod_dom`) REFERENCES `domicilio` (`Cod_dom`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Forma_pago_has_Domicilio1_Forma_pago1` FOREIGN KEY (`Cod_Forma_pago`) REFERENCES `forma_pago` (`Cod_Forma_pago`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `opinion`
--
ALTER TABLE `opinion`
  ADD CONSTRAINT `fk_Num_Documento_per` FOREIGN KEY (`Num_Documento_per`) REFERENCES `persona` (`Num_Documento_per`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_Persona_Tipo_Doc1` FOREIGN KEY (`Cod_tipo_doc`) REFERENCES `tipo_doc` (`Cod_tipo_doc`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_Producto_Tipo_producto1` FOREIGN KEY (`Tipo_producto`) REFERENCES `tipo_producto` (`Cod_tipo_prod`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `producto_has_tamaño`
--
ALTER TABLE `producto_has_tamaño`
  ADD CONSTRAINT `fk_Producto_has_Tamaño_Producto1` FOREIGN KEY (`Producto_Cod_producto`) REFERENCES `producto` (`Cod_producto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Producto_has_Tamaño_Tamaño1` FOREIGN KEY (`Tamaño_Cod_Tamaño`) REFERENCES `tamaño` (`Cod_Tamaño`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `rol_has_persona`
--
ALTER TABLE `rol_has_persona`
  ADD CONSTRAINT `fk_Rol_has_Persona_Persona1` FOREIGN KEY (`Persona_Num_Documento_per`,`Persona_Cod_tipo_doc`) REFERENCES `persona` (`Num_Documento_per`, `Cod_tipo_doc`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_Rol_has_Persona_Rol1` FOREIGN KEY (`Rol_Cod_rol`) REFERENCES `rol` (`Cod_rol`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
