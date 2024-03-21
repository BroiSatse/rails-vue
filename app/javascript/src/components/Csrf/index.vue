<template>
  <input type="hidden" name="authenticity_token" :value="csrf" />
</template>

<script setup>
  const csrf = document.querySelector('meta[name="csrf-token"]').getAttribute('content')
</script>
