import { defineConfig } from 'vite'
import vue from "@vitejs/plugin-vue"
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'
import vuetify from "vite-plugin-vuetify"

const config = defineConfig({
  root: '/app/javascript',
  resolve: {
    alias: {
      '~': '/src'
    }
  },
  plugins: [
    RubyPlugin(),
    FullReload(['app/views/**/*'], { delay: 200 }),
    vue(),
    vuetify({styles: { configFile: 'src/styles/settings.scss' }})

  ],
})


export default config
