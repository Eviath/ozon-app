<template>
  <div class="widget">
    <header>
      <WidgetItem position="top" />
      <hr>
      <WidgetItem reverse position="bus" />
    </header>

    <small class="widget__annotation">* Ceny brutto</small>
    <router-link class="btn widget__contact" to="kontakt">Skontaktuj się</router-link>
  </div>
</template>


<script>
import WidgetItem from './WidgetItem'
export default {
  name: 'Widget',
  components: { WidgetItem },
  created() {
    this.$store.dispatch('pricing/getMains')
  }
}
</script>

<style scoped lang="scss">
.widget {
  background: #fff;
  color: $bg;
  width: 90%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  &__annotation {
    padding: 0.5rem 0;
    color: $gray;
  }

  .btn {
    color: $bg;
    font-weight: 600;
    background: $light;
    width: 100%;
    box-sizing: border-box;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 1rem;
  }

  header {
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 0.5rem;
    hr {
      width: 80%;
      margin: 0 auto;
      margin: 1rem 0;
      opacity: 0.1;
      border-color: $bg;
    }
  }

  section {
    display: flex;
    margin: 0 auto;
    width: 95%;
    flex-direction: column;
    justify-content: space-between;
  }
}
@media (min-width: 992px) {
  .widget {
    width: 60%;
    section {
      padding: 0 2rem;
      flex-direction: row;
    }
  }
}
</style>