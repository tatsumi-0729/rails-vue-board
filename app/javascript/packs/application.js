/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/pages/layouts/application.html.erb

console.log('Hello World from Webpacker')

// import "@babel/polyfill";
import Vue from 'vue/dist/vue.esm';
import App from '../app.vue';
import Router from './router.js';
import axios from "axios";

new Vue({
  el: '#app',
  router: Router,
  axios,
  render: h => h(App)
})

export default {
  name: "global_footer",
  props: {
    msg: "記事詳細"
  },
};
