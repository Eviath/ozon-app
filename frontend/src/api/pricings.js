import { plainAxiosInstance } from './axios'

export default {
  getBenefits() {
    return plainAxiosInstance.get('/api/v1/pricing/benefits').then(response => response.data)
  },
  getMains() {
    return plainAxiosInstance.get('/api/v1/pricing/mains').then(response => response.data)
  },
  getFeatures(){
    return plainAxiosInstance.get('/api/v1/pricing/features').then(response => response.data)
  }
}
