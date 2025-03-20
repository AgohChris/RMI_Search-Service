-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : jeu. 20 mars 2025 à 05:18
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `AuthService`
--

-- --------------------------------------------------------

--
-- Structure de la table `file_metadata`
--

CREATE TABLE `file_metadata` (
  `id` bigint(20) NOT NULL,
  `file_path` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) DEFAULT NULL,
  `upload_times_tamp` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `file_metadata`
--

INSERT INTO `file_metadata` (`id`, `file_path`, `file_size`, `upload_times_tamp`, `username`) VALUES
(1, './storage/chris/etape_hebergement_django_pythonAnywhere.pdf', 434581, '2025-03-20 02:49:37.000000', 'chris'),
(2, './storage/agoh/etape_hebergement_django_pythonAnywhere.pdf', 434581, '2025-03-20 02:50:50.000000', 'agoh');

-- --------------------------------------------------------

--
-- Structure de la table `TASK_EXECUTION`
--

CREATE TABLE `TASK_EXECUTION` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `START_TIME` datetime(6) DEFAULT NULL,
  `END_TIME` datetime(6) DEFAULT NULL,
  `TASK_NAME` varchar(100) DEFAULT NULL,
  `EXIT_CODE` int(11) DEFAULT NULL,
  `EXIT_MESSAGE` varchar(2500) DEFAULT NULL,
  `ERROR_MESSAGE` varchar(2500) DEFAULT NULL,
  `LAST_UPDATED` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `EXTERNAL_EXECUTION_ID` varchar(255) DEFAULT NULL,
  `PARENT_EXECUTION_ID` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `TASK_EXECUTION_PARAMS`
--

CREATE TABLE `TASK_EXECUTION_PARAMS` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `TASK_PARAM` varchar(2500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `TASK_LOCK`
--

CREATE TABLE `TASK_LOCK` (
  `LOCK_KEY` char(36) NOT NULL,
  `REGION` varchar(100) NOT NULL,
  `CLIENT_ID` char(36) DEFAULT NULL,
  `CREATED_DATE` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `TASK_SEQ`
--

CREATE TABLE `TASK_SEQ` (
  `ID` bigint(20) NOT NULL,
  `UNIQUE_KEY` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `TASK_SEQ`
--

INSERT INTO `TASK_SEQ` (`ID`, `UNIQUE_KEY`) VALUES
(0, '0');

-- --------------------------------------------------------

--
-- Structure de la table `TASK_TASK_BATCH`
--

CREATE TABLE `TASK_TASK_BATCH` (
  `TASK_EXECUTION_ID` bigint(20) NOT NULL,
  `JOB_EXECUTION_ID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `password`, `role`, `username`) VALUES
(1, '$2a$10$4Nin6jYGFtdCPi0/EBMrlOhmWa2zb86iu9YT4Jw8xtNhFVm/GS73G', 'ROLE_USER', 'chris'),
(2, '$2a$10$Tc/Hr2OKa9TUtMz65TnRXOzZRdHjPxJKpkJTxkrADlb63HfQrhKJ.', 'ROLE_USER', 'agoh');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `file_metadata`
--
ALTER TABLE `file_metadata`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `TASK_EXECUTION`
--
ALTER TABLE `TASK_EXECUTION`
  ADD PRIMARY KEY (`TASK_EXECUTION_ID`);

--
-- Index pour la table `TASK_EXECUTION_PARAMS`
--
ALTER TABLE `TASK_EXECUTION_PARAMS`
  ADD KEY `TASK_EXEC_PARAMS_FK` (`TASK_EXECUTION_ID`);

--
-- Index pour la table `TASK_LOCK`
--
ALTER TABLE `TASK_LOCK`
  ADD PRIMARY KEY (`LOCK_KEY`,`REGION`);

--
-- Index pour la table `TASK_SEQ`
--
ALTER TABLE `TASK_SEQ`
  ADD UNIQUE KEY `UNIQUE_KEY_UN` (`UNIQUE_KEY`);

--
-- Index pour la table `TASK_TASK_BATCH`
--
ALTER TABLE `TASK_TASK_BATCH`
  ADD KEY `TASK_EXEC_BATCH_FK` (`TASK_EXECUTION_ID`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `file_metadata`
--
ALTER TABLE `file_metadata`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `TASK_EXECUTION_PARAMS`
--
ALTER TABLE `TASK_EXECUTION_PARAMS`
  ADD CONSTRAINT `TASK_EXEC_PARAMS_FK` FOREIGN KEY (`TASK_EXECUTION_ID`) REFERENCES `TASK_EXECUTION` (`TASK_EXECUTION_ID`);

--
-- Contraintes pour la table `TASK_TASK_BATCH`
--
ALTER TABLE `TASK_TASK_BATCH`
  ADD CONSTRAINT `TASK_EXEC_BATCH_FK` FOREIGN KEY (`TASK_EXECUTION_ID`) REFERENCES `TASK_EXECUTION` (`TASK_EXECUTION_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
