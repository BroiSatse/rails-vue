<template>
  <Layout><slot></slot></Layout>
</template>

<script setup>
  import { useRoute } from "vue-router";
  import Blank from './Blank.vue'
  import Full from './Full.vue'

  const layouts = {
    blank: Blank,
    default: Full
  }

  const route = useRoute()
  const Layout = layouts[route.meta.layout || 'default']
</script>
