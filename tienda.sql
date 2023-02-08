-- MySQL Script generated by MySQL Workbench
-- Tue Feb  7 22:35:38 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tienda` ;

-- -----------------------------------------------------
-- Schema Tienda
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tienda` DEFAULT CHARACTER SET utf8 ;
USE `Tienda` ;

-- -----------------------------------------------------
-- Table `Tienda`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`productos` (
  `idproductos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `fecha_creacion` VARCHAR(45) NULL,
  PRIMARY KEY (`idproductos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`clientes` (
  `idclientes` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`idclientes`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`categorias` (
  `idcategorias` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcategorias`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`ordenes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`ordenes` (
  `idordenes` INT NOT NULL AUTO_INCREMENT,
  `numero_orden` INT NOT NULL,
  `fecha_compra` VARCHAR(45) NOT NULL,
  `clientes_idclientes` INT NOT NULL,
  PRIMARY KEY (`idordenes`),
  INDEX `fk_ordenes_clientes1_idx` (`clientes_idclientes` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_clientes1`
    FOREIGN KEY (`clientes_idclientes`)
    REFERENCES `Tienda`.`clientes` (`idclientes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`categorias_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`categorias_has_productos` (
  `categorias_idcategorias` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`categorias_idcategorias`, `productos_idproductos`),
  INDEX `fk_categorias_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_categorias_has_productos_categorias1_idx` (`categorias_idcategorias` ASC) VISIBLE,
  CONSTRAINT `fk_categorias_has_productos_categorias1`
    FOREIGN KEY (`categorias_idcategorias`)
    REFERENCES `Tienda`.`categorias` (`idcategorias`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_categorias_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `Tienda`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tienda`.`ordenes_has_productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tienda`.`ordenes_has_productos` (
  `ordenes_idordenes` INT NOT NULL,
  `productos_idproductos` INT NOT NULL,
  PRIMARY KEY (`ordenes_idordenes`, `productos_idproductos`),
  INDEX `fk_ordenes_has_productos_productos1_idx` (`productos_idproductos` ASC) VISIBLE,
  INDEX `fk_ordenes_has_productos_ordenes1_idx` (`ordenes_idordenes` ASC) VISIBLE,
  CONSTRAINT `fk_ordenes_has_productos_ordenes1`
    FOREIGN KEY (`ordenes_idordenes`)
    REFERENCES `Tienda`.`ordenes` (`idordenes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ordenes_has_productos_productos1`
    FOREIGN KEY (`productos_idproductos`)
    REFERENCES `Tienda`.`productos` (`idproductos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
