<template>
  <v-stepper
    v-model="e6"
    vertical>
  
    <v-stepper-step
      :complete="e6 > 1"
      step="1">
    
      Select the specialization  
    </v-stepper-step>

    <v-stepper-content step="1">
      <v-card
        color="#F2F2F2"
        class="mb-12 justify-center"
        height="100px">

        <v-card-title class="mb-12 justify-center">         
          <v-text class="justify-center">
            <v-select              
              label='Choose a specialization'
              v-model='specialization'
              :items='specializations'
              item-value='id'
              item-text='description'
              return-object>
            
              <!-- <template slot='selection' slot-scope='{ item }'>
                {{ item.name }} - {{ item.age }}
              </template> -->

              <template slot='item' slot-scope='{ item }'>
                {{ item.description }}
              </template>
            </v-select>
            
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
        color="#F2F2F2"
        class="mb-12"
        height="100px"
      >
        <v-card-title class="mb-12 justify-center" >
         
          <v-text class="justify-center text--white">
          <v-select
              
              label='Choose your Doctor'
              v-model='doctor'
              :items='doctors'
              item-value='id'
              item-text='name'
              return-object>
            
              <!-- <template slot='selection' slot-scope='{ item }'>
                {{ item.name }} - {{ item.age }}
              </template> -->

              <template slot='item' slot-scope='{ item }'>
                {{ item.name }}
              </template>
            </v-select>
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
        color="#F2F2F2"
        class="mb-12 justify pa-5 "
        height="500px"
        width="350px"
      >
        <v-container fluid>
          <v-row align="center" >
            <v-col
              class="d-flex"
              cols="4"
              sm="4"
            >
              <v-row>
            <v-date-picker
              class="mb-5"
              v-model="picker"
              year-icon="mdi-calendar-blank"
              prev-icon="mdi-skip-previous"
              next-icon="mdi-skip-next"
            ></v-date-picker>

            <v-select
          
          :items="items"
          filled
          label="Filled style"
        ></v-select>
        </v-row>
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
        color="grey lighten-3"
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
  import axios from 'axios'
  export default {
    data () {
      return {
        e6: 1,
        items: ['Foo', 'Bar', 'Fizz', 'Buzz'],
        names:[
          {id: 1, name: 'Paul', age: 23},
          {id: 2, name: 'Marcelo', age: 15},
          {id: 3, name: 'Any', age: 30},
        ],
        specialization: {},
        doctor: '',
        specializations: [],
        doctors: '',
        picker: new Date().toISOString().substr(0, 10),
      }
    },

    methods: {

      getSpecializations () {
        axios.get('http://localhost:3000/specializations').then((response) => {
          this.specializations = response.data.data 
        })
      },

      getDoctors () {
        axios.get('http://localhost:3000/doctors').then((response) => {
          console.log(response)
          this.doctors = response.data.data
        })
      }


      },

      async created() {
          await this.getSpecializations()
          this.getDoctors()
      }
  }
</script>