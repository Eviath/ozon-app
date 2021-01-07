<template>
  <div
    v-bind:class="{'widget__block--row': row, 'widget__block--reverse': reverse}"
    class="widget__block"
  >
    <section>
      <h3 v-html="main.title" class="widget__name">{{main.title}}</h3>
      <div class="image-price">
        <h1 v-html="main.price" class="widget__price">{{main.price}}</h1>
        <small v-if="main.position === 'top'">Przykładowa wycena</small>
        <img v-if="main.picture" :src="main.picture.url" alt />
      </div>
    </section>
    <div v-if="main.position === 'top'" class="addition">
      <h1>50 m2 * 10 zł/m2 = 500zł</h1>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'WidgetItem',
  props: {
    position: String,
    row: Boolean,
    reverse: Boolean
  },
  computed: {
    ...mapGetters('pricing', ['getMainByPosition']),
    main() {
      return this.getMainByPosition(this.position)[0]
    }
  }
}
</script>

<style scoped lang="scss">
.widget {
  &__name {
    font-weight: 600;
    margin: 0;
    padding: 0;
    font-size: 1.3rem;
  }

  &__block_image {
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  &__block {
    align-items: center;
    text-align: center;
    padding: 1rem;
    width: 100%;
    box-sizing: border-box;
    font-size: 0.9rem;
    height: fit-content;
    flex-direction: column;
    display: flex;
    img {
      max-width: 300px;
    }

    .addition {
      font-size: 0.7rem;
    }

    &--reverse {
      flex-direction: column-reverse;
    }
  }

  &__price {
    margin: 0;
    font-weight: 700;
    font-size: 3rem;
    color: $bg;

    /deep/ small {
      font-size: 0.9rem;
    }
  }

  section {
    margin: 1rem 0;
    text-align: center;
    font-size: 1.5rem;
    display: flex;
    flex-direction: column;

    .image-price {
      display: flex;
      justify-content: center;
      align-items: center;
      flex-direction: column;
    }
  }

  &__block--row {
    display: flex;
    text-align: left;
    flex-direction: row;
    justify-content: center;

    &--reverse {
      flex-direction: column-reverse;
    }

    img {
      margin: 0;
    }
  }
}

@media (min-width: 768px) {
  .widget {
    &__name {
      font-weight: 400;
      font-size: 2.5rem;
    }

    &__price {
      margin: 1rem;
    }
  }
  .widget__block {
    width: 70%;
    font-size: 1rem;

    .addition {
      font-size: 1rem;
    }

    &--reverse {
      section {
        .image-price {
          display: flex;
          justify-content: center;
          align-items: center;
          flex-direction: row-reverse;
        }
      }

      flex-direction: column-reverse;
      img {
        margin-left: 20px;
        margin-right: 0;
      }
    }
  }
}
</style>
