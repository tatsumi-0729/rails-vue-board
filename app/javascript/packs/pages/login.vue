<template>
  <div class="whole">
    <div class="loginInfo">
      <h1 class="title">ログイン画面</h1>ユーザ名
      <input v-model="userName" />
      <br />パスワード
      <input v-model="password" />
      <br />
      <button v-on:click="clickButton" class="login">ログイン</button>
      <div class="backToTop">
        <router-link class="routerLink" :to="{ name: 'Top' }">記事一覧へ</router-link>
      </div>
      <br />
      <div class="backToTop">
        <router-link class="routerLink" :to="{ name: 'NewUser' }">新規ユーザ登録へ</router-link>
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
      userName: "ユーザ名",
      password: "パスワード"
    };
  },
  methods: {
    clickButton: function() {
      axios
        .post("/api/v1/session", {
          session: {
            user_name: this.userName,
            password: this.password
          }
        })
        .then(
          res => {
            console.log(res.data);
            // this.$router.push({ path: "/" });
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

.loginInfo {
  display: flex; /* 子要素をflexboxで揃える */
  flex-direction: column; /* 子要素をflexboxにより縦方向に揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
}

.login {
  display: flex; /* 子要素をflexboxで揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
  width: 60px;
  height: 30px;
}

.backToTop {
  position: relative;
  top: 50px;
  right: 130px;
}
</style>
