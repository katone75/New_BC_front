
<ul class="social">
    <li><ion-icon name="logo-linkedin" aria-label="LinkedIn" /></li>
    <li><ion-icon name="logo-twitter" aria-label="Twitter" /></li>
    <li><ion-icon name="logo-instagram" aria-label="Instagram" /></li>
    <li><ion-icon name="logo-facebook" aria-label="Facebook" /></li>
</ul>

<style>
    .social {
  display: flex;
}

.social li {
  font-size: 1.8rem;
  margin: .3rem;
}

.social li ion-icon {
  color: darkbrown;
  margin: .5rem;
}
 
/* Styles pour les écrans de petite taille */
@media screen and (max-width: 600px) {
  /* Ajoutez ici les styles spécifiques pour les petits écrans */

  .info_footer {
    width: 100%;
    display: flex;
    justify-content: center;
  }

  .social {
    display: none; /* Masquer le composant ReseauxSociaux */
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