<template>
    <header class="page-404">
      <SectionTitle title='404' arrow/>
      <p>Ups, nie udało nam się odnaleźć strony, której szukasz...</p>
    </header>
</template>

<script>
import SectionTitle from '@/components/SectionTitle'
export default {
  name: '404',
  components: { SectionTitle },
}
</script>

<style scoped lang='scss'>
.page-404 {
  min-height: 100vh;
  text-align: center;
}
</style>