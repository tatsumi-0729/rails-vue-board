<template>
  <div class="whole">
    <div class="newArticleInfo">
      <h1 class="title">新規記事投稿</h1>
      <p v-show="userPresent" class="user_present">ログインして下さい。</p>題名：
      <input v-model="title" />
      <br />本文：
      <textarea v-model="content" />
      <br />画像：
      <input name="uploadedImage" type="file" ref="file" v-on:change="onFileChange()" />
      <br />
      <button v-on:click="clickButton" class="submit">投稿</button>
      <div class="backToTop">
        <router-link class="routerLink" :to="{ name: 'Top' }">記事一覧へ</router-link>
      </div>
    </div>
  </div>
</template>

<script>
import Vue from "vue/dist/vue.esm";
import axios from "axios";
axios.defaults.headers.common = {
  "X-Requested-With": "XMLHttpRequest",
  "X-CSRF-TOKEN": document
    .querySelector('meta[name="csrf-token"]')
    .getAttribute("content")
};
export default {
  data: function() {
    return {
      title: "タイトル",
      content: "内容",
      image: "",
      userPresent: false
    };
  },
  methods: {
    onFileChange() {
      let file = event.target.files[0] || event.dataTransfer.files;
      let reader = new FileReader();
      reader.onload = () => {
        this.uploadedImage = event.target.result;
        this.image = this.uploadedImage;
      };
      reader.readAsDataURL(file);
    },
    clickButton: function() {
      // this.userId = document.getElementById("userId").value;
      axios
        .post("/api/v1/board", {
          article: {
            title: this.title,
            content: this.content,
            image: this.image
          }
        })
        .then(
          res => {
            console.log(res.data);
            if (res.data != "user false") {
              this.$router.push({ path: "/" });
            }
            this.userPresent = true;
          },
          error => {
            console.log(error);
          }
        );
    }
  }
};
</script>

<style scoped>
.routerLink {
  text-decoration: none;
}

.title {
  text-align: center;
}

.newArticleInfo {
  display: flex; /* 子要素をflexboxで揃える */
  flex-direction: column; /* 子要素をflexboxにより縦方向に揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
}

.submit {
  display: flex; /* 子要素をflexboxで揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
  width: 60px;
  height: 30px;
}

.user_present {
  color: white;
  background-color: pink;
  border-radius: 5%;
  padding: 10px 20px 10px 20px;
}

.backToTop {
  position: relative;
  top: 50px;
  right: 130px;
}
</style>
