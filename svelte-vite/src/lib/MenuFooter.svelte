<script>

</script>

<ul class="info_footer">
    <!--'on:click' permet d'ouvrir le lien en cliquant dessus-->
    <li><a href="#" aria-label="Lien vers page Mentions Légales">Mentions légales</a></li>
    <li><a href="#/about" aria-label="lien vers page A propos">A propos</a></li>
    <li><a href="#/contact" aria-label="lien vers page contact">Contact</a></li>
  </ul>

  <style>
    .info_footer {
  display: flex;
}

.info_footer li {
  font-size: 1rem;
  margin: 0 .3rem;
}

.info_footer li a {
  text-decoration: none;
  color: #52443C;
  margin: 1rem;
  font-weight: 700;
}

/* Styles par défaut */

/* Styles pour les écrans de petite taille */
@media screen and (max-width: 600px) {
  /* Ajoutez ici les styles spécifiques pour les petits écrans */
 .info_footer {
    display: flex;
    justify-content: center; /* Centrer horizontalement */
    align-items: center; /* Centrer verticalement */
    flex-wrap: wrap; /* Gérer le retour à la ligne des éléments */
  }

  .info_footer li {
    flex: 0 0 100%; /* Chaque élément prend toute la largeur */
    text-align: center; /* Centrer le texte */
    margin-bottom: 0.3rem; /* Espacement entre les éléments */
  }
}


/* Styles pour les écrans de taille moyenne */
@media screen and (min-width: 601px) and (max-width: 1024px) {
  /* Ajoutez ici les styles spécifiques pour les écrans de taille moyenne */
}

/* Styles pour les grands écrans */
@media screen and (min-width: 1025px) {
  /* Ajoutez ici les styles spécifiques pour les grands écrans */
}
  </style>