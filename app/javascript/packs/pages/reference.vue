<template>
  <div>
    <div class="content">
      <img src="https://placehold.jp/160x80.png" alt="画像" />
      <!-- <img :src={{ article.image }} /> -->
      <p class="article-title">{{ article.image }}</p>
      <h3 class="article-title">{{ article.title }}</h3>
      <p class="article-content">{{ article.content }}</p>
    </div>
    <router-link class="routerLink" :to="{ name: 'Top' }">記事一覧へ</router-link>
  </div>
</template>

<script>
import Vue from "vue/dist/vue.esm";
import axios from "axios";

export default {
  data: function() {
    return {
      article: []
    };
  },
  mounted() {
    axios.get(`/api/v1/board/${this.$route.params.id}`).then(res => {
      if (res.data.image == null) {
        console.log("image is blank");
      }
      console.log(res.data), (this.article = res.data);
    });
  }
};
</script>

<style scoped lang="scss">
.routerLink {
  text-decoration: none;
}

.content {
  margin: 0.2em;
  margin: 1em;
  padding: 1em;
  background: #efefef;
  border: solid darkred;
}
</style>
