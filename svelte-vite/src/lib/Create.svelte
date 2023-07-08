<script>
  
  import axios from "axios";
  import Editor from "@tinymce/tinymce-svelte";
  import { getAPI } from "../API.js";


  export let params = {};
  
  //Déclarations de variables utilisées dans les fonctions
  let title;
  let content;
  let image_article;
  let Category=[];
  let articles = [];

  //Fonction qui permet de poster un nouvel article
  const post_article=async()=>{
    //console.log(parseJwt(window.localStorage.getItem("token")));
        const response = await getAPI(). post(
           "/items/article?fields=*.*",
            { 
              title, 
              image_article, 
              content, 
              Category, 
              
            },
        
        );
       
        console.log(response.data.data);
        return response.data.data;
    }; 

    const handleImageChange = (event) => {
      const file = event.target.files[0];
      image_article = file;
    };

    const handleSubmit = async () => {
        //console.log(handleSubmit);
        const new_article = await post_article();
        //console.log(new_article);
        title="";
        image_article=[];
        content="";
        Category=[];


        // On ajoute le nouveau commentaire au tableau de articles (il sera rajouté à la BDD seulement)
        articles.push(new_article);
        // ici on vient tout réassigner au tableau qui sera rerender (il prendra en compte cet ajout)
        articles= [...articles];

        window.location.href = "/"; // Lien qui permet de nous ramener à l'accueil suite à la suppression de l'article

    };


  //Fonction permettant de filtrer les catégories dans le menu déroulant (limitées à 12 pour le MVP)
  const filter_category = async () => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/category?limit=12" 
     
    );
    //console.log(response.data.data);
    return response.data.data;
  };

  //Variables et fonctions liées à la preview d'une image

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

  // on:change={(e) => (image_article = e.target.files[0])}     
</script>

<main class="create_form">
  <h1>
    <ion-icon
      name="create-outline"
      aria-label="titre ecrire un article"
    />Ecrire un article
  </h1>

  <!-- <form method="post" action="" enctype="multipart/form-data" on:submit|preventDefault={handleSubmit}>: 
      Cela crée un formulaire HTML. 
      method="post" indique que le formulaire doit être soumis avec la méthode POST.
    -->
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
        aria-label="{title}"
        required
      />
    </div>

    <div class="img_form">
      <!--'on:change={(e) => createArticle.image = e.target.files[0]} : événement JS qui se déclenche lorsque la valeur de l'élément <input> est modifiée. 
          Lorsque l'utilisateur sélectionne un fichier, la fonction fléchée sera exécutée. Elle récupère le fichier sélectionné (e.target.files[0]) et l'assigne à la propriété image de l'objet createArticle.
        -->
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

      <select name="pets" id="pet-select" bind:value={Category}>
        <option value="0">--Choisissez une catégorie--</option>
        {#await filter_category()}
          {:then categories}
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
      bind:text={content}
      aria-label="Ecrivez ici le contenu de l'article"
      required
    />
    

    <div class="btn">
      <!-- <button type="button"> <span>Supprimer</span> </button> -->
<div class="btn_sub">

  <button type="submit"> <span>Publier</span> </button>
      <button type="button"> <span>Annuler</span> </button>
</div>
      
    </div>
  </form>
</main>

<style>


</style>