<template>
  <div class="side-var-back-ground">
    <h4 class="ranking">ランキング</h4>
    <div class="side-var">
      <nav class="global-nav">
        <ul class="side-nav">
          <li id="nav">
            <a href>demo1</a>
          </li>
          <li id="nav">
            <a href>demo2</a>
          </li>
          <li id="nav">
            <a href>demo3</a>
          </li>
          <li id="nav">
            <a href>demo4</a>
          </li>
          <li id="nav">
            <a href>demo5</a>
          </li>
          <li id="nav">
            <a href>demo6</a>
          </li>
          <li id="nav">
            <a href>demo7</a>
          </li>
          <li id="nav">
            <a href>demo8</a>
          </li>
          <li id="nav">
            <a href>demo9</a>
          </li>
          <li id="nav">
            <a href>demo10</a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</template>

<script>
export default {
  name: "global_footer",
  props: {
    msg: String
  }
};
</script>

<style scoped>
.side-var {
  flex-grow: 2;
}

.side-var-back-ground {
  background-color: #d7eeff;
  margin: 20px 20px 820px 0px;
}

.ranking {
  padding-right: 20px;
  padding-top: 20px;
  margin: 0px 10px 15px 30px;
  font-weight: bold;
}

#nav {
  margin: 10px 0px 10px 10px;
}
</style>
