<script>
// @ts-nocheck

  import { link } from "svelte-spa-router";
  import { onMount } from 'svelte';
  import { format } from 'date-fns';
  import { fr } from 'date-fns/locale';



  let myDate;

onMount(() => {
  // Supposons que myDate soit une valeur de date existante
  myDate = new Date();
});

function formatDate(date) {
  return format(date, 'dd MMMM yyyy', { locale: fr });
}

  // Importation de la bibliothèque axios pour effectuer des requêtes HTTP
  import axios from "axios";
  import Articles from "./Articles.svelte";

  export let params = {};

  let categories = [];
  let articles = [];
 

  //Fonction qui permet d'aller chercher les 8 derniers articles postés, du plus récent au moins récent.
  const get_article = async () => {
      try {
      const response = await axios.get(
        import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article?limit=8&sort=-date_created"
      );
     // console.log(response.data.data)
      articles = response.data.data;
      return articles; 
    } catch (error) {
      //console.log(error);
    }
  };


  // Initialisation du tableau de catégories avec des valeurs manuelles
  const get_category = async () => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/category?limit=12" 
    );
    //console.log(response.data.data);
    categories = response.data.data;
    return categories;
  };
</script>


<main class="home_container" aria-label="Contenu principal">
 
  <section class="latest_articles" aria-label="Derniers articles">
    
    <h1>Nos articles récents</h1>
    
    <p>Lisez notre sélection d'article</p>
    

    <div class="container_categories_list">
    
    {#await get_article(params.id) }
      {:then articles}       
          {#each articles as article}
            <article class="lastest_articles_article" aria-label="Article"> 
                <img
                  src={"http://localhost:8055/assets/" + article.image_article}
                  alt={article.title}
                />
                
                <h2>{article.title}</h2>
                
                <p>
                  <!-- Extraire les 200 premiers caractères de l'article -->
                  {@html article.content.substring(0, 200)}
                  <!-- Revoir l'url, ça note la bonne mais ça ne nous amène pas à la page en question -->
                  <a href=/article/{article.id} use:link >...Lire l'article</a>
                </p>
               
                  <!-- {formattedDate} -->
                  {#if myDate}
                  <span>Posté le {formatDate(myDate)}</span>
                {:else}
                  <p>Chargement de la date...</p>
                {/if}
           

               

            </article>
          {/each}
    {/await}

  </div>
  </section>
  <!-- Fin de la section des derniers articles -->

  <!-- Une section pour afficher les catégories -->

  <section class="categories">
    <h1>Catégories</h1>

    {#await get_category()}
      {:then categories} 
      <article class="categories_list">
        {#each categories as category}
          <button>
            <a href=/articles/category/{category.id} use:link class="" title="" aria-label={category.name}>
              {category.name}</a
            ></button
          >
        {/each}
      </article>
    {/await}
  </section>
</main>
 <!-- Fin du contenu principal de la page -->



