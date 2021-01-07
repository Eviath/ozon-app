<template>
  <ul v-bind:class="{active: isActive}" class="events disable-scrollbars">
    <div class="persistent events--before"></div>
    <div class="list">
      <div v-on:click="isActive = !isActive" class="btn--show">></div>
      <li v-for="event in events" :key="event.id" :event="event">
        <Event :event="event" />
      </li>
    </div>
    <div class="persistent events--after"></div>
  </ul>
</template>


<script>
import Event from './Event.vue'
const events = [
  {
    id: 1,
    title: 'Promocja przedszkolna',
    desc: '20% zniżki na usługi w przedszkolach',
    timeline: 'Promocja do końca kwietnia'
  }
]

export default {
  name: 'EventList',
  components: { Event },
  data() {
    return {
      events: events,
      isActive: true
    }
  }
}
</script>

<style scoped lang="scss">
.events {
  list-style-type: none;
  right: 0;
  left: 0;
  padding: 0;
  margin: 0 auto;
  justify-content: center;
  align-items: flex-end;
  height: auto;
  margin-bottom: 50px;
  width: 100%;
  padding: 1rem;
  will-change: width, scroll-position;
  -webkit-backface-visibility: hidden;
  backface-visibility: hidden;
  transform: translateX(90%);
  display: flex;
  transition: 0.4s;

  &.active {
    transform: translateX(0);

    .btn--show {
      width: 80px !important;
      height: 15px !important;
      transform: rotateZ(0deg) !important;
      right: 0 !important;
      left: 0 !important;
      top: -30px !important;
    }
  }

  .persistent {
    height: 35vh;
    display: none;
  }

  .list {
    position: relative;
    .btn--show {
      transition: 0.3s;
      position: absolute;
      left: -40px;

      top: 0px;
      margin: auto;
      cursor: pointer;
      color: $gray;
      font-weight: 700;
      font-size: 1.2rem;
      display: flex;
      justify-content: center;
      align-items: center;
      width: 30px;
      height: 150px;
      background: #fff;
      border-radius: 25px;
      transform: rotateZ(180deg);
    }
  }
}

@media (min-width: 768px) {
  .events {
    justify-content: flex-end;
    position: absolute;
    left: auto;
    transform: translateX(100%);
    height: 90vh;
    margin: 0 auto;
    width: 300px;
    padding: 0;
    .persistent {
      display: block;
    }

    &.active {
      right: 20px;
    }
  }
}
</style>
