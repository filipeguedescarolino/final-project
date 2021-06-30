<template>
  <v-form v-model="valid">
    <v-container class="mt-5">
      
      <v-row class="pa-3">
        <v-col
          cols="12"
          md="12">
          
        
          <v-select
            v-model="doctor"
            :items='doctors'
            item-value='id'
            item-text='name'
            label="Doctor's name"
            required>

            <template slot='item' slot-scope='{ item }'>
                DR: {{ item.name }}
            </template>

          </v-select>
        </v-col>

        
        
        <v-col
          cols="12"
          sm="4">


          <v-text-field
            v-model="day"
            color="blue accent-3"
            
            type="date"
            label="day"
            prepend-icon="event"
            required>

          </v-text-field>

        </v-col>


        <v-col
          cols="12"
          sm="3"
        >
          <v-dialog
            ref="dialog1"
            v-model="modal1"
            :return-value.sync="timeIn"
            persistent
            width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="timeIn"
                label="Start Hour"
                prepend-icon="mdi-clock-time-four-outline"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-time-picker
              v-if="modal1"
              v-model="timeIn"
              full-width
              format="24hr"
              min="9:00"
              max="20:00"
              :allowed-minutes="allowedStep"
            >
              <v-spacer></v-spacer>
              <v-btn
                text
                color="primary"
                @click="modal1 = false"
              >
                Cancel
              </v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.dialog1.save(timeIn)"
              >
                OK
              </v-btn>
            </v-time-picker>
          </v-dialog>
        </v-col>
        <v-spacer></v-spacer>
        <v-col
          cols="12"
          sm="3"
        >
          <v-dialog
            ref="dialog"
            v-model="modal2"
            :return-value.sync="timeOut"
            persistent
            width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="timeOut"
                label="End Hour"
                prepend-icon="mdi-clock-time-four-outline"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-time-picker
              v-if="modal2"
              v-model="timeOut"
              full-width
              format="24hr"
              :min= timeIn
              max="20:00"
              :allowed-minutes="allowedStep"
            >
              <v-spacer></v-spacer>
              <v-btn
                text
                color="primary"
                @click="modal2 = false"
              >
                Cancel
              </v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.dialog.save(timeOut)"
              >
                OK
              </v-btn>
            </v-time-picker>
          </v-dialog>
        </v-col>
        
        <v-col
          cols="12"
          md="12"
        >
          <v-select
            v-model="clinicalOffice"
            :items='clinicalOffices'
            item-value='id'
            item-text='description'
            label="Choose the office"
            required>

            <template slot='item' slot-scope='{ item }'>
              {{ item.description }}
            </template>

          </v-select>
        </v-col>

        <v-col
          cols="12"
          md="4">
        </v-col>

        <v-col
          cols="12"
          md="4">

          <v-btn
            depressed
            color="primary"
            @click="registerClient()"
          >
            Submit
          </v-btn>


        </v-col>
      </v-row>
    </v-container>
  </v-form>
</template>

<script>
  import axios from 'axios'

  export default {
    data: () => ({
      valid: false,
      doctors: [],
      doctor: {},
      day: '',
      brackets: '',
      mySchedule:'',
      timeIn: null,
      timeOut: null,
      menu1: false,
      modal1: false,
      menu2: false,
      modal2: false,
      clinicalOffices: [],
      clinicalOffice: {}
      
    }),

    methods: {

      allowedStep: m => m % 30 === 0,
      
      getDoctors () {
        axios.get('http://localhost:3000/doctors').then((response) => {
          console.log(response)
          this.doctors = response.data.data
        })
      },

      getClinicalOffices () {
        axios.get('http://localhost:3000/clinical_offices').then((response) => {
          console.log(response)
          this.clinicalOffices = response.data.data
        })
      },

      getTime(a,b) {
        let toInt  = time => ((h,m) => h*2 + m/30)(...time.split(':').map(parseFloat))
        let toTime = int => [Math.floor(int/2), int%2 ? '30' : '00'].join(':')
        let range  = (from, to) => Array(to-from+1).fill().map((_,i) => from + i)
        let eachHalfHour = (t1, t2) => range(...[t1, t2].map(toInt)).map(toTime);
        return this.brackets = eachHalfHour(a, b)
      }, 

      async registerClient() {
        if( !this.timeIn || !this.timeOut || !this.doctor || !this.clinicalOffice || !this.day ) {
          return
        }
        this.getTime(this.timeIn, this.timeOut)

        let workingHour = {
          "id_doctor": this.doctor, 
          "begin_hour": this.timeIn, 
          "day": this.day,
          "end_hour": this.timeOut, 
          "id_clinical_office": this.clinicalOffice,          
        }

        console.log(workingHour)
        await axios.post('http://localhost:3000/workingHours', workingHour).then(response =>  console.log(response.data.id))      
            .catch(error => {
                this.errorMessage = error.message
                console.error("There was an error!", error);    
            })

        
        // console.log(this.brackets)
        
                    
      //   for( var i = 0;  i < this.brackets.length - 1;  i++ ) {
            
      //     axios.post(`http://localhost:3000/timeSlots`,  
      //         this.mySchedule = {
      //             "start_at": this.brackets[i],
      //             "end_at": this.brackets[i + 1],
      //             "id_doctor": this.doctor,
      //             "day": this.day
      //         }
              
      //     )
      //     .then((response) => {
      //         // Takes 4 seconds, 4 more seconds, 4 more seconds, etc
      //         // Ideally: Takes 4 seconds, returns in the same ~4 seconds, returns in the same ~4 seconds, etc
      //         console.log(response);
      //         console.log('Que Fking animal Beast')
      //     })
      //     .catch((error) => {
      //         console.log(error);
      //         console.log('deuBosta')
      //     });

      //     // Takes < 1 second, < 1 more second, < 1 more second, etc
      //     console.log( 'Request sent!' );
      // }
    }
        

    
    },







    async created() {
        await this.getDoctors ()
        this.getClinicalOffices()
          
          
    }
  }
</script>