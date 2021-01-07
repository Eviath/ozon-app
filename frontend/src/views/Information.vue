<template>
  <div :class="{loaded: loaded, information: true}">
    <header class="about__header">
      <SectionTitle title="Informacje" arrow />
    </header>
    <main>
      <section class="content">
        <article>
          <header>
            <h1>Ozonowanie</h1>
          </header>

          <h3>Wykonujemy usługi ozonowania na terenie Gdańska i okolic. Konsultacja jest w pełni darmowa. Nie pobieramy opłaty za dojazd do klienta.</h3>

          <section v-if="blocks1" class="articleContent__bodies">
            <ArticleBody v-for="(article, index) in blocks1" :key="index" :article="article" />
          </section>

          <section class="articleContent articleContent--specific">
            <h3 class="articleContent__title">Dlaczego warto rozważyć czyszczenie ozonem?</h3>
            <ul class="articleContent__desc">
              <InformationTile v-for="(item, index) in tiles" :key="index" :item="item" />
            </ul>
          </section>

          
          <section v-if="blocks2" class="articleContent__bodies">
            <ArticleBody v-for="(article, index) in blocks2" :key="index" :article="article" />
          </section>
        </article>
      </section>
    </main>
  </div>
</template>

<script>
import SectionTitle from '@/components/SectionTitle'
import ArticleBody from '@/components/articles/ArticleBody'
import InformationTile from '@/components/informations/InformationTile'
import { mapState, mapGetters } from 'vuex'

export default {
  name: 'Information',
  components: { SectionTitle, ArticleBody, InformationTile },
  methods: {
    setLoaded: function() {
      setTimeout(() => {
        this.loaded = true
      }, 200)
    }
  },
  computed: {
    ...mapState({ tiles: state => state.informations.tiles }),
    ...mapState({ blocks: state => state.informations.blocks }),
    ...mapGetters('informations', ['getInformationsByPosition']),
    blocks1() {
      return this.getInformationsByPosition('articles1')
    },
    blocks2() {
      return this.getInformationsByPosition('articles')
    }
  },
  created() {
    this.$store.dispatch('informations/getInformationTiles')
    this.$store.dispatch('informations/getInformationBlocks')
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

<style scoped lang='scss'>
.information {
  min-height: 100vh;
  padding: 50px 0;

  transition: opacity 0.3s, padding 0.5s;
  opacity: 0;

  &.loaded {
    opacity: 1;
  }

  article header h1 {
    color: $white;
    font-size: 2rem;
  }

  main {
    color: $lightb;
    width: 90%;
    margin: 0 auto;
    main {
      .content {
        width: 80%;
        margin: 0 auto;
        color: $lightb;
        letter-spacing: 0.03rem;

    
      }
    }
  }
}

.articleContent__bodies {
  display: flex;
  flex-direction: column;
  flex-wrap: wrap;
  margin: 100px 0;

  h3 {
    color: $white;
  }
}

.articleContent {
  &--specific {
    margin: 0auto;
    width: 90%;
    .articleContent__title {
      font-size: 1.5rem;
      color: $white;
    }
  }
}

@media (min-width: 768px) {
  .articleContent__bodies {
    display: flex;
    flex-wrap: wrap;
    margin: 100px 0;
  }
  .information {
    main {
      article {
        header {
          font-size: 3rem;
        }
      }
    }
  }
}
</style>