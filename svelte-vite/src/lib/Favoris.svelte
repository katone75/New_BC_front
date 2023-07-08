<script>
      let isFavorited = false;
 // Fonction pour basculer l'état de la variable isFavorited
 function toggleFavorite() {
        isFavorited = !isFavorited;
    }
  
</script>

<div class="fav_container">
  <a href="#" on:click|preventDefault={toggleFavorite}>
    {#if isFavorited}
          Retirer des favoris
      {:else}
          Ajouter aux favoris
      {/if}
  </a>
</div>