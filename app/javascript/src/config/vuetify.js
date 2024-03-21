import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '~/styles/main.scss'
import { createVuetify } from 'vuetify'
import { aliases, md } from 'vuetify/iconsets/md'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

import 'vuetify/styles'

export default createVuetify({
  theme: {
    // defaultTheme: 'dark'
  },
  icons: {
    defaultSet: 'md',
    aliases,
    sets: { md }
  },
  defaults: {
    VTextField: {
      variant: 'underlined'
    }
  },
  components,
  directives
})
