<script>

  let showImage = true; // Variable pour contrôler l'affichage de l'image
  
  let description = "Description de l'article"; // Remplacez par la description réelle de votre article
  
  const maxDescriptionLength = 100;
  const shortenedDescription = description.length > maxDescriptionLength ? `${description.substring(0, maxDescriptionLength)}...` : description;

</script>

<div class="card">
  {#if showImage}
    <img src="../src/assets/dog1.jpg" alt="Image de l'article" class="card-image">
  {/if}
  <div class="card-details">
    <p class="card-publisher">Nom de l'éditeur</p>
    <p class="card-date">Date de publication</p>
  </div>
  <div class="card-content">
    <h2 class="card-title">Titre de l'article</h2>
    <p class="card-description">{shortenedDescription}</p>
    <a href="#" class="card-link">Lire la suite</a>
  </div>
</div>

  <style>

.card {
  position: relative; /* Ajout d'une position relative à la carte */
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  background-color: #fff;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  width: 300px;
  min-height: min-content; /* Hauteur minimale du contenu */
  max-height: 500px; /* Hauteur maximale à ne jamais dépasser */
  margin-bottom: 20px;
  overflow: hidden; /* Masque le contenu qui dépasse */
}

.card-image {
  width: 100%;
  height: 200px; /* Hauteur fixe pour l'image */
  object-fit: cover; /* Redimensionne l'image pour couvrir toute la zone */
  border-radius: 5px;
  margin-bottom: 10px;
}

.card-title {
  font-size: 18px;
  margin-bottom: 5px;
}

.card-description {
  font-size: 14px;
  color: #666;
  margin-bottom: 10px;
}

.card-link {
  position: absolute; /* Positionnement absolu du lien */
  bottom: 10px; /* Distance du bas de la carte */
  right: 10px; /* Distance de la gauche de la carte */
  color: #007bff;
  text-decoration: none;
}

.card-link:hover {
  text-decoration: underline;
}

.card-details {
  display: flex;
  justify-content: space-between;
  align-items: baseline;
}

.card-publisher, .card-date {
  font-size: 12px;
  color: #999;
  margin-bottom: 5px;
}

  </style>