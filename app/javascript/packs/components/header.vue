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
    </div>

    <div class="nav-bar">
      <!-- <div></div>
      <router-link class="routerLink" :to="{ name: 'Programing' }"
        ><p class="nav-text">プログラミング</p></router-link
      >
      <router-link class="routerLink" :to="{ name: 'Book' }"
        ><p class="nav-text">本</p></router-link
      >
      <router-link class="routerLink" :to="{ name: 'Stock' }"
        ><p class="nav-text">株</p></router-link
      >
      <router-link class="routerLink" :to="{ name: 'Psychology' }"
        ><p class="nav-text">心理学</p></router-link
      >
      <router-link class="routerLink" :to="{ name: 'Sport' }"
        ><p class="nav-text">運動</p></router-link
      >
      <div></div>-->
    </div>

    <div class="border-bottom"></div>
  </div>
</template>

<script>
export default {
  name: "global_header",
  props: {
    msg: String
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
  justify-content: space-between;
  align-items: center;
  font-family: "Courier New", monospace;
  font-size: 14px;
}

.routerLink {
  text-decoration: none;
}

.nav-text {
  color: black;
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
</style>
