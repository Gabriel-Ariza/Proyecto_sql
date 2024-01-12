
DROP DATABASE IF EXISTS proyect;
CREATE DATABASE IF NOT EXISTS proyect;

USE proyect;

# ----------  Creando la tabla proyecto  ----------
DROP TABLE IF EXISTS carrera;
CREATE TABLE IF NOT EXISTS carrera (
    id_carrera SMALLINT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(id_carrera)
);


# ----------  Creando la tabla aprendiz  ----------
DROP TABLE IF EXISTS aprendiz;
CREATE TABLE IF NOT EXISTS aprendiz (
    id_aprendiz INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(35) NOT NULL,
    PRIMARY KEY(id_aprendiz)
);


# ----------  Creando la tabla especialidad  ----------
DROP TABLE IF EXISTS especialidad;
CREATE TABLE IF NOT EXISTS especialidad(
    id_especialidad SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(id_especialidad)
);


# ----------  Creando la tabla enfasis  ----------
DROP TABLE IF EXISTS enfasis;
CREATE TABLE IF NOT EXISTS enfasis (
    id_enfasis SMALLINT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(id_enfasis)
);


# ----------  Creando la tabla instructor ----------
DROP TABLE IF EXISTS instructor;
CREATE TABLE IF NOT EXISTS instructor(
    id_instructor MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(35) NOT NULL,
    id_especialidad SMALLINT UNSIGNED NOT NULL,
    PRIMARY KEY(id_instructor),
    FOREIGN KEY(id_especialidad) REFERENCES especialidad(id_especialidad) ON DELETE CASCADE ON UPDATE CASCADE
);


# ----------  Creando la tabla ruta  ----------
DROP TABLE IF EXISTS ruta;
CREATE TABLE IF NOT EXISTS ruta (
    id_ruta SMALLINT UNSIGNED AUTO_INCREMENT,
    id_carrera SMALLINT UNSIGNED,
    id_enfasis SMALLINT UNSIGNED,
    PRIMARY KEY(id_ruta),
    FOREIGN KEY(id_carrera) REFERENCES carrera(id_carrera) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_enfasis) REFERENCES enfasis(id_enfasis) ON DELETE CASCADE ON UPDATE CASCADE
);


# ----------  Creando la tabla curso  ----------
DROP TABLE IF EXISTS curso;
CREATE TABLE IF NOT EXISTS curso (
    id_curso SMALLINT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    id_instructor MEDIUMINT UNSIGNED,
    PRIMARY KEY(id_curso),
    FOREIGN KEY(id_instructor) REFERENCES instructor(id_instructor) ON DELETE CASCADE ON UPDATE CASCADE 
);


# ----------  Creando la tabla curso_ruta  ----------
DROP TABLE IF EXISTS curso_ruta;
CREATE TABLE IF NOT EXISTS curso_ruta (
    id_curso SMALLINT UNSIGNED,
    id_ruta SMALLINT UNSIGNED, 
    FOREIGN KEY(id_curso) REFERENCES curso(id_curso) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_ruta) REFERENCES ruta(id_ruta) ON DELETE CASCADE ON UPDATE CASCADE
);


# ----------  Creando la tabla matricula  ----------
DROP TABLE IF EXISTS matricula;
CREATE TABLE IF NOT EXISTS matricula (
    id_matricula INT AUTO_INCREMENT,
    id_ruta SMALLINT UNSIGNED,
    id_aprendiz INT UNSIGNED,
    PRIMARY KEY(id_matricula),
    FOREIGN KEY(id_ruta) REFERENCES ruta(id_ruta) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(id_aprendiz) REFERENCES aprendiz(id_aprendiz) ON DELETE CASCADE ON UPDATE CASCADE
);


#
#
#
#
#


/* --------------------  POBLANDO LA BASE DE DATOS  -------------------- */

use proyect;

# ----------  poblando la tabla carrera  ----------
INSERT INTO carrera(nombre) VALUES
('Desarrollo de Software'),
('Electrónica'),
('Mecánica Automotriz'),
('Seguridad y Salud Ocupacional'),
('Soldadura');


# ----------  poblando la tabla especialidad  ----------
INSERT into especialidad(nombre) VALUES
('Sistemas'),
('Salud Ocupacional'),
('Soldadura'),
('Mecánica'),
('Inglés'),
('Electrónica');


# ----------  poblando la tabla enfasis  ----------
INSERT INTO enfasis(nombre) VALUES
('Sistemas de Información Empresariales'),
('Videojuegos'),
('Machine Learning'),
('Microcontroladores'),
('Robótica'),
('Dispositivos Bio-médicos'),
('Motores Híbridos'),
('Vehículos de Uso Agrícola'),
('Sistemas de Gestión en Seguridad Ocupacional'),
('Soldadura Autógena Industrial'),
('Soldadura Eléctrica Industrial'),
('Soldadura Submarina');


