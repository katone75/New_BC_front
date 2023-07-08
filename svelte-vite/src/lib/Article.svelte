<script>
    // @ts-nocheck
    import { link } from "svelte-spa-router";
    import axios from "axios";
    import { onMount } from 'svelte';
    import { format } from 'date-fns';
    import { fr } from 'date-fns/locale';
    import Favoris from "./Favoris.svelte";

    export let params = {};

    //Fonction pour mise en français de la date de publication
    let myDate;

    onMount(() => {
    // Supposons que myDate soit une valeur de date existante
    myDate = new Date();
    });

    function formatDate(date) {
    return format(date, 'dd MMMM yyyy', { locale: fr });
    }

    //Déclarations des variables utilisées
    let comments = [];
    let user = {};
    let article = null;
    let articlesYouMayLike = [];
    let message;
    let articles =[];


    //Fonction qui récupère l'article grâce à l'id dans l'url en paramètre
    const get_article = async (id) => {
        const response = await axios.get(
            import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article/" + id
        );
        
        article = response.data.data;
        //console.log(article);
        //articlesYouMayLike = await get_articlesYouMayLike();
        return article;
    };

    //Fonction qui récupère 3 articles de façon aléatoire
    const get_articlesYouMayLike = async () => {
        const response = await axios.get(
            import.meta.env.VITE_LOCAL_DIRECTUS + "/items/article"
        );
        //console.log(response.data.data);
        articles = response.data.data;
        shuffleArray(articles);

        // Récupérer les 3 premiers articles
        const articlesYouMayLike = articles.slice(0, 3);
        console.log(articlesYouMayLike);
        return articlesYouMayLike;
    };
    
    // Fonction pour mélanger un tableau de manière aléatoire (algorithme de Fisher-Yates)
    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
    }

    //Fonction qui récupère le writer de l'article grâce à l'id dans l'url en paramètre
    const get_writer = async () => {
        const response = await axios.get(
            import.meta.env.VITE_LOCAL_DIRECTUS +
            "/items/article/" + params.id + "?fields=*.*"
        );
        //console.log(response.data.data);
        user = response.data.data;
        return user;
    };


    //Fonction qui récupère les commentaires grâce à l'id dans l'url en paramètre
    const get_comments = async (comments) => {
        const response = await axios.get(
            import.meta.env.VITE_LOCAL_DIRECTUS +
                "/items/comment?filter[article][_eq]=" +
                params.id +
                "&fields=*.*"
        );
        //console.log(response.data.data);
        comments = response.data.data;
        return comments;
    };
    

    //Fonction qui permet de poster un commentaire si le user est connecté
    const post_comment=async()=>{
        const token = parseJwt(window.localStorage.getItem("token"));
        const response = await axios.post(

            import.meta.env.VITE_LOCAL_DIRECTUS + "/items/comment?fields=*.*",
            { 
                user_id: token.id,
                message, 
                article: params.id,

            },
            {
                headers: {
                        'Content-Type': 'application/json',
                        'Authorization': `Bearer ${token}`
                        }   

            }
            
        );
       
        console.log(response.data.data);
        return response.data.data;
    }; 


    const handleSubmit = async () => {
        //console.log(handleSubmit);
        const new_comment = await post_comment();
        //console.log(new_comment);     
        message="";
        
        // On ajoute le nouveau commentaire au tableau de comments (il sera rajouté à la BDD seulement)
        comments.push(new_comment);
        // ici on vient tout réassigner au tableau qui sera rerender (il prendra en compte cet ajout)
        comments= [...comments];
    };



</script>

<main class="article_container">
    <div class="section_container">
       {#await get_articlesYouMayLike()}       
            {:then articlesYouMayLike} 
            <section class="article_favorite">
                <h2>Articles que vous pourriez aimer</h2>
                    {#each articlesYouMayLike as article}
                        <div class="article_choice">
                        <img src={"http://localhost:8055/assets/" + article.image_article} alt="Image de l'article" />
                        <a href="/article/{article.id}" use:link>{article.title}</a>
                        </div>
                    {/each}
                
            </section>
       {/await}
          
          
    
        
        {#await get_article(params.id)}
            <p>Récupération des données...</p>
            {:then article}
                <section class="articlescontainer">
                    <h2 class="title_article">{article.title}</h2>
                   

                    <img src={"http://localhost:8055/assets/" + article.image_article} alt="Image de l'article" />

                     {#if myDate}
                        <span>Posté le {formatDate(myDate)}</span>
                      {:else}
                        <p>Chargement de la date...</p>
                      {/if}
                    <p>
                        {@html article.content}
                    </p>
                       
                    <div class="fav_container">
                       <!--  <Favoris/> -->
                       <button aria-label="Ajouter un article au favoris">
                        <span>Ajouter au favoris </span>
                      </button>
                    </div>

                </section>
        {/await}
        
        {#await get_writer(params.id)}
            {:then article}
                <section class="user_profil">
                    
                            <div class="user_profil_container">
                                <div class="user_profil_img">
                                    <img src={"http://localhost:8055/assets/" + article.user_id.avatar} alt="Photo de profil" />
                                    <span>{article.user_id.first_name} {article.user_id.last_name}</span>
                                </div>

                                <p>{article.user_id.description}</p>

                            </div>
        
                </section>
        {/await}
    </div>

    <section class="section_comment">
        <div class="section_comment_review">
            {#await get_comments(comments)}
                <p>Récupération des commentaires...</p>
            {:then comments}
                <h2>{comments.length} commentaire(s)</h2>
                {#each comments as comment}                 
                    <article>
                        <div class="profil_comment">
                            <span>
                                {comment.user_id.first_name}
                                {comment.user_id.last_name}
                            </span>

                            <div class="date_comment">
                                {#if myDate}
                                <span>{formatDate(myDate)}</span>
                              {:else}
                                <p>Chargement de la date...</p>
                              {/if}
                            </div>
                        </div>

                        <p>{comment.message}</p>

                        <a href="/">Répondre à ce commentaire</a>
                    </article>
                {/each}
            {/await}
        </div>

            
                <div class="form_comment">
                    <h2>Ajouter un commentaire</h2>
                    
                        <form on:submit|preventDefault={handleSubmit} action="">
                            <textarea
                                bind:value={message}
                                name=""
                                id=""
                                cols="30"
                                rows="10"
                                placeholder="Votre commentaire"
                            />
                            <button> <span>Ajouter un commentaire</span> </button>
                        </form>
                    
                </div>
            

    </section>
</main>