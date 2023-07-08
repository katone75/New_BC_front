<script>
  import { push } from "svelte-spa-router";
  import axios from "axios";
  import { getAPI } from "../API.js";
  import { getToken } from "../API.js";
  import { onMount } from 'svelte';

  

  let user = {}; // Objet pour stocker les informations de l'utilisateur
  let showSaveConfirmation = false; // Variable pour afficher ou masquer la confirmation de sauvegarde
  let showDeleteConfirmation = false; // Variable pour afficher ou masquer la confirmation de suppression

  const logout = async () => {
    try {
      const refreshToken = "gmPd...8wuB"; // Token de rafraîchissement (refresh token)

      const postData = {
        refresh_token: refreshToken,
      };

      await axios.post(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/auth/logout`,
        postData
      );
      localStorage.removeItem("token"); // Suppression du token dans le stockage local (localStorage)

      push("/"); // Redirection vers la page d'accueil

      return true;
    } catch (error) {
      console.error(
        "Une erreur s'est produite lors de la déconnexion :",
        error
      );
      return false;
    }
  };

  /* function confirmSave() {
    showSaveConfirmation = true; // Afficher la confirmation de sauvegarde
  }
 */
  async function confirmSaveAction() {
    await updateProfil(); // Appel de la fonction pour mettre à jour le profil
    showSaveConfirmation = false; // Masquer la confirmation de sauvegarde
  }

  function cancelSaveAction() {
    showSaveConfirmation = false; // Annuler la sauvegarde et masquer la confirmation
  }

  function confirmDelete() {
    showDeleteConfirmation = true; // Afficher la confirmation de suppression
  }

  async function confirmDeleteAction() {
    await deleteUser(); // Appel de la fonction pour supprimer l'utilisateur
    showDeleteConfirmation = false; // Masquer la confirmation de suppression
    await push("/"); // Redirection vers la page d'accueil
  }

  function cancelDeleteAction() {
    showDeleteConfirmation = false; // Annuler la suppression et masquer la confirmation
  }

  // Récupérer les informations du profil utilisateur depuis Directus
  async function getProfilUser() {
    try {
      const response = await getAPI().get(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/users/me`
      );
      user = response.data.data; // Assigner les données à l'objet user
      user.email = user.email || "";
      user.title = user.title || "";
      user.last_name = user.last_name || "";
      user.first_name = user.first_name || "";
      user.description = user.description || "";
      return user;
    } catch (error) {
      console.error(error);
    }
  }

  let userUpdate = {};

  async function updateProfil() {
    try {
      const token = getToken();
      const headers = {};

      if (token) {
        headers.Authorization = `Bearer ${token}`;
      }

      const dataToUpdate = {
        // Inclure ici les champs que vous souhaitez mettre à jour avec leurs nouvelles valeurs
        avatar: "056fb6b6-aa60-4b32-a350-2aff26cbb6df",
        title: user.title,
        last_name: user.last_name,
        first_name: user.first_name,
        description: user.description,
      };

      const response = await axios.patch(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/users/me`,
        dataToUpdate,
        {
          headers: headers,
        }
      );
      userUpdate = response.data.data;
      return userUpdate;
    } catch (error) {
      console.error(error);
    }
  }

  let showFields = false;

  const toggleFields = () => {
    showFields = !showFields;
  };

  // Fonction pour supprimer l'utilisateur actuel
  async function deleteUser() {
    try {
      const token = getToken(); // S'assurer que getToken() renvoie la valeur réelle du token
      const headers = {};

      if (token) {
        headers.Authorization = `Bearer ${token}`;
      }

      const user = await getProfilUser(); // Récupérer les informations du profil utilisateur depuis Directus

      const userId = user.id; // Récupérer l'ID de l'utilisateur actuel

      const response = await axios.delete(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/users/${userId}`,
        {
          headers: headers,
        }
      );

      // La suppression a réussi, vous pouvez effectuer des actions supplémentaires ici si nécessaire

      console.log("Utilisateur supprimé avec succès");

      await push("/");
    } catch (error) {
      console.error(error);
    }
  }

  const info = [
    {
      photo: "",
    },
  ];

  const article = [
    {
      pic: "../src/assets/elephant.jpg",
      title: "'Titi' l'éléphant",
    },
    {
      pic: "../src/assets/cat.jpg",
      title: "Chat",
    },
    {
      pic: "../src/assets/dog1.jpg",
      title: "Chien",
    },
    {
      pic: "../src/assets/dog2.jpg",
      title: "Chien",
    },
    {
      pic: "../src/assets/dog3.jpg",
      title: "Chien",
    },
  ];

  let favorite_articles = [];

  async function fetchFavoriteArticlesWithFields() {
    try {
      // Récupérer le token d'authentification de l'utilisateur
      const token = getToken();

      // Définir les headers de la requête avec le token d'authentification
      const headers = {
        Authorization: `Bearer ${token}`,
      };

      // Effectuer la requête pour récupérer les favoris depuis la table "favoris"
      const favorisResponse = await axios.get(`${import.meta.env.VITE_LOCAL_DIRECTUS}/items/favoris`, {
        headers,
        params: {
          fields: ['article.title', 'article.image_article'], // Spécifier les champs à récupérer de la table "article"
        },
      });

      // Obtenir les enregistrements des favoris avec les champs de la table "article"
      favorite_articles = favorisResponse.data.data;
      console.log(favorite_articles);
    } catch (error) {
      console.error("Une erreur s'est produite lors de la récupération des favoris :", error);
    }
  }

  // Appeler la fonction pour récupérer les favoris avec les champs de la table "article"
  fetchFavoriteArticlesWithFields();






  export { favorite_articles };


