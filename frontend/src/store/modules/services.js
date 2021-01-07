import services from '../../api/services'

// Helpers
const getData = (func, method) => ({ commit }) => {
  services[func]().then(data => commit(method, data))
}

const getDataByID = (func, method) => ({ commit }, param) => {
  services[func](param).then(data => commit(method, data))
}

const set = key => (state, val) => {
  state[key] = val
}

// initial state
const state = {
  all: [],
  single_service: {},
  tiles: []
}
// getters
const getters = {}
 
// actions
const actions = {
  getAllServices: getData('getAll', 'setServices'),
  getServiceTiles: getData('getTiles', 'setTiles'),
  getSingleService: getDataByID('getByID', 'setSingleService'),
  createNewService({ commit }, data) {
    services.create(data).then(service => commit('addService', service))
  },
  deleteService({ commit }, service) {
    services.destroy(service.id).then(() => commit('removeService', service))
  },
  updateService({ commit }, data) {
    services.update(data[0], data[1]).then(service => commit('setSingleService', service))
  },
  updateTile({ commit }, data) {
    services.updateTile(data[0], data[1]).then(tiles => commit('setTiles', tiles))
  }
}

const mutations = {
  setServices: set('all'),
  setTiles: set('tiles'),
  setSingleService: set('single_service'),

  addService(state, service) {
    state.all = [...state.all, service]
  },
  removeService(state, service) {
    state.all.splice(state.all.indexOf(service), 1)
  }
}

export default {
  namespaced: true,
  state,
  getters,
  actions,
  mutations
}
