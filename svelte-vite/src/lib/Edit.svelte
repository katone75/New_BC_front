<script>
 
  import axios from "axios";
  import Editor from "@tinymce/tinymce-svelte";


  export let params = {};

  // Déclarations de variables utilisées dans les fonctions
  let article = {};
  let title;
  let content;
  let image_article;
  let Category;
  let articles = [];
  let handleDeleteArticle;

  // Fonction qui récupère l'article grâce à l'id dans l'url en paramètre
  const get_article = async (id) => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article/" + id
    );

    article = response.data.data;
    title = article.title;
    content = article.content;
    image_article = article.image_article;
    Category = article.Category;

    //console.log(article);
    return article;
  };

  get_article(params.id);

  // Fonction qui permet d'éditer l'article 
  const edit_article = async (id) => {
      const token = parseJwt(window.localStorage.getItem("token"));
      const response = await axios.patch(
        import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article/" + id,
        { 
          user_id : token.id,
          title, 
          image_article, 
          content, 
          Category,

        },
        {
                headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`
                        }   

            }

      );

      console.log(response.data.data);
      return response.data.data;
    
  };

  const handleImageChange = (event) => {
    const file = event.target.files[0];
    image_article = file;
  };

  const handleSubmit = async () => {
    const updated_article = await edit_article(params.id);
    console.log(updated_article);
    title = "";
    image_article = "";
    content = "";
    Category = "";

    articles.push(updated_article);
    window.location.href = `#/article/${updated_article.id}`; // Redirection vers la page de l'article mis à jour
  };

  // Fonction permettant de filtrer les catégories dans le menu déroulant (limitées à 12 pour le MVP)
  const filter_category = async () => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/category?limit=12"
    );
    //console.log(response.data.data);
    return response.data.data;
  };

  // Variables et fonctions liées à la preview d'une image

  let input;
  let container;
  let image;
  let placeholder;
  let showImage = false;

  function onChange() {
    const file = input.files[0];

    if (file) {
      showImage = true;

      const reader = new FileReader();
      reader.addEventListener("load", function () {
        image.setAttribute("src", reader.result);
      });
      reader.readAsDataURL(file);

      return;
    }
    showImage = false;
  }

  //Fonction qui permet de supprimer l'article
// Fonction qui supprime l'article
const delete_article = async (id) => {
  try {
    const response = await axios.delete(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article/" + id
    );

    console.log(response.data.data);
    handleDeleteArticle = await handleDelete();
    return response.data.data;
    
  } catch (error) {
    console.error(error);
    // Gérer l'erreur ici, afficher un message d'erreur approprié ou effectuer une action spécifique en cas d'erreur 403.
  }
};

// Fonction de gestion de la suppression de l'article
const handleDelete = async () => {
  await delete_article(params.id);
  // Effectuer une action après la suppression, par exemple, rediriger l'utilisateur vers la page d'accueil
window.location.href = "/";};

</script>

<main class="create_form">
  <h1>
    <ion-icon name="create-outline" aria-label="Modifier un article" />Modifier
    un article
  </h1>

  <form
    method="post"
    action=""
    enctype="multipart/form-data"
    on:submit|preventDefault={handleSubmit}
  >
    <div class="title_form">
      <label for="article_title">Titre de l'article :</label>
      <input
        type="text"
        id="article_title"
        name="article_title"
        bind:value={title}
        aria-label="Titre de l'article"
      />
    </div>

    <div class="img_form">
      <div class="file-input-container">
        <label for="article_image">Image :</label>

        <input
          type="file"
          id="article_image"
          name="article_image"           
          aria-label="Image de l'article"
          bind:this={input}
          on:change={onChange}
          onchange={handleImageChange}
          style="display: none;"
        />
        <label for="article_image" class="file-input-label">
          <ion-icon class="upload" name="cloud-download-outline" size="large"></ion-icon>
        </label>
      </div>


    <div class="article_image-preview" bind:this={container}>
      {#if showImage}
        <img bind:this={image} src="" alt="Preview" />
      {:else}
        <span bind:this={placeholder}>Image Preview</span>
      {/if}
    </div>

    <div class="category_select">
      <label for="pet-select">Catégorie:</label>

      <select name="pets" id="pet-select" bind:value={article.Category}>
        <option value="0">--Choisissez une catégorie--</option>
        {#await filter_category() then categories}
          {#each categories as category}
            <option value={category.id}>{category.name}</option>
          {/each}
        {/await}
      </select>
    </div>
    <label for="article_content">Contenu de l'article :</label>
    <Editor
      id="mytextarea"
      name="editor"
      bind:value={content}
      aria-label="Modifier ici le contenu de l'article"
    />

    <div class="btn">
       <button type="button" on:click|preventDefault={() =>
        delete_article(params.id)}> <span>Supprimer</span> </button>

      <button type="submit"> <span>Publier</span> </button>
      <button type="button"> <span>Annuler</span> </button>
    </div>
  </form>
</main>