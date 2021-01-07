<template>
  <div class="contact__form">
    <ul v-if='errors' class='errors'>
      <li v-for="(error, index) in errors" :key='index'>{{error}}</li>
    </ul>
    <div class="order" v-if="orderCreated">
      <header>
        <h1>Dziękujemy {{getName()}}</h1>
      </header>
      <p>
        Oczekuj odpowiedzi na zgłoszenie pod adresem
        <strong>{{order.email}}</strong>
      </p>

      <div class="message">
        <strong>Treść Twojego zgłoszenia:</strong>
        <p>{{order.message}}</p>
      </div>
    </div>
    <form v-else action @submit.prevent="createNewOrder(newOrder)">
      <header>
        <h1>Wyślij zapytanie</h1>
      </header>
      <section>
        <input
          class="input"
          autocomplete="off"
          placeholder="Imię i nazwisko"
          v-model="newOrder.name"
        />
        <input
          class="input"
          autocomplete="off"
          placeholder="Adres E-mail"
          v-model="newOrder.email"
        />
        <textarea
          class="input"
          autocomplete="off"
          placeholder="Chcesz nam coś przekazać?"
          v-model="newOrder.message"
        ></textarea>
      </section>
      <input class="btn btn--dark" type="submit" value="Wyślij" />
    </form>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex'
export default {
  name: 'ContactForm',
  data() {
    return {
      newOrder: {
        name: '',
        email: '',
        message: ''
      }
    }
  },
  methods: {
    ...mapActions('contacts', ['createNewOrder', 'clearOrder']),
    getName() {
      return this.order.name.split(' ')[0]
    }
  },
  mounted: function () {
    this.clearOrder()
  },
  computed: {
    ...mapState({
      order: state => state.contacts.order,
      orderCreated: state => state.contacts.orderCreated,
      errors: state => state.contacts.errors
    })
  }
}
</script>

<style scoped lang="scss">
.contact__form {
  height: 600px;
  width: 100%;
  background: #fff;
  color: $bg;
 
  border-radius: 20px;
  box-shadow: 0px 5px 17px -4px rgba(37, 37, 37, 0.37);

  .order {
    width: 100%;
    height: 100%;
    padding: 2rem;
    display: flex;
    justify-content: center;
    text-align: center;
    box-sizing: border-box;

    flex-direction: column;
    .message {
      text-align: left;
      padding: 2rem;
    }
  }
  header {
    color: $second;
    padding-top: 2rem;
    text-align: center;
  }

  form {
    padding: 3rem;
    input.btn {
      width: 40%;
    }
    section {
      display: flex;
      flex-direction: column;
      input,
      textarea {
        padding: 1.1rem 1rem;
        font-family: 'Poppins', sans-serif;
        margin: 1rem 0;
        border: none;
        box-shadow: 0px 5px 10px -10px $gray;
      }
      textarea {
        min-height: 100px;
      }
    }
  }
}

@media (min-width: 768px) { 
  .contact__form {
    width: 40%;
     margin-top: -140px;
  }
}
</style>
