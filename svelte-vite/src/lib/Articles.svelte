<script>
  // @ts-nocheck

  import axios from "axios";
  import { link } from "svelte-spa-router";
  export let params = {};

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
  let article = [];
  let articles = [];
  let categorie = [];

  const get_articles = async (id) => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS +
      "/items/article?filter[Category][_eq]=" + id +  "&fields=*,user_id.*"

    );
    
    //console.log(response.data.data);

    articles = response.data.data;
    return articles;
  };

  

  const get_category = async () => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/category/" + params.id
    );
    //console.log(response.data.data);
    categorie = response.data.data;
    return categorie;
  };


  
</script>
<main class="container_section_articles">
  {#await get_category(params.id)}
  {:then category} 
    <h1 aria-label={category.name}>{category.name}</h1>
  {/await}



  {#await get_articles (params.id)}
  {:then articles} 

  <section class="articles_container">
    {#each articles as article}
      <article class="articles_container_article">
        <img
          src={"http://localhost:8055/assets/" + article.image_article}
          alt=""
        />
        <h2 class="title_article">
          <a href=/article/{article.id} use:link>{article.title}</a>
        </h2>
        <p>
          {@html article.content.substring(0, 300)} <a href=/article/{article.id} use:link >...Lire l'article</a>
      </p>


        <div class="profil">
          <img
            src={"http://localhost:8055/assets/" + article.user_id.avatar}
            alt=""
          />


          <div class="profil_user">
            <span>{article.user_id.first_name} {article.user_id.last_name}</span>
             {#if myDate}
              <span>Posté le {formatDate(myDate)}</span>
            {:else}
              <p>Chargement de la date...</p>
            {/if}
          </div>

        </div>



        <div class="category">
          <!-- {#each article.category as category}
                    <span>{category.name}</span>
                {/each} -->
        </div>
      </article>
    {/each}
  </section>
  {/await}

</main>