-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Oct 07, 2024 at 02:47 PM
-- Server version: 11.5.2-MariaDB-ubu2404
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Ges_Stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `approvisionnement`
--

CREATE TABLE `approvisionnement` (
  `id_approvisionement` int(11) NOT NULL,
  `id_fournisseur` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `date_appro` date NOT NULL,
  `quantite_appro` int(11) NOT NULL,
  `prix_appro` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categorie`
--

CREATE TABLE `categorie` (
  `id_categorie` int(11) NOT NULL,
  `nom_categorie` varchar(50) NOT NULL,
  `description_categorie` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `statut_commande` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `entrepot`
--

CREATE TABLE `entrepot` (
  `id_entrepot` int(11) NOT NULL,
  `nom_entrepot` varchar(50) NOT NULL,
  `adresse_entrepot` varchar(255) NOT NULL,
  `capacite` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseur`
--

CREATE TABLE `fournisseur` (
  `id_fournisseur` int(11) NOT NULL,
  `nom_fournisseur` varchar(50) NOT NULL,
  `adresse_fournisseur` varchar(255) NOT NULL,
  `telephone_fournisseur` varchar(20) NOT NULL,
  `mail_fournisseur` varchar(255) NOT NULL,
  `contact_fournisseur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ligne_commande`
--

CREATE TABLE `ligne_commande` (
  `id_ligne_commande` int(11) NOT NULL,
  `id_commande` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `quantite_ligne` int(11) NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mouvement_stock`
--

CREATE TABLE `mouvement_stock` (
  `id_mouvement` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `quantite_mouvement` int(11) NOT NULL,
  `type_mouvement` varchar(50) NOT NULL,
  `date_mouvement` date NOT NULL,
  `statut_mouvement` enum('en cours','terminé','annulé','') NOT NULL,
  `source_mouvement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

CREATE TABLE `produit` (
  `id_produit` int(11) NOT NULL,
  `nom_produit` varchar(100) NOT NULL,
  `description_produit` text NOT NULL,
  `prix_ref` decimal(10,2) NOT NULL,
  `seuil_appro` int(11) NOT NULL,
  `seuil_alerte` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id_role` int(11) NOT NULL,
  `nom__role` varchar(50) NOT NULL,
  `description_role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id_stock` int(11) NOT NULL,
  `id_produit` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `quantite_disponible` int(11) NOT NULL,
  `date_mise_a_jour` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `nom_utilisateur` varchar(50) NOT NULL,
  `prenom_utilisateur` varchar(50) NOT NULL,
  `email_utilisateur` varchar(100) NOT NULL,
  `mot_de_passe_utilisateur` varchar(255) NOT NULL,
  `id_role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `utilisateur_entrepot`
--

CREATE TABLE `utilisateur_entrepot` (
  `id_utilisateur` int(11) NOT NULL,
  `id_entrepot` int(11) NOT NULL,
  `date_debut_responsabilite` date NOT NULL,
  `date_fin_responsabilite` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD PRIMARY KEY (`id_approvisionement`),
  ADD KEY `fk_approvisionnement_id_fourniseur` (`id_fournisseur`),
  ADD KEY `fk_approvisionnement_id_entrepot` (`id_entrepot`),
  ADD KEY `fk_approvisionnement_id_produit` (`id_produit`);

--
-- Indexes for table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Indexes for table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fk_commande_id_utilisateur` (`id_utilisateur`),
  ADD KEY `fk_commande_id_entrepot` (`id_entrepot`);

--
-- Indexes for table `entrepot`
--
ALTER TABLE `entrepot`
  ADD PRIMARY KEY (`id_entrepot`),
  ADD KEY `fk_entrepot_id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `fournisseur`
--
ALTER TABLE `fournisseur`
  ADD PRIMARY KEY (`id_fournisseur`);

--
-- Indexes for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD PRIMARY KEY (`id_ligne_commande`),
  ADD KEY `fk_ligne_commande_id_commande` (`id_commande`),
  ADD KEY `fk_ligne_commande_id_produit` (`id_produit`);

--
-- Indexes for table `mouvement_stock`
--
ALTER TABLE `mouvement_stock`
  ADD PRIMARY KEY (`id_mouvement`),
  ADD KEY `fk_mouvement_stock_id_produit` (`id_produit`),
  ADD KEY `fk_mouvement_stock_id_entrepot` (`id_entrepot`),
  ADD KEY `fk_mouvement_stock_id_utilisateur` (`id_utilisateur`);

--
-- Indexes for table `produit`
--
ALTER TABLE `produit`
  ADD PRIMARY KEY (`id_produit`),
  ADD KEY `id_categorie` (`id_categorie`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD KEY `fk_stock_id_produit` (`id_produit`),
  ADD KEY `fk_stock_id_entrepot` (`id_entrepot`);

--
-- Indexes for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`),
  ADD KEY `fk_utilisateur_id_role` (`id_role`);

--
-- Indexes for table `utilisateur_entrepot`
--
ALTER TABLE `utilisateur_entrepot`
  ADD PRIMARY KEY (`id_utilisateur`,`id_entrepot`),
  ADD KEY `fk_utilisateur_entrepot_id_entrepot` (`id_entrepot`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  MODIFY `id_approvisionement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `entrepot`
--
ALTER TABLE `entrepot`
  MODIFY `id_entrepot` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fournisseur`
--
ALTER TABLE `fournisseur`
  MODIFY `id_fournisseur` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  MODIFY `id_ligne_commande` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mouvement_stock`
--
ALTER TABLE `mouvement_stock`
  MODIFY `id_mouvement` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `produit`
--
ALTER TABLE `produit`
  MODIFY `id_produit` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `approvisionnement`
--
ALTER TABLE `approvisionnement`
  ADD CONSTRAINT `fk_approvisionnement_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id_entrepot`),
  ADD CONSTRAINT `fk_approvisionnement_id_fourniseur` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseur` (`id_fournisseur`),
  ADD CONSTRAINT `fk_approvisionnement_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id_entrepot`),
  ADD CONSTRAINT `fk_commande_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `entrepot`
--
ALTER TABLE `entrepot`
  ADD CONSTRAINT `fk_entrepot_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `ligne_commande`
--
ALTER TABLE `ligne_commande`
  ADD CONSTRAINT `fk_ligne_commande_id_commande` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id_commande`),
  ADD CONSTRAINT `fk_ligne_commande_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Constraints for table `mouvement_stock`
--
ALTER TABLE `mouvement_stock`
  ADD CONSTRAINT `fk_mouvement_stock_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id_entrepot`),
  ADD CONSTRAINT `fk_mouvement_stock_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`),
  ADD CONSTRAINT `fk_mouvement_stock_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `fk_produit_id_categorie` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`);

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `fk_stock_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id_entrepot`),
  ADD CONSTRAINT `fk_stock_id_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`);

--
-- Constraints for table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `fk_utilisateur_id_role` FOREIGN KEY (`id_role`) REFERENCES `role` (`id_role`);

--
-- Constraints for table `utilisateur_entrepot`
--
ALTER TABLE `utilisateur_entrepot`
  ADD CONSTRAINT `fk_utilisateur_entrepot_id_entrepot` FOREIGN KEY (`id_entrepot`) REFERENCES `entrepot` (`id_entrepot`),
  ADD CONSTRAINT `fk_utilisateur_entrepot_id_utilisateur` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
