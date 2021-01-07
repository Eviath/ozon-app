<template>
  <div class="toolbar">
    <div class="resource-admin">
      <p>{{resourceName}}</p>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
export default {
  name: 'Toolbar',
  computed: {
    ...mapGetters('toolbar', ['resourceName'])
  }
}
</script>

<style scoped lang="scss">
.toolbar {
  position: fixed;
  background: $purple;
  left: 0;
  bottom: 0;
  margin: auto;
  top: 0;
  width: 50px;
  height: 80vh;
}
</style>
