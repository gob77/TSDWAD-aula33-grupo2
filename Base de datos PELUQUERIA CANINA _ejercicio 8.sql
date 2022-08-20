DROP DATABASE IF EXISTS peluqueriaCanina;

# crea base de datos 'peluqeriaCanina
CREATE DATABASE `peluqueriaCanina` ;

#Nos posiciona en la base de datos peluqueriaCanina
USE peluqueriacanina;

#creacion de tablas

#Tabla dueno
CREATE TABLE `dueno` (
  `DNI` INT NOT NULL UNIQUE,
  `Nombre` VARCHAR(30)  NOT NULL,
  `Apellido` VARCHAR(30) NOT NULL,
  `Telefono` VARCHAR(13) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`DNI`)
) ;

#tabla perro
CREATE TABLE `perro` (
  `ID_Perro` INT NOT NULL AUTO_INCREMENT ,
  `Nombre` VARCHAR(30) NOT NULL,
  `Fecha_nac` DATE NOT NULL,
  `Sexo` VARCHAR(6) NOT NULL,
  `DNI_dueno` INT NOT NULL,
  PRIMARY KEY (`ID_Perro`),
  KEY `DNI_Dueno_idx` (`DNI_dueno`),
  CONSTRAINT `DNI_Dueno` FOREIGN KEY (`DNI_dueno`) REFERENCES `dueno` (`DNI`)
) ;

#tabla historial
CREATE TABLE `historial` (
  `ID_Historial` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE DEFAULT NULL,
  `PerroID` INT NOT NULL,
  `Descripcion` VARCHAR(45) DEFAULT NULL,
  `Monto` FLOAT NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  KEY `Perro_idx` (`PerroID`),
  CONSTRAINT `PerroID` FOREIGN KEY (`PerroID`) REFERENCES `perro` (`ID_Perro`)
) ;
#insert de datos

#insert tabla dueno
INSERT INTO dueno (DNI,Nombre,Apellido,Telefono,Direccion)
values
(33054374,"Rita","Farias","154345092","Bolivar 280"),
(26550376,"Luciano","Meinero","155091270","Colon 650");
########################################################

#insert tabla perro
INSERT INTO perro (Nombre,fecha_nac,Sexo,DNI_dueno)
values
("perla","2021-01-03","hembra",33054374),
("tayo","2020-04-05","macho",26550376);

#insert tabla historial
INSERT INTO historial(Fecha,PerroID,Descripcion,Monto)
values
("2022-08-12",1,"Baño",1500),
("2022-05-29",2,"Corte y Baño",2500);

##############################################

#Ejercicio 8 -insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 1
INSERT INTO historial(Fecha,PerroID,Descripcion,Monto)
values("2020-03-02",1,"Limpieza dental",3500);
select *From historial;

