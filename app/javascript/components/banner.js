import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('.banner-typed-text', {
    strings: ["As Chuck Norris", "types with one finger."],
    typeSpeed: 50,
    loop: true
  });
}

export { loadDynamicBannerText };
