import { createApp } from "vue"
import vuetify from './vuetify'
import router from './router'
import App from "~/components/App.vue"

export default createApp(App).use(vuetify).use(router)
