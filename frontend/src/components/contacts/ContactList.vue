<template>
  <section :class="{vertical: vertical, reverse: reverse, contacts: true, white: white}">
    <small>
      <img :src="imageUrl('clock')" alt />
      Pn-Pt: 24h
    </small>
    <small>
      <img :src="imageUrl('phone')" alt />
      (+48) 512-144-180
    </small>
    <small>
      <img :src="imageUrl('mail')" alt />
      biuro@ozonexpert.pl
    </small>
  </section>
</template>

<script>
export default {
  name: 'ContactList',
  props: {
    reverse: Boolean,
    vertical: Boolean,
    white: Boolean
  },
  methods: {
    imageUrl: function(image) {
      return '/img/' + image + (this.white ? '-w' : '') + '.png'
    }
  }
}
</script>

<style scoped lang="scss">
.contacts {
  display: flex;
  text-align: center;
  color: $bg;
  flex-direction: column;
  font-weight: 500;
  img {
    margin-right: 15px;
  }
  small {
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0.25rem 1rem;
  }
  &.white {
    color: $white;
  }
  &.vertical {
    flex-direction: column;
    padding: 0;
    align-items: center;
    justify-content: center;

    small {
      padding: 1rem 0;
    }
  }

  &.reverse {
    flex-direction: row-reverse;
  }
}

@media (min-width: 992px) {
  .contacts {
    margin-left: 0;
    display: flex;
    justify-content: space-between;
    align-items: center;
    flex-direction: row;
    &.vertical {
      align-items: flex-start;
    }
  }
}

@media (min-width: 1200px) {
  .contacts {
    &:not(.vertical) {
      margin-left: 50px;
    }
  }
}
</style>