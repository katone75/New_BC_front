<script>
  // @ts-nocheck
  
  
  const createArticle = {
      title: '',
      image: null,
      content: ''
    };
  
    function handleSubmit() {
     
      console.log(createArticle);
    }
  
  </script>
  
  <main class="create_form">
      <h1><ion-icon name="create-outline"></ion-icon>Ecrire un article</h1>
    
      <form method="post" action="" enctype="multipart/form-data" on:submit|preventDefault={handleSubmit}>
        <div class="title_form">
          <label for="article_title">Titre de l'article :</label>
          <input type="text" id="article_title" name="article_title" bind:value={createArticle.title}>
        </div>
    
        <div class="img_form">
          <label for="article_image">Image :</label>
          <input type="file" id="article_image" name="article_image" on:change={(e) => createArticle.image = e.target.files[0]}>
        </div>
    
        <label for="article_content">Contenu de l'article :</label>
        <textarea name="editor" bind:value={createArticle.content}></textarea>
    
        <div class="btn">
          <button type="submit">Publier</button>
          <button type="button">Annuler</button>
        </div>
      </form>
    </main>