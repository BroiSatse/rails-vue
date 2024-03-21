<template>
  <div class="h-75 pa-6 d-flex flex-column justify-center">
    <v-sheet width="450" elevation=10 class="pt-4 px-12 pb-8 mx-auto text-center">
      <h1 class="mb-4 text-h5 py-4">{{ title }}</h1>
      <slot></slot>
    </v-sheet>
  </div>
</template>

<script setup>
  const { title } = defineProps({
    title: String
  })
</script>
