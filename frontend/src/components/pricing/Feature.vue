<template>
  <div class="feature">
    <header>
      <h1 v-html="feature.title">{{feature.title}}</h1>
      <p v-html="feature.desc">{{feature.desc}}</p>
    </header>
    <section>
      <p class='traits' v-html="feature.traits">{{feature.traits}}</p>
      <div>
        <img :src="feature.picture.url" alt />
        <p v-html="feature.subtext">{{feature.subtext}}</p>
      </div>
    </section>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'Feature',
  computed: {
    ...mapGetters('pricing', ['getFeature']),
    feature() {
      return this.getFeature
    }
  }
}
</script>

<style scoped lang="scss">
.feature {
  display: flex;
  justify-content: space-between;
  flex-direction: column;
    height: 80%;
    header {
    text-align: center;
    h1 {
      font-weight: 300;
      margin: 0;
    }
    p {
      margin: .5rem;
    }
  }

  section {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    .trait {
      margin: 0;
    }

    .traits {
      text-align: center;
    }

    div {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
    }
  }
}

@media (min-width: 768px) { 
  .feature section {
     flex-direction: row;
     padding: 2rem;
  }
 }
</style>
