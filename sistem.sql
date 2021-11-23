-- MySQL Script generated by MySQL Workbench
-- Tue Nov 23 14:07:52 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

--SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
--SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
--SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema system_guru
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema system_guru
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `system_guru` DEFAULT CHARACTER SET utf8;
USE `system_guru`;

-- -----------------------------------------------------
-- Table `system_guru`.`grupo_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`grupo_usuarios` (
  `id_grupo_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nome_grupo` VARCHAR(45) NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_grupo_usuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `system_guru`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`emprestimos` (
  `id_emprestimos` INT NOT NULL,
  `quant.saida` INT(45) NOT NULL,
  `nome` VARCHAR(220) NOT NULL,
  `id_produto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_emprestimos`, `id_produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `system_guru`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`usuarios`(
  `id_usuarios` INT NOT NULL,
  `nivel` INT(45) NOT NULL,
  `nome` VARCHAR(220) NOT NULL,
  `senha` VARCHAR(55) NOT NULL,
  `nome_usuarios` VARCHAR(45) NOT NULL,
  `emprestimos_id_emprestimos` INT NOT NULL,
  `emprestimos_id_produto` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuarios`, `emprestimos_id_emprestimos`, `emprestimos_id_produto`),
  CONSTRAINT `fk_usuarios_emprestimos1`
    FOREIGN KEY (`emprestimos_id_emprestimos` , `emprestimos_id_produto`)
    REFERENCES `system_guru`.`emprestimos` (`id_emprestimos` , `id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `system_guru`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`produto` (
  `idproduto` INT NOT NULL,
  `nome` VARCHAR(225) NOT NULL,
  `descricao` VARCHAR(225) NOT NULL,
  `quant_estoque` INT NOT NULL,
  `quant_minim a` INT NOT NULL,
  PRIMARY KEY (`idproduto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `system_guru`.`grupo_usuarios_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`grupo_usuarios_has_usuarios`(
  `grupo_usuarios_id_grupo_usuarios` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  PRIMARY KEY (`grupo_usuarios_id_grupo_usuarios`, `usuarios_id_usuarios`),
  CONSTRAINT `fk_grupo_usuarios_has_usuarios_grupo_usuarios`
    FOREIGN KEY (`grupo_usuarios_id_grupo_usuarios`)
    REFERENCES `system_guru`.`grupo_usuarios` (`id_grupo_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_usuarios_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `system_guru`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `system_guru`.`emprestimos_has_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`emprestimos_has_produto` (
  `emprestimos_id_emprestimos` INT NOT NULL,
  `emprestimos_id_produto` VARCHAR(45) NOT NULL,
  `produto_idproduto` INT NOT NULL,
  PRIMARY KEY (`emprestimos_id_emprestimos`, `emprestimos_id_produto`, `produto_idproduto`),
  CONSTRAINT `fk_emprestimos_has_produto_emprestimos1`
    FOREIGN KEY (`emprestimos_id_emprestimos` , `emprestimos_id_produto`)
    REFERENCES `system_guru`.`emprestimos` (`id_emprestimos` , `id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimos_has_produto_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `system_guru`.`produto` (`idproduto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


--SET SQL_MODE=@OLD_SQL_MODE;
--SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
--SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
