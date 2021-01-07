<template>
  <div class="tile">
    <div class="btn-group">
      <button
        class="btn"
        v-if="edited && loggedIn"
        @click="updateItem(tile.id, updatedItem)"
      >Zapisz</button>
      <button class="btn" v-if="edited && loggedIn" @click="toggleEdit">Anuluj</button>
      <button class="btn" v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    </div>
    <section>
      <img :src="tile.picture.url" alt />
      <h1 v-if="edited" ref="title" @input="updateTitle" contenteditable>{{tile.title}}</h1>
      <h1 v-if="!edited" >{{tile.title}}</h1>
      <wysiwyg v-if="edited" v-model="updatedItem.desc"></wysiwyg>
      <p v-if="!edited">{{tile.desc}}</p>
    </section>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'SectionTitle',
  props: {
    tile: Object
  }, 
  computed: {
    ...mapGetters('user', ['loggedIn']),
  },
  data() {
    return {
      edited: false,
      updatedItem: {
        title: '',
        desc: ''
      }
    }
  },
  methods: {
    updateItem(id, data) {
      this.$store.dispatch('services/updateTile', [id, data])
      this.edited = false
    },
    toggleEdit() {
      this.edited = !this.edited
      this.updatedItem = this.tile
    },
    updateTitle() {
      this.updatedItem.title = this.$refs.title.innerHTML
    }
  },
}
</script>

<style scoped lang="scss">
.tile {
  width: 100%;
  display: flex;
  flex-direction: column;
  text-align: center;

  section {
    padding: 1rem 0rem;
    display: flex;
    flex-direction: column;
     align-items: center;
    
    h1 {
      color: $white;
      margin: 0;
    }
    img {
      margin-bottom: 20px;
      object-fit: scale-down;
    }
  }
}

@media (min-width: 992px) {
  .tile {
    text-align: left;
    width: calc(100% / 3);
    section {
      align-items: flex-start;
      padding: 1rem 4rem;
    }
  }
}
</style>
