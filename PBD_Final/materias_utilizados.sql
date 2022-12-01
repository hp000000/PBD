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
-- Estrutura da tabela `materias_utilizados`
--

CREATE TABLE `materias_utilizados` (
  `Quantidade` int(11) DEFAULT NULL,
  `Id_Utilizados` int(11) NOT NULL,
  `fk_OS_Servico_Id_OS_Servico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `materias_utilizados`
--

INSERT INTO `materias_utilizados` (`Quantidade`, `Id_Utilizados`, `fk_OS_Servico_Id_OS_Servico`) VALUES
(2, 171, 18),
(2, 172, 18),
(2, 173, 18),
(10, 174, 8),
(11, 175, 8),
(5, 176, 8),
(6, 177, 8),
(7, 178, 8),
(8, 179, 8);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `materias_utilizados`
--
ALTER TABLE `materias_utilizados`
  ADD PRIMARY KEY (`Id_Utilizados`),
  ADD KEY `fk_OS_Servico_Id_OS_Servico` (`fk_OS_Servico_Id_OS_Servico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `materias_utilizados`
--
ALTER TABLE `materias_utilizados`
  MODIFY `Id_Utilizados` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `materias_utilizados`
--
ALTER TABLE `materias_utilizados`
  ADD CONSTRAINT `materias_utilizados_ibfk_1` FOREIGN KEY (`fk_OS_Servico_Id_OS_Servico`) REFERENCES `os_servico` (`Id_OS_Servico`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
