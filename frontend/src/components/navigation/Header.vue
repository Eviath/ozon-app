<template>
  <div class="navigation" v-bind:class="{compressed: isUserScrolling}">
    <div class="toggle" @click="isActive = !isActive">
      <img src="@/assets/menu.svg" alt />
    </div>
    <div class="collapse" v-bind:class="{active: isActive}">
      <div class="meta">
        <Brand white />
      </div>
      <Navigation @clicked="onClickChild" header />
    </div>
  </div>
</template>

<script>
import Navigation from './Navigation'
import Brand from './Brand'

export default {
  name: 'Header',
  components: { Navigation, Brand },
  data() {
    return {
      isUserScrolling: false,
      isActive: false
    }
  },
  created() {
    window.addEventListener('scroll', this.handleScroll)
  },
  destroyed() {
    window.removeEventListener('scroll', this.handleScroll)
  },
  methods: {
    handleScroll() {
      this.isUserScrolling = window.scrollY > 10
    },
    onClickChild: function() {
      this.isActive = false
    }
  }
}
</script>

<style scoped lang="scss">
.navigation {
  width: 100%;
  height: 10%;
  display: flex;
  flex-direction: column;
  position: fixed;
  align-items: center;
  justify-content: center;
  z-index: 99999999;
  justify-content: space-around;

  .collapse {
    position: fixed;
    top: 0;
    transition: 0.4s;
    transform: translateX(-100%);
    background: $bg;
    height: 100%;
    width: 100%;
    flex-direction: column;
    align-items: center;
    display: flex;
    justify-content: space-evenly;
  }

  .collapse.active {
    transform: translateX(0);
  }

  .toggle {
    img {
      width: 40px;
      object-fit: scale-down;
      height: 15px;
      filter: invert(1);
    }
    display: block;
    z-index: 99999999;
    position: fixed;
    left: 15px;
    top: 20px;
    cursor: pointer;
  }

  .meta {
    width: 100%;
    display: flex;
    flex-direction: column;
    height: 20vh;
    a {
      text-decoration: none;
    }
  }
}

@media (min-width: 768px) {
}

// Large devices (desktops, 992px and up)
@media (min-width: 992px) {
  .navigation {
    height: auto;
    display: flex;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    box-sizing: border-box;
    flex-direction: row;
    background: transparent;
    transition: 0.4s ease-in-out;

    nav {
      margin-left: auto;
      width: max-content;
    }

    .collapse {
      position: relative;
      top: 0;
      padding: 1rem;
      display: flex;
      transform: translateX(0);
      background: transparent;
      align-items: center;
      justify-content: space-between;

      flex-direction: row;
      align-items: center;
    }

    .toggle {
      display: none;
    }

    &.compressed {
      .collapse {
        padding: 0.5rem;
        background: $bg;
        -webkit-box-shadow: 0px 4px 10px -8px rgba(0, 0, 0, 0.75);
        -moz-box-shadow: 0px 4px 10px -8px rgba(0, 0, 0, 0.75);
        box-shadow: 0px 4px 10px -8px rgba(0, 0, 0, 0.75);
      }
    }

    .meta {
      align-items: center;
      height: 100%;
      display: flex;
      flex-direction: row;
    }

    a {
      text-decoration: none;
      padding: 0 0.3rem;
      color: #fff;
    }
  }
}

// Extra large devices (large desktops, 1200px and up)
@media (min-width: 1200px) {
  .navigation {
    .collapse {
      min-height: 100px;
      padding: 1rem;
    }
    &.compressed {
      .collapse {
      min-height:auto;
      }
    }
    a {
      padding: 0 1rem;
    }
  }
}
</style>
