-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 31-Out-2025 às 11:48
-- Versão do servidor: 10.4.32-MariaDB
-- versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `2025_2p_futebolada`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `classificado_em`
--

CREATE TABLE `classificado_em` (
  `idclube` int(11) NOT NULL,
  `idtabela` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `lugares` int(11) NOT NULL DEFAULT 1,
  `pontos` int(11) NOT NULL DEFAULT 0,
  `vitorias` int(11) NOT NULL DEFAULT 0,
  `empates` int(11) NOT NULL DEFAULT 0,
  `derrotas` int(11) NOT NULL DEFAULT 0,
  `golosmarcados` int(11) NOT NULL DEFAULT 0,
  `golossofridos` int(11) NOT NULL DEFAULT 0,
  `saldogolo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `classificado_em`
--

INSERT INTO `classificado_em` (`idclube`, `idtabela`, `nome`, `lugares`, `pontos`, `vitorias`, `empates`, `derrotas`, `golosmarcados`, `golossofridos`, `saldogolo`) VALUES
(1, 1, 'SFC', 1, 0, 0, 0, 0, 0, 0, 0),
(2, 2, 'FLA', 2, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `clube`
--

CREATE TABLE `clube` (
  `idclube` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cor` varchar(50) NOT NULL,
  `hino` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `clube`
--

INSERT INTO `clube` (`idclube`, `nome`, `cor`, `hino`) VALUES
(1, 'Santos', '#000000', '        gsgbgs'),
(2, 'Flamengo', '#d21919', 'Uma vez flamengo\r\nnunca mais flamengo'),
(3, 'SP', '#ec1313', '        o menor de sp'),
(6, 'Palmeiras', '#07c00a', '        Vintao');

-- --------------------------------------------------------

--
-- Estrutura da tabela `inscritos`
--

CREATE TABLE `inscritos` (
  `idclube` int(11) NOT NULL,
  `numerojogador` int(11) NOT NULL,
  `anoinscricao` int(11) NOT NULL,
  `anosaida` int(11) DEFAULT NULL,
  `capitao` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `inscritos`
--

INSERT INTO `inscritos` (`idclube`, `numerojogador`, `anoinscricao`, `anosaida`, `capitao`) VALUES
(1, 10, 2025, NULL, 1),
(1, 11, 2025, NULL, 0),
(1, 12, 2025, NULL, 0),
(2, 13, 2025, NULL, 1),
(2, 14, 2025, NULL, 0),
(2, 15, 2025, NULL, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `joga`
--

CREATE TABLE `joga` (
  `id_joga` int(11) NOT NULL,
  `idjogo` int(11) NOT NULL,
  `idclube_casa` int(11) NOT NULL,
  `idclube_fora` int(11) NOT NULL,
  `casa_clube` varchar(100) NOT NULL,
  `fora_clube` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `joga`
--

INSERT INTO `joga` (`id_joga`, `idjogo`, `idclube_casa`, `idclube_fora`, `casa_clube`, `fora_clube`) VALUES
(1, 1, 1, 2, 'Leitão', '123 novo'),
(2, 2, 2, 1, '123 novo', 'Leitão');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogador`
--

CREATE TABLE `jogador` (
  `numero` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `golos` int(11) NOT NULL,
  `assistencias` int(11) NOT NULL,
  `cartoes_amarelos` int(11) NOT NULL,
  `cartoes_vermelhos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `jogador`
--

INSERT INTO `jogador` (`numero`, `nome`, `golos`, `assistencias`, `cartoes_amarelos`, `cartoes_vermelhos`) VALUES
(10, 'Rui Silva', 5, 2, 1, 0),
(11, 'João Pinto', 2, 4, 0, 0),
(12, 'Carlos Mendes', 0, 1, 2, 0),
(13, 'Miguel Rocha', 3, 0, 1, 1),
(14, 'André Tavares', 1, 3, 0, 0),
(15, 'Pedro Sousa', 4, 1, 1, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogo`
--

CREATE TABLE `jogo` (
  `idjogo` int(11) NOT NULL,
  `resultado` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `jogo`
--

INSERT INTO `jogo` (`idjogo`, `resultado`) VALUES
(1, '2-1'),
(2, '1-3');

-- --------------------------------------------------------

--
-- Estrutura da tabela `jogou_em`
--

CREATE TABLE `jogou_em` (
  `numerojogador` int(11) NOT NULL,
  `id_joga` int(11) NOT NULL,
  `marcadores` text NOT NULL,
  `amarelos` text NOT NULL,
  `vermelhos` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `jogou_em`
--

INSERT INTO `jogou_em` (`numerojogador`, `id_joga`, `marcadores`, `amarelos`, `vermelhos`) VALUES
(10, 1, '2', '', ''),
(11, 1, '', '', ''),
(12, 1, '', '1', ''),
(13, 1, '1', '', ''),
(10, 2, '', '', ''),
(11, 2, '', '', '1'),
(14, 2, '2', '', ''),
(15, 2, '1', '', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tabela`
--

CREATE TABLE `tabela` (
  `idtabela` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela `tabela`
--

INSERT INTO `tabela` (`idtabela`, `nome`) VALUES
(1, 'abc'),
(2, 't1'),
(3, 't2'),
(4, 't3'),
(5, 't4'),
(6, 't5'),
(7, 't6');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `classificado_em`
--
ALTER TABLE `classificado_em`
  ADD PRIMARY KEY (`idclube`,`idtabela`),
  ADD KEY `idtabela` (`idtabela`);

--
-- Índices para tabela `clube`
--
ALTER TABLE `clube`
  ADD PRIMARY KEY (`idclube`);

--
-- Índices para tabela `inscritos`
--
ALTER TABLE `inscritos`
  ADD KEY `idclube` (`idclube`,`numerojogador`),
  ADD KEY `numerojogador` (`numerojogador`);

--
-- Índices para tabela `joga`
--
ALTER TABLE `joga`
  ADD PRIMARY KEY (`id_joga`),
  ADD KEY `idjogo` (`idjogo`,`idclube_casa`,`idclube_fora`),
  ADD KEY `idclube_casa` (`idclube_casa`),
  ADD KEY `idclube_fora` (`idclube_fora`);

--
-- Índices para tabela `jogador`
--
ALTER TABLE `jogador`
  ADD PRIMARY KEY (`numero`);

--
-- Índices para tabela `jogo`
--
ALTER TABLE `jogo`
  ADD PRIMARY KEY (`idjogo`);

--
-- Índices para tabela `jogou_em`
--
ALTER TABLE `jogou_em`
  ADD PRIMARY KEY (`id_joga`,`numerojogador`),
  ADD KEY `numerojogador` (`numerojogador`);

--
-- Índices para tabela `tabela`
--
ALTER TABLE `tabela`
  ADD PRIMARY KEY (`idtabela`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clube`
--
ALTER TABLE `clube`
  MODIFY `idclube` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `joga`
--
ALTER TABLE `joga`
  MODIFY `id_joga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `jogo`
--
ALTER TABLE `jogo`
  MODIFY `idjogo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tabela`
--
ALTER TABLE `tabela`
  MODIFY `idtabela` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `classificado_em`
--
ALTER TABLE `classificado_em`
  ADD CONSTRAINT `classificado_em_ibfk_1` FOREIGN KEY (`idclube`) REFERENCES `clube` (`idclube`),
  ADD CONSTRAINT `classificado_em_ibfk_2` FOREIGN KEY (`idtabela`) REFERENCES `tabela` (`idtabela`);

--
-- Limitadores para a tabela `inscritos`
--
ALTER TABLE `inscritos`
  ADD CONSTRAINT `inscritos_ibfk_1` FOREIGN KEY (`idclube`) REFERENCES `clube` (`idclube`),
  ADD CONSTRAINT `inscritos_ibfk_2` FOREIGN KEY (`numerojogador`) REFERENCES `jogador` (`numero`);

--
-- Limitadores para a tabela `joga`
--
ALTER TABLE `joga`
  ADD CONSTRAINT `joga_ibfk_1` FOREIGN KEY (`idjogo`) REFERENCES `jogo` (`idjogo`),
  ADD CONSTRAINT `joga_ibfk_2` FOREIGN KEY (`idclube_casa`) REFERENCES `clube` (`idclube`),
  ADD CONSTRAINT `joga_ibfk_3` FOREIGN KEY (`idclube_fora`) REFERENCES `clube` (`idclube`),
  ADD CONSTRAINT `joga_ibfk_4` FOREIGN KEY (`id_joga`) REFERENCES `jogou_em` (`id_joga`);

--
-- Limitadores para a tabela `jogou_em`
--
ALTER TABLE `jogou_em`
  ADD CONSTRAINT `jogou_em_ibfk_1` FOREIGN KEY (`numerojogador`) REFERENCES `jogador` (`numero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
