<template>
  <div class="articleContent">
    <div class="btn-group">
      <button
        class="btn"
        v-if="edited && loggedIn"
        @click="updateArticle(article.id, updatedArticle)"
      >Zapisz</button>
      <button class="btn" v-if="edited && loggedIn" @click="toggleEdit">Anuluj</button>
      <button class="btn" v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    </div>
    <h3 v-if="edited" ref="title" @input="updateTitle" contenteditable>{{article.title}}</h3>
    <h3 v-else class="articleContent__title">{{article.title}}</h3>
    <div class="articleContent--inside">
      <wysiwyg v-if="edited" v-model="updatedArticle.desc"></wysiwyg>
      <p v-else v-html="article.desc" class="articleContent__desc">{{article.desc}}</p>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'ArticleBody',
  props: {
    article: Object
  },
  data() {
    return {
      edited: false,
      updatedArticle: {
        title: '',
        desc: ''
      }
    }
  },
  computed: {
    ...mapGetters('user', ['loggedIn']),
  },
  methods: {
    updateArticle(id, data) {
      this.$store.dispatch('informations/updateBlock', [id, data])
      this.edited = false
    },
    toggleEdit() {
      this.edited = !this.edited
      this.updatedArticle = this.article
    },
    updateTitle() {
      this.updatedArticle.title = this.$refs.title.innerHTML
    }
  },
}
</script>

<style scoped lang="scss">
.articleContent {
  width: 100%;
  padding: 2rem 0;
  letter-spacing: 0.04rem;

  &__desc {
    color: $lightb;
    transition: 0.3s;
  }
  &__title {
    cursor: pointer;
    color: $white;
    margin: 0;
    font-size: 1.5rem;
    transition: 0.3s;
  }
}

@media (min-width: 992px) {
.articleContent {
  padding: 0;
  &__title, &__desc {
    padding: 1rem;
  }
}

 }

</style>