<script>

  let contactData = {
    lastname: '',
    firstname: '',
    mail: '',
    message: ''
  };

  let showModal = false;

  function handleSubmit(event) {
    event.preventDefault(); // Empêche le rechargement de la page

    // Logique de gestion de la soumission du formulaire ici
    console.log(contactData);

    // Réinitialiser les champs de saisie
    contactData = {
      lastname: '',
      firstname: '',
      mail: '',
      message: ''
    };

    // Afficher la modale
    showModal = true;
  }

  function closeModal() {
    // Cacher la modale
    showModal = false;
  }
</script>

<main class="contact_form">
  <h1>Contact</h1>

  <form id="contact-form">
    <div class="form_header">
      <div class="form_header_lastname">
        <label for="nom">Nom</label>
        <input type="text" id="nom" bind:value={contactData.lastname} placeholder="Nom" required>
      </div>

      <div class="form_header_firstname">
        <label for="prenom">Prénom</label>
        <input type="text" id="prenom" bind:value={contactData.firstname} placeholder="Prénom" required>
      </div>
    </div>

    <label for="mail">Mail</label>
    <input type="email" id="mail" bind:value={contactData.mail} placeholder="abc@exemple.fr" required>

    <label for="message">Message</label>
    <textarea id="message" bind:value={contactData.message} cols="30" rows="10" placeholder="Votre message ici" required></textarea>

    <button type="submit" aria-label="Envoyer"> <span>Envoyer</span> </button>
  </form>

  <!-- Modale -->
  {#if showModal}
  <div class="modal" on:click={closeModal}>
    <div class="modal-content" on:click={(event) => event.stopPropagation()}>
      <h2>Votre message a été envoyé</h2>
      <button on:click={closeModal}>Fermer</button>
    </div>
  </div>
  {/if}
</main>


<style>


</style>