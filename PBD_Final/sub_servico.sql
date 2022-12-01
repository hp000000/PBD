-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2022 às 21:17
-- Versão do servidor: 10.4.8-MariaDB
-- versão do PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `lab`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `sub_servico`
--

CREATE TABLE `sub_servico` (
  `Valor` float DEFAULT NULL,
  `Id_Sub_Servico` int(11) NOT NULL,
  `Horas` int(11) DEFAULT NULL,
  `fk_OS_Servico_Id_OS_Servico` int(11) DEFAULT NULL,
  `Descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `sub_servico`
--

INSERT INTO `sub_servico` (`Valor`, `Id_Sub_Servico`, `Horas`, `fk_OS_Servico_Id_OS_Servico`, `Descricao`) VALUES
(250, 13, 2, 8, 'teste'),
(100, 1979, 3, 8, 'teste1'),
(200, 1980, 4, 8, 'teste2'),
(100, 1981, 1, 16, 'Desmontagem'),
(100, 1982, 1, 16, 'Avaliação visual'),
(100, 1983, 6, 8, 'engenharia reversa');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `sub_servico`
--
ALTER TABLE `sub_servico`
  ADD PRIMARY KEY (`Id_Sub_Servico`),
  ADD KEY `chave 2` (`fk_OS_Servico_Id_OS_Servico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `sub_servico`
--
ALTER TABLE `sub_servico`
  MODIFY `Id_Sub_Servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1984;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `sub_servico`
--
ALTER TABLE `sub_servico`
  ADD CONSTRAINT `chave 2` FOREIGN KEY (`fk_OS_Servico_Id_OS_Servico`) REFERENCES `os_servico` (`Id_OS_Servico`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
