--
-- Base de données :  "bloggers'chnonicles"
--

-- Note : BEGIN déclare le début d'une transaction : un groupe d'instructions SQL qui rend celles-ci dépendantes les unes des autres. 
-- Si au moins une des instructions génère une erreur, alors toutes les commandes sont invalidées.
BEGIN;

--
-- SUPPRIMER LES TABLES A CREER SI ELLES EXISTENT DEJA
--
DROP TABLE IF EXISTS "User";
DROP TABLE IF EXISTS "Category";
DROP TABLE IF EXISTS "Article";
DROP TABLE IF EXISTS "Comment";

