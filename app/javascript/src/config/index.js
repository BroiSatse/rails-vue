import { createApp } from "vue"
import vuetify from './vuetify'
import router from './router'
import App from "~/components/App.vue"
import { refreshCurrentUser } from "~/concepts/auth";

export default refreshCurrentUser().then(() => createApp(App).use(vuetify).use(router))

