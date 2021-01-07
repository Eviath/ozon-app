<template>
  <section>
    <div  v-if="visible" class="service-new">
      <h3>Dodaj nową usługę</h3>
      <form action @submit.prevent="createNewService(newService)">
        <div>
          <input
            class="input"
            autofocus
            autocomplete="off"
            placeholder="Tytuł usługi"
            v-model="newService.title"
          />
            <wysiwyg
            class="input"
            autofocus
            autocomplete="off"
            placeholder="Opis usługi"
            v-model="newService.header"
          ></wysiwyg>
          <wysiwyg
            class="input"
            autofocus
            autocomplete="off"
            placeholder="Opis usługi"
            v-model="newService.desc"
          ></wysiwyg>
          <p>Zdjęcie :</p>
          <input type="file" ref="inputFile" @change="uploadFile()" />
        </div>
        <input class="btn btn--dark" type="submit" value="Dodaj usługę" />
      </form>
    </div>
    <button class='btn toggle-form' @click="toggleForm">NOWA USŁUGA</button>
  </section>
</template>

<script>
export default {
  name: 'ServiceForm',
  data() {
    return {
      visible: false,
      newService: {
        title: '',
        desc: '',
        header: '',
        image: null
      }
    }
  },
  methods: {
    createNewService: function() {
      this.$store.dispatch('services/createNewService', this.newService)
      this.visible = !this.visible
    },

    // Saving the file in our data to send it !
    uploadFile: function() {
      this.newService.image = this.$refs.inputFile.files[0]
    },
    toggleForm: function() {
      this.visible = !this.visible
    }
  }
}
</script>

<style lang="scss">
button.toggle-form {
  position: fixed;
  bottom: 10px;
  z-index: 2000;
  right: 10px;
}
.service-new {
  width: 100%;
  position: fixed;
  left: 0;
  bottom: 0;
  z-index: 900;
  background: #fff;
  padding: 2rem;
  margin: 0 auto;
  color: $bg;
  text-align: left;
  form {
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    input {
      margin: 1rem 0;
      padding: 0.75rem 1rem;
      width: 50%;
    }
  }
}
</style>