<template>
  <Layout>
    <router-view v-slot="{ Component }">
      <v-fade-transition>
        <div class="page-view">
          <component :is="Component" :key="$router.fullPath"/>
        </div>
      </v-fade-transition>
    </router-view>
  </Layout>
</template>

<script setup>
  import Layout from "~/components/Layout";
</script>
