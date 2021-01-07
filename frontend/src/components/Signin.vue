<template>
  <div class='sign-in'>
    <section>
      <h3>Logowanie</h3>
      <form @submit.prevent="getUserData({email: email, password: password})">
        <div class="text-red" v-if="error">{{ error }}</div>
        <div class='form-group'>
          <label for="email" class="label">Adres E-mail</label>
          <input
            type="email"
            v-model="email"
            class="input"
            id="email"
            placeholder="example@example.com"
          />
        </div>
        <div class='form-group'>
          <label for="password" class="label">Hasło</label>
          <input
            type="password"
            v-model="password"
            class="input"
            id="password"
            placeholder="example"
          />
        </div>
        <button type="submit">Zaloguj</button>
      </form>
    </section>
  </div>
</template>

<script>
import { mapActions } from 'vuex'
export default {
  name: 'Signin',
  data() {
    return {
      email: '',
      password: '',
      error: ''
    }
  },
  methods: mapActions('user', ['getUserData'])
}
</script>


<style lang="scss">
.sign-in {
  width: 100%;
  align-items: center;
  height: 100vh;
  justify-content: center;
  display: flex;
  flex-direction: column;

  section { 
    width: 20%;
  }

  form {
    display: flex;
    flex-direction: column;
    a {
      color: #fff;
    
    }

    button[type='submit'] {
        background: $purple;
        border: 0;
        color: #fff;
        font-family: 'Poppins', sans-serif;
        padding: .7rem;
        text-align: center;
        font-weight: 600;
        cursor: pointer;
    }

    .form-group {
      padding: 1rem 0;
      display: flex;
      flex-direction: column;

      label {
        text-align: left;
      }
      input {
        padding: .75rem;
      }
    }
  }
  }
</style>