<template>
  <div id="app">
    <Header class="header"></Header>
    <div class="whole">
      <LeftSidebar class="left-side-bar"></LeftSidebar>
      <div class="router-part">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script>
import Header from "./packs/components/header.vue";
import LeftSidebar from "./packs/components/left-sidebar.vue";

export default {
  name: "App",
  components: {
    Header,
    LeftSidebar
  }
};
</script>

<style>
#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif, "Ricty Diminished";
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  width: 100%;
}

.whole {
  display: flex;
  justify-content: center;
  margin-bottom: 20px;
}

.left-side-bar {
  /* width: 16%; */
  position: absolute;
  left: 20px;
}

.router-part {
  /* flex-basis: 65%; */
  width: 55%;
}
</style>
