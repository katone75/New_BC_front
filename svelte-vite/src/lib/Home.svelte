<script>
  /*   onMount est une fonction de cycle de vie fournie par Svelte. Elle est appelée lorsqu'un composant est monté et inséré dans le DOM. Cela signifie qu'au moment où onMount est exécuté, le composant est déjà rendu dans le navigateur et est prêt à être manipulé.*/
 
  import { onMount } from "svelte";
  import axios from "axios";

  
  onMount(() => {
    /* ... */
  });

  let articles = [
    {
      imgSrc: "../assets/books.jpg",
      title: "Harry Potter",
      content:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus, eaque.",
      date: "Il y a 3 jours",
    },
    {
      imgSrc: "../assets/pâte.jpg",
      title: "Pâte à la carbonara",
      content:
        "Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus, eaque.",
      date: "Il y a 3 jours",
    },
  ];

  let categories = [
    "Septième-art",
    "Litérrature",
    "Technologie",
    "Sport",
    "Divertissement",
    "Animaux",
    "Musique",
    "Actualité",
    "Science",
    "Voyage",
    "Gastronomie",
    "Botanique",
  ];
</script>

<main class="home_container">
  <section class="latest_articles">
    <h1>Nos derniers articles les plus récents</h1>
    <p>
      Lisez une sélection d'articles de catégorie de renommée mondial
    </p>
    <!-- A dynamiser -->
    {#each articles as article}
      <article class="lastest_articles_article">
        <img src={article.imgSrc} alt="" />
        <h2>{article.title}</h2>
        <p>{article.content}</p>
        <span>{article.date}</span>
      </article>
    {/each}
  </section>

  <section class="categories">
    <h1>Catégories</h1>

    <article class="categories_list">
      {#each categories as category}
        <button>{category}</button>
      {/each}
    </article>
  </section>
</main>





