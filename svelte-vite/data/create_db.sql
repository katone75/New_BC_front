--
-- Base de données :  "ourblog_bc"
--

-- Note : BEGIN déclare le début d'une transaction : un groupe d'instructions SQL qui rend celles-ci dépendantes les unes des autres. 
-- Si au moins une des instructions génère une erreur, alors toutes les commandes sont invalidées.
BEGIN;

--
-- SUPPRIMER LES TABLES A CREER SI ELLES EXISTENT DEJA
--
DROP TABLE IF EXISTS "comment";
DROP TABLE IF EXISTS "articles";
DROP TABLE IF EXISTS "category";
DROP TABLE IF EXISTS "users";

-- Création de la table "users"
CREATE TABLE IF NOT EXISTS users (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "firstname" VARCHAR (50) NOT NULL,
  "lastname" VARCHAR (50) NOT NULL,
  "mail" VARCHAR (100) NOT NULL UNIQUE,
  "password" VARCHAR (100) NOT NULL,
  "role" CHAR (20) NOT NULL
);

-- Création de la table "category"
CREATE TABLE IF NOT EXISTS category (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(100)
);

-- Création de la table "articles"
CREATE TABLE IF NOT EXISTS articles (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "titre" VARCHAR (100) NOT NULL,
  "content" TEXT NOT NULL,
  "image_url" VARCHAR (255),
  "created_date" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_date" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "users_id" INT,
  "category_id" INT,
  FOREIGN KEY ("category_id") REFERENCES "category"("id")
);

-- Création de la table "comment"
CREATE TABLE IF NOT EXISTS comment (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "message" TEXT,
  "article_id" INT,
  "users_id" INT,
  FOREIGN KEY ("article_id") REFERENCES "articles"("id") ON DELETE CASCADE,
  FOREIGN KEY ("users_id") REFERENCES "users"("id")
);

-- Pour mettre fin au bloc de transaction et l'exécuter
COMMIT;
