<script>
    /*  import "../partials/colors.scss"; */
     import plume from "../assets/plume.png";
     import nom from "../assets/nom.png";
     import Menu from "../../src/lib/Menu.svelte";
     const homeURL = "/";
   </script>
   
   <header>
     <a href={homeURL} aria-label="Accueil">
       <img class="img_plume" src={plume} alt="Logo de la plume" />
     </a>
     <a href={homeURL} aria-label="Accueil">
       <img class="img_title" src={nom} alt="Titre du site" />
     </a>
     <Menu aria-label="Menu principal" />
   </header>
   
   <style>
     /* Début header */
     header {
       display: flex;
       width: auto;
       height: 80px;
       justify-content: space-between;
       align-items: center;
       border-bottom: 1px solid;
       padding: 0.5rem;
       background-color: #FFF5EF;
       
     }
   
     .img_title {
       width: 300px;
       height: 75px;
     }
   
     .img_plume {
       width: 60px;
       height: 60px;
     }
   
     .link {
       display: flex;
     }
   
     .link li {
       margin: 0.3rem;
       
     }
   
     .link li ion-icon {
       font-size: 2.6rem;
       margin: 0.5rem;
       color: #CD9985;
     }
   
     /* Fin header */
   
     /* Styles par défaut */
   
   /* Styles pour les écrans de petite taille */
   @media screen and (max-width: 600px) {
     /* Ajoutez ici les styles spécifiques pour les petits écrans */
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
   