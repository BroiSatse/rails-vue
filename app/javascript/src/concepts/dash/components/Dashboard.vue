<template>
  <v-row>
    <v-fab-transition v-for="n in 200">
      <v-col cols="4"  sm="2" md="1" v-show="!hide[n]">
        <v-card @click="console.log(`https://picsum.photos/500/300?image=${n * 5 + 10}`)" >
          <v-img
              :src="`https://picsum.photos/500/300?image=${n * 5 + 10}`"
              :lazy-src="`https://picsum.photos/5/3?image=${n * 5 + 10}`"
              aspect-ratio="1"
              @error="hide[n] = true"
              cover
          >
            <template v-slot:placeholder>
              <div class="d-flex align-center justify-center fill-height">
                <v-progress-circular
                    color="grey-lighten-4"
                    indeterminate
                ></v-progress-circular>
              </div>
            </template>
          </v-img>
        </v-card>
      </v-col>
    </v-fab-transition>
  </v-row>
</template>

<script setup>
  import { ref } from 'vue';

  const hide = ref({})
</script>
