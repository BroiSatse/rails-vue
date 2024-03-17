<template>
  <v-layout class="rounded rounded-md">
    <v-app-bar>
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title>This is a hat</v-app-bar-title>
    </v-app-bar>

    <v-navigation-drawer :model-value="drawer">
      <v-list>
        <v-list-item title="Navigation drawer"></v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-main class="d-flex align-center justify-center" style="min-height: 300px;">
      Main Content <v-icon icon="$vuetify"></v-icon>
    </v-main>
  </v-layout>
</template>

<script setup>
  import { ref } from "vue";
  const drawer = ref(false);
</script>
