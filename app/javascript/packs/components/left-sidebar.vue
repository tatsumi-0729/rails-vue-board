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
            <div class="article" v-for="article in articles" :key="article.id">
              <li id="nav">
                <router-link
                  class="routerLink"
                  :to="{ name: 'Reference', params: { id: article.id } }"
                >{{article.title}}</router-link>
              </li>
            </div>
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
      showNewArticleButton: true,
      articles: []
    };
  },
  mounted: function() {
    axios.get(`/api/v1/board/ranking`).then(res => {
      console.log(res.data);
      this.articles = res.data;
    });
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
