-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Dez-2022 às 21:15
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
-- Estrutura da tabela `os_servico`
--

CREATE TABLE `os_servico` (
  `Id_OS_Servico` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Descricao_OS` varchar(500) DEFAULT NULL,
  `fk_Servico_Id_Servico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `os_servico`
--

INSERT INTO `os_servico` (`Id_OS_Servico`, `Data`, `Descricao_OS`, `fk_Servico_Id_Servico`) VALUES
(8, '2022-11-21', 'Monitor Auteq MPA 2500 S/N: 2500004772 P/N: AKK12346. Obs: V. PoerschProblema no sinal GPS.', 32717),
(9, '2022-10-31', 'Motor de passo do levante hidráulico acompanhado do sensor de posição do braço hidráulico trator John deere.Revisão', 32716),
(10, '2022-11-28', 'Antena de monitor de plantio Auteq MPA2500.Fio rompido.', 32711),
(11, '2022-11-14', 'Antena Starfire 3000 John Deere S/N: PCGT3TA333774 P/N: PF81207.Cúpula amarela superior quebrada, carcaça verde inferior quebrada e suporte metálico da antena quebrado.', 32703),
(12, '2022-11-22', 'Válvula corte de seção Jacto 582254Revisão.', 32714),
(13, '2022-11-22', 'Eletroválvula de corte de sessão de pulverizador John Deere P/N: AN302514 S/N: 598251Revisão. Está sem o conector principal.', 32713),
(16, '2022-12-01', 'Controladora CCU RE156939 John Deere Motorola P/N: 7VCU8JD01 S/N: 012844/98167 Trator 1300O trator não engata as marchas e a controladora está com a medição da tensão alterada.', 32690),
(17, '2022-12-28', 'Válvula corte de seção Jacto 582254Revisão.', 32715),
(18, '2022-12-09', 'Manche multi funções pulverizador John Deere 4630 chassis: 1N04630XVB0018086Não funciona as teclas 1 e 2.', 32709),
(19, '2022-12-02', 'Módulo Controlador ECU John Deere RE532628 S/N: 529996Ruído no sinal de rotação do motor.', 32701);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `os_servico`
--
ALTER TABLE `os_servico`
  ADD PRIMARY KEY (`Id_OS_Servico`),
  ADD KEY `chave1` (`fk_Servico_Id_Servico`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `os_servico`
--
ALTER TABLE `os_servico`
  MODIFY `Id_OS_Servico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `os_servico`
--
ALTER TABLE `os_servico`
  ADD CONSTRAINT `chave1` FOREIGN KEY (`fk_Servico_Id_Servico`) REFERENCES `servico` (`Id_Servico`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
