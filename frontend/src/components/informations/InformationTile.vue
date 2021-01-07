<template>
  <li class="information_tile">
    <div class="btn-group">
      <button
        class="btn"
        v-if="edited && loggedIn"
        @click="updateItem(item.id, updatedItem)"
      >Zapisz</button>
      <button class="btn" v-if="edited && loggedIn" @click="toggleEdit">Anuluj</button>
      <button class="btn" v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    </div>

    <div v-if="item.picture && !edited" class="information_tile__image">
      <img v-if="item.picture && !edited" :src="item.picture.url" alt />
    </div>

    <input v-if="edited" type="file" ref="inputFile" @change="uploadFile()" />
    <div class="information_tile__text">
       <wysiwyg v-if="edited" v-model="updatedItem.desc"></wysiwyg>
      <p v-if="!edited">{{item.desc}}</p>
      
      </div>
  </li>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'InformationTile',
  props: {
    item: Object
  },
  computed: {
    ...mapGetters('user', ['loggedIn']),
  },
  data() {
    return {
      edited: false,
      updatedItem: {
        desc: '',
        image: null
      }
    }
  },
  methods: {
    updateItem(id, data) {
      this.$store.dispatch('informations/updateTile', [id, data])
      this.edited = false
    },
    toggleEdit() {
      this.edited = !this.edited
      this.updatedItem = this.item
    },
    uploadFile: function() {
      this.updatedItem.image = this.$refs.inputFile.files[0]
    }
  },
}
</script>

<style scoped lang="scss">
.information_tile {
  display: flex;
  flex-direction: column;
  margin: 0;
     padding: 2rem 0;
   input {
      position: absolute;
      left: 150px;
    }
     .btn-group {
       position: absolute;
       left: 0;
       button {
         width: 40px;
         display: flex;
         justify-content: center;
       }
     }
  &__image {
    position: relative;

 
    flex: 1;
    img {
      width: 100%;
      object-fit: cover;
      height: 100%;
    }
    &::before {
      z-index: 20;
      position: absolute;
      content: '';
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background: #040444;
      opacity: 0.3;
    }
  }

  &__text {
    flex: 1;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}

@media (min-width: 992px) {
  .information_tile {
    flex-direction: row;
     padding: 0;

    &__text {
     padding: 2rem;
    }

    &:nth-child(odd) {
      flex-direction: row-reverse;
    }
  }
}
</style>