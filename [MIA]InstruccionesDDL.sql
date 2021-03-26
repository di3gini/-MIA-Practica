-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema Practica_MIA
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Practica_MIA
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Practica_MIA` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `Practica_MIA` ;

-- -----------------------------------------------------
-- Table `Practica_MIA`.`Carga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`Carga` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`Carga` (
  `idCarga` INT NOT NULL AUTO_INCREMENT,
  `nombre_compania` VARCHAR(60) NULL DEFAULT NULL,
  `contacto_compania` VARCHAR(60) NULL DEFAULT NULL,
  `correo_compania` VARCHAR(60) NULL DEFAULT NULL,
  `telefono_compania` VARCHAR(60) NULL DEFAULT NULL,
  `tipo` VARCHAR(1) NULL DEFAULT NULL,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `correo` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` VARCHAR(60) NULL DEFAULT NULL,
  `fecha_registro` VARCHAR(60) NULL DEFAULT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  `ciudad` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` VARCHAR(60) NULL DEFAULT NULL,
  `region` VARCHAR(60) NULL DEFAULT NULL,
  `producto` VARCHAR(60) NULL DEFAULT NULL,
  `categoria_producto` VARCHAR(60) NULL DEFAULT NULL,
  `cantidad` INT NULL DEFAULT NULL,
  `precio_unitario` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`idCarga`))
ENGINE = InnoDB
AUTO_INCREMENT = 14299
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`categoria_producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`categoria_producto` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`categoria_producto` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB
AUTO_INCREMENT = 125
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`ciudad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`ciudad` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`ciudad` (
  `id_ciudad` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_ciudad`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`region`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`region` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`region` (
  `id_region` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  PRIMARY KEY (`id_region`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`cliente` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `correo` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_registro` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` INT NULL DEFAULT NULL,
  `region` INT NOT NULL,
  `ciudad` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_cliente_region1_idx` (`region` ASC) VISIBLE,
  INDEX `fk_cliente_ciudad1_idx` (`ciudad` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_region1`
    FOREIGN KEY (`region`)
    REFERENCES `Practica_MIA`.`region` (`id_region`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_ciudad1`
    FOREIGN KEY (`ciudad`)
    REFERENCES `Practica_MIA`.`ciudad` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`compania`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`compania` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`compania` (
  `id_compania` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `contacto` VARCHAR(60) NULL DEFAULT NULL,
  `correo` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` VARCHAR(30) NULL DEFAULT NULL,
  PRIMARY KEY (`id_compania`))
ENGINE = InnoDB
AUTO_INCREMENT = 255
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`proveedor` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`proveedor` (
  `id_proveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `correo` VARCHAR(60) NULL DEFAULT NULL,
  `telefono` VARCHAR(30) NULL DEFAULT NULL,
  `fecha_registro` DATE NULL DEFAULT NULL,
  `direccion` VARCHAR(60) NULL DEFAULT NULL,
  `codigo_postal` INT NULL DEFAULT NULL,
  `region` INT NOT NULL,
  `ciudad` INT NOT NULL,
  PRIMARY KEY (`id_proveedor`),
  INDEX `fk_proveedor_region1_idx` (`region` ASC) VISIBLE,
  INDEX `fk_proveedor_ciudad1_idx` (`ciudad` ASC) VISIBLE,
  CONSTRAINT `fk_proveedor_region1`
    FOREIGN KEY (`region`)
    REFERENCES `Practica_MIA`.`region` (`id_region`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_proveedor_ciudad1`
    FOREIGN KEY (`ciudad`)
    REFERENCES `Practica_MIA`.`ciudad` (`id_ciudad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`detalle_compania`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`detalle_compania` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`detalle_compania` (
  `ID_DetCompania` INT NOT NULL AUTO_INCREMENT,
  `proveedor` INT NOT NULL,
  `compania` INT NOT NULL,
  PRIMARY KEY (`ID_DetCompania`),
  INDEX `fk_detalle_compania_proveedor1_idx` (`proveedor` ASC) VISIBLE,
  INDEX `fk_detalle_compania_compania1_idx` (`compania` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_compania_compania1`
    FOREIGN KEY (`compania`)
    REFERENCES `Practica_MIA`.`compania` (`id_compania`),
  CONSTRAINT `fk_detalle_compania_proveedor1`
    FOREIGN KEY (`proveedor`)
    REFERENCES `Practica_MIA`.`proveedor` (`id_proveedor`))
ENGINE = InnoDB
AUTO_INCREMENT = 1024
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`orden` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`orden` (
  `id_orden` INT NOT NULL AUTO_INCREMENT,
  `proveedor` INT NOT NULL,
  PRIMARY KEY (`id_orden`),
  INDEX `fk_orden_proveedor1_idx` (`proveedor` ASC) VISIBLE,
  CONSTRAINT `fk_orden_proveedor1`
    FOREIGN KEY (`proveedor`)
    REFERENCES `Practica_MIA`.`proveedor` (`id_proveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`producto` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`producto` (
  `id_producto` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(60) NULL DEFAULT NULL,
  `precio` DECIMAL(10,2) NULL DEFAULT NULL,
  `categoria` INT NOT NULL,
  PRIMARY KEY (`id_producto`),
  INDEX `fk_producto_categoria_producto1_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk_producto_categoria_producto1`
    FOREIGN KEY (`categoria`)
    REFERENCES `Practica_MIA`.`categoria_producto` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 256
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`detalle_orden`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`detalle_orden` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`detalle_orden` (
  `id_detorden` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL DEFAULT NULL,
  `orden` INT NOT NULL,
  `producto` INT NOT NULL,
  `precio` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_detorden`),
  INDEX `fk_detalle_orden_orden1_idx` (`orden` ASC) VISIBLE,
  INDEX `fk_detalle_orden_producto1_idx` (`producto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_orden_orden1`
    FOREIGN KEY (`orden`)
    REFERENCES `Practica_MIA`.`orden` (`id_orden`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_orden_producto1`
    FOREIGN KEY (`producto`)
    REFERENCES `Practica_MIA`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`venta` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`venta` (
  `id_venta` INT NOT NULL AUTO_INCREMENT,
  `cliente` INT NOT NULL,
  PRIMARY KEY (`id_venta`),
  INDEX `fk_venta_cliente1_idx` (`cliente` ASC) VISIBLE,
  CONSTRAINT `fk_venta_cliente1`
    FOREIGN KEY (`cliente`)
    REFERENCES `Practica_MIA`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 128
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `Practica_MIA`.`detalle_venta`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Practica_MIA`.`detalle_venta` ;

CREATE TABLE IF NOT EXISTS `Practica_MIA`.`detalle_venta` (
  `id_detventa` INT NOT NULL AUTO_INCREMENT,
  `cantidad` INT NULL DEFAULT NULL,
  `venta` INT NOT NULL,
  `producto` INT NOT NULL,
  `precio` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id_detventa`),
  INDEX `fk_detalle_venta_venta1_idx` (`venta` ASC) VISIBLE,
  INDEX `fk_detalle_venta_producto1_idx` (`producto` ASC) VISIBLE,
  CONSTRAINT `fk_detalle_venta_venta1`
    FOREIGN KEY (`venta`)
    REFERENCES `Practica_MIA`.`venta` (`id_venta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_producto1`
    FOREIGN KEY (`producto`)
    REFERENCES `Practica_MIA`.`producto` (`id_producto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
