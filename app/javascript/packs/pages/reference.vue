<template>
  <div>
    <div class="content">
      <div class="horizon">
        <input type="hidden" id="room_id" :value="article.id" />
        <img class="article-image" :src="image" />
        <h3 class="article-title">{{ article.title }}</h3>
      </div>
      <p class="article-content">{{ article.content }}</p>
    </div>
    <br />
    <p v-if="userPresent" class="user_present">ログインして下さい。</p>
    <div class="comment">
      <input class="comment-text" v-model="content" />
      <button v-on:click="newComment">コメントする</button>
    </div>
    <br />
    <div class="comments" v-for="comment in comments" :key="comment.id">
      <p>{{comment.content}}</p>
      <p>{{comment.created_at}}</p>
    </div>
    <br />
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
      image: "",
      comments: [],
      roomId: "",
      content: "",
      userPresent: false
    };
  },
  methods: {
    newComment: function() {
      this.roomId = document.getElementById("room_id").value;
      console.log(this.roomId);
      axios
        .post("/api/v1/comment", {
          comment: {
            room_id: this.roomId,
            content: this.content
          }
        })
        .then(
          res => {
            console.log(res.data);
            if (res.data == "user false") {
              this.userPresent = true;
            } else {
              this.comments.push(res.data);
            }
          },
          error => {
            console.log(error);
          }
        );
    }
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
      }),
      axios.get(`/api/v1/comment/${this.$route.params.id}`).then(res => {
        if (res.data != null) {
          console.log(res.data);
        }
        this.comments = res.data;
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

.comment {
  text-align: center;
}

.comments {
  text-align: center;
  padding-bottom: 20px;
}

.comment-text {
  width: 400px;
  height: 50px;
}

.user_present {
  color: white;
  background-color: pink;
  border-radius: 5%;
  padding: 10px 20px 10px 20px;
}
</style>
