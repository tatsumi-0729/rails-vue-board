import Vue from 'vue/dist/vue.esm';
import VueRouter from 'vue-router';
import Top from './pages/top.vue'
import Reference from './pages/reference.vue'

Vue.use(VueRouter);

const routes = [
  { path: '/', name: 'Top', component: Top },
  { path: '/reference', name: 'Reference', component: Reference }
]

const router = new VueRouter({
  mode: "history",
  routes: routes
})

export default router
