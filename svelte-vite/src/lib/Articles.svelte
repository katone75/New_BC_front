<script>
  
  
      let title = 'Animaux';
  
   const oneArticle = [
          {
              pic: "../src/assets/elephant.jpg",
              title: "'Titi' l'elephant ",
              author : "../src/assets/homme.jpg",
              name: "Robert BROWN",
  
          },
          {
              pic: "../src/assets/cat.jpg",
              title: "Chat",
              author : "../src/assets/femme.jpg",
              name: "Melinda JACKSON",
  
  
          },
          {
              pic: "../src/assets/dog1.jpg",
              title: "Chien et chat",
              author : "../src/assets/homme.jpg",
              name: "Robert BROWN",
  
          },
          {
              pic: "../src/assets/dog2.jpg",
              title: "Chien",
              author : "../src/assets/femme.jpg",
              name: "Melinda JACKSON",
  
  
          },
      ];
  
  </script>
  
  <main class="container_section_articles">
      <h1>{title}</h1>
  
      <section class="articles_container">
  
          {#each oneArticle as article}
          <article class="articles_container_article">
              <img src={article.pic} alt="" />
  
              <h2 class="title_article">{article.title}</h2>
  
              <p>
                  Lorem ipsum dolor sit amet consectetur, adipisicing elit.
                  Laboriosam, porro. Cum debitis labore quod mollitia. Eaque quam
                  asperiores odit distinctio!?
              </p>
  
              <p>
                  Lorem ipsum dolor sit amet consectetur adipisicing elit.
                  Doloribus optio quis perferendis nisi eaque officiis quia enim
                  aspernatur quibusdam expedita??
              </p>
  
              <div class="profil">
                  <img src={article.author} alt="" />
                  <div class="profil_user">
                      <span>{article.name}</span>
                      <span> il y a 3 jours</span>
                  </div>
              </div>
          </article>
  
          {/each}
  
      </section>
  </main>