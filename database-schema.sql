-- =====================================================
-- Script de création des bases de données pour Spring Microservices
-- Compatible MariaDB/MySQL
-- =====================================================

-- =====================================================
-- 1. BASE DE DONNÉES CATEGORY SERVICE
-- =====================================================

-- Création de la base de données pour les catégories
CREATE DATABASE IF NOT EXISTS `db_category` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `db_category`;

-- Table des catégories
CREATE TABLE IF NOT EXISTS `categorie` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR(255) NOT NULL COMMENT 'Nom de la catégorie',
    `description` TEXT COMMENT 'Description de la catégorie',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de modification'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table des catégories de produits';


-- Insertion de données de test pour les catégories
INSERT INTO `categorie` (`nom`, `description`) VALUES
('Électronique', 'Produits électroniques et gadgets technologiques'),
('Vêtements', 'Habillement et accessoires vestimentaires'),
('Livres', 'Livres, magazines et publications'),
('Maison & Jardin', 'Articles pour la maison et le jardinage'),
('Sport & Loisirs', 'Équipements sportifs et activités de loisirs'),
('Alimentation', 'Produits alimentaires et boissons'),
('Beauté & Santé', 'Produits de beauté et de santé'),
('Automobile', 'Pièces et accessoires automobiles'),
('Jouets & Jeux', 'Jouets et jeux pour tous âges'),
('Informatique', 'Ordinateurs, logiciels et accessoires informatiques');

-- =====================================================
-- 2. BASE DE DONNÉES PRODUCT SERVICE
-- =====================================================

-- Création de la base de données pour les produits
CREATE DATABASE IF NOT EXISTS `db_product` 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

USE `db_product`;

-- Table des produits
CREATE TABLE IF NOT EXISTS `produit` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `nom` VARCHAR(255) NOT NULL COMMENT 'Nom du produit',
    `prix` DECIMAL(10,2) NOT NULL COMMENT 'Prix du produit',
    `description` TEXT COMMENT 'Description du produit',
    `categorie_id` BIGINT NOT NULL COMMENT 'ID de référence vers la catégorie',
    `stock` INT DEFAULT 0 COMMENT 'Quantité en stock',
    `actif` BOOLEAN DEFAULT TRUE COMMENT 'Statut actif/inactif du produit',
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT 'Date de création',
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Date de modification'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Table des produits';


-- Insertion de données de test pour les produits
INSERT INTO `produit` (`nom`, `prix`, `description`, `categorie_id`, `stock`) VALUES
-- Électronique (categorie_id = 1)
('Smartphone Galaxy S23', 899.99, 'Smartphone Samsung dernière génération avec appareil photo 108MP', 1, 50),
('iPhone 15 Pro', 1199.99, 'iPhone Apple avec puce A17 Pro et caméra triple', 1, 30),
('MacBook Air M2', 1499.99, 'Ordinateur portable Apple avec puce M2', 1, 25),
('AirPods Pro', 249.99, 'Écouteurs sans fil avec réduction de bruit active', 1, 100),

-- Vêtements (categorie_id = 2)
('T-shirt Cotton Premium', 29.99, 'T-shirt en coton bio de haute qualité', 2, 200),
('Jean Slim Fit', 79.99, 'Jean coupe slim en denim stretch', 2, 150),
('Sneakers Running', 89.99, 'Chaussures de running légères et confortables', 2, 80),

-- Livres (categorie_id = 3)
('Le Petit Prince', 12.99, 'Classique de la littérature française', 3, 300),
('Harry Potter à l\'école des sorciers', 18.99, 'Premier tome de la série Harry Potter', 3, 250),
('Le Seigneur des Anneaux', 24.99, 'Trilogie complète en un volume', 3, 100),

-- Maison & Jardin (categorie_id = 4)
('Machine à café automatique', 299.99, 'Machine à café avec broyeur intégré', 4, 40),
('Robot aspirateur', 199.99, 'Aspirateur robot avec navigation intelligente', 4, 60),
('Kit de jardinage', 49.99, 'Kit complet pour l\'entretien du jardin', 4, 120),

-- Sport & Loisirs (categorie_id = 5)
('Vélo de route', 599.99, 'Vélo de route en aluminium léger', 5, 35),
('Tapis de yoga', 39.99, 'Tapis de yoga antidérapant', 5, 200),
('Raquette de tennis', 89.99, 'Raquette de tennis professionnelle', 5, 75);
