--
-- Base de données :  "ourblog_bc"
--

-- Note : BEGIN déclare le début d'une transaction : un groupe d'instructions SQL qui rend celles-ci dépendantes les unes des autres. 
-- Si au moins une des instructions génère une erreur, alors toutes les commandes sont invalidées.
BEGIN;

--
-- SUPPRIMER LES TABLES A CREER SI ELLES EXISTENT DEJA
--
DROP TABLE IF EXISTS "user",
"category",
"article",
"comment";


-- Création de la table "user"
CREATE TABLE IF NOT EXISTS "user" (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- GENERATED ALWAYS AS IDENTITY permet de laisser le SGBD gérer la valeur pour ce champs
  "firstname" VARCHAR (50) NOT NULL,
  "lastname" VARCHAR (50) NOT NULL,
  "mail" VARCHAR (100) NOT NULL UNIQUE,
  "password" VARCHAR (100) NOT NULL,
  "role" CHAR (20) NOT NULL,
);


-- Création de la table "article"
CREATE TABLE articles (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "titre" VARCHAR (100) NOT NULL,
  "content" TEXT NOT NULL,
  "image_url" VARCHAR (255), -- Colonne pour stocker l'URL de l'image
  "created_date" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "updated_date" TIMESTAMPTZ NOT NULL DEFAULT CURRENT_TIMESTAMP,
  "user_id" INT,
  "category_id" INT,
  FOREIGN KEY ("user_id") REFERENCES "user"("id"),
  FOREIGN KEY ("category_id") REFERENCES "category"("id")
);



-- Création de la table "category"
CREATE TABLE category (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "name" VARCHAR(100),
  "article_id" INT,
  FOREIGN KEY ("article_id") REFERENCES "article"("id")
);



-- Création de la table "comment"
CREATE TABLE comment (
  "id" INT NOT NULL GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  "message" TEXT,
  "article_id" INT,
  "user_id" INT,
  FOREIGN KEY ("article_id") REFERENCES "articles"("id") ON DELETE CASCADE, -- Utilisation de l'option ON DELETE CASCADE
  FOREIGN KEY ("user_id") REFERENCES "user"("id")
);


-- Pour mettre fin à au bloc de transaction et l'exécuter
COMMIT;