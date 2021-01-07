<template>
  <div v-bind:class="{ active: isActive }" class="event__item" v-on:click="isActive = !isActive">
    <p>{{event.desc}}</p>
    <time>
      <small>{{event.timeline}}</small>
    </time>
  </div>
</template>

<script>
export default {
  name: 'Event',
  props: {
    event: Object
  },
  data() {
    return {
      isActive: false
    }
  }
}
</script>


<style scoped lang="scss">
.event__item {
  padding: 1.5rem 1rem;
  border-radius: 10px;
  background: #fff;
  color: $gray;
  margin: 0.5rem 0;
  box-shadow: 0px 5px 17px -4px rgba(37, 37, 37, 0.37);
  margin-top: 0;
  transition: 0.3s;

  &.active {
    padding: 1.5rem;
  }
  h1 {
    font-size: 0.9rem;
  }
  p {
    font-size: 0.9rem;
    margin: 0;
  }
  small {
    color: $second;
  }
}
</style>
