<script>
  import ArticleCard from "./ArticleCard.svelte";


</script>

<h1>Bienvenue sur Bloggers'Chronicles</h1>

<nav class="menu-bar">
  <ul class="menu-list">
    <li><a href="/">Septième.art</a></li>
    <li><a href="/">Littérature</a></li>
    <li><a href="/">Technologie</a></li>
    <li><a href="/">Sport</a></li>
    <li><a href="/">Divertissement</a></li>
    <li><a href="/">Animaux</a></li>
    <li><a href="/">Voyage</a></li>
    <li><a href="/">Gastronomie</a></li>
    <li><a href="/">Botanique</a></li>
    <li><a href="/">Musique</a></li>
    <li><a href="/">Science</a></li>
    <li><a href="/">Actualité</a></li>
  </ul>
</nav>


<main class="home-container">

  <section class="home-container_latest-article" id="latest-articles">
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div> 
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
    <div class="home-container_latest-article-block">
      <ArticleCard />
    </div>
  </section>
</main>




<style>
 h1 {
  font-size: 50px;
  text-align: center;
  margin: 30px 0;
}

h2, p {
  margin: 5px 0;
}

h2 {
  font-size: large;
}

.home-container {
  padding: 0 500px 10px;
}

.home-container_latest-article {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-wrap: wrap; /* Permet aux cartes de se retourner à la ligne */
}



.menu-bar {
  text-align: center;
  background-color: #FFF5EF;
  padding: 10px 0;
  margin: 100px 200px -100px;
  border-radius: 100px;
  overflow-x: auto; /* Activation du défilement horizontal */
  scroll-snap-type: x mandatory; /* Défilement horizontal avec arrêts nets */

}

.menu-list {
  list-style-type: none;
  margin: 0;
  padding: 0;
  display: flex;
  scroll-snap-type: x mandatory; /* Défilement horizontal avec arrêts nets */
  gap: 20px; /* Espacement entre les éléments */
  justify-content: space-around;
}

.menu-list li {
  margin-right: 20px;
  scroll-snap-align: start; /* Alignement avec les arrêts nets */
}

.menu-list li:last-child {
  margin-right: 0;
}

.menu-list li a {
  text-decoration: none;
  color: #333;
  padding: 5px;
  font-weight: bold;
}

.menu-list li a:hover {
  color: #ff6600;
}


/* Styles par défaut */

/* Styles pour les écrans de petite taille */
@media screen and (max-width: 600px) {
  /* Ajoutez ici les styles spécifiques pour les petits écrans */
  .home-container {
    padding: 0 20px; /* Modifiez la valeur selon vos besoins */
  }
  h1 {
    font-size: 30px; /* Modifiez la taille de police selon vos besoins */
    width: 100%; /* Prend la largeur du conteneur parent */
    margin-top: 20;
    margin-bottom: 0px;
  }
  
  .menu-bar {
    display: none; /* Cacher la barre de menu */
  }
}

/* Styles pour les écrans de taille moyenne */
@media screen and (min-width: 601px) and (max-width: 1024px) {
  /* Ajoutez ici les styles spécifiques pour les écrans de taille moyenne */
  

  .home-container {
    padding: 0 50px; /* Redéfinir le padding du conteneur */
  }
}

/* Styles pour les grands écrans */
@media screen and (min-width: 1025px) {
  /* Ajoutez ici les styles spécifiques pour les grands écrans */
  main {
    margin-top: 150px;
  }
  
  h1 {
    margin-top: 100px;
    font-size: 90px;
  }
}

</style>
