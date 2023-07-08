<script>

  let isModalOpen = false;

  function toggleModal() {
    isModalOpen = !isModalOpen;
  }
</script>


<nav>
  <ul class="link">
    <li><a href="/"><ion-icon name="home-outline" aria-label="Accueil"></ion-icon></a></li>
    <li><a href="/#/profil"><ion-icon name="person-circle-outline" aria-label="Profil"></ion-icon></a></li>
    <li on:click={toggleModal}><ion-icon name="menu-outline" aria-label="Menu"></ion-icon></li>
  </ul>
</nav>

{#if isModalOpen}
  <div class="modal">
    <div class="theme-background">
      <nav class="menu-bar">
        <h1>Sélectionnez une catégorie.</h1>
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
      <button on:click={toggleModal}>Fermer</button>
    </div>
  </div>
{/if}

  
  
<style>
  /* Styles pour la modal */
  .modal {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    display: flex;
    justify-content: center;
    align-items: center;
    z-index: 9999;
  }

  .modal button {
    font-size: 1.2rem;
    padding: 0.5rem 1rem;
    background-color: #52443C; /* Couleur du site */
    color: #FFF; /* Couleur du texte */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    display: block;
    margin: 0 auto;
  }

  h1 {
    margin: 20px;
    font-size: x-large;
  }


  /* Styles pour les liens */
  .link {
    display: flex;
  }

  .link li {
    font-size: 1.8rem;
    margin: 0.3rem;
  }

  .link li ion-icon {
    margin: 0.5rem;
  }

  /* Styles pour la barre de menu */
  .menu-bar {
    text-align: center;
    background-color: #FFF5EF;
    padding: 10px 80px;
    margin: 0 20px;
    border-radius: 10px;
    overflow-x: auto;
    scroll-snap-type: x mandatory;
    justify-content: space-between;
  }

  /* Styles pour les liens */
  .menu-list {
    list-style-type: none;
    margin: 0;
    padding: 0;
  }

  .menu-list li {
    margin-bottom: 10px;
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
</style>
