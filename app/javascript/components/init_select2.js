import $ from 'jquery';
import 'select2';

import 'select2/dist/js/select2.full.min.js';

const initSelect2 = () => {
  $('.select2').select2();
};


export { initSelect2 };