</script>

<main class="profil_container">
  <section class="profil_container_box">
    <h1>
      <ion-icon name="person-circle-outline" aria-hidden="true" />Profil
    </h1>

    <article class="profil_description">
      <div class="profil_description_header">
        <!-- Boucle sur chaque élément de "info" -->
        {#each info as profil}
          <img
            src={"http://localhost:8055/assets/" + user.avatar}
            alt="Photo de profil"
          />
          <!-- Affichage de la photo de profil -->
          <!-- <img src={profil.photo} alt="Photo de profil" /> -->
          <span>{user.first_name} {user.last_name}</span>
          <!-- Affichage du prénom et du nom de l'utilisateur -->
        {/each}
      </div>

      <div class="profil_description_form">
        <!-- Attendre la récupération du profil utilisateur -->
        {#await getProfilUser() then}
          {#if showSaveConfirmation}
            <!-- Confirmation de sauvegarde du profil -->
          {:else if showDeleteConfirmation}
            <!-- Confirmation de suppression du profil -->
          {:else}
            <!-- Formulaire de modification du profil -->
            <form action="">
              <label for="email">E-mail : {user.email}</label>
              <!-- Affichage de l'e-mail de l'utilisateur -->

              <label for="pseudo">Pseudo : {user.title}</label>
              <!-- Champ de saisie pour le pseudo -->

              <label for="nom">Nom : {user.last_name} </label>
              <!-- Champ de saisie pour le nom -->

              <label for="prenom">Prénom : {user.first_name}</label>
              <!-- Champ de saisie pour le prénom -->

              <label for="description">Description : {user.description} </label>

              <!-- Champ de saisie pour la description -->

              <button aria-label="Supprimer le profil" on:click={confirmDelete}>
                <span>Supprimer le profil</span>
              </button>
              <!-- Bouton pour supprimer le profil -->

              <button aria-label="Se déconnecter" on:click={logout}>
                <span>Se déconnecter</span>
              </button>
              <!-- Bouton pour se déconnecter -->
            </form>
          {/if}
        {/await}
      </div>
    </article>

    <article class="profil_description">
      <div class="profil_description_header">
        <div class="profil_description_form">
          <!-- Attendre la récupération du profil utilisateur -->
          {#await getProfilUser() then}
            {#if showSaveConfirmation}
              <!-- Confirmation de sauvegarde du profil -->
              <div class="confirmation-dialog">
                <h3>Confirmez-vous la sauvegarde du profil ?</h3>
                <button on:click={confirmSaveAction}>Confirmer</button>
                <button on:click={cancelSaveAction}>Annuler</button>
              </div>
            {:else if showDeleteConfirmation}
              <!-- Confirmation de suppression du profil -->
              <div class="confirmation-dialog">
                <h3>Confirmez-vous la suppression du profil ?</h3>
                <button on:click={confirmDeleteAction}>Confirmer</button>
                <button on:click={cancelDeleteAction}>Annuler</button>
              </div>
            {:else}
              <!-- Formulaire de modification du profil -->
              <form action="">
                <label for="Mettre à jour son profil"
                  >Mettre à jour son profil</label
                >

                <!-- Affichage de l'e-mail de l'utilisateur -->

                {#if showFields}
                  <label for="pseudo">Pseudo : </label>
                  <input
                    type="text"
                    id="pseudo"
                    placeholder="Entrez votre Pseudo"
                    bind:value={user.title}
                  />
                  <!-- Champ de saisie pour le pseudo -->

                  <label for="nom">Nom : </label>
                  <input
                    type="text"
                    id="nom"
                    placeholder="Entrez votre Nom"
                    bind:value={user.last_name}
                  />
                  <!-- Champ de saisie pour le nom -->

                  <label for="prenom">Prénom : </label>
                  <input
                    type="text"
                    id="prenom"
                    placeholder="Entrez votre Prénom"
                    bind:value={user.first_name}
                  />
                  <!-- Champ de saisie pour le prénom -->

                  <label for="description">Description : </label>
                  <textarea
                    id="description"
                    placeholder="Pour mieux vous connaître"
                    bind:value={user.description}
                  />
                  <!-- Champ de saisie pour la description -->
                {/if}

                <button
                  aria-label="Sauvegarder le profil"
                  on:click={toggleFields}
                >
                  <span>Mettre à jour son profil</span>
                </button>
                <!-- Bouton pour afficher/cacher les champs du profil -->
              </form>
            {/if}
          {/await}
        </div>
      </div>
    </article>
  </section>

  <section class="profil_items">
    <h1>
      <ion-icon name="newspaper-outline" aria-hidden="true" />Mes articles
    </h1>

    <button aria-label="Écrire un article">
      <span><a href="http://localhost:5173/#/create">Écrire un article</a></span>
    </button>
    <!-- Bouton pour écrire un nouvel article -->

    <article class="profil_items_article">
      <!-- Boucle sur chaque élément de "article" -->
      {#each article as articles}
        <div class="profil_items_article_content">
          <img src={articles.pic} alt="" />
          <!-- Affichage de l'image de l'article -->
          <div class="ion-icon">
            <h2>{articles.title}</h2>
            <!-- Affichage du titre de l'article -->
            <a href="http://localhost:5173/#/create">Modifier</a>
            <!-- Lien pour modifier l'article -->
          </div>
        </div>
      {/each}
    </article>


    <h1><ion-icon name="star" aria-hidden="true"></ion-icon>Favoris</h1>
    <article class="profil_items_fav">
      {#each favorite_articles as article, index}
        <div class="profil_items_fav_content">
          <img src={"http://localhost:8055/assets/" + article.article.image_article} alt="" />
          <div class="ion-icon">
            <h2>{article.article.title}</h2>
            <a href="#">Supprimer</a>
          </div>
        </div>
      {/each}
    </article>
    
    

  </section>
</main>

<style>
  .profil_description_form {
    word-wrap: break-word;
    overflow: hidden;
  }

  .profil_description_header {
    display: flex;
    align-items: center;
  }

  .profil_description_header img {
    margin-right: 10px;
  }

  .profil_description_header span {
    display: inline-block;
    /* white-space: nowrap; */
    overflow: hidden;
    text-overflow: ellipsis;
    word-wrap: break-word;
  }

  button {
    border: 1px solid #fff5ef;
    padding: 0.5rem 1rem;
    background-color: #fff5ef;
    font-weight: bold;
    margin-bottom: 1rem;
    cursor: pointer;
    color: #52443c;
    position: relative;
    border: 1px solid #cd9985;
  }

  
</style>