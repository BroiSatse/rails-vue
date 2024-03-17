import { defineConfig } from 'vite'
import vue from "@vitejs/plugin-vue"
import RubyPlugin from 'vite-plugin-ruby'
import FullReload from 'vite-plugin-full-reload'

export default defineConfig({
  plugins: [
    RubyPlugin(),
    FullReload(['app/views/**/*'], { delay: 200 }),
    vue()
  ],
})
