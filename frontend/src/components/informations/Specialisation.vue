<template>
  <div class="specialisation">
    <main>
      <section class="content">
        <article>
          <header>
            <h1>W czym się specjalizujemy?</h1>
          </header>

          <h3>Sprawdź zakres naszych usług – razem szybko i bezstresowo rozwiążemy Twój problem. Zajmujemy się przede wszystkim:</h3>

          <section class="articleContent articleContent--specific">
            <ul class="articleContent__desc">
              <li v-for="(item, index) in list" :key="index">{{item}}</li>
            </ul>
          </section>

          <footer>
            <ArrowBtn path="/informacje" title="Dowiedz się więcej" />
          </footer>
        </article>
      </section>
    </main>
  </div>
</template>

<script>
import ArrowBtn from '@/components/buttons/ArrowBtn'
export default {
  name: 'Specialisation',
  components: { ArrowBtn },
  data() {
    return {
      list: [
        'Ozonowaniem domów, mieszkań, biur oraz dużych jednostek takich jak szkoły, szpitale, restauracje czy ośrodki sportowe.',
        'Ozonowaniem środków transportu takich jak samochody osobowe, samochody ciężarowe statki, autokary, samoloty i pociągi. Usługa obejmuje także skuteczne czyszczenie klimatyzacji.',
        'Dezynfekcją – usuwaniem bakterii, wirusów, grzybów, alergenów i pleśni.',
        'Dezodoryzacją – usuwaniem nieprzyjemnych zapachów (dym papierosowy, stęchlizna, spalenizna, zapachy odzwierzęce i wiele innych).'
      ]
    }
  }
}
</script>

<style scoped lang="scss">
.specialisation {
  padding: 100px 0 0 0;
  main {
    color: $lightb;
    width: 80%;
    margin: 0 auto;
    article header {
      color: $white;
        font-size: 2rem;

    }
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

.articleContent {
  &--specific {
    margin: 50px auto;
    width: 90%;
    .articleContent__title {
      color: $white;
    }

    ul li {
      letter-spacing: 0.04rem;
      padding: 0.5rem 0;
    }
  }
}

@media (min-width: 768px) {
  .specialisation {
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