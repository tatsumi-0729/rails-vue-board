<template>
  <div class="whole">
    <div>
      <button class="button">
        <router-link class="routerLink" :to="{ name: 'NewArticle' }">
          <p v-show="showNewArticleButton" class="newArticleText">新規記事投稿</p>
        </router-link>
      </button>
    </div>

    <div class="back-ground">
      <h4 class="ranking">ランキング</h4>
      <div class="side-var">
        <nav class="global-nav">
          <ul class="side-nav">
            <li id="nav">
              <a href>demo1</a>
            </li>
            <li id="nav">
              <a href>demo2</a>
            </li>
            <li id="nav">
              <a href>demo3</a>
            </li>
            <li id="nav">
              <a href>demo4</a>
            </li>
            <li id="nav">
              <a href>demo5</a>
            </li>
            <li id="nav">
              <a href>demo6</a>
            </li>
            <li id="nav">
              <a href>demo7</a>
            </li>
            <li id="nav">
              <a href>demo8</a>
            </li>
            <li id="nav">
              <a href>demo9</a>
            </li>
            <li id="nav">
              <a href>demo10</a>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from "vue/dist/vue.esm";
import axios from "axios";

export default {
  data: function() {
    return {
      showNewArticleButton: false
    };
  },
  mounted: function() {
    this.showNewArticleButton = true;
  }
};
</script>

<style scoped>
.whole {
  margin: 20px 0px 0px 0px;
  display: flex; /* 子要素をflexboxで揃える */
  flex-direction: column; /* 子要素をflexboxにより縦方向に揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
}

.routerLink {
  text-decoration: none;
}

.button {
  text-decoration: none;
  margin: 0px 0px 20px 0px;
  background-color: #3399cc;
  border-radius: 6%;
}

.newArticleText {
  color: #ffffff;
  font-size: 1.5em;
  text-align: center;
  padding: 0px 13px 0px 13px;
  height: 50%;
}

.side-var {
  flex-grow: 2;
}

.back-ground {
  background-color: #d7eeff;
  margin: 0px 20px 820px 0px;
}

.ranking {
  padding-right: 20px;
  padding-top: 20px;
  margin: 0px 10px 15px 30px;
  font-weight: bold;
}

#nav {
  margin: 10px 0px 10px 10px;
}
</style>
