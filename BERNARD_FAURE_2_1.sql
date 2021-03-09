-- phpMyAdmin SQL Dump
-- version 4.6.6deb4+deb9u2
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Lun 08 Mars 2021 à 11:18
-- Version du serveur :  10.1.48-MariaDB-0+deb9u1
-- Version de PHP :  7.0.33-0+deb9u10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `thomas_bernard`
--

-- --------------------------------------------------------

--
-- Structure de la table `CARACTERISE`
--

CREATE TABLE `CARACTERISE` (
  `id_caracterise` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `id_genre` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `CARACTERISE`
--

INSERT INTO `CARACTERISE` (`id_caracterise`, `id_video`, `id_genre`) VALUES
(1, 1, 3),
(2, 2, 2),
(3, 3, 6),
(4, 4, 8),
(5, 5, 9),
(6, 6, 2);

-- --------------------------------------------------------

--
-- Structure de la table `GENRE`
--

CREATE TABLE `GENRE` (
  `id_genre` int(11) NOT NULL,
  `id_supergenre` int(11) NOT NULL,
  `nom_de_genre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `GENRE`
--

INSERT INTO `GENRE` (`id_genre`, `id_supergenre`, `nom_de_genre`) VALUES
(1, 1, 'NULL'),
(2, 1, 'Policier'),
(3, 1, 'Drame'),
(4, 1, 'SF'),
(5, 4, 'Dystopie'),
(6, 4, 'Cyberpunk'),
(7, 4, 'Space Opera'),
(8, 4, 'Marvel'),
(9, 2, 'Enquete');

-- --------------------------------------------------------

--
-- Structure de la table `PERSONNE`
--

CREATE TABLE `PERSONNE` (
  `id_personne` int(11) NOT NULL,
  `nom` char(255) NOT NULL,
  `prenom` char(255) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `PERSONNE`
--

INSERT INTO `PERSONNE` (`id_personne`, `nom`, `prenom`, `email`) VALUES
(1, 'BERNARD', 'Thomas', 'thomas.bernard@etu.imt-lille-douai.fr'),
(2, 'FAURE', 'Guillaume', 'guillaume.faure@etu.imt-lille-douai.fr'),
(3, 'GUARINONI', 'Romain', 'romain.guarinoni@etu.imt-lille-douai.fr'),
(4, 'LAM', 'Alexandre', 'alexandre.lam@etu.imt-lille-douai.fr'),
(5, 'SLEPT', 'Andre', 'alexandre.dorcival@etu.imt-lille-douai.fr');

-- --------------------------------------------------------

--
-- Structure de la table `REALISER`
--

CREATE TABLE `REALISER` (
  `id_realiser` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  `id_video` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `REALISER`
--

INSERT INTO `REALISER` (`id_realiser`, `id_personne`, `id_video`) VALUES
(1, 2, 5),
(2, 1, 3),
(3, 2, 3),
(4, 2, 6);

-- --------------------------------------------------------

--
-- Structure de la table `VIDEO`
--

CREATE TABLE `VIDEO` (
  `id_video` int(11) NOT NULL,
  `titre` varchar(255) NOT NULL,
  `synopsis` text NOT NULL,
  `duree` int(11) NOT NULL,
  `date_de_sortie` date NOT NULL,
  `id_personne` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `VIDEO`
--

INSERT INTO `VIDEO` (`id_video`, `titre`, `synopsis`, `duree`, `date_de_sortie`, `id_personne`) VALUES
(1, 'J\'ouvre des cartes pokémon avec la mif', 'tt est dans le titre', 10, '2021-02-10', 3),
(2, 'je code pcq c\'est cool', 'il code pcq c\'est cool', 600, '2021-02-27', 4),
(3, 'je prends le train  [vlog]', 'un ptit vlog pepouz en region pariseinne', 4, '2021-02-03', 2),
(4, 'lets raid tonight', 'on tombe dénathrius MM', 4, '2021-02-09', 1),
(5, 'Je vous montre enfin ma collection de redbull', 'Cela fait maintenant presque 5ans que notre jeune youtubeur star, andre slept collection des redbulls', 5, '2021-03-09', 5),
(6, 'c\'est la police', 'la police arrive', 25, '2021-03-04', 2);

-- --------------------------------------------------------

--
-- Structure de la table `VISIONNER`
--

CREATE TABLE `VISIONNER` (
  `id_visionner` int(11) NOT NULL,
  `id_personne` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `debutvisio` int(11) NOT NULL,
  `finvisio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `VISIONNER`
--

INSERT INTO `VISIONNER` (`id_visionner`, `id_personne`, `id_video`, `date`, `debutvisio`, `finvisio`) VALUES
(1, 1, 1, '2021-03-18 00:00:00', 0, 100),
(2, 2, 2, '2021-03-10 00:00:00', 0, 200),
(3, 4, 1, '2021-03-19 00:00:00', 0, 250),
(4, 1, 1, '2021-03-23 00:00:00', 100, 500);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `CARACTERISE`
--
ALTER TABLE `CARACTERISE`
  ADD PRIMARY KEY (`id_caracterise`),
  ADD KEY `id_genre` (`id_genre`),
  ADD KEY `id_video` (`id_video`);

--
-- Index pour la table `GENRE`
--
ALTER TABLE `GENRE`
  ADD PRIMARY KEY (`id_genre`),
  ADD KEY `id_sousgenre` (`id_supergenre`);

--
-- Index pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  ADD PRIMARY KEY (`id_personne`);

--
-- Index pour la table `REALISER`
--
ALTER TABLE `REALISER`
  ADD PRIMARY KEY (`id_realiser`),
  ADD KEY `id_personne` (`id_personne`),
  ADD KEY `id_video` (`id_video`);

--
-- Index pour la table `VIDEO`
--
ALTER TABLE `VIDEO`
  ADD PRIMARY KEY (`id_video`),
  ADD KEY `VIDEO_ibfk_1` (`id_personne`);

--
-- Index pour la table `VISIONNER`
--
ALTER TABLE `VISIONNER`
  ADD PRIMARY KEY (`id_visionner`),
  ADD KEY `id_personne` (`id_personne`),
  ADD KEY `id_video` (`id_video`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `CARACTERISE`
--
ALTER TABLE `CARACTERISE`
  MODIFY `id_caracterise` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `GENRE`
--
ALTER TABLE `GENRE`
  MODIFY `id_genre` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT pour la table `PERSONNE`
--
ALTER TABLE `PERSONNE`
  MODIFY `id_personne` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT pour la table `REALISER`
--
ALTER TABLE `REALISER`
  MODIFY `id_realiser` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `VIDEO`
--
ALTER TABLE `VIDEO`
  MODIFY `id_video` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `VISIONNER`
--
ALTER TABLE `VISIONNER`
  MODIFY `id_visionner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `CARACTERISE`
--
ALTER TABLE `CARACTERISE`
  ADD CONSTRAINT `CARACTERISE_ibfk_1` FOREIGN KEY (`id_genre`) REFERENCES `GENRE` (`id_genre`) ON UPDATE CASCADE,
  ADD CONSTRAINT `CARACTERISE_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `VIDEO` (`id_video`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `GENRE`
--
ALTER TABLE `GENRE`
  ADD CONSTRAINT `GENRE_ibfk_1` FOREIGN KEY (`id_supergenre`) REFERENCES `GENRE` (`id_genre`) ON UPDATE CASCADE;

--
-- Contraintes pour la table `REALISER`
--
ALTER TABLE `REALISER`
  ADD CONSTRAINT `REALISER_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `PERSONNE` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `REALISER_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `VIDEO` (`id_video`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `VIDEO`
--
ALTER TABLE `VIDEO`
  ADD CONSTRAINT `VIDEO_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `PERSONNE` (`id_personne`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `VISIONNER`
--
ALTER TABLE `VISIONNER`
  ADD CONSTRAINT `VISIONNER_ibfk_1` FOREIGN KEY (`id_personne`) REFERENCES `PERSONNE` (`id_personne`) ON UPDATE CASCADE,
  ADD CONSTRAINT `VISIONNER_ibfk_2` FOREIGN KEY (`id_video`) REFERENCES `VIDEO` (`id_video`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;