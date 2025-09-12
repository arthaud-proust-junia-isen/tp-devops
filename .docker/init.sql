-- Créer la base
CREATE DATABASE IF NOT EXISTS croupier
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_general_ci;

USE croupier;

-- Créer la table users
CREATE TABLE IF NOT EXISTS users (
    userid INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(100) NOT NULL UNIQUE,
    password CHAR(40) NOT NULL, -- SHA1 = 40 caractères hex
    mail VARCHAR(255) NOT NULL UNIQUE,
    chmod VARCHAR(40) NOT NULL DEFAULT '0'
);

-- Insérer des données de test
-- login = sha1(sha1($clearLogin).$id);
INSERT INTO users (userid, login, password, mail, chmod) VALUES
(1, 'admin', 'd688fd1134266c0693ba48cf6b44b6e1ef09951e', 'admin@example.com', '1'),
(2, 'user',  '2418c523553ab669f8f2c5554607a0daa9eb157f', 'user@example.com',  '0');