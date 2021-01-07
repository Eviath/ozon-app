<template>
  <div :class="{loaded: loaded, service_list: true}">
    <ServiceForm v-if="loggedIn" />
    <SectionTitle
      arrow
      title="Nasze usługi"
      desc="Współpracujemy zarówno z klientami indywidualnymi, jak i firmami. Robimy wszystko, aby w jak najkrótszym czasie przywrócić Ci maksymalną czystość i usunąć wszelkie nieprzyjemne zapachy. "
    />
    <ul class="services__list">
      <li class="service__item" v-for="service in services" :key="service.id" :service="service">
        <figure>
          <img :src="service.picture.url" alt />
          <figcaption>
            <h1>{{ service.title }}</h1>
          </figcaption>
        </figure>
        <a v-if="loggedIn" class="btn btn--delete" @click.prevent="deleteService(service)">USUŃ</a>
        <router-link :to="{ name: 'service', params: {id: service.id } }" class="btn btn--more"></router-link>
      </li>
    </ul>
  </div>
</template>

<script>
import { mapState, mapActions, mapGetters } from 'vuex'
import SectionTitle from '../SectionTitle'
import ServiceForm from './ServiceForm'

export default {
  name: 'ServiceList',
  components: { SectionTitle, ServiceForm },
  data() {
    return {
      loaded: false
    }
  },
  methods: {
    ...mapActions('services', ['deleteService']),
    ...mapActions('toolbar', ['getResourceName']),
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    }
  },
  computed: {
    ...mapState({ services: state => state.services.all }),
    ...mapGetters('user', ['loggedIn'])
  },
  created() {
    this.$store.dispatch('services/getAllServices')
    this.getResourceName(this.$options.name)
  },
  mounted() {
    this.setLoaded()
  }
}
</script>

<style lang="scss">

.service_list {
  transition: opacity 0.3s, padding 0.5s;
  padding: 50px 0;
  opacity: 0;

  &.loaded {
    opacity: 1;
  }

}
.services__list {
  list-style-type: none;
  padding: 0;
}

.service__item {
  position: relative;
  width: 80%;
  margin: 20px auto;

  .btn--more {
    margin: 0px;
    display: block;
    width: 100%;
    height: 100%;
    padding: 0 !important;
    background: transparent !important;
    margin-right: 100px;
  }

  .btn--delete {
    z-index: 200;
    display: absolute;
    max-width: fit-content;
    height: fit-content;
  }

  &::before {
    z-index: 20;
    position: absolute;
    content: '';
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background: $bg;
    opacity: 0.6;
  }

  figure {
    padding: 0;
    margin: 0;
    height: 500px;
  }

  figcaption {
    z-index: 30;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    position: absolute;
    top: 0;
    left: 0;

    h1 {
      font-size: 1.5rem;
      text-align: center;
    }
  }
  img {
    position: relative;
    width: 100%;
    object-fit: cover;
    object-position: center;
    height: 500px;
    z-index: -2;
  }

  .btn {
    padding: 1rem;
    position: absolute;
    right: 0;
    left: 0;
    bottom: 0;
    top: 0;
    cursor: pointer;
    background: #fff;
    color: $bg;
    z-index: 90;
  }
}

@media (min-width: 768px) {
  .services__list {
    figcaption {
      h1 {
        font-size: 3rem;
      }
    }
  }
}
</style>