<main class="contact-container">
  <h1>Contactez-nous</h1>
  <p>Vous pouvez utiliser le formulaire ci-dessous pour nous envoyer un message. Nous vous répondrons dès que possible.</p>
  <form>
    <div class="form-group">
      <label for="name">Nom :</label>
      <input type="text" id="name" name="name" required>
    </div>
    <div class="form-group">
      <label for="email">Email :</label>
      <input type="email" id="email" name="email" required>
    </div>
    <div class="form-group">
      <label for="message">Message :</label>
      <textarea id="message" name="message" rows="5" required></textarea>
    </div>
    <button type="submit">Envoyer</button>
  </form>
</main>

<style>
  .contact-container {
    margin: 0 auto;
    padding: 20px;
    text-align: center;
    display: block;
    text-align: center;
    margin: 20px;
  }

  h1 {
    color: #52443C;
    font-size: xx-large;
    margin: 20px;
  }

  p {
    margin-bottom: 20px;
  }

  form {
    display: inline-block;
    text-align: left;
  }

  .form-group {
    margin-bottom: 10px;
    width: 300px;
  }

  label {
    display: block;
    font-weight: bold;
  }

  input,
  textarea {
    width: 100%;
    padding: 5px;
  }

  button {
    display: block;
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #CD9985;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
  }
</style>
