import { plainAxiosInstance, securedAxiosInstance } from './axios'

export default {
  getAll() {
    return plainAxiosInstance.get('/api/v1/services').then(response => response.data)
  },
  getTiles() {
    return plainAxiosInstance.get('/api/v1/service/tiles').then(response => response.data)
  },
  getByID(id) {
    return plainAxiosInstance.get(`/api/v1/services/${id}`).then(response => response.data)
  },
  create(data) {
    const formData = new FormData()
    formData.append('title', data.title)
    formData.append('desc', data.desc)
    formData.append('header', data.header)
    formData.append('picture', data.image)
    return securedAxiosInstance.post('/api/v1/services',  formData, { headers: { 'Content-type': 'multipart/form-data' } }).then(response => response.data)
  },
  destroy(id) {
    return securedAxiosInstance.delete(`/api/v1/services/${id}`)
  },
  update(id, data) {
    const formData = new FormData()
    formData.append('title', data.title)
    formData.append('header', data.header)
    formData.append('desc', data.desc)
    if(data.image) {
      formData.append('picture', data.image)
    }
    return securedAxiosInstance.patch(`/api/v1/services/${id}`, formData, { headers: { 'Content-type': 'multipart/form-data' } }).then(response => response.data)
  },
  updateTile(id, data) {
    const formData = new FormData()
    formData.append('title', data.title)
    formData.append('desc', data.desc)
    if(data.image) {
      formData.append('picture', data.image)
    }
    return securedAxiosInstance.patch(`/api/v1/service/tiles/${id}`, formData, { headers: { 'Content-type': 'multipart/form-data' } }).then(response => response.data)
  }
}
