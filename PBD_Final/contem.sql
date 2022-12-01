-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2022 às 21:18
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
-- Estrutura da tabela `contem`
--

CREATE TABLE `contem` (
  `Valor_Efetivo` float NOT NULL,
  `fk_Materiais_Id_Material` int(11) DEFAULT NULL,
  `fk_Materias_Utilizados_Id_Utilizados` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `contem`
--

INSERT INTO `contem` (`Valor_Efetivo`, `fk_Materiais_Id_Material`, `fk_Materias_Utilizados_Id_Utilizados`) VALUES
(2, 2, 171),
(2, 2, 172),
(1, 4, 172),
(2, 2, 174),
(1, 3, 175),
(2, 2, 176),
(1, 3, 177),
(6, 4, 178),
(10, 6, 179);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `contem`
--
ALTER TABLE `contem`
  ADD KEY `FK_Contem_1` (`fk_Materiais_Id_Material`),
  ADD KEY `FK_Contem_2` (`fk_Materias_Utilizados_Id_Utilizados`);

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `contem`
--
ALTER TABLE `contem`
  ADD CONSTRAINT `chav2` FOREIGN KEY (`fk_Materias_Utilizados_Id_Utilizados`) REFERENCES `materias_utilizados` (`Id_Utilizados`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `contem_ibfk_1` FOREIGN KEY (`fk_Materiais_Id_Material`) REFERENCES `materias` (`id_Material`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
