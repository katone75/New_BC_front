<script>
  import fade from "svelte-transitions-fade";
  import axios from "axios";
  import { push } from "svelte-spa-router";

  let open = false; // Indique si la modal est ouverte ou fermée
  let inscription = false; // Indique si le formulaire d'inscription est affiché
  let password = false; // Utilisé pour la gestion du mot de passe

  let errorLogin = ""; // Message d'erreur de la connexion
  let errorSignup = ""; // Message d'erreur de l'inscription

  let emailInModalLogin = ""; // E-mail saisi dans le formulaire de connexion
  let passwordInModalLogin = ""; // Mot de passe saisi dans le formulaire de connexion

  let emailInModalSignup = ""; // E-mail saisi dans le formulaire d'inscription
  let passwordInModalSignup = ""; // Mot de passe saisi dans le formulaire d'inscription
  let confirmPasswordInModalSignup = ""; // Confirmation du mot de passe saisi dans le formulaire d'inscription

  // Ces regex sont utilisées pour valider les entrées de l'utilisateur lors de la connexion et de l'inscription.
  const emailRegex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
  const passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;

  const handleSubmitLogin = async () => {
    try {
      if (!emailRegex.test(emailInModalLogin)) {
        errorLogin = "Veuillez entrer un email valide.";
        return;
      }

      if (!passwordRegex.test(passwordInModalLogin)) {
        errorLogin =
          "Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre.";
        return;
      }

      const response = await login();
      if (response) {
        const token = response.data.data.access_token;
        if (token) {
          // successLogin = "Vous êtes connecté avec succès!";
          window.localStorage.setItem("token", token);
          await push("/profil");
          open = false; // Ferme la modal si la connexion réussit en modifiant la valeur de 'open'
        } else {
          errorLogin = "E-mail ou mot de passe incorrect.";
        }
      }
    } catch (error) {
      console.error(error);
    }
  };

  const handleSubmitSignup = async () => {
    if (!emailRegex.test(emailInModalSignup)) {
      errorSignup = "Veuillez entrer un email valide.";
      return;
    }

    if (!passwordRegex.test(passwordInModalSignup)) {
      errorSignup =
        "Le mot de passe doit contenir au moins 8 caractères, une majuscule, une minuscule et un chiffre.";
      return;
    }

    if (passwordInModalSignup !== confirmPasswordInModalSignup) {
      errorSignup = "Les mots de passe ne correspondent pas.";
      return;
    }

    const user = await signup();
    if (user) {
      open = true;
      inscription = false;
    }
  };

  let isConnected = false; // Indique si l'utilisateur est connecté ou non

  const login = async () => {
    try {
      const response = await axios.post(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/auth/login`,
        { email: emailInModalLogin, password: passwordInModalLogin }
      );
      // Connexion réussie
      isConnected = true;
      // console.log("Vous êtes connecté");

      // Réinitialiser la variable isConnected après 3 secondes
      setTimeout(() => {
        isConnected = false;
      }, 5000);

      return response;
    } catch (error) {
      errorLogin = "Email ou mot de passe incorrect";
      console.error(
        "Une erreur s'est produite lors de la tentative de connexion :",
        error
      );
    }
  };

  const signup = async () => {
    try {
      const response = await axios.post(
        `${import.meta.env.VITE_LOCAL_DIRECTUS}/users`,
        {
          email: emailInModalSignup,
          password: passwordInModalSignup,
          role: "437d235f-8fbf-4f56-9f2d-37337d99c6fa",
          avatar: "056fb6b6-aa60-4b32-a350-2aff26cbb6df",
        }
      );
      return response.data.data;
    } catch (error) {
      console.error(
        "Une erreur s'est produite lors de la création du compte :",
        error
      );
    }
  };
</script>


<li>
  <a href="#">
    <ion-icon
      name="person-circle-outline"
      aria-hidden="true"
      on:click={() => (open = !open)}
    />
  </a>
</li>



{#if open}
  <div class="login_profil show" transition:fade>
    <div class="login">
      <ion-icon
        class="close"
        name="close-circle-outline"
        on:click={() => (open = false)}
      />
      <h1>Connexion</h1>
      {#if errorLogin}
        <div class="error-message">{errorLogin}</div>
      {/if}
      {#if isConnected}
        <div>Vous êtes connecté</div>
      {/if}

      <form on:submit|preventDefault={handleSubmitLogin}>
        <label for="email">E-mail</label>
        <input
          type="email"
          id="email"
          bind:value={emailInModalLogin}
          required
        />
        <label for="password">Mot de passe</label>
        <input
          type="password"
          id="password"
          bind:value={passwordInModalLogin}
          required
        />
        <a href="#" on:click={() => (password = true)}>Mot de passe oublié ?</a>
        <button type="submit">Connexion</button>
      </form>

      <p>
        Vous n'avez pas encore de compte? <a
          href="#"
          on:click|preventDefault={() => {
            open = false;
            inscription = true;
          }}>S'inscrire</a
        >
      </p>
    </div>
  </div>
{/if}

{#if inscription}
  <div class="sign_profil show" transition:fade>
    <div class="sign">
      <ion-icon
        class="close"
        name="close-circle-outline"
        on:click={() => (inscription = false)}
      />
      <h1>Inscription</h1>
      <p>{errorSignup}</p>
      <form on:submit|preventDefault={handleSubmitSignup}>
        <label for="emailSignup">E-mail</label>
        <input
          type="email"
          id="emailSignup"
          bind:value={emailInModalSignup}
          required
        />
        <label for="passwordSignup">Mot de passe</label>
        <input
          type="password"
          id="passwordSignup"
          bind:value={passwordInModalSignup}
          required
        />
        <label for="confirmPasswordSignup">Confirmez le mot de passe</label>
        <input
          type="password"
          id="confirmPasswordSignup"
          bind:value={confirmPasswordInModalSignup}
          required
        />
        <button type="submit">Inscription</button>
      </form>
    </div>
  </div>
{/if}

{#if password}
  <div class="sign_profil show" transition:fade>
    <div class="sign">
      <ion-icon
        class="close"
        name="close-circle-outline"
        on:click={() => (password = false)}
      />
      <h1>Mot de passe oublié</h1>
      <form action="">
        <label for="emailPasswordReset">E-mail</label>
        <input
          type="email"
          id="emailPasswordReset"
          placeholder="votreemail@exemple.fr"
          required
        />

        <button type="submit">Envoyer</button>
      </form>
    </div>
  </div>
{/if}


<style>
  p {
    margin: 20px;
    text-align: center;
    font-size: large;
  }
</style>