-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema LittleLemonDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `LittleLemonDB` DEFAULT CHARACTER SET utf8 ;
USE `LittleLemonDB` ;

-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Customers` (
  `id` INT NOT NULL,
  `fullName` VARCHAR(255) NULL,
  `contactNumber` VARCHAR(12) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Bookings` (
  `id` INT NOT NULL,
  `date` DATE NULL,
  `tableNumber` INT NULL,
  `clientId` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `client_idx` (`clientId` ASC) VISIBLE,
  CONSTRAINT `client`
    FOREIGN KEY (`clientId`)
    REFERENCES `LittleLemonDB`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Deliveries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Deliveries` (
  `id` INT NOT NULL,
  `date` DATE NULL,
  `status` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus` (
  `id` INT NOT NULL,
  `menuName` VARCHAR(255) NULL,
  `cuisine` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`StaffMembers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`StaffMembers` (
  `id` INT NOT NULL,
  `fullName` VARCHAR(255) NULL,
  `Phone` VARCHAR(45) NULL,
  `email` VARCHAR(255) NULL,
  `role` VARCHAR(45) NULL,
  `salary` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Orders` (
  `id` INT NOT NULL,
  `customerId` INT NULL,
  `totalCost` DECIMAL NULL,
  `deliveryId` INT NULL,
  `menuId` INT NULL,
  `quantity` INT NULL,
  `staffMemberId` INT NULL,
  `Orderscol` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `customer_idx` (`customerId` ASC) VISIBLE,
  UNIQUE INDEX `deliveryId_UNIQUE` (`deliveryId` ASC) VISIBLE,
  INDEX `menu_idx` (`menuId` ASC) VISIBLE,
  INDEX `staffMember_idx` (`staffMemberId` ASC) VISIBLE,
  CONSTRAINT `customer`
    FOREIGN KEY (`customerId`)
    REFERENCES `LittleLemonDB`.`Customers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `deivery`
    FOREIGN KEY (`deliveryId`)
    REFERENCES `LittleLemonDB`.`Deliveries` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `menu`
    FOREIGN KEY (`menuId`)
    REFERENCES `LittleLemonDB`.`Menus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffMember`
    FOREIGN KEY (`staffMemberId`)
    REFERENCES `LittleLemonDB`.`StaffMembers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`MenuItems` (
  `id` INT NOT NULL,
  `courseName` VARCHAR(255) NULL,
  `starterName` VARCHAR(255) NULL,
  `desertName` VARCHAR(255) NULL,
  `drinkName` VARCHAR(255) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `LittleLemonDB`.`Menus_has_MenuItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `LittleLemonDB`.`Menus_has_MenuItems` (
  `Menus_id` INT NOT NULL,
  `MenuItems_id` INT NOT NULL,
  PRIMARY KEY (`Menus_id`, `MenuItems_id`),
  INDEX `fk_Menus_has_MenuItems_MenuItems1_idx` (`MenuItems_id` ASC) VISIBLE,
  INDEX `fk_Menus_has_MenuItems_Menus1_idx` (`Menus_id` ASC) VISIBLE,
  CONSTRAINT `fk_Menus_has_MenuItems_Menus1`
    FOREIGN KEY (`Menus_id`)
    REFERENCES `LittleLemonDB`.`Menus` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Menus_has_MenuItems_MenuItems1`
    FOREIGN KEY (`MenuItems_id`)
    REFERENCES `LittleLemonDB`.`MenuItems` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
