<template>
  <article class="service-view">
    <button class='btn' v-if="edited && loggedIn" @click="updateService(service.id, updatedService)">Zapisz</button>
    <button class='btn' v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    <header>
      <h1 v-if="edited" ref="title" @input="updateTitle" contenteditable>{{service.title}}</h1>
      <h1 v-else>{{service.title}}</h1>
    </header>

    <main>
      <section>
        <wysiwyg v-if="edited" v-model="updatedService.header"></wysiwyg>
        <div v-else class='wysiwyg-editor' v-html="service.header"></div>

        <aside v-bind:class="{ edited: edited }">
          <img v-if="service.picture && !edited" :src="service.picture.url" />
          <input v-if="edited" type="file" ref="inputFile" @change="uploadFile()" />
        </aside>
        
        <wysiwyg v-if="edited" v-model="updatedService.desc"></wysiwyg>
        <div v-else class='wysiwyg-editor' v-html="service.desc"></div>
      </section>
    </main>
  </article>
</template>

<script>
import { mapActions, mapState, mapGetters } from 'vuex'
export default {
  name: 'ServiceView',
  props: ['id'],
  data() {
    return {
      edited: false,
      updatedService: {
        desc: '',
        header: '',
        title: '',
        image: null
      }
    }
  },
  created() {
    this.getSingleService(this.id)
  },
  methods: {
    ...mapActions('services', ['getSingleService']),
    toggleEdit() {
      this.edited = !this.edited
      this.updatedService = this.service
    },
    updateService(id, data) {
      this.$store.dispatch('services/updateService', [id, data])
      this.edited = false
    },
    updateTitle() {
      this.updatedService.title = this.$refs.title.innerHTML
    },
    uploadFile: function() {
      this.updatedService.image = this.$refs.inputFile.files[0]
    }
  },
  computed: {
    ...mapGetters('user', ['loggedIn']),
    ...mapState({ service: state => state.services.single_service })
  }
}
</script>

<style lang="scss">
.service-view {
  margin: auto;
  margin-top: 100px;

  .wysiwyg-editor {
    width: 100% !important;
    word-break: break-word;
  }

  header {
    width: 80%;
    margin: 0 auto;
    text-align: center;
    h1 {
      font-size: 2.5rem;
      width: 100%;
      padding-bottom: 1rem;
    }
  }
  main {
    background: #fff;
    min-height: 80vh;

    section {
      padding: 4rem 0;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      width: 80%;
      margin: 0 auto;
      text-align: left;
      color: #8898aa;
      img {
        margin-top: 0;
      }
    }
  }

  aside {
    padding: 2rem 0;

    &.edited {
      position: relative;
    }
    img {
      width: 100%;
      object-fit: cover;
      height: 70vh;
    }
  }
}

// Large devices (desktops, 992px and up)
@media (min-width: 992px) {
  .service-view {

    .wysiwyg-editor {
      width: 60% !important;
    }

    header {
      text-align: left;
      h1 {
        width: 40%;
      }
    }
    main {
      section {
        flex-direction: column;
        
        img {
          margin-top: -200px;
        }
      }
    }

    aside {
      position: absolute;;
      img {
        width: 300px;
      }
    }
  }
}

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) {
  .service-view {
    aside {
      right: 5%;
      img {
        width: 500px;
      }
    }
  }
}
</style>