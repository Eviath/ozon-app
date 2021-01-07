import user from '../../api/user'
import router from '../../router'
import Vue from 'vue'

// initial state
const state = {
  jwtToken: null,
  data: null,
  loggedIn: false
}

// getters
const getters = {
  loggedIn: state => {
    return state.loggedIn
  },
  userEmail: state => {
    return state.data ? state.data.email : null
  }
}

// actions
const actions = {
  getUserData({ commit }, data) {
    user.login(data).then(payload => {
      commit('setUser', payload)
      router.replace('/')
      location.reload()
    })
  },
  logoutUser({ commit }) {
    commit('clearUser')
  },
  validateUserData() {
    return 'test'
  }
}

// mutations
const mutations = {
  setUser(state, payload) {
    state.data = Vue.$jwt.decode(payload.token)
    state.jwtToken = payload.token
    state.loggedIn = true
  },
  clearUser(state) {
    state.data = null
    state.jwtToken = null
    state.loggedIn = false
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