# ----------  poblando la tabla instructor  ----------
INSERT INTO instructor(nombre,id_especialidad) VALUES
('Ricardo Vicente Jaimes',1),  
('Marinela Narvaez',2),         
('Agustín Parra Granados',3),
('Nelson Raúl Buitrago',4),
('Roy Hernando Llamas',5),
('Maria Jimena Monsalve',6),
('Juan Carlos Cobos',6),
('Pedro Nell Santamaría',1),
('Andrea González',1),
('Marisela Sevilla',2);


# ----------  poblando la tabla curso  ----------
INSERT INTO curso(nombre, id_instructor) VALUES
('Matemáticas Básicas',4), 
('Álgebra Computacional',1), 
('Programación Básica',3), 
('Inglés',5), 
('Electrónica Básica',7), 
('Motor de Cuatro Tiempos', NULL), 
('Enfermedades Laborales', NULL), 
('Higiene Postural en el Trabajo', NULL), 
('Ergonomía', NULL),
('Legislación Laboral en Colombia', NULL), 
('Materiales de Soldadura',3), 
('Métodos de Soldadura', NULL), 
('Fusión de Metales',3), 
('Buceo 1',3), 
('Buceo 2', NULL),
('Riesgo Eléctrico', NULL),
('Bases de Datos Relacionales',2),
('Bases de Datos NO Relacionales',2),
('Electrónica Digital',6),
('Microprocesadores',7)


# ----------  poblando la tabla ruta  ----------
INSERT INTO ruta(id_carrera,id_enfasis) VALUES
(1,1),
(1,2),
(1,3),
(2,4),
(2,5),
(NULL,6),
(NULL,7),
(NULL,8),
(NULL,9),
(5,10),
(5,11),
(NULL,12);

# ----------  poblando la tabla curso_ruta  ----------
/* ----- Se debe hacer el alter table add duracion antes de ejecutar ----- */
INSERT INTO curso_ruta(id_curso,id_ruta,duracion) VALUES
(17,1,22.5),
(2,1,17),
(3,1,12.1),
(18,1,60),
(1,1,12),
(2,1,6),
(3,1,11.4),
(4,1,123),
(1,2,12.1),
(2,2,11),
(3,2,24),
(4,2,134),
(1,2,32),
(2,2,3),
(3,3,56.1),
(4,3,23.59),
(17,3,13.93),
(5,4,43),
(19,4,19.1),
(20,4,24),
(5,4,17.6),
(19,4,85.44),
(20,4,1.99),
(5,5,38.1),
(19,5,14),
(5,5,8),
(19,5,11.4),
(20,5,23.2),
(11,11,74.7),
(13,11,80),
(11,10,23),
(14,10,11.1);


# ----------  poblando la tabla aprendiz  ----------
/* ----- Se debe hacer el alter table add edad antes de ejecutar ----- */
INSERT INTO aprendiz(nombre,edad) VALUES
('Carlos Saúl Gómez', 18),
('Leyla María Delgado Vargas',35),
('Juan José Cardona',27),
('Sergio Augusto Contreras Navas',47),
('Ana María Velázquez Parra', 19),
('Gustavo Noriega Alzate',22),
('Pedro Nell Gómez Díaz',26),
('Jairo Augusto Castro Camargo',27),
('Henry Soler Vega',22),
('Antonio Cañate Cortés',18),
('Daniel Simancas Junior',17);


# ----------  poblando la tabla matricula  ----------
/* ----- Se debe hacer el alter table add estado antes de ejecutar ----- */
INSERT INTO matricula (id_ruta,id_aprendiz, estado)
VALUES
(1,1,1), 
(1,1,1),
(1,1,1),
(1,1,1),
(1,2,1),  
(1,2,1), 
(1,2,1),
(1,2,1),   
(2,3,2),
(2,3,2),
(2,3,2),
(2,4,1),
(2,4,1),
(2,4,1),
(3,5,1),
(3,5,1),
(3,5,1),
(4,6,3),
(4,6,3),
(4,6,3),
(4,7,3),
(4,7,3),
(4,7,3),
(5,8,3),
(5,8,3),
(5,9,2),
(5,9,2),
(5,9,2),
(6,10,3),
(6,10,3),
(7,11,3),
(7,11,3);



/* EXTRA */
CREATE TRIGGER carrera_tiene_aprendices
BEFORE DELETE ON carrera
FOR EACH ROW
BEGIN
    DECLARE tiene_aprendices INT;
    SELECT COUNT(*) INTO tiene_aprendices FROM aprendiz WHERE id_carrera = OLD.id_carrera;
    IF tiene_aprendices > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No se puede eliminar una carrera que tiene aprendices asociados';
    END IF;
END;


CREATE TRIGGER aprendiz_tiene_matricula
BEFORE INSERT ON aprendiz
FOR EACH ROW
BEGIN
    DECLARE existe_nombre INT;
    SELECT COUNT(*) INTO existe_nombre FROM aprendiz WHERE nombre = NEW.nombre;
    IF existe_nombre > 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El nombre del aprendiz ya existe';
    END IF;
END;