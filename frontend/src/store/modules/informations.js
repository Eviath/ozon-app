import informations from '../../api/informations'

// Helpers
const getData = (func, method) => ({ commit }) => {
  informations[func]().then(data => commit(method, data))
}

const set = key => (state, val) => {
  state[key] = val
}

// initial state
const state = {
  blocks: [],
  tiles: []
}

// getters
const getters = {
  getInformationsByPosition: (state) => {
    return keyword => state.blocks.filter(item => {
      return item.position === keyword
    })
  },
  getInformationByPosition: (state) => {
    return keyword => state.blocks.filter(item => {
      return item.position === keyword
    })
  }
}
 
// actions
const actions = {
  getInformationBlocks: getData('getBlocks', 'setBlocks'),
  getInformationTiles: getData('getTiles', 'setTiles'),
  updateBlock({ commit }, data) {
    informations.updateBlock(data[0], data[1]).then(blocks => commit('setBlocks', blocks))
  },
  updateTile({ commit }, data) {
    informations.updateTile(data[0], data[1]).then(tiles => commit('setTiles', tiles))
  }
}

const mutations = {
  setBlocks: set('blocks'),
  setTiles: set('tiles'),
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
