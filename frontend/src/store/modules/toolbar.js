// initial state
const state = {
  resource: 'Not provided'
}

// getters
const getters = {
  resourceName: state => {
    return state.resource
  }
}

// actions
const actions = {
  getResourceName({ commit }, resource) {
    commit('pushName', resource)
  }
}

// mutations
const mutations = {
  pushName(state, resource) {
    state.resource = resource
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
