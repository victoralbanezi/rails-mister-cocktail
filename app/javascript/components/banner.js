import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  new Typed('#banner-typed-text', {
    strings: ["Find your favorite drink!"],
    typeSpeed: 100,
    loop: false
  });
}

export { loadDynamicBannerText };