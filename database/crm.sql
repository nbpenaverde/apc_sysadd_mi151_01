-- MySQL Script generated by MySQL Workbench
-- 07/27/17 10:08:45
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema crm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema crm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `crm` DEFAULT CHARACTER SET utf8 ;
USE `crm` ;

-- -----------------------------------------------------
-- Table `crm`.`marketeer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`marketeer` (
  `id` INT NOT NULL,
  `marketeer_fname` VARCHAR(45) NULL,
  `marketeer_mname` VARCHAR(45) NULL,
  `marketeer_lname` VARCHAR(45) NULL,
  `marketeer_birthdate` DATE NULL,
  `marketeer_contact_number` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`email` (
  `id` INT NOT NULL,
  `email_date` DATE NULL,
  `email_recipient` VARCHAR(45) NULL,
  `email_content` VARCHAR(1000) NULL,
  `email_template` VARCHAR(45) NULL,
  `marketeer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_email_marketeer1_idx` (`marketeer_id` ASC),
  CONSTRAINT `fk_email_marketeer1`
    FOREIGN KEY (`marketeer_id`)
    REFERENCES `crm`.`marketeer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`customer` (
  `id` INT NOT NULL,
  `customer_fname` VARCHAR(45) NULL,
  `customer_mname` VARCHAR(45) NULL,
  `customer_lname` VARCHAR(45) NULL,
  `customer_email` VARCHAR(45) NULL,
  `customer_contact_number` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`Existing`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`Existing` (
  `customer_ID` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`customer_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`prospect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`prospect` (
  `id` INT NOT NULL,
  `prospect_email` VARCHAR(45) NULL,
  `prospect_fname` VARCHAR(45) NULL,
  `prospect_mname` VARCHAR(45) NULL,
  `prospect_lname` VARCHAR(45) NULL,
  `prospect_contact_number` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`customer_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`customer_history` (
  `id` INT NOT NULL,
  `ch_checkin` DATETIME NULL,
  `ch_checkout` DATETIME NULL,
  `ch_numberdays` INT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_customer_history_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_history_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `crm`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`webvisit_history`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`webvisit_history` (
  `id` INT NOT NULL,
  `wvh_date` DATE NULL,
  `wvh_time` DATETIME NULL,
  `wvh_ip_address` INT NULL,
  `wvh_url` VARCHAR(100) NULL,
  `wvh_cookie_information` VARCHAR(45) NULL,
  `customer_id` INT NOT NULL,
  `Prospect_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_webvisit_history_customer1_idx` (`customer_id` ASC),
  INDEX `fk_webvisit_history_Prospect1_idx` (`Prospect_id` ASC),
  CONSTRAINT `fk_webvisit_history_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `crm`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_webvisit_history_Prospect1`
    FOREIGN KEY (`Prospect_id`)
    REFERENCES `crm`.`prospect` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`event` (
  `id` INT NOT NULL,
  `event_date_created` DATETIME NULL,
  `event_description` VARCHAR(400) NULL,
  `event_start_date` DATE NULL,
  `event_end_date` DATE NULL,
  `marketeer_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_event_marketeer1_idx` (`marketeer_id` ASC),
  CONSTRAINT `fk_event_marketeer1`
    FOREIGN KEY (`marketeer_id`)
    REFERENCES `crm`.`marketeer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`preference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`preference` (
  `id` INT NOT NULL,
  `preference_category` VARCHAR(45) NULL,
  `preference_description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`email_activity`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`email_activity` (
  `id` INT NOT NULL,
  `email_activity_status` VARCHAR(45) NULL,
  `email_activity_date` DATE NULL,
  `emai_activity_time` DATETIME NULL,
  `email_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_email_activity_email1_idx` (`email_id` ASC),
  CONSTRAINT `fk_email_activity_email1`
    FOREIGN KEY (`email_id`)
    REFERENCES `crm`.`email` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`email_customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`email_customer` (
  `email_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`email_id`, `customer_id`),
  INDEX `fk_email_has_customer_customer1_idx` (`customer_id` ASC),
  INDEX `fk_email_has_customer_email1_idx` (`email_id` ASC),
  CONSTRAINT `fk_email_has_customer_email1`
    FOREIGN KEY (`email_id`)
    REFERENCES `crm`.`email` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_email_has_customer_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `crm`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`prospect_preference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`prospect_preference` (
  `prospect_id` INT NOT NULL,
  `preference_id` INT NOT NULL,
  PRIMARY KEY (`prospect_id`, `preference_id`),
  INDEX `fk_Prospect_has_preference_preference1_idx` (`preference_id` ASC),
  INDEX `fk_Prospect_has_preference_Prospect1_idx` (`prospect_id` ASC),
  CONSTRAINT `fk_Prospect_has_preference_Prospect1`
    FOREIGN KEY (`prospect_id`)
    REFERENCES `crm`.`prospect` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prospect_has_preference_preference1`
    FOREIGN KEY (`preference_id`)
    REFERENCES `crm`.`preference` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`customer_preference`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`customer_preference` (
  `customer_id` INT NOT NULL,
  `preference_id` INT NOT NULL,
  PRIMARY KEY (`customer_id`, `preference_id`),
  INDEX `fk_customer_has_preference_preference1_idx` (`preference_id` ASC),
  INDEX `fk_customer_has_preference_customer1_idx` (`customer_id` ASC),
  CONSTRAINT `fk_customer_has_preference_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `crm`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customer_has_preference_preference1`
    FOREIGN KEY (`preference_id`)
    REFERENCES `crm`.`preference` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `crm`.`prospect_email`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crm`.`prospect_email` (
  `prospect_id` INT NOT NULL,
  `email_id` INT NOT NULL,
  PRIMARY KEY (`prospect_id`, `email_id`),
  INDEX `fk_Prospect_has_email_email1_idx` (`email_id` ASC),
  INDEX `fk_Prospect_has_email_Prospect1_idx` (`prospect_id` ASC),
  CONSTRAINT `fk_Prospect_has_email_Prospect1`
    FOREIGN KEY (`prospect_id`)
    REFERENCES `crm`.`prospect` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prospect_has_email_email1`
    FOREIGN KEY (`email_id`)
    REFERENCES `crm`.`email` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
