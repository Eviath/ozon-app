import contacts from '../../api/contacts'

// initial state
const state = {
  all: [],
  order: {},
  orderCreated: false,
  errors: null
}

// getters
const getters = {
  getContactByPosition: (state) => {
    return keyword => state.all.filter(item => {
      return item.position === keyword
    })
  },
}

// actions
const actions = {
  getContacts({ commit }) {
    contacts.getAll().then(contacts => commit('setContacts', contacts))
  },
  createNewOrder({ commit }, data) {
    contacts.createOrder(data).then(response => {
      if (response.error) {
        commit('addError', response.error)
      } else {
        commit('addOrder', response)
        commit('clearError')
      }
    })
  },
  clearOrder({commit}) {
    commit('clearOrder')
    commit('clearError')
  },
  updateContact({ commit }, data) {
    contacts.update(data[0], data[1]).then(contacts => commit('setContacts', contacts))
  }
}

// mutations
const mutations = {
  setContacts(state, contacts) {
    state.all = contacts
  },
  addOrder(state, order) {
    state.order = order
    state.orderCreated = true
  },
  clearOrder(state) {
    state.order = null
    state.orderCreated = false
  },
  addError(state, errors) {
    state.errors = errors
  },
  clearError(state) {
    state.errors = null
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
