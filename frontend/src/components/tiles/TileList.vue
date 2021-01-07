<template>
  <section class="tiles">
    <h1>{{title}}</h1>
    <main>
      <Tile v-for="tile in tiles" :key="tile.id" :tile="tile" />
    </main>
  </section>
</template>

<script>
import Tile from './Tile'
import { mapState } from 'vuex'
export default {
  name: 'TileList',
  components: { Tile },
  props: {
    title: String
  },
  computed: {
    ...mapState({ tiles: state => state.services.tiles })
  },
  created() {
    this.$store.dispatch('services/getServiceTiles')
  }
}
</script>

<style scoped lang="scss">
.tiles {
  h1 {
    text-align: center;
    color: $white;
  }
  text-align: left;
  margin: 5rem 0;

  main {
    display: flex;
    flex-direction: column;
    flex-wrap: wrap;
  }
}

@media (min-width: 768px) {

  .tiles h1 {
        font-size: 3rem;
  }
 }

@media (min-width: 992px) {
  .tiles {
      padding: 2rem;
      margin: 0;
    main {
      flex-direction: row;
    }
  }
}
</style>
