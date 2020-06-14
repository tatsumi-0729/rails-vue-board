import Vue from "vue/dist/vue.esm";
import VueRouter from "vue-router";
import Top from "./pages/top.vue";
import Search from "./pages/search.vue";
import Reference from "./pages/reference.vue";
import NewArticle from "./pages/newArticle.vue";
import Login from "./pages/login.vue";
import NewUser from "./pages/newUser.vue";

Vue.use(VueRouter);

const routes = [
  { path: "/", name: "Top", component: Top },
  { path: "/search", name: "Search", component: Search },
  { path: "/reference/:id(\\d+)", name: "Reference", component: Reference },
  { path: "/newArticle", name: "NewArticle", component: NewArticle },
  { path: "/login", name: "Login", component: Login },
  { path: "/newUser", name: "NewUser", component: NewUser },
];

const router = new VueRouter({
  mode: "history",
  routes: routes,
});

export default router;
