<template>
  <div class="contact_item" v-bind:class="{aligned: aligned, edited: edited}">
    <div class="btn-group">
      <button
        class="btn"
        v-if="edited && loggedIn"
        @click="updateItem(contact.id, updatedItem)"
      >Zapisz</button>
      <button class="btn" v-if="edited && loggedIn" @click="toggleEdit">Anuluj</button>
      <button class="btn" v-if="!edited && loggedIn" @click="toggleEdit">Edytuj</button>
    </div>
    <header>
      <h1 v-if="edited" ref="title" @input="updateTitle" contenteditable>{{contact.title}}</h1>
      <h1 v-else >{{contact.title}}</h1>
    </header>
    <wysiwyg v-if="edited" v-model="updatedItem.desc"></wysiwyg>
    <footer v-else v-html="contact.desc">{{contact.desc}}</footer>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'ContactItem',
  props: {
    position: String,
    aligned: Boolean
  },
  data() {
    return {
      edited: false,
      updatedItem: {
        desc: '',
        title: ''
      }
    }
  },
  methods: {
    updateItem(id, data) {
      this.$store.dispatch('contacts/updateContact', [id, data])
      this.edited = false
    },
    toggleEdit() {
      this.edited = !this.edited
      this.updatedItem = this.contact
    },
    updateTitle() {
      this.updatedItem.title = this.$refs.title.innerHTML
    }
  },
  computed: {
    ...mapGetters('user', ['loggedIn']),
    ...mapGetters('contacts', ['getContactByPosition']),
    contact() {
      return this.getContactByPosition(this.position)[0]
    }
  }
}
</script>

<style scoped lang="scss">
.contact_item {
  box-sizing: border-box;
  padding: 0;
  text-align: center;
  margin: 2rem 0;

  .btn-group {
    display: flex;
    flex-direction: row;
    margin: 1rem 0;
  }
  h1 {
    margin-top: 0;
    font-size: 2rem;
  }

  &.edited {
    h1 {
      border: 1px solid $light;
    }
  }
  &.aligned {
    text-align: center;
    width: 90%;
    margin: 0 auto;
  }

  footer {
    display: flex;
    padding: 1rem;
    flex-direction: column;
    /deep/ strong {
      margin: 2rem 0;
      text-align: center;
      font-size: 1rem;
      color: $second;
    }
  }
}

@media (min-width: 768px) {
  .contact_item {
    padding: 2rem;
    text-align: inherit;

    &.aligned {
      width: 40%;
    }
    footer {
      /deep/ strong {
        font-size: 2rem;
      }
    }
  }
}
</style>
