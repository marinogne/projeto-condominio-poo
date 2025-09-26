-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 26/09/2025 às 02:59
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projeto_condominio`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acesso`
--

CREATE TABLE `acesso` (
  `Cod Acesso` int(11) NOT NULL,
  `Cadastro` int(11) NOT NULL,
  `Data Entrada` int(11) NOT NULL,
  `Data Saida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `administradora`
--

CREATE TABLE `administradora` (
  `Nome Fantasia` varchar(50) NOT NULL,
  `id` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `apartamento`
--

CREATE TABLE `apartamento` (
  `Bloco Numero ap` int(4) NOT NULL,
  `IdEncomenda` int(50) DEFAULT NULL,
  `IdApartamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `condominio`
--

CREATE TABLE `condominio` (
  `Endereco` varchar(50) NOT NULL,
  `Nome Fantasia` varchar(50) NOT NULL,
  `IdCondominio` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `condominio`
--

INSERT INTO `condominio` (`Endereco`, `Nome Fantasia`, `IdCondominio`) VALUES
('', '', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `encomendas`
--

CREATE TABLE `encomendas` (
  `IdEncomenda` int(50) NOT NULL,
  `Data Entrada` int(50) NOT NULL,
  `Data Retirada` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `morador`
--

CREATE TABLE `morador` (
  `IdMorador` int(50) NOT NULL,
  `Nome` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `pessoa`
--

CREATE TABLE `pessoa` (
  `Nome` varchar(50) NOT NULL,
  `CPF` int(13) NOT NULL,
  `Data Nasc` int(8) NOT NULL,
  `Endereço` varchar(255) NOT NULL,
  `IdMorador` int(50) DEFAULT NULL,
  `idVisitante` int(11) DEFAULT NULL,
  `IdPrestador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `porteiro`
--

CREATE TABLE `porteiro` (
  `Nome` varchar(50) NOT NULL,
  `IdCondominio` int(11) DEFAULT NULL,
  `IdPorteiro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `prestadordeservico`
--

CREATE TABLE `prestadordeservico` (
  `IdPrestador` int(50) NOT NULL,
  `Funcao` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `visitante`
--

CREATE TABLE `visitante` (
  `IdVisitante` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acesso`
--
ALTER TABLE `acesso`
  ADD PRIMARY KEY (`Cod Acesso`),
  ADD UNIQUE KEY `Cadastro` (`Cadastro`),
  ADD UNIQUE KEY `Data Entrada` (`Data Entrada`),
  ADD UNIQUE KEY `Data Saida` (`Data Saida`);

--
-- Índices de tabela `apartamento`
--
ALTER TABLE `apartamento`
  ADD PRIMARY KEY (`IdApartamento`),
  ADD KEY `apartamento_ibfk_1` (`IdEncomenda`);

--
-- Índices de tabela `condominio`
--
ALTER TABLE `condominio`
  ADD PRIMARY KEY (`IdCondominio`);

--
-- Índices de tabela `encomendas`
--
ALTER TABLE `encomendas`
  ADD PRIMARY KEY (`IdEncomenda`);

--
-- Índices de tabela `morador`
--
ALTER TABLE `morador`
  ADD PRIMARY KEY (`IdMorador`);

--
-- Índices de tabela `pessoa`
--
ALTER TABLE `pessoa`
  ADD PRIMARY KEY (`CPF`),
  ADD KEY `pessoa_ibfk_1` (`IdMorador`),
  ADD KEY `pessoa_ibfk_2` (`IdPrestador`),
  ADD KEY `pessoa_ibfk_3` (`idVisitante`);

--
-- Índices de tabela `porteiro`
--
ALTER TABLE `porteiro`
  ADD PRIMARY KEY (`IdPorteiro`),
  ADD KEY `porteiro_ibfk_1` (`IdCondominio`);

--
-- Índices de tabela `prestadordeservico`
--
ALTER TABLE `prestadordeservico`
  ADD PRIMARY KEY (`IdPrestador`);

--
-- Índices de tabela `visitante`
--
ALTER TABLE `visitante`
  ADD PRIMARY KEY (`IdVisitante`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apartamento`
--
ALTER TABLE `apartamento`
  ADD CONSTRAINT `apartamento_ibfk_1` FOREIGN KEY (`IdEncomenda`) REFERENCES `encomendas` (`IdEncomenda`);

--
-- Restrições para tabelas `pessoa`
--
ALTER TABLE `pessoa`
  ADD CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`IdMorador`) REFERENCES `morador` (`IdMorador`),
  ADD CONSTRAINT `pessoa_ibfk_2` FOREIGN KEY (`IdPrestador`) REFERENCES `prestadordeservico` (`Idprestador`),
  ADD CONSTRAINT `pessoa_ibfk_3` FOREIGN KEY (`idVisitante`) REFERENCES `visitante` (`IdVisitante`);

--
-- Restrições para tabelas `porteiro`
--
ALTER TABLE `porteiro`
  ADD CONSTRAINT `porteiro_ibfk_1` FOREIGN KEY (`IdCondominio`) REFERENCES `condominio` (`IdCondominio`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
