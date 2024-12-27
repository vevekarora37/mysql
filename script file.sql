-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema assignments
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema assignments
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `assignments` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `assignments` ;

-- -----------------------------------------------------
-- Table `assignments`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignments`.`company` (
  `companyid` INT NOT NULL,
  `companyname` VARCHAR(45) NULL DEFAULT NULL,
  `street` VARCHAR(45) NULL DEFAULT NULL,
  `city` VARCHAR(45) NULL DEFAULT NULL,
  `state` VARCHAR(2) NULL DEFAULT NULL,
  `zip` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`companyid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignments`.`contact`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignments`.`contact` (
  `Contact_id` INT NOT NULL,
  `Company_id` INT NULL DEFAULT NULL,
  `Firstname` VARCHAR(45) NULL DEFAULT NULL,
  `Lastname` VARCHAR(45) NULL DEFAULT NULL,
  `Street` VARCHAR(45) NULL DEFAULT NULL,
  `City` VARCHAR(45) NULL DEFAULT NULL,
  `State` VARCHAR(2) NULL DEFAULT NULL,
  `Zip` VARCHAR(10) NULL DEFAULT NULL,
  `ismain` TINYINT(1) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`Contact_id`),
  INDEX `Company_id` (`Company_id` ASC) VISIBLE,
  CONSTRAINT `contact_ibfk_1`
    FOREIGN KEY (`Company_id`)
    REFERENCES `assignments`.`company` (`companyid`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignments`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignments`.`employee` (
  `Employee_id` INT NOT NULL,
  `Firstname` VARCHAR(45) NULL DEFAULT NULL,
  `Lastname` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `Hiredate` DATE NULL DEFAULT NULL,
  `Jobtitle` VARCHAR(25) NULL DEFAULT NULL,
  `Email` VARCHAR(45) NULL DEFAULT NULL,
  `Phone` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`Employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `assignments`.`contactemployee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `assignments`.`contactemployee` (
  `ContactemployeeID_id` INT NOT NULL,
  `Contactid` INT NULL DEFAULT NULL,
  `Employeeid` INT NULL DEFAULT NULL,
  `Contactdate` DATE NULL DEFAULT NULL,
  `Description` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`ContactemployeeID_id`),
  INDEX `Contactid` (`Contactid` ASC) VISIBLE,
  INDEX `Employeeid` (`Employeeid` ASC) VISIBLE,
  CONSTRAINT `contactemployee_ibfk_1`
    FOREIGN KEY (`Contactid`)
    REFERENCES `assignments`.`contact` (`Contact_id`),
  CONSTRAINT `contactemployee_ibfk_2`
    FOREIGN KEY (`Employeeid`)
    REFERENCES `assignments`.`employee` (`Employee_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
