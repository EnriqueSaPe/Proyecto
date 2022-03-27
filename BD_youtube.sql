CREATE DATABASE  IF NOT EXISTS `db_youtube_2022` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_youtube_2022`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: db__youtube_2022
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_anuncios`
--

DROP TABLE IF EXISTS `tb_anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_anuncios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_bin,
  `tipo` enum('Banner Interno','Banner Externo','Video') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Descripcion: Clasificacion de ANUNCIOS basado en la manera en que se presenta al consumidor clasificados en:\\n\\nVIDEO: Sera mostrado al inicio, intermedio o final del video dependiendo de su duracion.\\nBANNER INTERNO: IMAGEN promocional de tamaño 350 x 90 pixeles, presentada durante la reproduccion del video.\\nBANNER EXTERNO: IMAGEN promocional de tamaño variable que sera colocada fuera de la interfaz de reproduccion de video.\\n\\nTipo: Valor Especifico.\\nDominio: Video, Banner Interno, Banner Externo\\nComposicion: ["Video" | "Banner Interno" |  "Banner Externo"]',
  `estatus` enum('Vigente','No vigente','Bloqueado','Necesita Aprobacion') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Descripcion: Atributo que define la situacion actual del ANUNCIO, para su promocion y publicidad dividido en:\\nVIGENTE: Anuncio actualmete activo con  plan de publicidad pagada.\\nNO VIGENTE: Anuncio que ha consumido su plan de publicidad y no sera promocionado hasta que sea pagado.\\nBLOQUEADO: Anuncio que infringe las normas o politicas de operacion y no sera promocionado.\\nNECESITA APROBACION: Anuncio que recientemente ha sido añadido por el CLIENTE y necesita la aprobación de YouTube para ser promocionado.\\n\\nTipo: Valor Especifico.\\nDominio: Vigente, No Vigente, Bloqueado, Necesita Aprobación.\\nComposición: ["Vigente" |"No Vigente" | "Bloqueado" |  "Necesita Aprobación"]\\n',
  `fecha_carga` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `archivo_imagen` blob,
  `video_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY ` fk_videos_id4_idx` (`video_ID`),
  CONSTRAINT ` fk_videos_id4` FOREIGN KEY (`video_ID`) REFERENCES `tb_videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_anuncios`
--

