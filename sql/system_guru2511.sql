-- -----------------------------------------------------
-- Schema system_guru
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `system_guru`;
-- -----------------------------------------------------
-- Schema system_guru
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `system_guru` DEFAULT CHARACTER SET utf8;
USE `system_guru`;
-- -----------------------------------------------------
-- Table `system_guru`.`grupo_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`grupo_usuarios`(
  `id_grupo_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nome_grupo` VARCHAR(45) NOT NULL,
  `nivel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_grupo_usuarios`));
-- -----------------------------------------------------
-- Table `system_guru`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`usuarios`(
  `id_usuarios` INT NOT NULL AUTO_INCREMENT,
  `nivel` INT(45) NOT NULL,
  `nome` VARCHAR(220) NOT NULL,
  `senha` VARCHAR(55) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuarios`));
-- -----------------------------------------------------
-- Table `system_guru`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`emprestimos`(
  `id_emprestimos` INT NOT NULL,
  `id_usuarios` INT NOT NULL,
  `data_retirada` DATETIME NOT NULL,
  PRIMARY KEY (`id_emprestimos`, `id_usuarios`),
  CONSTRAINT `fk_emprestimos_usuarios1`
    FOREIGN KEY (`id_usuarios`)
    REFERENCES `system_guru`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `system_guru`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`produto`(
  `id_produto` INT NOT NULL,
  `nome` VARCHAR(225) NOT NULL,
  `descricao` VARCHAR(225) NOT NULL,
  `quant_estoque` INT(4) NOT NULL,
  `quant_minima` INT(3) NOT NULL,
  `numero_caixa` INT(3) NOT NULL,
  PRIMARY KEY (`id_produto`));
-- -----------------------------------------------------
-- Table `system_guru`.`produto_emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`produto_emprestimo`(
  `id_emprestimos` INT NOT NULL,
  `emprestimos_id_produto` VARCHAR(45) NOT NULL,
  `produto_idproduto` INT NOT NULL,
  `quant` INT(4) NOT NULL,
  `id` INT(8) NOT NULL,
  CONSTRAINT `fk_emprestimos_has_produto_emprestimos1`
    FOREIGN KEY (`id_emprestimos`)
    REFERENCES `system_guru`.`emprestimos` (`id_emprestimos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_emprestimos_has_produto_produto1`
    FOREIGN KEY (`produto_idproduto`)
    REFERENCES `system_guru`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
-- -----------------------------------------------------
-- Table `system_guru`.`grupo_usuarios_has_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `system_guru`.`grupo_usuarios_has_usuarios`(
  `grupo_usuarios_id_grupo_usuarios` INT NOT NULL,
  `usuarios_id_usuarios` INT NOT NULL,
  `id_grupo` VARCHAR(45) NOT NULL,
  CONSTRAINT `fk_grupo_usuarios_has_usuarios_grupo_usuarios1`
    FOREIGN KEY (`grupo_usuarios_id_grupo_usuarios`)
    REFERENCES `system_guru`.`grupo_usuarios` (`id_grupo_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_grupo_usuarios_has_usuarios_usuarios1`
    FOREIGN KEY (`usuarios_id_usuarios`)
    REFERENCES `system_guru`.`usuarios` (`id_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
