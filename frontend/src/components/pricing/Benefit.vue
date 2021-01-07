<template>
  <div class="benefit">
    <img :src="benefit.picture.url" alt />
    <h1>{{benefit.title}}</h1>
    <ul>
      <li v-for="(trait, index) in benefit.traits" :key="index">{{trait}}</li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Benefit',
  props: {
    benefit: Object
  }
}
</script>

<style scoped lang="scss">
.benefit {
  padding: 1rem;
  width: 100%;
  text-align: center;
  box-sizing: border-box;
  height: 200px;

  ul {
    padding: 0;
    list-style: none;
  }

  ul li:before {
    content: '✓';
    margin-right: 10px;
    color: $second;
  }
}

@media (min-width: 992px) {
  .benefit {
    text-align: left;
    width: 25%;
    height: auto;
    padding: 2rem 2rem;
  }
 }
</style>
