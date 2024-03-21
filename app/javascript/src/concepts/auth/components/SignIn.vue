<template>
  <Layout title="Sign in">
    <v-form @submit.prevent="submit">
      <v-text-field label='Email' v-model="email" :rules="emailRules" class="text-right" validate-on="blur"></v-text-field>
      <v-text-field label='Password' type='password' v-model="password" :rules="passwordRules"></v-text-field>
      <v-btn block color="indigo-darken-3" size="x-large" class="mt-4" type="submit">Sign in</v-btn>
    </v-form>
  </Layout>
</template>

<script setup>
  import { ref } from "vue";

  import api from '~/api'
  import rules from '~/validations'

  import Layout from './Layout.vue'
  import { refreshCurrentUser } from "../currentUser";

  const email = ref('')
  const password = ref('')

  const emailRules = [
    rules.email()
  ]

  const passwordRules = [
    rules.presence()
  ]

  const submit = (event) => {
    event
      .then(form => form.valid || Promise.reject(form.errors))
      .then(() => api.authControllersSessions.create({data: { email: email.value, password: password.value }}))
      .then(() => refreshCurrentUser())
      .catch(() => undefined)
  }

</script>
