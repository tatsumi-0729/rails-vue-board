<template>
  <div class="body">
    <div class="article" v-for="article in articles" :key="article.id">
      <div class="thumbnail">
        <div class="space-between">
          <img src="https://placehold.jp/160x80.png" alt="画像" />
          <div class="caption">
            <h3 class="article-title">{{ article.title }}</h3>
            <p class="article-content">{{ article.content }}</p>
            <a class="btn btn-default btn-xs" id="reference_button">
              <router-link to="/reference">詳細</router-link>
            </a>
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
      id: document.getElementById("id").value
      // document.getElementById("id").getAttribute("id")
      // document.getElementById("id")
      // document.querySelector('#id')
    };
  },
  methods: {
    fetchArticles() {
      axios.get(`/api/board`).then(res => {
        for (var i = 0; i < res.data.length; i++) {
          this.articles.push(res.data[i]);
        }
      });
    }
  },
  onclick: function() {
    this.fetchReferenceArticleId();
  },
  methods: {
    fetchReferenceArticleId() {
      axios
        .post(`/api/board/show`, { id: this.referenceArticleId })
        .then(res => {
          console.log = res.data;
        });
    }
  }
};
</script>

<style scoped lang="scss">
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

.deleteButton {
  display: flex;
  flex-direction: row-reverse;
}
</style>
