// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------
import "../plugins/flatpickr"
import "bootstrap";
import { scrolledNav } from '../components/navbar';
import { stopCarousel } from '../components/carousel';
import { loadDynamicBannerText } from '../components/banner';
import { initMapbox } from '../plugins/init_mapbox';
import { initFlatPickr } from '../plugins/flatpickr';

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  // [...]
  initFlatPickr();
  scrolledNav(); // scroll effect of the navbar on Home Page
  stopCarousel(); // stop boostrap carousel (for preview) to autoplay
  initMapbox();

  loadDynamicBannerText();
});

