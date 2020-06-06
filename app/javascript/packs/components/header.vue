<template>
  <div class="whole">
    <div class="header">
      <div id="title">
        <router-link class="routerLink" :to="{ name: 'Top' }">
          <h1 class="h1">雑談掲示板</h1>
        </router-link>
      </div>

      <!-- 検索ボックス -->
      <div class="both">
        <form action="Top" method="post">
          <input name="main_search" type="text" class="text_area" placeholder />
          <button type="submit" class="btn btn-primary" id="search_button" value="検索">検索</button>
        </form>
      </div>

      <div class="nav-bar">
        <!-- <router-link class="routerLink" :to="{ name: 'Programing' }">
        <p class="nav-text">プログラミング</p>
        </router-link>-->
        <p class="nav-text" v-on:click="sessionDelete" v-if="logout">ログアウト</p>
        <router-link class="routerLink" :to="{ name: 'Login'}">
          <p class="nav-text" v-if="login">ログイン</p>
        </router-link>
        <div></div>
      </div>
    </div>
    <!-- <p v-show="completeLogout" class="complete_logout">ログアウトが完了しました。</p> -->
  </div>
</template>

<script>
import Vue from "vue/dist/vue.esm";
import axios from "axios";

export default {
  data: function() {
    return {
      logout: false,
      login: false
      // completeLogout: false
    };
  },
  methods: {
    investSessionUser() {
      axios.get(`/api/v1/user/invest`).then(res => {
        console.log(res.data);
        if (res.data == "user true") {
          this.login = false;
          this.logout = true;
        } else {
          this.logout = false;
          this.login = true;
        }
      });
    },
    sessionDelete: function() {
      axios.post("/api/v1/user/delete").then(res => {
        console.log(res.data);
        if (res.data == "success") {
          this.logout = false;
          this.login = true;
          // this.completeLogout = true;
        }
      });
    }
  },
  mounted: function() {
    this.investSessionUser();
  }
};
</script>

<style scoped>
.whole {
  display: flex; /* 子要素をflexboxで揃える */
  flex-direction: column; /* 子要素をflexboxにより縦方向に揃える */
  justify-content: center; /* 子要素をflexboxにより中央に配置する */
}

.header {
  display: flex;
  justify-content: space-between;
  background-color: black;
  height: 80px;
}

.h1 {
  color: white;
}

.nav-bar {
  margin: 6px 0px 0px 0px;
  display: flex;
  justify-content: flex-end;
  font-family: "Courier New", monospace;
  font-size: 14px;
}

.routerLink {
  text-decoration: none;
}

.nav-text {
  margin: 25px 20px 0px 0px;
  color: white;
}

.border-bottom {
  margin: 6px 0px 10px 0px;
  border-bottom: solid 1px #dddd;
}

#title {
  color: white;
  padding-left: 20px;
  position: relative;
  bottom: 6px;
}

.both {
  position: relative;
  top: 3px;
  right: 20px;
}

.text_area {
  padding: 5px 100px 5px 0px;
  margin: 23px 0px 0px 0px;
}

.complete_logout {
  color: white;
  background-color: pink;
  border-radius: 5%;
  padding: 10px 20px 10px 20px;
  margin-bottom: 50px;
  width: 50%;
  text-align: center;
}
</style>
