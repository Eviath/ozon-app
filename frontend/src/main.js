/* eslint-disable quotes */
import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueAxios from 'vue-axios'
import VueJWT from 'vuejs-jwt'
import { securedAxiosInstance, plainAxiosInstance } from './api/axios'
import wysiwyg from "vue-wysiwyg"
Vue.use(wysiwyg, {
  forcePlainTextOnPaste: true,
  image: {
    uploadURL: "http://localhost:3000/api/v1/upload"
  },
})
Vue.config.productionTip = false
Vue.use(VueJWT)
Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  securedAxiosInstance,
  plainAxiosInstance,
  components: { App },
  render: h => h(App)
})
