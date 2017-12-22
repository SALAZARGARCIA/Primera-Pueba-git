-- MySQL Script generated by MySQL Workbench
-- Wed Oct 25 19:26:49 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb1` DEFAULT CHARACTER SET utf8 ;
USE `mydb1` ;

-- -----------------------------------------------------
-- Table `mydb1`.`TIPO_DOCUMENTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`TIPO_DOCUMENTO` (
  `COD_TDOC` VARCHAR(3) NOT NULL,
  `DESC_TDOC` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_TDOC`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`PERSONA` (
  `ID_PERSONA` INT NOT NULL,
  `TIPO_DOCUMENTO_COD_TDOC` VARCHAR(3) NOT NULL,
  `P_NOMBRE` VARCHAR(45) NOT NULL,
  `S_NOMRE` VARCHAR(45) NULL,
  `P_APELLIDO` VARCHAR(45) NOT NULL,
  `S_APELLIDO` VARCHAR(45) NULL,
  `DIRRECION_PERSONA` VARCHAR(45) NOT NULL,
  `TELEFONO_PERSONA` BIGINT(15) NULL,
  `CELL_PERSONA` BIGINT(15) NULL,
  PRIMARY KEY (`ID_PERSONA`, `TIPO_DOCUMENTO_COD_TDOC`),
  INDEX `fk_PERSONA_TIPO_DOCUMENTO_idx` (`TIPO_DOCUMENTO_COD_TDOC` ASC),
  CONSTRAINT `fk_PERSONA_TIPO_DOCUMENTO`
    FOREIGN KEY (`TIPO_DOCUMENTO_COD_TDOC`)
    REFERENCES `mydb1`.`TIPO_DOCUMENTO` (`COD_TDOC`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`ROL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`ROL` (
  `COD_ROL` INT NOT NULL,
  `DESC_ROL` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_ROL`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`FACTURA` (
  `N_FACTURA` INT NOT NULL,
  `FECHA_FAC` DATE NOT NULL,
  `SUBTOTAL` DOUBLE NOT NULL,
  `IVA` DECIMAL NOT NULL,
  `TOTAL_FACT` DOUBLE NOT NULL,
  `FACTURAcol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`N_FACTURA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`CATEGORIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`CATEGORIA` (
  `COD_CATEGORIA` VARCHAR(5) NOT NULL,
  `DES_PROD` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`COD_CATEGORIA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`PRODUCTO` (
  `COD_PROD` VARCHAR(10) NOT NULL,
  `CATEGORIA_COD_CATEGORIA` VARCHAR(5) NOT NULL,
  `DESC_PROD` VARCHAR(45) NOT NULL,
  `PRECIO_PROD` DOUBLE NOT NULL,
  PRIMARY KEY (`COD_PROD`),
  INDEX `fk_PRODUCTO_CATEGORIA1_idx` (`CATEGORIA_COD_CATEGORIA` ASC),
  CONSTRAINT `fk_PRODUCTO_CATEGORIA1`
    FOREIGN KEY (`CATEGORIA_COD_CATEGORIA`)
    REFERENCES `mydb1`.`CATEGORIA` (`COD_CATEGORIA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`ROL_has_PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`ROL_has_PERSONA` (
  `ROL_COD_ROL` INT NOT NULL,
  `PERSONA_TIPO_DOCUMENTO_COD_TDOC` VARCHAR(3) NOT NULL,
  `PERSONA_ID_PERSONA` INT NOT NULL,
  `ESTADO_RP` TINYINT NOT NULL,
  PRIMARY KEY (`ROL_COD_ROL`, `PERSONA_TIPO_DOCUMENTO_COD_TDOC`, `PERSONA_ID_PERSONA`),
  INDEX `fk_ROL_has_PERSONA_PERSONA1_idx` (`PERSONA_ID_PERSONA` ASC, `PERSONA_TIPO_DOCUMENTO_COD_TDOC` ASC),
  INDEX `fk_ROL_has_PERSONA_ROL1_idx` (`ROL_COD_ROL` ASC),
  CONSTRAINT `fk_ROL_has_PERSONA_ROL1`
    FOREIGN KEY (`ROL_COD_ROL`)
    REFERENCES `mydb1`.`ROL` (`COD_ROL`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_ROL_has_PERSONA_PERSONA1`
    FOREIGN KEY (`PERSONA_ID_PERSONA` , `PERSONA_TIPO_DOCUMENTO_COD_TDOC`)
    REFERENCES `mydb1`.`PERSONA` (`ID_PERSONA` , `TIPO_DOCUMENTO_COD_TDOC`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`PERSONA_has_FACTURA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`PERSONA_has_FACTURA` (
  `PERSONA_ID_PERSONA` INT NOT NULL,
  `PERSONA_TIPO_DOCUMENTO_COD_TDOC` VARCHAR(3) NOT NULL,
  `FACTURA_N_FACTURA` INT NOT NULL,
  PRIMARY KEY (`PERSONA_ID_PERSONA`, `PERSONA_TIPO_DOCUMENTO_COD_TDOC`, `FACTURA_N_FACTURA`),
  INDEX `fk_PERSONA_has_FACTURA_FACTURA1_idx` (`FACTURA_N_FACTURA` ASC),
  INDEX `fk_PERSONA_has_FACTURA_PERSONA1_idx` (`PERSONA_ID_PERSONA` ASC, `PERSONA_TIPO_DOCUMENTO_COD_TDOC` ASC),
  CONSTRAINT `fk_PERSONA_has_FACTURA_PERSONA1`
    FOREIGN KEY (`PERSONA_ID_PERSONA` , `PERSONA_TIPO_DOCUMENTO_COD_TDOC`)
    REFERENCES `mydb1`.`PERSONA` (`ID_PERSONA` , `TIPO_DOCUMENTO_COD_TDOC`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PERSONA_has_FACTURA_FACTURA1`
    FOREIGN KEY (`FACTURA_N_FACTURA`)
    REFERENCES `mydb1`.`FACTURA` (`N_FACTURA`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`PERSONA_has_PRODUCTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`PERSONA_has_PRODUCTO` (
  `PERSONA_ID_PERSONA` INT NOT NULL,
  `PERSONA_TIPO_DOCUMENTO_COD_TDOC` VARCHAR(3) NOT NULL,
  `PRODUCTO_COD_PROD` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`PERSONA_ID_PERSONA`, `PERSONA_TIPO_DOCUMENTO_COD_TDOC`, `PRODUCTO_COD_PROD`),
  INDEX `fk_PERSONA_has_PRODUCTO_PRODUCTO1_idx` (`PRODUCTO_COD_PROD` ASC),
  INDEX `fk_PERSONA_has_PRODUCTO_PERSONA1_idx` (`PERSONA_ID_PERSONA` ASC, `PERSONA_TIPO_DOCUMENTO_COD_TDOC` ASC),
  CONSTRAINT `fk_PERSONA_has_PRODUCTO_PERSONA1`
    FOREIGN KEY (`PERSONA_ID_PERSONA` , `PERSONA_TIPO_DOCUMENTO_COD_TDOC`)
    REFERENCES `mydb1`.`PERSONA` (`ID_PERSONA` , `TIPO_DOCUMENTO_COD_TDOC`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_PERSONA_has_PRODUCTO_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_COD_PROD`)
    REFERENCES `mydb1`.`PRODUCTO` (`COD_PROD`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb1`.`FACT_PROD`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb1`.`FACT_PROD` (
  `PRODUCTO_COD_PROD` VARCHAR(10) NOT NULL,
  `FACTURA_N_FACTURA` INT NOT NULL,
  PRIMARY KEY (`PRODUCTO_COD_PROD`, `FACTURA_N_FACTURA`),
  INDEX `fk_PRODUCTO_has_FACTURA_FACTURA1_idx` (`FACTURA_N_FACTURA` ASC),
  INDEX `fk_PRODUCTO_has_FACTURA_PRODUCTO1_idx` (`PRODUCTO_COD_PROD` ASC),
  CONSTRAINT `fk_PRODUCTO_has_FACTURA_PRODUCTO1`
    FOREIGN KEY (`PRODUCTO_COD_PROD`)
    REFERENCES `mydb1`.`PRODUCTO` (`COD_PROD`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PRODUCTO_has_FACTURA_FACTURA1`
    FOREIGN KEY (`FACTURA_N_FACTURA`)
    REFERENCES `mydb1`.`FACTURA` (`N_FACTURA`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
