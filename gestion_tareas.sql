SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `gestion_tareas` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestion_tareas`;

DROP TABLE IF EXISTS `empleado`;
CREATE TABLE IF NOT EXISTS `empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo` (`correo`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `empleado` (`id`, `nombre`, `correo`, `telefono`) VALUES
(4, 'Juan Perez', 'juan.perez@example.com', '1234567890'),
(5, 'Maria Lopez', 'maria.lopez@example.com', '0987654321'),
(6, 'Carlos Garcia', 'carlos.garcia@example.com', '5678901234'),
(7, 'Ana Martinez', 'ana.martinez@example.com', '6789012345'),
(8, 'Luis Fernandez', 'luis.fernandez@example.com', '7890123456'),
(9, 'Jose Sanchez', 'jose.sanchez@example.com', '8901234567'),
(10, 'Laura Ramirez', 'laura.ramirez@example.com', '9012345678'),
(11, 'Pedro Torres', 'pedro.torres@example.com', '0123456789'),
(12, 'Lucia Vargas', 'lucia.vargas@example.com', '1234567891'),
(13, 'Miguel Gomez', 'miguel.gomez@example.com', '2345678901'),
(14, 'Sara Diaz', 'sara.diaz@example.com', '3456789012'),
(15, 'Jorge Castro', 'jorge.castro@example.com', '4567890123'),
(16, 'Claudia Morales', 'claudia.morales@example.com', '5678901235'),
(17, 'Fernando Ortiz', 'fernando.ortiz@example.com', '6789012346'),
(18, 'Patricia Herrera', 'patricia.herrera@example.com', '7890123457'),
(19, 'Santiago Ruiz', 'santiago.ruiz@example.com', '8901234568'),
(20, 'Isabel Mendoza', 'isabel.mendoza@example.com', '9012345679'),
(21, 'Andres Chavez', 'andres.chavez@example.com', '0123456780'),
(22, 'Cristina Flores', 'cristina.flores@example.com', '1234567892'),
(23, 'Daniel Suarez', 'daniel.suarez@example.com', '2345678902'),
(24, 'Gabriela Soto', 'gabriela.soto@example.com', '3456789013'),
(25, 'Ricardo Vega', 'ricardo.vega@example.com', '4567890124'),
(26, 'Natalia Guzman', 'natalia.guzman@example.com', '5678901236'),
(27, 'Adrian Pena', 'adrian.pena@example.com', '6789012347'),
(28, 'Monica Silva', 'monica.silva@example.com', '7890123458'),
(29, 'Felipe Castro', 'felipe.castro@example.com', '8901234569'),
(30, 'Veronica Reyes', 'veronica.reyes@example.com', '9012345670'),
(31, 'Diego Paredes', 'diego.paredes@example.com', '0123456781'),
(32, 'Camila Nunez', 'camila.nunez@example.com', '1234567893'),
(33, 'Alejandro Espinoza', 'alejandro.espinoza@example.com', '2345678903'),
(34, 'Valeria Campos', 'valeria.campos@example.com', '3456789014'),
(35, 'Francisco Ramos', 'francisco.ramos@example.com', '4567890125'),
(36, 'Carolina Ponce', 'carolina.ponce@example.com', '5678901237'),
(37, 'Martin Rojas', 'martin.rojas@example.com', '6789012348'),
(38, 'Paula Molina', 'paula.molina@example.com', '7890123459'),
(39, 'Victor Ibarra', 'victor.ibarra@example.com', '8901234570'),
(40, 'Rosa Medina', 'rosa.medina@example.com', '9012345671'),
(41, 'Emilio Navarro', 'emilio.navarro@example.com', '0123456782'),
(42, 'Silvia Aguilar', 'silvia.aguilar@example.com', '1234567894'),
(43, 'Roberto Salazar', 'roberto.salazar@example.com', '2345678904'),
(44, 'Carmen Avila', 'carmen.avila@example.com', '3456789015'),
(45, 'Hector Espinosa', 'hector.espinosa@example.com', '4567890126'),
(46, 'Alicia Castillo', 'alicia.castillo@example.com', '5678901238'),
(47, 'Manuel Sosa', 'manuel.sosa@example.com', '6789012349'),
(48, 'Mariana Ortiz', 'mariana.ortiz@example.com', '7890123460'),
(49, 'Javier Romero', 'javier.romero@example.com', '8901234571'),
(50, 'Lorena Delgado', 'lorena.delgado@example.com', '9012345672'),
(51, 'Oscar Figueroa', 'oscar.figueroa@example.com', '0123456783');

DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE IF NOT EXISTS `proyecto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `proyecto` (`id`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Sistema de Gestión', 'Desarrollo de un sistema para la gestión de inventarios', '2024-01-01', '2024-06-30'),
(2, 'E-commerce', 'Creación de una plataforma de comercio electrónico', '2024-02-15', '2024-08-15'),
(3, 'App de Reservas', 'Desarrollo de una aplicación para la reserva de servicios', '2024-03-01', '2024-07-31'),
(4, 'Portal de Noticias', 'Construcción de un portal web para noticias locales', '2024-04-01', '2024-09-30'),
(5, 'CRM Empresarial', 'Implementación de un sistema de gestión de relaciones con clientes', '2024-05-15', '2024-12-31'),
(6, 'Red Social', 'Desarrollo de una nueva red social para jóvenes', '2024-06-01', '2024-11-30'),
(7, 'Sistema de Facturación', 'Automatización del proceso de facturación de una empresa', '2024-07-01', '2024-10-31'),
(8, 'App de Fitness', 'Creación de una aplicación para seguimiento de actividades físicas', '2024-08-01', '2024-12-31'),
(9, 'Web de Portafolio', 'Desarrollo de un sitio web para mostrar el portafolio de un diseñador', '2024-09-01', '2024-12-01'),
(10, 'Plataforma de Educación', 'Creación de una plataforma online para cursos educativos', '2024-10-01', '2025-03-31'),
(11, 'Sistema de Pagos', 'Desarrollo de un sistema de pagos en línea', '2024-11-01', '2025-04-30'),
(12, 'Aplicación de Mensajería', 'Creación de una aplicación de mensajería instantánea', '2024-12-01', '2025-06-01'),
(13, 'Sistema de Recursos Humanos', 'Automatización de procesos de recursos humanos', '2024-01-15', '2024-07-15'),
(14, 'Marketplace', 'Desarrollo de un marketplace para productos locales', '2024-02-01', '2024-08-01'),
(15, 'Sistema de Seguimiento', 'Creación de un sistema de seguimiento de proyectos', '2024-03-01', '2024-09-01'),
(16, 'App de Viajes', 'Desarrollo de una aplicación para la planificación de viajes', '2024-04-01', '2024-10-01'),
(17, 'Sistema de Encuestas', 'Automatización del proceso de encuestas para empresas', '2024-05-01', '2024-09-30'),
(18, 'Aplicación de Delivery', 'Desarrollo de una aplicación para servicios de entrega a domicilio', '2024-06-01', '2024-12-01'),
(19, 'Blog Personal', 'Creación de un blog personal para un escritor', '2024-07-01', '2024-10-31'),
(20, 'Sistema de Reservas de Hoteles', 'Desarrollo de un sistema para la reserva de hoteles', '2024-08-01', '2025-01-31'),
(21, 'Plataforma de Streaming', 'Creación de una plataforma para streaming de videos', '2024-09-01', '2025-03-01'),
(22, 'Aplicación de Salud', 'Desarrollo de una aplicación para seguimiento de la salud', '2024-10-01', '2025-04-01'),
(23, 'Sistema de Inventarios', 'Automatización del control de inventarios en almacenes', '2024-11-01', '2025-05-01'),
(24, 'Web de Noticias', 'Desarrollo de un portal web de noticias deportivas', '2024-12-01', '2025-06-01'),
(25, 'Aplicación de Cocina', 'Creación de una aplicación para recetas de cocina', '2024-01-01', '2024-06-01'),
(26, 'Sistema de Gestión de Tareas', 'Desarrollo de un sistema para la gestión de tareas', '2024-02-01', '2024-08-01'),
(27, 'App de Meditación', 'Creación de una aplicación para la práctica de meditación', '2024-03-01', '2024-09-01'),
(28, 'Sistema de Monitoreo', 'Desarrollo de un sistema de monitoreo de servidores', '2024-04-01', '2024-10-01'),
(29, 'Web de E-learning', 'Creación de una plataforma de e-learning para cursos online', '2024-05-01', '2024-11-01'),
(30, 'Aplicación de Clima', 'Desarrollo de una aplicación para seguimiento del clima', '2024-06-01', '2024-12-01'),
(31, 'Plataforma de Eventos', 'Creación de una plataforma para la gestión de eventos', '2024-07-01', '2025-01-01'),
(32, 'Web de Fotografía', 'Desarrollo de un sitio web para mostrar fotografías profesionales', '2024-08-01', '2025-02-01'),
(33, 'Sistema de Publicidad', 'Automatización de la gestión de campañas publicitarias', '2024-09-01', '2025-03-01'),
(34, 'App de Compras', 'Desarrollo de una aplicación para realizar compras online', '2024-10-01', '2025-04-01'),
(35, 'Sistema de Logística', 'Automatización de procesos logísticos para empresas', '2024-11-01', '2025-05-01'),
(36, 'Aplicación de Finanzas', 'Desarrollo de una aplicación para gestión financiera personal', '2024-12-01', '2025-06-01'),
(37, 'Sistema de Reportes', 'Creación de un sistema para la generación de reportes empresariales', '2024-01-15', '2024-07-15'),
(38, 'App de Bienestar', 'Desarrollo de una aplicación para el bienestar personal', '2024-02-15', '2024-08-15'),
(39, 'Plataforma de Colaboración', 'Creación de una plataforma para la colaboración en línea', '2024-03-15', '2024-09-15'),
(40, 'Sistema de Seguimiento de Clientes', 'Automatización del seguimiento de clientes', '2024-04-15', '2024-10-15'),
(41, 'Web de Consultoría', 'Desarrollo de un sitio web para una empresa de consultoría', '2024-05-15', '2024-11-15'),
(42, 'Aplicación de Reuniones', 'Creación de una aplicación para la gestión de reuniones virtuales', '2024-06-15', '2024-12-15'),
(43, 'Sistema de Alertas', 'Desarrollo de un sistema para la gestión de alertas de seguridad', '2024-07-15', '2025-01-15'),
(44, 'App de Bienes Raíces', 'Creación de una aplicación para la compra y venta de propiedades', '2024-08-15', '2025-02-15'),
(45, 'Plataforma de Reclutamiento', 'Desarrollo de una plataforma para el reclutamiento de personal', '2024-09-15', '2025-03-15'),
(46, 'Sistema de Automatización', 'Automatización de procesos industriales en una planta', '2024-10-15', '2025-04-15'),
(47, 'Aplicación de Transporte', 'Desarrollo de una aplicación para la gestión de transporte público', '2024-11-15', '2025-05-15'),
(48, 'Web de Entrenamiento', 'Creación de un sitio web para programas de entrenamiento físico', '2024-12-15', '2025-06-15');

DROP TABLE IF EXISTS `tarea`;
CREATE TABLE IF NOT EXISTS `tarea` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_proyecto` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `tarea` (`id`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_fin`, `id_proyecto`) VALUES
(4, 'TAREA1', 'TAREA1', '2024-08-01', '2024-08-02', 1);

DROP TABLE IF EXISTS `tarea_empleado`;
CREATE TABLE IF NOT EXISTS `tarea_empleado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tarea` int DEFAULT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_tarea` (`id_tarea`,`id_empleado`),
  KEY `id_empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


ALTER TABLE `tarea`
  ADD CONSTRAINT `tarea_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id`);

ALTER TABLE `tarea_empleado`
  ADD CONSTRAINT `tarea_empleado_ibfk_1` FOREIGN KEY (`id_tarea`) REFERENCES `tarea` (`id`),
  ADD CONSTRAINT `tarea_empleado_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
