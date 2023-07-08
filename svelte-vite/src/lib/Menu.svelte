<script>

  import axios from "axios";

  import { link } from "svelte-spa-router";

  import Hamburger from "svelte-hamburger";
  import Login from "./Login.svelte";

  import slide from "svelte-transitions-slide";

  const transitionOptions = {
    duration: 800, // Durée de la transition en millisecondes
    delay: 0, // Délai avant le début de la transition en millisecondes
    opacity: 0, // Opacité initiale de l'élément
    x: 0, // Position horizontale initiale de l'élément
    y: 100, // Position verticale initiale de l'élément
    scaleX: 1, // Échelle horizontale initiale de l'élément
    scaleY: 0.5, // Échelle verticale initiale de l'élément
  };

  let open = false;

  let close = true;

  let categories = [];

  function toggleMenu() {
    open = !open;
  }

  function closeMenu() {
    open = false;
  }

  const get_category = async () => {
    const response = await axios.get(
      import.meta.env.VITE_LOCAL_DIRECTUS + "/items/category?limit=12" 
    );
    //console.log(response.data.data);
    categories = response.data.data;
    return categories;
  };
</script>
<nav>
  <ul class="link">
    <li>
      <a href=""> 
        <Darkmode/>
      </a>

    </li>
    <li>
      <a href="#">
        <ion-icon name="home-sharp" aria-hidden="true" />
      </a>
    </li>

    <li>
      <Login />
    </li>

    <li>
      <Hamburger
        --line-width="3px"
        class="hamburger"
        {open}
        on:click={toggleMenu}
      />
    </li>
  </ul>
</nav>

{#if open}
  <div class="menu" transition:slide={transitionOptions}>
    {#await get_category()}
    {:then categories} 
    <div class="menu_container">
      {#each categories as category}
        <button on:click={closeMenu} >
          <a href=/articles/category/{category.id} use:link class="" title="" aria-label={category.name}>
            {category.name}</a
          >
        </button>
      {/each}
    </div>
    {/await}
  </div>
{/if}

<style>

	:global(*) {
		background: var(--bg-color);
		color: var(--text-color);
	}
	
	:global(*.dark) {
		--bg-color: #000000;
		--text-color: #FFFFFF;
	}
</style>
