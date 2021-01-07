<template>
  <div :class="`page__header ${loaded ? 'loaded' : '' }`">
    <section v-bind:class="{gray: sub}">
      <div class="hr__section">
        <hr />
      </div>
      <div>
        <h1 v-if="title">{{title}}</h1>
        <small v-else>{{sub}}</small>
      </div>
      <div class="hr__section">
        <hr />
      </div>
    </section>
    <header>
      <p v-if="desc">{{desc}}</p>
    </header>
  </div>
</template>

<script>
export default {
  name: 'SectionTitle',
  props: {
    sub: String,
    title: String,
    desc: String,
    arrow: Boolean
  },
  methods: {
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    }
  },
  mounted() {
    this.setLoaded()
  },
  data() {
    return {
      loaded: false
    }
  }
}
</script>

<style scoped lang="scss">
.page__header {
  padding: 50px 0;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;

  transition: opacity 0.3s, padding 0.5s;
  opacity: 0;

  &.loaded {
    opacity: 1;

     section {
      .hr__section {
        hr {
                 transition: .3s;
          width: 100%;
        }
      }
    }
  }

  header {
    width: 80%;
    margin: 0 auto;
  }

  small {
    color: #fff;
    font-size: 1rem;
    font-weight: 600;
    opacity: 0.8;
    text-transform: uppercase;
    padding: 0 4rem;
  }

  section {
    width: 100%;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    color: $white;
    align-items: center;
    flex: 2;

    &.gray {
      margin: 0;
      .hr__section hr {
        border-color: $gray;
        opacity: 0.5;
      }
    }

    .hr__section {
      flex: 1;
      hr {
        width: 0%;
        border-color: $white;
      }
    }
  }

  h1 {
    font-size: 1.5rem;
    color: #fff;
    text-transform: uppercase;
    margin: 0;
    padding: 1rem 1rem;
  }

  p {
    margin: 0;
  }
}

@media (min-width: 768px) {
  .page__header {
    padding: 100px 0;
    section {
      font-size: 1.5rem;
    }
    header {
      width: 42%;
    }

    small {
         font-size: 1.2rem;
    }

    h1 {
      padding: 0 4rem;
      font-size: 2.5rem;
    }
  }
}
</style>
