import { plainAxiosInstance, securedAxiosInstance } from './axios'

export default {
  getAll() {
    return plainAxiosInstance.get('/api/v1/contacts').then(response => response.data)
  },
  createOrder(data) {
    return plainAxiosInstance.post('/api/v1/contact/orders', { order: data }).then(response => response.data)
  },
  update(id, data) {
    return securedAxiosInstance.patch(`/api/v1/contacts/${id}`, data).then(response => response.data)
  }
}
