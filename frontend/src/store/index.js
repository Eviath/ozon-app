import Vue from 'vue'
import Vuex from 'vuex'
import user from './modules/user'
import toolbar from './modules/toolbar'
import services from './modules/services'
import contacts from './modules/contacts'
import pricing from './modules/pricing'
import informations from './modules/informations'
import createPersistedState from 'vuex-persistedstate'
Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    user,
    services,
    toolbar,
    informations,
    contacts,
    pricing
  },
  plugins: [createPersistedState()]
})
