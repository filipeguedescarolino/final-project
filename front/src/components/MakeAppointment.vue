<template>
  <v-stepper
    v-model="e6"
    vertical>
  
    <v-stepper-step
      :complete="e6 > 1"
      step="1">
      <!-- <button @click="getTimeSlots()">Click me </button>
      <button @click="createAppointment()">Post  </button> -->
      Select the specialization  
    </v-stepper-step>

    <v-stepper-content step="1">
      <v-card
        color="#F2F2F2"
        class="mb-12 justify-center"
        height="100px">

        <v-card-title class="mb-12 justify-center">         
          <v-text-content class="justify-center">
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
            
          </v-text-content>
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
      Choose the day and hour of appointment
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
              
              label='Choose the Hour'
              v-model='timeSlot'
              :items='timeSlots'
              item-value="start_at"
              item-text='start_at'
              return-object>
            
              <!-- <template slot='selection' slot-scope='{ item }'>
                {{ item.name }} - {{ item.age }}
              </template> -->

              <template slot='item' slot-scope='{ item }'>
                {{ item.start_at }} - {{item.end_at}} 
              </template>
            </v-select>
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
      >
      
        <div class="form">
          <p v-if="specialization" style="font-weight: bold;"> specialization:  {{specialization.description}}  </p>
          <p v-if="doctor" style="font-weight: bold;"> Doctor: {{doctor.name}} </p> 
          <p v-if="picker && timeSlot" style="font-weight: bold;"> Date: {{picker}} at {{timeSlot.start_at}} </p> 
            
        </div>
      </v-card>
      <v-btn
        color="primary"
        @click="e6 = 1"
        @:click="createAppointment()"
        

      >
        Create appointment
      </v-btn>
      <v-btn text>
        Cancel
      </v-btn>
    </v-stepper-content>
  </v-stepper>
</template>


<script>
  // import moment from 'moment'
  import axios from 'axios'
  export default {
    data () {
      return {
        loggedUser: '',
        e6: 1,
        items: ['Foo', 'Bar', 'Fizz', 'Buzz'],
        names:[
          {id: 5, name: 'Paul', age: 23},
          {id: 6, name: 'Marcelo', age: 15},
          {id: 8, name: 'Any', age: 30},
        ],
        specialization: {},
        doctor: {},          
        specializations: [],
        doctors: '',
        picker: new Date().toISOString().substr(0, 10),
        timeSlots: '',
        timeSlot: ''
      }
    },

    computed: {
      localStorageUser() {
        if (!localStorage.user == null || !localStorage.user) {
          return ''
        }
        return JSON.parse(localStorage.user)
      
      }
    },

    // computed: {
    //   formatDate() {
    //     return this.picker
    //       ? moment(this.picker).format("L")
    //       : "";
    //   }
    // },

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
      },

      getPatients () {
        let userId = this.localStorageUser.id
        axios.get(`http://localhost:3000/patients/${userId}`).then((response) => {
          console.log(response)
          this.loggedUser = response.data.data
        })
      },

      getTimeSlots () {
        debugger; // eslint-disable-line no-debugger
        
    
        console.log(this.picker)
        console.log(this.doctor.id)
        

        axios.get(`http://localhost:3000/timeSlots/${this.picker}/${this.doctor.id}`).then((response) => {
          console.log(response)
          this.timeSlots = response.data.data
        })
      },

      createAppointment() {
        let appointmentData = {
          "id_patient": this.loggedUser.id,
          "id_doctor": this.doctor.id,
          "day": this.picker,
          "hour": this.timeSlot.start_at,
          "id_insurance": this.loggedUser.id_insurance,
          "id_specialization": this.specialization.id,
          "id_slot": this.timeSlot.id,
          "id_status": 2
        }

        axios.post('http://localhost:3000/appointments', appointmentData).then(response =>  console.log(response.data.id))
                alert('Appointment is booked.')      
                .catch(error => {
                    this.errorMessage = error.message
                    console.error("There was an error!", error);    
                })

        console.log(appointmentData)
      }


      },

      watch: {
        picker(val) {
          this.getTimeSlots()
          console.log(val)
        }
      },

      async created() {
          await this.getSpecializations()
          this.getDoctors()
          this.getPatients()

      }
  }
</script>