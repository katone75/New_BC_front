<script>



  const aboutUs = [
      {
        title: "Qui sommes-nous?",
        content: " Nous sommes Dylan, Jéromine, Karen, Othmane et Sarousy, les esprits créatifs derrière le blog Bloggers'Chronicles. Nous nous sommes rencontrés lors de notre formation chez O'Clock, et notre passion commune pour une multitude de sujets nous a inspirés à créer cet espace en ligne. Nous sommes des amoureux du cinéma, de la littérature, de la technologie, du sport, du divertissement, des animaux, des voyages, de la gastronomie, de la botanique, de la musique, de la science et des actualités. À travers notre blog, nous partageons nos connaissances, nos réflexions et nos découvertes avec nos lecteurs, dans l'espoir d'inspirer et d'informer. Nous sommes une équipe dynamique, passionnée et curieuse, prête à explorer et à couvrir ces sujets variés pour offrir une expérience enrichissante à tous ceux qui nous suivent. Rejoignez-nous dans cette aventure passionnante au sein de Bloggers'Chronicles! "
      },
      {
        title: "Origine du Blog",
        content: "Le blog Bloggers'Chronicles a été crée par Dylan, Jéromine, Karen, Othmane et Sarousy. Nous nous sommes rencontrés lors de notre formation chez O'Clock pour l'Apothéose. Animés par notre amour pour le septième art, la littérature, la technologie, le sport, le divertissement, les animaux, les voyages, la gastronomie, la botanique, la musique, la science et les actualités, nous avons décidé de créer un espace virtuel où nous pourrons partager nos passions avec d'autres passionnés. Ainsi est né Bloggers'Chronicles, un blog riche en articles variés qui abordent des sujets avec enthousiasme et expertise, captivant ainsi leurs lecteurs à chaque nouvelle publication."
      }
    ];
  
  </script>
  
  <main class="about_container">
     <!-- aria-hidden="true" indique aux technologies d'assistance de ne pas la prendre en compte.-->
      <section class="about_container_bg" aria-hidden="true">
        <!-- Tableau d'objets comprenant les propriétés 'title' et 'content'   -->
      </section>
    
      <section class="about_container_description">
        <h1>A propos de Bloggers'Chronicles</h1>
        <div class="bg_responsive" role="presentation" aria-hidden="true"></div>
    
        <!--boucle {#each aboutUs as about} affiche les informations contenues dans la variable aboutUs-->
        {#each aboutUs as about}
          <article class="about_container_description_text">
            <h2>{about.title}</h2>
            <p>{about.content}</p>
          </article>
        {/each}
      </section>
    </main>