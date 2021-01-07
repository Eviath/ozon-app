import axios from 'axios'
import Vue from 'vue'

const vuexState = JSON.parse(window.localStorage.getItem('vuex'))

const securedAxiosInstance = axios.create({
  baseURL: '/',
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json',
    'Authorization': `Bearer ${vuexState ? vuexState.user.jwtToken : 'not set'}`
  }
})

const plainAxiosInstance = axios.create({
  baseURL: '/',
  withCredentials: true,
  headers: {
    'Content-Type': 'application/json'
  }
})

securedAxiosInstance.interceptors.request.use(config => {
  const method = config.method.toUpperCase()
  if (method !== 'OPTIONS' && method !== 'GET') {
    config.headers = {
      ...config.headers,
      'Authorization': `Bearer ${vuexState ? vuexState.user.jwtToken : 'not set'}`
    }
  }
  return config
})

securedAxiosInstance.interceptors.response.use(null, error => {
  if (error.response && error.response.config && error.response.status === 401) {
    // If 401 by expired access cookie, we do a refresh request
    Vue.$router.replace('/signin')
  } else {
    return Promise.reject(error)
  }
})

export { securedAxiosInstance, plainAxiosInstance }
