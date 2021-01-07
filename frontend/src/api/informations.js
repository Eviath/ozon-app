import { plainAxiosInstance, securedAxiosInstance } from './axios'

export default {
  getBlocks() {
    return plainAxiosInstance.get('/api/v1/information/blocks').then(response => response.data)
  },
  getTiles() {
    return plainAxiosInstance.get('/api/v1/information/tiles').then(response => response.data)
  },
  updateBlock(id, data) {
    return securedAxiosInstance.patch(`/api/v1/information/blocks/${id}`, data).then(response => response.data)
  },
  updateTile(id, data) {
    const formData = new FormData()
    formData.append('desc', data.desc)
    if(data.image) {
      formData.append('picture', data.image)
    }
    return securedAxiosInstance.patch(`/api/v1/information/tiles/${id}`, formData, { headers: { 'Content-type': 'multipart/form-data' } }).then(response => response.data)
  }
}
