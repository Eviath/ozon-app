<template>
  <router-link :class="{brand: true}" to="/">
    <div :class="`brand__text ${white ? 'brand__text--white' : ''}`">
      <sub>ozon</sub>
      <span>EXPERT</span>
    </div>
    <div :class="`brand__image ${white ? 'brand__image--white' : ''}`">
      <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 107.37 33.92">
        <path
          class="cls-1"
          d="M100.53,12.17c-1.47.07-3.37-.69-4.88-1a61.26,61.26,0,0,0-7.88-.87C72.29,9.66,57.56,16.08,43,20.23a92.22,92.22,0,0,1-13.44,2.91,33.66,33.66,0,0,1-8.85-.29,16.8,16.8,0,0,1-9.47-4.59c-2.56-2.61-4-6.78-2.3-10.24L9,7.88a13.16,13.16,0,0,1,5.67-5.6,21.55,21.55,0,0,1,6.83-2A29.28,29.28,0,0,1,32.14.7a20.9,20.9,0,0,1,9.41,4.93c.38.36,3.27,3.23,1.89,3.51a1.43,1.43,0,0,1-.94-.28C34.23,4.05,23.68,3.93,14.85,7.59a6.88,6.88,0,0,0-3,2,4.58,4.58,0,0,0-.44,4.51,6.81,6.81,0,0,0,3.31,3.28,13.2,13.2,0,0,0,4.59,1.15,34.67,34.67,0,0,0,14.32-2C39,14.69,43.91,11.93,49.06,9.74,58.21,5.86,67.74,3.37,77.74,3.4,85,3.42,93.26,5,98.74,10A14.85,14.85,0,0,1,100.53,12.17Z"
        />
        <path
          class="cls-1"
          d="M106.72,23.68a14.58,14.58,0,0,0-1.93-1.4,14.18,14.18,0,0,0-4.47-1.66A27.06,27.06,0,0,0,89.13,21c-6.53,1.29-12.71,3.77-18.94,6A124.21,124.21,0,0,1,48,32.56a86.18,86.18,0,0,1-21.81,1.07,48.62,48.62,0,0,1-9.72-1.84,31.07,31.07,0,0,1-9.15-4.31,20.17,20.17,0,0,1-3.56-3.22,16.51,16.51,0,0,1-2.63-4,14.9,14.9,0,0,1-.71-1.89c-.08-.3-.17-.62-.23-.93a2.45,2.45,0,0,1-.14-1c.11,0,.23.12.29.21a5.63,5.63,0,0,1,.38.68,10.93,10.93,0,0,0,2,2.42,38,38,0,0,0,3.6,3.22c10.11,7.45,24.18,5.8,35.62,3,10.26-2.53,20.14-6.3,30.31-9.12h0c1.16-.33,2.33-.65,3.5-1,5.39-1.46,11-2.92,16.65-2a22.11,22.11,0,0,1,14.74,9.41C107.62,23.91,107.22,24.11,106.72,23.68Z"
        />
      </svg>
    </div>
  </router-link>
</template>

<script>
export default {
  name: 'Brand',
  props: {
    white: Boolean
  }
}
</script>

<style scoped lang="scss">
.brand {
  text-decoration: none;
  width: 100%;
  justify-content: center;
  align-items: center;
  display: flex;
  flex-direction: row;
  justify-content: space-evenly;

  sub {
    margin: 0;
    padding: 0;
    font-size: 1.5rem;
    font-weight: 500;
  }

  span {
    font-weight: 700;
    margin: 0;
    font-size: 1.5rem;
  }

  &__text {
    display: flex;
    color: $bg;
    flex-direction: column;
    padding-bottom: 1rem;
    line-height: 18px;
    text-align: left;

    &--white {
      color: #fff;
    }
  }

  &__image {
    height: auto;
    width: 30%;
    svg {
      fill: $bg;
    }

    &--white {
      svg {
        fill: #fff;
      }
    }
  }
}

@media (min-width: 768px) {
}

// Large devices (desktops, 992px and up)
@media (min-width: 992px) {
  .brand {
    display: flex;
    flex-direction: row;
    text-align: left;
    justify-content: space-between;
    width: 180px;
    align-items: center;

    &__text {
      display: flex;
      flex-direction: column;
      text-align: left;
      padding: 0;
    }

    &__image {
      margin-left: 10px;
      display: flex;
      flex-direction: column;
      line-height: 15px;
      width: 100% !important;
      justify-content: center;
      text-align: left;
    }

    sub {
      margin: 0;
      padding: 0;
    }

    span {
      margin: 0;
      font-size: 1.5rem;
    }
  }
}
</style>
