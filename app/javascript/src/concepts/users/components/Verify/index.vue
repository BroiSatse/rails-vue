<template>
  <div class="h-75 pa-6 d-flex flex-column justify-center">
    <v-sheet width="450" elevation=10 class="pt-4 px-12 pb-8 mx-auto text-center">
      <h1 class="mb-4 text-h5 py-4">Verify your email address</h1>
      <p>We've sent you your verification code to {{ currentUser.unverifiedEmail }}</p>
      <v-form @submit.prevent="submit">
        <v-text-field v-model="code" :rules="[rules.presence()]"/>
        <v-btn block color="indigo-darken-3" size="x-large" class="mt-4" type="submit">Sign in</v-btn>
      </v-form>
    </v-sheet>
  </div>
</template>

<script setup>
  import { ref } from 'vue'

  import { currentUser, refreshCurrentUser } from "~/concepts/auth";
  import { names as routes } from '~/config/routes'
  import router from '~/config/router'
  import rules from '~/validations'
  import api from '~/api'

  const code = ref()

  function submit () {
    api.emailsVerifyControllersVerifications
      .create({ data: { owner: `user#${currentUser.value.id}`, code: code.value }})
      .then(() => refreshCurrentUser())
      .then(() => router.push({ name: routes.root }))
  }
</script>
