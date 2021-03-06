-- MySQL Script generated by MySQL Workbench
-- Mon Apr 18 13:14:20 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `Membership`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Membership` (
  `idMembership` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `B_Adress` VARCHAR(45) NULL,
  `S_Adress` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Payment_Satus` VARCHAR(45) NULL,
  PRIMARY KEY (`idMembership`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Inventory` (
  `idItem` INT NOT NULL,
  `current stock` VARCHAR(45) NULL,
  `price` VARCHAR(45) NULL,
  `manufacturer name` VARCHAR(45) NULL,
  `min stock` VARCHAR(45) NULL,
  PRIMARY KEY (`idItem`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Sales` (
  `idTransaction` INT NOT NULL,
  `Qty` VARCHAR(45) NULL,
  `Order_Date` VARCHAR(45) NULL,
  `Ship_Date` VARCHAR(45) NULL,
  `Membership_idMembership` INT NOT NULL,
  `Inventory_idItem` INT NOT NULL,
  PRIMARY KEY (`idTransaction`),
  INDEX `fk_Sales_Membership_idx` (`Membership_idMembership` ASC),
  INDEX `fk_Sales_Inventory1_idx` (`Inventory_idItem` ASC),
  CONSTRAINT `fk_Sales_Membership`
    FOREIGN KEY (`Membership_idMembership`)
    REFERENCES `Membership` (`idMembership`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Sales_Inventory1`
    FOREIGN KEY (`Inventory_idItem`)
    REFERENCES `Inventory` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Employee` (
  `idEmployee` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `Title` VARCHAR(45) NULL,
  `Salary` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Customer Complaint`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Customer Complaint` (
  `idCustomer Complaint` INT NOT NULL,
  `Date` VARCHAR(45) NULL,
  `time` VARCHAR(45) NULL,
  `problem` VARCHAR(45) NULL,
  `resolution` VARCHAR(45) NULL,
  `Membership_idMembership` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Inventory_idItem` INT NOT NULL,
  PRIMARY KEY (`idCustomer Complaint`),
  INDEX `fk_Customer Complaint_Membership1_idx` (`Membership_idMembership` ASC),
  INDEX `fk_Customer Complaint_Employee1_idx` (`Employee_idEmployee` ASC),
  INDEX `fk_Customer Complaint_Inventory1_idx` (`Inventory_idItem` ASC),
  CONSTRAINT `fk_Customer Complaint_Membership1`
    FOREIGN KEY (`Membership_idMembership`)
    REFERENCES `Membership` (`idMembership`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer Complaint_Employee1`
    FOREIGN KEY (`Employee_idEmployee`)
    REFERENCES `Employee` (`idEmployee`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Customer Complaint_Inventory1`
    FOREIGN KEY (`Inventory_idItem`)
    REFERENCES `Inventory` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Backorder`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Backorder` (
  `Inventory_idItem` INT NOT NULL,
  `Qty` VARCHAR(45) NULL,
  `Order_date` VARCHAR(45) NULL,
  `Ship_date` VARCHAR(45) NULL,
  PRIMARY KEY (`Inventory_idItem`),
  CONSTRAINT `fk_Backorder_Inventory1`
    FOREIGN KEY (`Inventory_idItem`)
    REFERENCES `Inventory` (`idItem`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
