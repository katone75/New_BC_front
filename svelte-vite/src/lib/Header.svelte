<script>
  // @ts-nocheck

  import plume from "../assets/plume.png";
  import nom from "../assets/nom.png";
  import Menu from "../../src/lib/Menu.svelte";
  const homeURL = "/";
</script>

<header>

  <a href= {homeURL} aria-label="Accueil">
  <img class="img_plume" src="{plume}" alt="Logo de la plume">
  </a>
  <a href={homeURL} aria-label="Accueil">
  <img class="img_title" src="{nom}" alt="Titre du site">
  </a>
  <Menu aria-label="Menu principal"/>

  <script
    type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
  ></script>
  <script
    nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
  ></script>
</header>
