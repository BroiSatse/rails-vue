<template>
  <layout title="Sign in">
    <v-form @submit.prevent="submit">
      <v-expand-transition>
        <div v-if="showError">
          <v-alert
              v-model="showError"
              variant="outlined"
              type="error"
              text="Incorrect email or password"
              class="text-left mb-6"
              closable
          />
        </div>
      </v-expand-transition>

      <v-text-field label='Email' v-model="email" :rules="emailRules" class="text-right" validate-on="blur"></v-text-field>
      <password-field v-model="password" />
      <v-btn block color="indigo-darken-3" size="x-large" class="mt-4" type="submit">Sign in</v-btn>
    </v-form>
    <v-divider class="py-2"/>
    <p>No account? <router-link :to="{name: routes.register}">Register</router-link></p>
  </layout>
</template>

<script setup>
  import { ref } from "vue";

  import api from '~/api'
  import rules from '~/validations'
  import { names as routes } from '../routes'

  import Layout from './Layout.vue'
  import { refreshCurrentUser } from "../currentUser";
  import PasswordField from "~/concepts/auth/components/PasswordField.vue";

  const email = ref('')
  const password = ref('')
  const showError = ref(false)

  const emailRules = [
    rules.email()
  ]

  function handleAuthenticationError(status) {
    if (status == 401) {
      showError.value = true
    }
  }

  const submit = (event) => {
    event
      .then(form => form.valid || Promise.reject(form.errors))
      .then(() => {
        return api.authControllersSessions.create({data: { email: email.value, password: password.value }})
          .then(() => refreshCurrentUser())
          .catch(err => handleAuthenticationError(err.response.status))
      })
        .catch(() => undefined)

  }

</script>
