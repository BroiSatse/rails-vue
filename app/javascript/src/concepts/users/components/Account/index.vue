<template>
  <CardPage title="My account">
    <v-form @submit.prevent="submit">
      <v-text-field label="Your name" v-model="name" :rules="[rules.presence()]"></v-text-field>
      <v-btn text="Save" block class="mt-4" type="submit"/>
    </v-form>
  </CardPage>
</template>

<script setup>
  import { ref } from 'vue'

  import { currentUser, refreshCurrentUser } from "~/concepts/auth";
  import CardPage from "~/components/CardPage.vue";
  import rules from "~/validations"
  import api from "~/api"

  const name = ref(currentUser.value.displayName)

  async function submit(event) {
    await event
    await api.usersControllersUsers.update({
      data: {
        id: currentUser.value.id,
        attributes: {
          displayName: name.value
        }
      }
    })
    await refreshCurrentUser()
  }
</script>
