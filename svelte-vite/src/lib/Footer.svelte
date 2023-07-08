<script>
  // window.open(pdfPath,'_blank') est utilisé pour ouvrir le lien vers le pdf dans une nouvelle fenetre/onglet
  function openPDF() {
    const pdfPath =
      "https://drive.google.com/file/d/18XevucRvkPc3id3dUSm-pidKGytYnEjv/view?usp=share_link";
    window.open(pdfPath, "_blank");
  }

  import Contact from "./Contact.svelte";
</script>

<footer>
  <ul class="info_footer">
    <!--'on:click' permet d'ouvrir le lien en cliquant dessus-->
    <li>
      <a
        href="#"
        on:click={openPDF}
        aria-label="Lien vers page Mentions Légales">Mentions légales</a
      >
    </li>
    <li><a href="#/about" aria-label="lien vers page A propos">A propos</a></li>
    <li><a href="#/contact" aria-label="lien vers page contact">Contact</a></li>
  </ul>

  <ul class="social">
    <li><ion-icon name="logo-linkedin" aria-label="LinkedIn" /></li>
    <li><ion-icon name="logo-twitter" aria-label="Twitter" /></li>
    <li><ion-icon name="logo-instagram" aria-label="Instagram" /></li>
    <li><ion-icon name="logo-facebook" aria-label="Facebook" /></li>
  </ul>

  <script
    type="module"
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"
  ></script>
  <script
    nomodule
    src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"
  ></script>

</footer>
