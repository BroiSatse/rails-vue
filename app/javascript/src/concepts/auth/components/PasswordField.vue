<template>
  <v-text-field
    ref="input"
    v-model="model"
    :label="props.label"
    :type="visible ? 'text' : 'password'"
    :rules="rules"
  >
    <template v-slot:append-inner>
      <!-- We need to prevent mousedown and mouseup default behaviour to prevent cursor jumping on type change -->
      <v-icon
        :icon="visible ? 'visibility' : 'visibility_off'"
        @mousedown.prevent
        @mouseup.prevent
        @click.stop="visible = !visible" />
    </template>
  </v-text-field>
</template>

<script setup>
  import { defineModel, ref, defineProps } from 'vue'
  import validations from '~/validations'

  const props = defineProps({
    label: {
      type: String,
      default: 'Password'
    },
    rules: {
      type: Array,
      default () {
        return [
          validations.presence()
        ]
      }
    }

  })
  const input = ref()
  const model = defineModel()
  const visible = defineModel('visibility')
  const show = ref(false)
</script>