LOCK TABLES `tb_anuncios` WRITE;
/*!40000 ALTER TABLE `tb_anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_canales`
--

DROP TABLE IF EXISTS `tb_canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_canales` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('Activo','Inactivo','Suspendido') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `icono` blob,
  `banner` blob,
  `usuario_ID` int unsigned NOT NULL,
  `total_suscriptores` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_usuario_id7_idx` (`usuario_ID`),
  CONSTRAINT `fk_usuario_id7` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='Tabla que contendra los datos de los canales, que son la agrupacion de los videos producidos por los usuarios para su distribución a los consumidores , generalmente tienen una tematica en común.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_canales`
--

LOCK TABLES `tb_canales` WRITE;
/*!40000 ALTER TABLE `tb_canales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categorias`
--

DROP TABLE IF EXISTS `tb_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categorias` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `estatus` enum('Activa','Inactiva','Descontinuada') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `ID_Categoría_Padre` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `fklol_idx` (`ID_Categoría_Padre`),
  CONSTRAINT `fklol` FOREIGN KEY (`ID_Categoría_Padre`) REFERENCES `tb_categorias` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='Tabla que almacenara la CLASIFICACION de los VIDEOS en base a su contenido temático, esta CLASIFICACIÓN será asignada exclusivamente por empleados de YouTube, con la finalidad de hacer búsquedas o recomendaciones a los USUARIOS.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categorias`
--

LOCK TABLES `tb_categorias` WRITE;
/*!40000 ALTER TABLE `tb_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_comentarios`
--

DROP TABLE IF EXISTS `tb_comentarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_comentarios` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `usuario_ID` int unsigned NOT NULL,
  `texto` text NOT NULL,
  `estatus` enum('Visible','No visible') NOT NULL DEFAULT 'Visible',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_megusta` int NOT NULL DEFAULT '0',
  `total_nomegusta` int NOT NULL DEFAULT '0',
  `tipo` enum('Video','Comunidad') NOT NULL,
  `ID_comentario_padre` int unsigned NOT NULL,
  `video_ID` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_video_id_idx` (`video_ID`),
  KEY `fk_comentario_id_idx` (`ID_comentario_padre`),
  CONSTRAINT `fk_comentario_id` FOREIGN KEY (`ID_comentario_padre`) REFERENCES `tb_comentarios` (`ID`),
  CONSTRAINT `fk_video_id` FOREIGN KEY (`video_ID`) REFERENCES `tb_videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tabla que contendra datos de los comentarios que los usuarios expresan en la plataforma.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_comentarios`
--

LOCK TABLES `tb_comentarios` WRITE;
/*!40000 ALTER TABLE `tb_comentarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_comentarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_empresas`
--

DROP TABLE IF EXISTS `tb_empresas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_empresas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `ubicacion_ID` int unsigned NOT NULL,
  `giro` enum('Productos','Servicios','Productos y Servicios') NOT NULL,
  `tamanio` enum('Micro','Pequeña','Mediana','Grande','Macro') NOT NULL,
  `mercado_region` enum('Local','Estatal','Regional','Nacional','Internacional') NOT NULL,
  `estatus` enum('Activo','Cancelado') NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `fk_ubicacion_ID_idx` (`ubicacion_ID`),
  CONSTRAINT `fk_ubicacion_ID` FOREIGN KEY (`ubicacion_ID`) REFERENCES `tb_ubicaciones` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla contendra la informacion de las empresas patrocinadoras las cuales deberan tener usuarios registrados para gestionar las campañas de publicidad en la plataforma.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_empresas`
--

LOCK TABLES `tb_empresas` WRITE;
/*!40000 ALTER TABLE `tb_empresas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_empresas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_paises`
--

DROP TABLE IF EXISTS `tb_paises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_paises` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_pais` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `abreviatura` varchar(2) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `continente` enum('America','Europa','Asia','Oceania','Africa') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `mapa_placeid` varchar(60) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_pais_UNIQUE` (`nombre_pais`),
  UNIQUE KEY `continente_UNIQUE` (`continente`),
  UNIQUE KEY `abreviatura_UNIQUE` (`abreviatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_paises`
--

LOCK TABLES `tb_paises` WRITE;
/*!40000 ALTER TABLE `tb_paises` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_paises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_patrocinadores`
--

DROP TABLE IF EXISTS `tb_patrocinadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_patrocinadores` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `Tipo` enum('Usuario','Empresa') NOT NULL,
  `usuario_ID` int unsigned NOT NULL,
  `empresa_ID` int unsigned DEFAULT NULL,
  `Estatus` enum('Activo','Inactivo','Canceladp') NOT NULL,
  `Fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `k_usuario_ID5_idx` (`usuario_ID`),
  KEY `fk_empresa_ID6_idx` (`empresa_ID`),
  CONSTRAINT `fk_empresa_ID6` FOREIGN KEY (`empresa_ID`) REFERENCES `tb_patrocinadores` (`ID`),
  CONSTRAINT `fk_usuario_ID5` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla contendra la informacion de los socios comenrciales de Youtube, que desean publicar sus productos o servicios a la comunidad de la plataforma.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_patrocinadores`
--

LOCK TABLES `tb_patrocinadores` WRITE;
/*!40000 ALTER TABLE `tb_patrocinadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_patrocinadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_reproducciones`
--

DROP TABLE IF EXISTS `tb_reproducciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_reproducciones` (
  `ID` int unsigned NOT NULL,
  `dispositivo_origen` enum('SmartPhone','SmartTV','PC Escritorio','PC.Laptop','Consola Video Juegos','Tablet','Centro de Medios') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `ubicacion_ID` int unsigned NOT NULL,
  `tipo` enum('Completa','Parcial') CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `video_ID` int unsigned NOT NULL,
  `usuario_ID` int unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ubicacion_ID_idx` (`ubicacion_ID`),
  KEY `fk_usuarioid_idx` (`usuario_ID`),
  KEY `fk_usuariorid_idx` (`usuario_ID`),
  KEY `fk_videorid_idx` (`video_ID`),
  CONSTRAINT `fk_ubicacionrid` FOREIGN KEY (`ubicacion_ID`) REFERENCES `tb_ubicaciones` (`id`),
  CONSTRAINT `fk_usuariorid` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`),
  CONSTRAINT `fk_videorid` FOREIGN KEY (`video_ID`) REFERENCES `tb_videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_reproducciones`
--

LOCK TABLES `tb_reproducciones` WRITE;
/*!40000 ALTER TABLE `tb_reproducciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_reproducciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ubicaciones`
--

DROP TABLE IF EXISTS `tb_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_ubicaciones` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ciudad` varchar(80) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `distrito_estado` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `region` varchar(80) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Descripcion: Atributo que definirá la Zona o Región geográfica de un país a la que pertenece la ubicación, permitiendo asociar varios estados o ciudades.\\n\\nTipo: Alfabético.\\nDominio: Alfabeto.\\nComposición: {A-Z|a-z|.|,| |}80',
  `latitud` decimal(11,8) NOT NULL,
  `longitud` decimal(11,8) NOT NULL,
  `altitud` float NOT NULL,
  `pais_id` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_paisid_idx` (`pais_id`),
  CONSTRAINT `fk_paisid` FOREIGN KEY (`pais_id`) REFERENCES `tb_paises` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ubicaciones`
--

LOCK TABLES `tb_ubicaciones` WRITE;
/*!40000 ALTER TABLE `tb_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_usuarios`
--

DROP TABLE IF EXISTS `tb_usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_usuarios` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `primer_apellido` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `segundo_apellido` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `titulo` varchar(15) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL COMMENT 'Descripción: Atributo que contiene la referencia profesional o de cortesía que el USUARIO defina.\\nTipo: Alfabetico.\\nDominio: Alfabetico.\\nComposiciòn: 0{A_Z |a-z|.| |}15',
  `genero` enum('M','F') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `estatus_conexion` enum('Desconectado','Conectado') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `email` varchar(60) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `contraseña` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `tipo` enum('Comun','Premium','Trabajador') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `estatus` enum('Activo','Inactivo','Bloqueado') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL COMMENT 'Descripción: Atributo que define la sotuación actual de la cuenta del USUARIO respecto a su actividad en  la plataforma, segementado en:\\n\\nACTIVO: Usuario que presenta actividad reciente en la plataforma y no ha quebrantado ninguna política o regla de operación.\\nINACTIVO: Usuario que no ha presentado actividad en los últimos 30 días y no ha quebrantado ninguna política o regla de operación.\\nBLOQUEADO: Usuario que debido a su comportamiento ha quebrantado políticas o reglamentos y ha sido sancionado con el bloqueo e interacción a la plataforma.\\n\\nTipo: Valor Específico.\\nDominio: Activo, Inactivo o Bloqueado.\\nComposiciòn: [ ''Activo'' |  ''Inactivio'' | ''Bloqueado'' ]',
  `nombre_usuario` varchar(50) CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='tabla que contendra los datos personales de los usuairos';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_usuarios`
--

LOCK TABLES `tb_usuarios` WRITE;
/*!40000 ALTER TABLE `tb_usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_videos`
--

DROP TABLE IF EXISTS `tb_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_videos` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` text CHARACTER SET latin1 COLLATE latin1_spanish_ci,
  `archivo` blob,
  `fecha_carga` datetime NOT NULL,
  `fecha_publicacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('Disponible','NoDisponible','Bloqueado','En Revision') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `total_reproducciones` int unsigned NOT NULL DEFAULT '0',
  `total_vistas` int unsigned NOT NULL DEFAULT '0',
  `duracion` time NOT NULL DEFAULT '00:00:00',
  `url` varchar(200) CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL DEFAULT 'NULL',
  `canal_ID` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_canal_id_idx` (`canal_ID`),
  CONSTRAINT `fk_canal_id2` FOREIGN KEY (`canal_ID`) REFERENCES `tb_canales` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_videos`
--

LOCK TABLES `tb_videos` WRITE;
/*!40000 ALTER TABLE `tb_videos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_vistas`
--

DROP TABLE IF EXISTS `tb_vistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_vistas` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_reproduccion` datetime NOT NULL,
  `usuario_ID` int unsigned NOT NULL,
  `video_ID` int unsigned NOT NULL,
  `total_comentarios` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_usuarioviid_idx` (`usuario_ID`),
  KEY `fk_videoviid_idx` (`video_ID`),
  CONSTRAINT `fk_usuarioviid` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`),
  CONSTRAINT `fk_videoviid` FOREIGN KEY (`video_ID`) REFERENCES `tb_videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_vistas`
--

LOCK TABLES `tb_vistas` WRITE;
/*!40000 ALTER TABLE `tb_vistas` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_vistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_patrocinador_patrocina_vcu`
--

DROP TABLE IF EXISTS `tbr_patrocinador_patrocina_vcu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_patrocinador_patrocina_vcu` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT,
  `patrocinador_ID` int unsigned NOT NULL,
  `usuario_ID` int unsigned DEFAULT NULL,
  `video_ID` int unsigned DEFAULT NULL,
  `canla_ID` int unsigned DEFAULT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_inicio_patrocinio` datetime NOT NULL,
  `fecha_fin_patrocinio` datetime NOT NULL,
  `estatus` enum('Vigente','No vigente','Suspendida') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `total_vistas_generadas` int unsigned DEFAULT '0',
  `total_reproducciones_generadas` int unsigned DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `fk_patricinador_id_idx` (`patrocinador_ID`),
  KEY `fk_usuario_id_idx` (`usuario_ID`),
  KEY `fk_video_id_idx` (`video_ID`),
  KEY `fk_canal_id_idx` (`canla_ID`),
  CONSTRAINT `fk_canal_id9` FOREIGN KEY (`canla_ID`) REFERENCES `tb_canales` (`ID`),
  CONSTRAINT `fk_patrocinador` FOREIGN KEY (`patrocinador_ID`) REFERENCES `tb_patrocinadores` (`ID`),
  CONSTRAINT `fk_usuario_id8` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`),
  CONSTRAINT `fk_video_id4` FOREIGN KEY (`video_ID`) REFERENCES `tb_videos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Esta tabla contendra los datos de los ID´S de los patrocinadores y el elemento de la plataforma que promueven o monetizan entre VIDEO, Canal o USUARIO';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_patrocinador_patrocina_vcu`
--

LOCK TABLES `tbr_patrocinador_patrocina_vcu` WRITE;
/*!40000 ALTER TABLE `tbr_patrocinador_patrocina_vcu` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_patrocinador_patrocina_vcu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_usuarios_suscriben_canales`
--

DROP TABLE IF EXISTS `tbr_usuarios_suscriben_canales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_usuarios_suscriben_canales` (
  `usuario_ID` int unsigned NOT NULL,
  `canal_ID` int unsigned NOT NULL,
  `fecha_suscripcion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_ultima_interaccion` datetime NOT NULL,
  `tipo_suscriptor` enum('Frecuente','Ocasional','Esporadico','Inusual') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  `estatus` enum('Activo','Inactivo','Suspendido','Suscripcion Cancelada') CHARACTER SET latin1 COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`usuario_ID`,`canal_ID`),
  KEY `fk_canal_id_idx` (`canal_ID`),
  CONSTRAINT `fk_canal_id` FOREIGN KEY (`canal_ID`) REFERENCES `tb_canales` (`ID`),
  CONSTRAINT `fk_usuario_id` FOREIGN KEY (`usuario_ID`) REFERENCES `tb_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin COMMENT='Esta tabla contendrá la asociación de los id´s de los USUARIOS suscritos a los diferentes CANALES';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_usuarios_suscriben_canales`
--

LOCK TABLES `tbr_usuarios_suscriben_canales` WRITE;
/*!40000 ALTER TABLE `tbr_usuarios_suscriben_canales` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_usuarios_suscriben_canales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbr_usuarios_tienen_ubicaciones`
--

DROP TABLE IF EXISTS `tbr_usuarios_tienen_ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbr_usuarios_tienen_ubicaciones` (
  `usuario_id` int unsigned NOT NULL,
  `ubicacion_id` int unsigned NOT NULL,
  `tipo_ubicacion` enum('Hogar','Trabajo','Otra') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estatus` enum('Activa','Inactiva') CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  KEY `fk_usuario_idx` (`usuario_id`),
  KEY `fk_ubicacion_idx` (`ubicacion_id`),
  CONSTRAINT `fk_ubicacionid` FOREIGN KEY (`ubicacion_id`) REFERENCES `tb_ubicaciones` (`id`),
  CONSTRAINT `fk_usuarioid` FOREIGN KEY (`usuario_id`) REFERENCES `tb_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbr_usuarios_tienen_ubicaciones`
--

LOCK TABLES `tbr_usuarios_tienen_ubicaciones` WRITE;
/*!40000 ALTER TABLE `tbr_usuarios_tienen_ubicaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbr_usuarios_tienen_ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-09 23:04:31
