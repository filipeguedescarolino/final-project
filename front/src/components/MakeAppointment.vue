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
                    <!-- <v-text-field class="justify-center"> -->
                        <v-select              
                            label='Choose a specialization'
                            v-model='specialization'
                            :items='specializations'
                            item-value='id'
                            item-text='description'
                            return-object>

                            <template slot='item' slot-scope='{ item }'>
                                {{ item.description }}
                            </template>
                        </v-select>                    
                    <!-- </v-text-field> -->
                </v-card-title>           
            </v-card>

            <v-btn
                color="primary"
                @click="getDoctorSpecializations()"                
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
                height="100px">
            
                <v-card-title class="mb-12 justify-center" >
                
                    <!-- <v-text-field class="justify-center text--white"> -->

                        <v-select
                            
                            label='Choose your Doctor'
                            v-model='doctor'
                            :items='doctors'
                            item-value='id_doctor'
                            item-text='name'
                            return-object>
                        
                            

                            <template slot='item' slot-scope='{ item }'>
                                {{ item.name }}
                            </template>
                        </v-select>
                    <!-- </v-text-field> -->
                </v-card-title>

            </v-card>

            <v-btn
                color="primary"
                @click="e6 = 3">
                
                Continue
            </v-btn>

            <v-btn text
            @click="e6 = 1">
                Cancel
            </v-btn>
        </v-stepper-content>

        <v-stepper-step
            :complete="e6 > 3"
            step="3">
            
        
            Choose the day and hour of appointment
        </v-stepper-step>

        <v-stepper-content step="3">
            <v-card
                color="#F2F2F2"
                class="mb-12 justify pa-5 "
                height="500px"
                width="350px" >
               
                <v-container fluid>
                    <v-row align="center" >
                        <v-col
                            class="d-flex"
                            cols="4"
                            sm="4">
                        
                            <v-row>
                                
                                <v-date-picker
                                    
                                    class="mb-5"
                                    v-model="picker"
                                   
                                    :min="nowDate"
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
                @click="e6 = 4">
                
                Continue
            </v-btn>
            <v-btn text
            @click="e6 = 2">
                Cancel
            </v-btn>
        </v-stepper-content>

        <v-stepper-step step="4">
            Appointment details
        </v-stepper-step>

        <v-stepper-content step="4">
            <v-card
                color="grey lighten-3"
                class="mb-12 mt-4 p-3"
                height="250px">
            

            <v-form>
        
            <v-row>
            <v-col cols="12" sm="6">
              <v-text-field
                v-model="specialization.description"
                readonly
                label="Specialization"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="doctor.name "
                readonly
                label="Doctor's Name"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="4">
              <v-text-field
                v-model="picker"
                readonly
                label="Day"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="4">
              <v-text-field
                v-model="timeSlot.start_at"
                readonly
                label="Start at"
                outlined
                shaped
              ></v-text-field>
            </v-col>
            <v-col cols="12" sm="4">
              <v-text-field
                v-model="timeSlot.end_at"
                readonly
                label="Ends at"
                outlined
                shaped
              ></v-text-field>
            </v-col>
            </v-row>
         
            </v-form>


                
            </v-card>

            <v-btn
                color="primary"
                @click="e6 = 1; createAppointment()"
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
                specialization: {},
                doctor: {},          
                specializations: [],
                doctors: [],
                picker: new Date().toISOString().substr(0, 10),
                timeSlots: [],
                timeSlot: '',
                nowDate: new Date().toISOString().slice(0,10),
                appointmentDates: [],                                
            }
        },

        computed: {
            localStorageUser() {
                if (localStorage && localStorage.user) {
                    return JSON.parse(localStorage.user)
                }
                return null
            },

        },

        methods: {
            
            // http://localhost:3000/workingHours/${this.doctor.id_doctor}/doctor/scales if i try with range we can go for this.
            getAllAvaliableDaysToMakeAppointment() {
                axios.get(`http://localhost:3000/appointments/10/doctor`).then((response) => {
                    this.appointmentDates = response.data.data 
                })
            },

            getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
            },

            async getDoctorSpecializations() {
                await axios.get(`http://localhost:3000/pivot_doctor_specialization/specialization/${this.specialization.id}`).then((response) => {
                    this.doctors = response.data.data 
                })
                this.e6 = 2;
            },
            getPatients () {
                if (!this.localStorageUser || !this.localStorageUser.id) {
                    return
                }
                let userId = this.localStorageUser.id
                axios.get(`http://localhost:3000/patients/${userId}`).then((response) => {
                    
                    this.loggedUser = response.data.data
                })
            },

            getTimeSlots () {
                if (!this.doctor && !this.doctor.id || !this.picker) {
                return 
                }

                axios.get(`http://localhost:3000/timeSlots/${this.picker}/${this.doctor.id_doctor}`).then((response) => {
                    
                    this.timeSlots = response.data.data
                })
            },

            createAppointment() {
                let appointmentData = {
                    "id_patient": this.loggedUser.id,
                    "id_doctor": this.doctor.id_doctor,
                    "day": this.picker,
                    "hour": this.timeSlot.start_at,
                    "id_insurance": this.loggedUser.id_insurance,
                    "id_specialization": this.specialization.id,
                    "id_time_slot": this.timeSlot.id,
                    "id_status": 1
                }

                axios.post('http://localhost:3000/appointments', appointmentData).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    this.$router.push('appointmentsHistory')                                           
                })
                .catch((error) => {
                    this.$swal.fire({
                        icon: 'error',
                        title: 'ERROR!',
                        text: error,
                        showConfirmButton: false,
                        timer: 1500
                    })
                });
            }

                
        },

        watch: {
            picker(val) {
                this.getTimeSlots()
                console.log(val)
            },

            doctor(val) {
                this.getAllAvaliableDaysToMakeAppointment()
                console.log(val)
            }
        },

        async created() {
            await this.getSpecializations()
            // this.getDoctors()
            this.getPatients()
        }
    }
</script>