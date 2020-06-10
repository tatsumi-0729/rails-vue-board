<template>
  <div>
    <div class="content">
      <div class="horizon">
        <img class="article-image" :src="image" />
        <h3 class="article-title">{{ article.title }}</h3>
      </div>
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
      article: [],
      image: ""
    };
  },
  mounted() {
    axios
      .get(`/api/v1/board/${this.$route.params.id}`, {
        // responseType: "arraybuffer"
      })
      .then(res => {
        console.log(res.data);
        this.article = res.data;
        this.image = res.data.image;
      });
  }
};
</script>

<style scoped lang="scss">
.routerLink {
  text-decoration: none;
}

.article-image {
  width: 150px;
  height: 150px;
}

.horizon {
  display: flex;
  align-content: space-between;
}

.article-image {
  margin: 15px 0px 0px 10px;
}

.article-title {
  margin: 45px 0px 0px 25px;
  font-size: 25px;
}

.article-content {
  margin: 35px 0px 25px 10px;
}

.content {
  margin: 0.2em;
  margin: 1em;
  padding: 1em;
  background: #efefef;
  border: 1px solid black;
}
</style>
