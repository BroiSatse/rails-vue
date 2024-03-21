<template xmlns="http://www.w3.org/1999/html">
  <v-app class="p-4">
    <v-app-bar>
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer" class="d-lg-none"></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title>This is a hat</v-app-bar-title>
    </v-app-bar>

    <v-navigation-drawer expand-on-hover :rail="!$vuetify.display.mobile || !drawer" v-model="drawer">
      <v-list>
        <v-list-item title="Home" prepend-icon="home" :to="{name: routes.root}"></v-list-item>
      </v-list>

      <template v-slot:append>
        <v-list>
          <v-list-item title="My account" @click="signOut" prepend-icon="manage_accounts"></v-list-item>
          <v-list-item title="Sign out" @click="signOut" prepend-icon="logout"></v-list-item>
        </v-list>
      </template>

    </v-navigation-drawer>

    <v-main>
      <div class="d-flex align-center justify-center pa-4">
        <slot></slot>
      </div>
    </v-main>
  </v-app>
</template>

<script setup>
  import { ref } from 'vue'
  import { signOut } from "~/concepts/auth";
  import { names as routes } from "~/config/routes"
  const drawer = ref()
</script>
