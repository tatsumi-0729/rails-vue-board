<template>
  <div class="header">
    <div id="title">
      <h1>雑談掲示板</h1>
    </div>

    <!-- 検索ボックス -->
    <div class="both">
      <form action="Top" method="post">
        <input name="main_search" type="text" class="text_area" placeholder />
        <button type="submit" class="btn btn-primary" id="search_button" value="検索">検索</button>
      </form>
    </div>
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
.header {
  display: flex;
  justify-content: space-between;
  background-color: black;
  height: 80px;
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
