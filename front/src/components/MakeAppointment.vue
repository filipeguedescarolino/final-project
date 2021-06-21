<template>
  <v-stepper
    v-model="e6"
    vertical
  >
    <v-stepper-step
      :complete="e6 > 1"
      step="1"
    >
      Select the specialization  
    </v-stepper-step>

    <v-stepper-content step="1">
      <v-card
        color="blue lighten-4"
        class="mb-12 justify-center"
        height="100px">

        <v-card-title class="mb-12 justify-center" >
         
          <v-text class="justify-center">
          <v-select
              class="justify-center"
              :items="items"
              :menu-props="{ top: true, offsetY: true }"
              label="Specialization"
            ></v-select>
          </v-text>
        </v-card-title>
          
        
        
        
      </v-card>
      <v-btn
        color="primary"
        @click="e6 = 2"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 2"
      step="2"
    >
      Choose your Doctor
    </v-stepper-step>

    <v-stepper-content step="2">
      <v-card
        color="blue lighten-4"
        class="mb-12"
        height="100px"
      >
        <v-card-title class="mb-12 justify-center" >
         
          <v-text class="justify-center text--white">
          <v-select
              class="justify-center"
              :items="items"
              :menu-props="{ top: true, offsetY: true }"
              label="Medic"
            ></v-select>
          </v-text>
        </v-card-title>

      </v-card>
      <v-btn
        color="primary"
        @click="e6 = 3"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step
      :complete="e6 > 3"
      step="3"
    >
      Choose the day and hour of the appointment
    </v-stepper-step>

    <v-stepper-content step="3">
      <v-card
        color="grey lighten-1"
        class="mb-12 justify"
        height="200px"
      >
        <v-container fluid>
    <v-row align="center" class="justify-center">
      <v-col
        class="d-flex"
        cols="12"
        sm="6"
      >
        <v-select
          :items="items"
          label="Standard"
        ></v-select>
      </v-col>

      <v-col
        class="d-flex"
        cols="12"
        sm="6"
      >
        <v-select
          :items="items"
          filled
          label="Filled style"
        ></v-select>
      </v-col>

      
      
    </v-row>
  </v-container>
      </v-card>
      <v-btn
        color="primary"
        @click="e6 = 4"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>

    <v-stepper-step step="4">
      Appointment details
    </v-stepper-step>
    <v-stepper-content step="4">
      <v-card
        color="grey lighten-1"
        class="mb-12"
        height="200px"
      ></v-card>
      <v-btn
        color="primary"
        @click="e6 = 1"
      >
        Continue
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>
  </v-stepper>
</template>


<script>
  export default {
    data () {
      return {
        e6: 1,
        items: ['Foo', 'Bar', 'Fizz', 'Buzz'],
      }
    },
  }
</script>