<template>
  <v-row>
    <v-col cols="4" v-for="n in 200" sm="2" md="1">
      <v-card @click="console.log(`https://picsum.photos/500/300?image=${n * 5 + 10}`)">
        <v-img
            :src="`https://picsum.photos/500/300?image=${n * 5 + 10}`"
            :lazy-src="`https://picsum.photos/5/3?image=${n * 5 + 10}`"
            aspect-ratio="1"
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
  </v-row>
</template>
