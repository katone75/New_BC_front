<script>
    const forms = [
        {
            label: "Pseudo",
            input: "text",
        },
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
       /*  {
            label: "Mot de passe",
            input: "password",
        }, */
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

    <div class="profil_section">
        <h1><ion-icon name="person-circle-outline" aria-hidden="true"/>Profil</h1>
        
        <div class="profil_box profil_box_large">
            <article class="profil_description">
                <div class="profil_description_header">
                    <!-- Boucle pour l'utilisateur avec son image et son nom -->
                    {#each info as profil}
                        <img src={profil.photo} alt="" />
                        <span>{profil.name}</span>
                    {/each}
                </div>

                <div class="profil_description_form">
                    <form action="" class="form-container">
                      <!-- Boucle pour les informations du profil -->
                      {#each forms as form}
                        <div class="form-group">
                          <label for="">{form.label}</label>
                          <input type={form.input} aria-label={form.label}/>
                        </div>
                      {/each}
                    </form>
                    <button>Supprimer le profil</button>
                  </div>
                  
            </article>
        </div>
    </div>

    <div class="profil_items">
        <div class="profil_items_section">
          <h1><ion-icon name="newspaper-outline" aria-hidden="true"/>Mes articles</h1>
          <div class="profil_box">
            <article class="profil_items_article">
              <!-- Boucle pour nos propres articles -->
              <div class="profil_items_article_content">
                {#each article as articles}
                  <div class="profil_item">
                    <img src={articles.pic} alt="" width="200" height="150" />
                    <h2>{articles.title}</h2>
                    <ion-icon name="pencil" aria-hidden="true"/>
                  </div>
                {/each}
              </div>
            </article>
          </div>
        </div>
      
        <div class="profil_items_section">
          <h1><ion-icon name="star" aria-hidden="true"></ion-icon>Favoris</h1>
          <div class="profil_box">
            <article class="profil_items_fav">
              <!-- Boucle pour les articles en favoris -->
              <div class="profil_items_fav_content">
                {#each article as articles}
                  <div class="profil_item">
                    <img src={articles.pic} alt="" width="200" height="150" />
                    <h2>{articles.title}</h2>
                    <ion-icon name="trash-outline" aria-label="true"></ion-icon>
                  </div>
                {/each}
              </div>
            </article>
          </div>
        </div>
      </div>
      

</main>


<style>

h1 {
    margin: 10px;
}

.profil_description_header img,
.profil_items_article_content img,
.profil_items_fav_content img {
  width: 150px;
  height: 150px;
  object-fit: cover;
}


.profil_item {
  display: inline-block;
  margin: 10px; /* Espacement entre les articles */
}

.profil_box {
  border-radius: 10px;
  background-color: #f2f2f2;
  padding: 5px;
  margin: 20px;
}

.profil_box_large {
  padding: 20px; /* Augmenter le padding pour agrandir la section */
}

.profil_items_section {
  display: flex;
  flex-direction: column;
}

.profil_items_article_content,
.profil_items_fav_content {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-between;
}

.form-container {
  display: flex;
  flex-direction: column;
  flex-grow: 1;
}

.form-group {
  margin-bottom: 10px;
}

label {
  display: block;
  margin-bottom: 5px;
}

input {
  width: 100%;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

</style>


