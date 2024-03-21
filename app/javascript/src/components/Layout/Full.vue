<template>
  <v-app class="p-4">
    <v-app-bar>
      <template v-slot:prepend>
        <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      </template>
      <v-app-bar-title>This is a hat</v-app-bar-title>
    </v-app-bar>

    <v-navigation-drawer expand-on-hover rail elevation="10">
      <v-list>
        <v-list-item title="Home" prepend-icon="home" :to="{name: routes.root}"></v-list-item>
      </v-list>

      <template v-slot:append>
        <v-list>
          <v-list-item title="Sign out" @click="signOut" prepend-icon="logout"></v-list-item>
        </v-list>
      </template>

    </v-navigation-drawer>

    <v-main class="d-flex align-center justify-center" style="min-height: 300px;">
      <slot></slot>
    </v-main>
  </v-app>
</template>

<script setup>
  import { signOut } from "~/concepts/auth";
  import { names as routes } from "~/config/routes"
</script>
