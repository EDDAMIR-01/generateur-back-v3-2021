-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 28 mai 2020 à 15:39
-- Version du serveur :  10.4.11-MariaDB
-- Version de PHP : 7.4.3

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `generator`
--

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(19),
(19);

-- --------------------------------------------------------

--
-- Structure de la table `pojo_config`
--

CREATE TABLE `pojo_config` (
  `id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `project_template`
--

CREATE TABLE `project_template` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `technologie` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `project_template`
--

INSERT INTO `project_template` (`id`, `description`, `name`, `path`, `technologie`) VALUES
(2, 'default for spring', 'default', 'src\\main\\resources\\templates\\backend\\spring\\demo', 1),
(3, 'advenced project with security and cloud', 'advenced', 'C/', 1),
(9, 'default for angular', 'default', 'src\\main\\resources\\templates\\frontend\\angular\\default', 8),
(17, 'default project for  ejb', 'default', 'C/', 16),
(11, 'advenced angular project', 'advenced', 'C/', 8),
(18, 'advenced ejb project', 'advanced', 'C/', 16),
(20, 'default for jsf', 'default', 'src\\main\\resources\\templates\\frontend\\jsf\\default', 21);

-- --------------------------------------------------------

--
-- Structure de la table `technologie`
--

CREATE TABLE `technologie` (
  `id` bigint(20) NOT NULL,
  `category` int(11) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `default_template` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `technologie`
--

INSERT INTO `technologie` (`id`, `category`, `description`, `name`, `default_template`) VALUES
(1, 0, 'spring framework', 'spring', 2),
(8, 1, 'Angular framework', 'angular', 9),
(16, 0, 'ejb framework o l3ibat', 'ejb', 17),
(21, 1, 'jsf framework', 'jsf', 20);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `pojo_config`
--
ALTER TABLE `pojo_config`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `project_template`
--
ALTER TABLE `project_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK7bae57egevoglnw2ciiao2o6` (`technologie`);

--
-- Index pour la table `technologie`
--
ALTER TABLE `technologie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbn1th3m4du5injg9sr9l4uy8x` (`default_template`);
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
