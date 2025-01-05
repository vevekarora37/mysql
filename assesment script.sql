-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema try
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema try
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `try` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `try` ;

-- -----------------------------------------------------
-- Table `try`.`employee_audit`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `try`.`employee_audit` (
  `audit_id` INT NOT NULL AUTO_INCREMENT,
  `employee_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `position` VARCHAR(100) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `hire_date` DATE NULL DEFAULT NULL,
  `action_date` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `try`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `try`.`employees` (
  `employee_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `position` VARCHAR(100) NULL DEFAULT NULL,
  `salary` DECIMAL(10,2) NULL DEFAULT NULL,
  `hire_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

USE `try` ;

-- -----------------------------------------------------
-- procedure add_employee
-- -----------------------------------------------------

DELIMITER $$
USE `try`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_employee`(
    IN emp_name VARCHAR(100),
    IN emp_position VARCHAR(100),
    IN emp_salary DECIMAL(10, 2),
    IN emp_hire_date DATE
)
BEGIN
    INSERT INTO employees (name, position, salary, hire_date)
    VALUES (emp_name, emp_position, emp_salary, emp_hire_date);
END$$

DELIMITER ;
USE `try`;

DELIMITER $$
USE `try`$$
CREATE
DEFINER=`root`@`localhost`
TRIGGER `try`.`after_employee_insert`
AFTER INSERT ON `try`.`employees`
FOR EACH ROW
BEGIN
    INSERT INTO employee_audit (employee_id, name, position, salary, hire_date, action_date)
    VALUES (NEW.Employee_id, NEW.name, NEW.position, NEW.salary, NEW.hire_date, CURRENT_TIMESTAMP);
END$$


DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
