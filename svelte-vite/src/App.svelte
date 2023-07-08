<script>
  import Router from "svelte-spa-router";
  import Home from "./lib/Home.svelte";
  import Header from "./lib/Header.svelte";
  import Footer from "./lib/Footer.svelte";
  import Contact from "./lib/Contact.svelte";
  import Profil from "./lib/Profil.svelte";
  import About from "./lib/About.svelte";
  import Article from "./lib/Article.svelte";
  import Articles from "./lib/Articles.svelte";
  




  const routes = {
    "/":Home,
    "/profil":Profil,
    "/about":About,
    "/contact":Contact,
    "/article": Article,
    "/articles": Articles,


  };


</script>

<Header />

<Router {routes}/> 

<Footer />