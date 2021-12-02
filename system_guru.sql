-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 02-Dez-2021 às 20:16
-- Versão do servidor: 10.4.21-MariaDB
-- versão do PHP: 8.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `system_guru`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id_emprestimos` int(11) NOT NULL,
  `id_usuarios` int(11) NOT NULL,
  `data_retirada` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuarios`
--

CREATE TABLE `grupo_usuarios` (
  `id_grupo_usuarios` int(11) NOT NULL,
  `nome_grupo` varchar(45) NOT NULL,
  `nivel` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo_usuarios_has_usuarios`
--

CREATE TABLE `grupo_usuarios_has_usuarios` (
  `grupo_usuarios_id_grupo_usuarios` int(11) NOT NULL,
  `usuarios_id_usuarios` int(11) NOT NULL,
  `id_grupo` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `id_produto` int(11) NOT NULL,
  `nome` varchar(225) NOT NULL,
  `descricao` varchar(225) NOT NULL,
  `quant_estoque` int(4) NOT NULL,
  `quant_minima` int(3) NOT NULL,
  `numero_caixa` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_emprestimo`
--

CREATE TABLE `produto_emprestimo` (
  `id_emprestimos` int(11) NOT NULL,
  `emprestimos_id_produto` varchar(45) NOT NULL,
  `produto_idproduto` int(11) NOT NULL,
  `quant` int(4) NOT NULL,
  `id` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuarios` int(11) NOT NULL,
  `nivel` int(45) NOT NULL,
  `nome` varchar(220) NOT NULL,
  `senha` varchar(55) NOT NULL,
  `email` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuarios`
--

INSERT INTO `usuarios` (`id_usuarios`, `nivel`, `nome`, `senha`, `email`) VALUES
(2, 2, 'Fel', '$2y$10$xKd04NcqCgO7qZu3/7BAwOlBtpAtre7W1U8B2cvOEDkprIKx', 'felps@123');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id_emprestimos`,`id_usuarios`),
  ADD KEY `fk_emprestimos_usuarios1` (`id_usuarios`);

--
-- Índices para tabela `grupo_usuarios`
--
ALTER TABLE `grupo_usuarios`
  ADD PRIMARY KEY (`id_grupo_usuarios`);

--
-- Índices para tabela `grupo_usuarios_has_usuarios`
--
ALTER TABLE `grupo_usuarios_has_usuarios`
  ADD KEY `fk_grupo_usuarios_has_usuarios_grupo_usuarios1` (`grupo_usuarios_id_grupo_usuarios`),
  ADD KEY `fk_grupo_usuarios_has_usuarios_usuarios1` (`usuarios_id_usuarios`);

--
-- Índices para tabela `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id_produto`);

--
-- Índices para tabela `produto_emprestimo`
--
ALTER TABLE `produto_emprestimo`
  ADD KEY `fk_emprestimos_has_produto_emprestimos1` (`id_emprestimos`),
  ADD KEY `fk_emprestimos_has_produto_produto1` (`produto_idproduto`);

--
-- Índices para tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuarios`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `grupo_usuarios`
--
ALTER TABLE `grupo_usuarios`
  MODIFY `id_grupo_usuarios` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk_emprestimos_usuarios1` FOREIGN KEY (`id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `grupo_usuarios_has_usuarios`
--
ALTER TABLE `grupo_usuarios_has_usuarios`
  ADD CONSTRAINT `fk_grupo_usuarios_has_usuarios_grupo_usuarios1` FOREIGN KEY (`grupo_usuarios_id_grupo_usuarios`) REFERENCES `grupo_usuarios` (`id_grupo_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_grupo_usuarios_has_usuarios_usuarios1` FOREIGN KEY (`usuarios_id_usuarios`) REFERENCES `usuarios` (`id_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `produto_emprestimo`
--
ALTER TABLE `produto_emprestimo`
  ADD CONSTRAINT `fk_emprestimos_has_produto_emprestimos1` FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimos` (`id_emprestimos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emprestimos_has_produto_produto1` FOREIGN KEY (`produto_idproduto`) REFERENCES `produto` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
