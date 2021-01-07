import { plainAxiosInstance } from './axios'

export default {
  login(data) {
    return plainAxiosInstance.post('/api/v1/auth', { email: data['email'], password: data['password'] }).then(response => response.data)
  }
}
