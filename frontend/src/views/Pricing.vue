<template>
  <div :class="{loaded: loaded, pricing: true}">
    <header class="pricing__header">
      <h1>Cennik</h1>
      <p>
        Konkurencyjne ceny zaplanowane dla każdej usługi.
        <br />Zawsze wiedz, za co płacisz.
      </p>
    </header>

    <Widget />

    <SectionTitle
      arrow
      title="Co otrzymasz w cenie?"
      desc="Każda oferowana przez nas usługa zawiera darmowe benefity."
    />

    <div class="pricing__benefits">
      <Benefit v-for="(benefit, index) in benefits" :key="index" :benefit="benefit" />
    </div>

    <div class="pricing__feature">
      <Feature />
    </div>
  </div>
</template>

<script>
import { mapActions, mapState } from 'vuex'
import Widget from '@/components/pricing/Widget'
import Feature from '@/components/pricing/Feature'
import Benefit from '@/components/pricing/Benefit'
import SectionTitle from '@/components/SectionTitle'

export default {
  name: 'Pricing',
  components: { Widget, SectionTitle, Benefit, Feature },
  data() {
    return {
      loaded: false
    }
  },
  methods: {
    ...mapActions('pricing', ['getBenefits', 'getFeatures']),
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    }
  },
  computed: {
    ...mapState({ benefits: state => state.pricing.benefits })
  },
  created() {
    this.getBenefits()
    this.getFeatures()
  },
  mounted() {
    this.setLoaded()
  }
}
</script>

<style scoped lang='scss'>
.pricing {
  min-height: 100vh;
  padding: 50px 0;
  transition: opacity .3s, padding .5s;
  opacity: 0;


  &.loaded {
    opacity: 1;
    padding: 100px 0;

    .pricing__header {
      transition: .4s;
      padding: 3rem;
    }
  }

  &__feature {
    background: #fff;
    color: $bg;
    width: 90%;
    margin: 0 auto;
    display: flex;
    flex-direction: column;
    align-items: center;
    box-sizing: border-box;
    justify-content: center;
    padding: 3rem 2rem;
  }

  &__benefits {
    display: flex;
    flex-direction: column;
    justify-content: center;
    flex-wrap: wrap;

    align-items: center;
    margin-bottom: 100px;
  }

  &__header {
    padding: 4rem;
    text-align: center;
    h1 {
      font-weight: 500;
      margin: 0;
      line-height: 2rem;
      font-size: 3rem;
    }
  }
}

@media (min-width: 992px) {
  .pricing__benefits {
    flex-direction: row;
    width: 80%;
    margin: 0 auto;
    margin-bottom: 100px;
  }

  .pricing__feature {
    width: 60%;
  }
}
</style>
