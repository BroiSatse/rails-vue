// js-from-routes automatically fetches csrf token from meta, however current rails version disallows the same token
// to be reused twice. This is why we need to get a new token for each api request.

import { AxiosConfig } from '@js-from-routes/axios'
let csrfMeta = null

AxiosConfig.instance.interceptors.response.use(
  function (response) {
    const newToken = response.headers['x-csrf-token']
    if (newToken) {
      csrfMeta = csrfMeta || document.querySelector('meta[name=csrf-token]')
      csrfMeta.content = newToken
    }
    return response
  }
);


