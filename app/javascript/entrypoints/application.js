import 'material-design-icons-iconfont/dist/material-design-icons.css'
import { createApp } from "vue"
import App from "../components/App.vue"

// Vuetify
import 'vuetify/styles'
import { createVuetify } from 'vuetify'
import { aliases, md } from 'vuetify/iconsets/md'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

const vuetify = createVuetify({
  theme: {
    defaultTheme: 'dark'
  },
  icons: {
    defaultSet: 'md',
    aliases,
    sets: { md }
  },
  components,
  directives
})

createApp(App).use(vuetify).mount('#app')
