<template>
  <div :class="`about ${loaded ? 'loaded' : ''}`">
        <div class="btn-group">
      <button
        class="btn"
        v-if="edited && loggedIn"
        @click="updateMain(main.id, updatedMain)"
      >Zapisz</button>
      <button class="btn" v-if="edited && loggedIn" @click="toggleEdit">Anuluj</button>
      <button class="btn" v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    </div>
    <header class="about__header">
      
      <h1 v-if="edited" ref="title" @input="updateTitle" contenteditable>{{main.title}}</h1>
      <h1 v-else >{{main.title}}</h1>
    </header>
    <main>
      <wysiwyg v-if="edited" v-model="updatedMain.desc"></wysiwyg>
      <p v-else>
        {{main.desc}}
      </p>

      <TileList title="Dlaczego nas wybrać?" />
    </main>
  </div>
</template>

<script>
import TileList from '@/components/tiles/TileList'
import { mapState, mapGetters } from 'vuex'

export default {
  name: 'About',
  components: { TileList },
  data() {
    return {
      loaded: false,
      edited: false,
      updatedMain: {
        title: '',
        desc: ''
      }
    }
  },
  computed: {
    ...mapGetters('user', ['loggedIn']),
    ...mapState({ blocks: state => state.informations.blocks }),
    ...mapGetters('informations', ['getInformationByPosition']),
    main() {
      return this.getInformationByPosition('main')[0]
    },
  },

  methods: {
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    },
    updateMain(id, data) {
      this.$store.dispatch('informations/updateBlock', [id, data])
      this.edited = false
    },
    toggleEdit() {
      this.edited = !this.edited
      this.updatedMain = this.main
    },
    updateTitle() {
      this.updatedMain.title = this.$refs.title.innerHTML
    }
  },
  created() {
    this.$store.dispatch('informations/getInformationBlocks')
  },
  mounted() {
    this.setLoaded()
  }
}
</script>

<style scoped lang='scss'>
.about {
  color: $lightb;
  width: 80%;
  margin: 10rem auto;
  transition: opacity 0.3s;
  opacity: 0;

  &.loaded {
    opacity: 1;
  }

  header {
    text-align: center;
    color: $white;
  }

  p {
    letter-spacing: 0.03rem;
  }
}

@media (min-width: 768px) {
  .about {
    header {
      h1 {
        font-size: 3rem;
      }
    }
  }
}
</style>