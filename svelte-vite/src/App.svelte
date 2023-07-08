<script>
  
  import Router from "svelte-spa-router";

   // Import the wrap methodc  xx  
   import {wrap} from 'svelte-spa-router/wrap'

  import Header from '../src/lib/Header.svelte'
  import Footer from '../src/lib/Footer.svelte'
  // @ts-ignore
  import Home from './lib/Home.svelte'
  import Profil from './lib/Profil.svelte'
  import Articles from './lib/Articles.svelte'
  import Article from './lib/Article.svelte';
  import Contact from './lib/Contact.svelte';
  import About from './lib/About.svelte';
  import Create from './lib/Create.svelte';
  import Edit from './lib/Edit.svelte';
 


  const routes = {
    "/": Home,
    "/profil": Profil,
    "/create" : Create,
    "/article/:id/edit" : Edit,
    "/articles/:category/:id" : Articles, 
    "/article/:id/" : Article,
    "/contact" : Contact,
    "/about" : About,
    "*": Home,
  };


</script>

<Header />


<Router {routes}/> 



<Footer />


