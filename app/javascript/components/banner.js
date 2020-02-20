import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.banner-typed-text', {
    strings: ["Asterix", "Lanfeust", "Black Sad", "Gaston Lagaffe", "Akira", "Largo Winch"],
    typeSpeed: 100,
    attr: 'placeholder',
    bindInputFocusEvents: true,
    loop: true
  });
}



export { loadDynamicBannerText };
