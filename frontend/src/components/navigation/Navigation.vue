<template>
  <nav>
    <div v-if="resources">
      <router-link to="/polityka">Polityka prywatności</router-link>
      <router-link to="/ciasteczka">Ciasteczka</router-link>
      <a href="/sitemap.xml">Mapa strony</a>
    </div>

    <div v-else>
      <router-link @click.native="onClickButton" to="/">Strona główna</router-link>
      <router-link @click.native="onClickButton" to="/onas">O Nas</router-link>
      <router-link @click.native="onClickButton" to="/informacje">Informacje</router-link>
      <router-link @click.native="onClickButton" to="/uslugi">Usługi</router-link>
      <router-link @click.native="onClickButton" to="/cennik">Cennik</router-link>
      <router-link @click.native="onClickButton" to="/kontakt">Kontakt</router-link>
      <router-link
        @click.native="onClickButton"
        v-if="header"
        class="btn"
        to="/kontakt"
      >UMÓW SIĘ TERAZ</router-link>
      <a @click.prevent="logoutUser" v-if="loggedIn">Wyloguj</a>
    </div>
  </nav>
</template>


<script>
import { mapActions, mapGetters } from 'vuex'
export default {
  name: 'Navigation',
  props: {
    header: Boolean,
    resources: Boolean
  },
  computed: {
    ...mapGetters('user', ['loggedIn', 'userEmail'])
  },
  methods: {
    ...mapActions('user', ['logoutUser']),
    onClickButton() {
      this.$emit('clicked')
    }
  }
}
</script>

<style scoped lang="scss">
nav a {
  font-family: 'Barlow', sans-serif;
  text-decoration: none;
  color: #fff;
  display: flex;
  align-items: center;
}

nav a.btn {
  color: $bg;
  padding: 0.7rem 2rem;
  font-weight: 700;
  font-size: 0.85rem;
  letter-spacing: 0.05rem;
}

.router-link-exact-active {
  font-weight: 600;
}

nav div {
  width: max-content;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  font-size: 1.5rem;
  a {
    padding: 0.5rem 0;
  }
}

footer {
  nav div {
    width: 100%;
    display: flex;
    flex-direction: column;
    font-size: 1rem;
    a {
      justify-content: center;
      padding: 0.4rem 0;
      color: $gray !important;
    }
  }
}

@media (min-width: 992px) {
  nav div {
    display: flex;
    flex-direction: row;
    font-size: 1rem;
    a {
      padding: 0 1rem;
    }
  }
  footer {
    nav div {
      align-items: flex-start;
      a {
        justify-content: flex-start;
      }
    }
  }
}
</style>