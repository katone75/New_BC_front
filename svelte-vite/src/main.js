import './scss/style.scss'
import '../src/API.js'
import App from './App.svelte'


const app = new App({
  target: document.getElementById('app'),
})

export default app
