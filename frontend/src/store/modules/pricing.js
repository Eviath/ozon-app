import pricings from '../../api/pricings'

// initial state
const state = {
  benefits: [],
  mains: [],
  feature: {}
}

// getters
const getters = {
  getMainByPosition: (state) => {
    return keyword => state.mains.filter(item => {
      return item.position === keyword
    })
  },
  getFeature: (state) => {
    return state.feature
  }
}

// actions
const actions = {
  getBenefits({ commit }) {
    pricings.getBenefits().then(benefits => commit('setBenefits', benefits))
  },
  getMains({ commit }) {
    pricings.getMains().then(mains => commit('setMains', mains))
  },
  getFeatures({ commit }) {
    pricings.getFeatures().then(feature => commit('setFeature', feature))
  }
}

// mutations
const mutations = {
  setBenefits(state, benefits) {
    state.benefits = benefits
  },
  setMains(state, mains) {
    state.mains = mains
  },
  setFeature(state, feature) {
    state.feature = feature
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
