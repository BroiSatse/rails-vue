<template>
  <Layout title="Register">
    <v-form @submit.prevent="submit">
      <v-text-field label='Email' v-model="email" :rules="emailRules" class="text-right" validate-on="blur"></v-text-field>
      <password-field label='Password' v-model="password" v-model:visibility="showPasswords"/>
      <password-field
          label='Confirm password'
          v-model="passwordConfirmation"
          v-model:visibility="showPasswords"
          :rules="[rules.presence(), matchesPassword]"
      />

      <v-btn block color="indigo-darken-3" size="x-large" class="mt-4" type="submit">Register</v-btn>
    </v-form>
  </Layout>
</template>

<script setup>
  import { ref } from "vue";

  import Layout from './Layout.vue'
  import PasswordField from "./PasswordField.vue";

  import api from '~/api'
  import rules from '~/validations'
  import { refreshCurrentUser } from "../currentUser";

  const email = ref('')
  const password = ref('')
  const passwordConfirmation = ref('')

  const showPasswords = ref(false)

  const emailRules = [
    rules.email(),
    emailNotTaken
  ]

  const passwordRules = [
    rules.presence()
  ]

  const submit = (event) => {
    event
      .then(form => form.valid || Promise.reject(form.errors))
      .then(() => api.authControllersRegistrations.create({data: { email: email.value, password: password.value }}))
      .then(() => refreshCurrentUser())
      .catch(() => undefined)
  }

  function matchesPassword(value) {
    return value == password.value || 'does not match'
  }

  function emailNotTaken(value) {
    console.log('Validating', value)
    return api.authControllersRegistrations.check({query: { email: value }})
      .then((response) => !response.taken || 'already registered')
  }

</script>
