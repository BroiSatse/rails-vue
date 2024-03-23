import 'material-design-icons-iconfont/dist/material-design-icons.css'
import { md3 } from 'vuetify/blueprints'

import '~/styles/main.scss'
import { createVuetify } from 'vuetify'
import { aliases, md } from 'vuetify/iconsets/md'
import * as components from 'vuetify/components'
import * as directives from 'vuetify/directives'

import 'vuetify/styles'

let defaultTheme = 'light'
if (window.matchMedia && window.matchMedia('(prefers-color-scheme)').media !== 'not all') {
  if(window.matchMedia('(prefers-color-scheme: dark)').matches) {
    defaultTheme = 'dark';
  }
}

export default createVuetify({
  blueprint: md3,
  theme: { defaultTheme },
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
