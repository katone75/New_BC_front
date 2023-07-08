<script>
    const forms = [
        {
            label: "Nom",
            input: "text",
        },
        {
            label: "Prénom",
            input: "text",
        },
        {
            label: "E-mail",
            input: "email",
        },
        {
            label: "Pseudo",
            input: "text",
        },
        {
            label: "Mot de passe",
            input: "password",
        },
    ];

    const info = [
        {
            photo: "../src/assets/femme.jpg",
            name: "Melinda JACKSON",
        },
    ];

    const article = [
        {
            pic: "../src/assets/elephant.jpg",
            title: "'Titi' l'elephant ",
        },
        {
            pic: "../src/assets/cat.jpg",
            title: "Chat",
        },
        {
            pic: "../src/assets/dog1.jpg",
            title: "Chien",
        },
        {
            pic: "../src/assets/dog2.jpg",
            title: "Chien",
        },
        {
            pic: "../src/assets/dog3.jpg",
            title: "Chien",
        },
    ];
</script>

<main class="profil_container">
    <section class="profil_container_box">
        <h1><ion-icon name="person-circle-outline" aria-hidden="true"/>Profil</h1>

        <article class="profil_description">
            <div class="profil_description_header">
                <!-- Génére une boucle de l'utilisateur avec son image et son nom -->

                {#each info as profil}
                    <img src={profil.photo} alt="" />
                    <span>{profil.name}</span>
                {/each}
            </div>

            <div class="profil_description_form">
                <form action="">
                    <!-- Génére une boucle pour les informations du profil -->

                    {#each forms as form}
                        <label for="">{form.label}</label>
                        <input type={form.input} aria-label={form.label}/>
                    {/each}
                </form>

                <button>Supprimer le profil</button>
            </div>
        </article>
    </section>

    <section class="profil_items">
        <h1><ion-icon name="newspaper-outline" aria-hidden="true"/>Mes articles</h1>
        <article class="profil_items_article">
            <!-- Génére une boucle pour nos propres articles -->

            {#each article as articles}
                <div class="profil_items_article_content">
                    <img src={articles.pic} alt="" />
                    <h2>{articles.title}</h2>

                    <ion-icon name="pencil" aria-hidden="true"/>
                </div>
            {/each}
        </article>

        <h1><ion-icon name="star" aria-hidden="true"></ion-icon>Favoris</h1>
        <article class="profil_items_fav">

            <!-- Génére une boucle pour les articles en favoris -->
            {#each article as articles}
            <div class="profil_items_fav_content">
                <img src={articles.pic} alt="">
                <h2>{articles.title}</h2>
                <ion-icon name="trash-outline" aria-label="true"></ion-icon>
            </div>
            {/each}

           
        </article>
    </section>
</main>