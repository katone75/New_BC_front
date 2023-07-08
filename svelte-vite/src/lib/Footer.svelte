<script>
  import MenuFooter from "./MenuFooter.svelte";
  import ReseauxSociaux from "./ReseauxSociaux.svelte";
   </script>
   
   <footer>
    
     <MenuFooter />
     <ReseauxSociaux />
   
     <script
       type="module"
       src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
     ></script>
     <script
       nomodule
       src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
     ></script>
   
   </footer>
   
   <style>
 
     footer {
   display: flex;
   width: auto;
   height: 50px;
   justify-content: space-between;
   align-items: center;
   border-top: 1px solid;
   padding: .5rem;
   height: 50px;
   background-color: #FFF5EF;
   margin-top: auto; /* Le footer sera automatiquement positionné en bas */
 }
 
 /* Styles par défaut */
 
 /* Styles pour les écrans de petite taille */
 @media screen and (max-width: 600px) {
   /* Ajoutez ici les styles spécifiques pour les petits écrans */
   footer {
     flex-direction: column;
     align-items: center;
   }
 
 
   .info_footer, .social {
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