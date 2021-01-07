<template>
  <router-link class='read-more-arrow' :to='path'>{{title}}</router-link>
</template>

<script>
export default {
  name: 'ArrowBtn',
  props: {
    title: String,
    path: String
  }
}
</script>

<style scoped lang="scss">
.read-more-arrow {
  text-decoration: none;
  position: relative;
  color: $white;
  text-transform: uppercase;
  display: block;
  font-weight: 600;
  font-size: .9rem;
  width: max-content;
  cursor: pointer;
  transition: .3s;

  &:hover {
    color: $second;

    &::after{
      transition: .3s;
      background: $second;
    }
  }

  &::after {
    content: '';
    background: #fff;
    height: 2px;
    width: 40px;
    position: absolute;
    right: -50px;
    bottom: 0;
    top: 0;
    margin: auto;
  }

  &::before {
    content: '>';
    height: 2px;
    width: 15px;
    font-weight: 700;
    position: absolute;
    right: -64px;
    top: 0.4px;
    margin: auto;
  }
}
</style>