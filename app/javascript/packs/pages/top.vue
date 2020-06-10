<template>
  <div class="body">
    <div class="article" v-for="article in articles" :key="article.id">
      <div class="thumbnail">
        <div class="space-between">
          <img class="image" :src="article.image" alt="画像" />
          <div class="caption">
            <!-- valueに注意 -->
            <input type="hidden" id="articleId" :value="article.id" />
            <h3 class="article-title">{{ article.title }}</h3>
            <p class="article-content">{{ article.content }}</p>
            <div class="button_whole">
              <button class="btn btn-default btn-xs" id="reference_button">
                <router-link
                  class="routerLink"
                  :to="{ name: 'Reference', params: { id: article.id } }"
                >詳細</router-link>
              </button>
              <button class="deleteButton" v-on:click="deleteButton">削除</button>
            </div>
          </div>
        </div>
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
      articles: [],
      articleId: []
    };
  },
  methods: {
    fetchArticles() {
      axios.get(`/api/v1/board`).then(res => {
        for (var i = 0; i < res.data.length; i++) {
          this.articles.push(res.data[i]);
        }
      });
    },
    deleteButton: function() {
      // articleIdはここで入れないとscriptの性質上、undifinedになる。
      this.articleId = document.getElementById("articleId").value;
      console.log(this.articleId);
      axios.delete(`/api/v1/board/${this.articleId}`).then(res => {
        this.articles = [];
        this.fetchArticles();
        console.log("削除完了");
      });
    }
  },
  mounted: function() {
    this.fetchArticles();
  }
};
</script>

<style scoped lang="scss">
.routerLink {
  text-decoration: none;
}

.body {
  font-size: 50%;
  font-family: Verdana, "ＭＳ Ｐゴシック", sans-serif;
}

.article {
  margin: 20px 20px 0px 20px;
  flex-grow: 2;
}

.article .thumbnail {
  box-shadow: 3px 3px 3px #a9a9a9;
}

.article .space-between {
  display: flex;
  align-content: space-between;
}

.article .image {
  width: 150px;
  height: 150px;
  margin-right: 20px;
}

.article .article-title {
  font-weight: bold;
  margin: 0px 0px 40px 25px;
  padding: 10px 0px 10px 0px;
}

.article .article-content {
  margin: 0px 0px 30px 25px;
  position: relative;
  bottom: 30px;
}

.button_whole {
  display: flex;
  justify-self: space-around;
}
</style>
