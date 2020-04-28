import Typed from 'typed.js';

const loadDynamicBannerText = () => {
  console.log("load typed")
  new Typed('#banner-typed-text', {
    strings: ["Find your favorite drink!"],
    typeSpeed: 100,
    loop: false
  });
}

// const loadDynamicSearchText = () => {
//   new Typed('#search-typed-text', {
//     strings: ["Search..."],
//     typeSpeed: 200,
//     loop: false
//   });
// }

export { loadDynamicBannerText };