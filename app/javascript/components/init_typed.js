import Typed from 'typed.js';

const loadDynamicBannerText = () => {
 
  if (document.getElementById("banner-typed-text") != null) {

    new Typed('#banner-typed-text', {
      strings: ["Find your favorite drink!"],
      typeSpeed: 100,
      loop: false
    });
  }
}


export { loadDynamicBannerText };