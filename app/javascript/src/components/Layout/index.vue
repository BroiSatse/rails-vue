<template>
  <component :is="layout"><slot></slot></component>
</template>

<script setup>
  import { computed } from "vue";
  import { useRoute } from "vue-router";
  import Blank from './Blank.vue'
  import Full from './Full.vue'

  const layouts = {
    blank: Blank,
    default: Full
  }

  const route = useRoute()
  const layout = computed(() => layouts[route.meta.layout || 'default'])

</script>
