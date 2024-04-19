-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 14 déc. 2023 à 10:33
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `streamingmf`
--

-- --------------------------------------------------------

--
-- Structure de la table `acteurs`
--

CREATE TABLE `acteurs` (
  `acteur_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `acteurs`
--

INSERT INTO `acteurs` (`acteur_id`, `nom`, `prenom`, `role`, `date_naissance`, `date_creation`, `date_modification`) VALUES
(1, 'DiCaprio', 'Leonardo', 'Acteur principal', '1974-11-11', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),
(2, 'Jackson', 'Samuel L.', 'Acteur principal', '1948-12-21', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),
(3, 'Neill', 'Sam', 'Acteur principal', '1947-09-14', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),
(4, 'Brando', 'Marlon', 'Acteur principal', '1924-04-03', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),
(5, 'De Niro', 'Robert', 'Acteur principal', '1943-08-17', '2023-12-14 09:26:45', '2023-12-14 09:26:45'),
(6, 'Pattinson', 'Robert', 'Acteur principal', '1986-05-13', '2023-12-14 10:12:08', '2023-12-14 10:12:08'),
(7, 'Elgort', 'Ansel', 'Acteur secondaire', '1995-01-01', '2023-12-14 10:16:08', '2023-12-14 10:16:08');

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE `favoris` (
  `utilisateur_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `liste_films_preferes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `favoris`
--

INSERT INTO `favoris` (`utilisateur_id`, `film_id`, `liste_films_preferes`) VALUES
(1, 21, 'Inception'),
(2, 22, 'Pulp fiction'),
(3, 23, 'Jurassic Park'),
(4, 24, 'The Godfather'),
(5, 25, 'Goodfellas');

-- --------------------------------------------------------

--
-- Structure de la table `films`
--

CREATE TABLE `films` (
  `film_id` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `realisateur_id` int(11) DEFAULT NULL,
  `duree` int(11) DEFAULT NULL,
  `annee_sortie` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `films`
--

INSERT INTO `films` (`film_id`, `titre`, `realisateur_id`, `duree`, `annee_sortie`, `date_creation`, `date_modification`) VALUES
(21, 'Inception', NULL, 148, 2010, '2023-12-14 09:21:35', '2023-12-14 09:21:35'),
(22, 'Pulp Fiction', NULL, 154, 1994, '2023-12-14 09:21:35', '2023-12-14 09:21:35'),
(23, 'Jurassic Park', NULL, 127, 1993, '2023-12-14 09:21:35', '2023-12-14 09:21:35'),
(24, 'The Godfather', NULL, 175, 1972, '2023-12-14 09:21:35', '2023-12-14 09:21:35'),
(25, 'Goodfellas', NULL, 146, 1990, '2023-12-14 09:21:35', '2023-12-14 09:21:35');

-- --------------------------------------------------------

--
-- Structure de la table `filmsacteurs`
--

CREATE TABLE `filmsacteurs` (
  `film_id` int(11) NOT NULL,
  `acteur_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `filmsacteurs`
--

INSERT INTO `filmsacteurs` (`film_id`, `acteur_id`) VALUES
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5);

-- --------------------------------------------------------

--
-- Structure de la table `realisateurs`
--

CREATE TABLE `realisateurs` (
  `realisateur_id` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `realisateurs`
--

INSERT INTO `realisateurs` (`realisateur_id`, `nom`, `prenom`, `date_creation`, `date_modification`) VALUES
(1, 'Nolan', 'Christopher', '2023-12-14 09:17:45', '2023-12-14 09:17:45'),
(2, 'Tarantino', 'Quentin', '2023-12-14 09:17:45', '2023-12-14 09:17:45'),
(3, 'Spielberg', 'Steven', '2023-12-14 09:17:45', '2023-12-14 09:17:45'),
(4, 'Coppola', 'Francis Ford', '2023-12-14 09:17:45', '2023-12-14 09:17:45'),
(5, 'Scorsese', 'Martin', '2023-12-14 09:17:45', '2023-12-14 09:17:45');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `utilisateur_id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `date_creation` datetime DEFAULT current_timestamp(),
  `date_modification` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `liste_films_preferes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`utilisateur_id`, `email`, `mot_de_passe`, `date_creation`, `date_modification`, `liste_films_preferes`) VALUES
(1, 'alice@email.com', 'motdepassealice', '2023-12-14 09:38:57', '2023-12-14 09:38:57', 'Inception'),
(2, 'bob@email.com', 'motdepassebob', '2023-12-14 09:38:57', '2023-12-14 09:38:57', 'Pulp Fiction'),
(3, 'charlie@email.com', 'motdepassecharlie', '2023-12-14 09:38:57', '2023-12-14 09:38:57', 'Jurassic Park'),
(4, 'david@email.com', 'motpassedavid', '2023-12-14 09:38:57', '2023-12-14 09:38:57', 'The Godfather'),
(5, 'emma@email.com', 'motpasseemma', '2023-12-14 09:38:57', '2023-12-14 09:38:57', 'Goodfellas');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`acteur_id`);

--
-- Index pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD PRIMARY KEY (`utilisateur_id`,`film_id`),
  ADD KEY `film_id` (`film_id`);

--
-- Index pour la table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`film_id`),
  ADD KEY `realisateur_id` (`realisateur_id`);

--
-- Index pour la table `filmsacteurs`
--
ALTER TABLE `filmsacteurs`
  ADD PRIMARY KEY (`film_id`,`acteur_id`),
  ADD KEY `acteur_id` (`acteur_id`);

--
-- Index pour la table `realisateurs`
--
ALTER TABLE `realisateurs`
  ADD PRIMARY KEY (`realisateur_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`utilisateur_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `acteurs`
--
ALTER TABLE `acteurs`
  MODIFY `acteur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `films`
--
ALTER TABLE `films`
  MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `realisateurs`
--
ALTER TABLE `realisateurs`
  MODIFY `realisateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `utilisateur_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`utilisateur_id`),
  ADD CONSTRAINT `favoris_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`);

--
-- Contraintes pour la table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`realisateur_id`) REFERENCES `realisateurs` (`realisateur_id`);

--
-- Contraintes pour la table `filmsacteurs`
--
ALTER TABLE `filmsacteurs`
  ADD CONSTRAINT `filmsacteurs_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`),
  ADD CONSTRAINT `filmsacteurs_ibfk_2` FOREIGN KEY (`acteur_id`) REFERENCES `acteurs` (`acteur_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
