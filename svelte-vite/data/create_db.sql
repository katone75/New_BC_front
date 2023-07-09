--
-- Base de données : "ourblog_bc"
--

-- Note : BEGIN déclare le début d'une transaction : un groupe d'instructions SQL qui rend celles-ci dépendantes les unes des autres. 
-- Si au moins une des instructions génère une erreur, alors toutes les commandes sont invalidées.
BEGIN;

--
-- SUPPRIMER LES TABLES A CREER SI ELLES EXISTENT DEJA
--
DROP TABLE IF EXISTS "comment";
DROP TABLE IF EXISTS "article";
DROP TABLE IF EXISTS "category";
DROP TABLE IF EXISTS "user";

-- Création de l'extension UUID
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- Création de la table "user"
CREATE TABLE IF NOT EXISTS "user" (
  "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "firstname" VARCHAR(50) NOT NULL,
  "lastname" VARCHAR(50) NOT NULL,
  "mail" VARCHAR(100) NOT NULL UNIQUE,
  "password" VARCHAR(100) NOT NULL,
  "role" CHAR(20) NOT NULL
);

-- Création de la table "article"
CREATE TABLE IF NOT EXISTS "article" (
  "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "titre" VARCHAR(100) NOT NULL,
  "content" TEXT NOT NULL,
  "created_time" TIME NOT NULL DEFAULT CURRENT_TIME, 
  "updated_time" TIME NOT NULL DEFAULT CURRENT_TIME,
  "user_id" UUID,
  "category_id" UUID,
  FOREIGN KEY ("user_id") REFERENCES "user" ("id"),
  FOREIGN KEY ("category_id") REFERENCES "category" ("id")
);

-- Création de la table "category"
CREATE TABLE IF NOT EXISTS "category" (
  "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "name" VARCHAR(100),
  "article_id" UUID,
  FOREIGN KEY ("article_id") REFERENCES "article" ("id")
);

-- Création de la table "comment"
CREATE TABLE IF NOT EXISTS "comment" (
  "id" UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  "message" TEXT,
  "article_id" UUID,
  "user_id" UUID,
  FOREIGN KEY ("article_id") REFERENCES "article" ("id") ON DELETE CASCADE,
  FOREIGN KEY ("user_id") REFERENCES "user" ("id")
);

-- Pour mettre fin au bloc de transaction et l'exécuter
COMMIT;
