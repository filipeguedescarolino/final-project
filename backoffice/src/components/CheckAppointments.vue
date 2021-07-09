<template>
   <div>
    <v-card
        color="#F2F2F2"
        class="mb-12 justify pa-5 "
        height="500px"
        width="350px">
        
    
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
                        
                        
                    </v-row>
                </v-col>
                  
            </v-row>
            
        </v-container>
    </v-card>

    <v-card v-if="appointments">
            <v-card-title>
                <v-text-field
                    v-model="search"
                    append-icon="mdi-magnify"
                    label="Search"
                    single-line
                    hide-details
                ></v-text-field>
            </v-card-title>
            <v-data-table            
                :headers="headers"
                :items="appointments"
                :search="search"
                :items-per-page="5"
                item-key="name"
                class="elevation-1 pa-4"
                :footer-props="{
                showFirstLastPage: true,
                firstIcon: 'mdi-arrow-collapse-left',
                lastIcon: 'mdi-arrow-collapse-right',
                prevIcon: 'mdi-minus',
                nextIcon: 'mdi-plus'
                }">

                <template v-slot:item="props">
                    <tr>
                        
                        <td>{{ props.item.doctorName }}</td>
                        <td>{{ formatDate(props.item.day )}}</td>
                        <td>{{ props.item.hour }}</td>
                        <td>{{ props.item.patientName }}</td>
                        <td>{{ props.item.specializationDescription }}</td>
                        
                        
                        <td @click="thisChangeStatus(props.item)">
                            <v-chip
                                :color="getColor(props.item)"
                                dark>

                                <span style="color: black;">{{ props.item.statusDescription }}</span>
                            </v-chip>
                            <i class="fas fa-random pointer ml-3" > </i> 

                        </td>
                        <td>                        
                            {{ props.item.base_price }} €                                                   
                        </td>

                        <td>                        
                            {{props.item.base_price * (props.item.reimbursed_value / 100) }} €                                                  
                        </td>

                        <td>                        
                            {{props.item.base_price -(props.item.base_price * (props.item.reimbursed_value / 100) )}} €                                                  
                        </td>
                        
                    </tr>
                </template>    
            </v-data-table>
        </v-card>
   </div>
    
</template> 


<script>
import axios from 'axios'
import moment from 'moment'
    export default {

        data () {
            return {
                headers: [
                    {
                        text: 'Doctor',
                        align: 'center',
                        sortable: false,
                        value: 'id_doctor',
                    },
                    
                    { text: 'Day', value: 'day', align: 'center'},
                    { text: 'Hour', value: 'hour', align: 'center' },
                    { text: 'Patient', value: 'patientName', align: 'center' },
                    { text: 'Specialization', value: 'specializationDescription', align: 'center'},
                    { text: 'Status', value: 'statusDescription', align: 'center' },
                    { text: 'Payment', value: 'base_price', align: 'center' },
                    { text: 'Covered', value: 'reimbursed_value', align: 'center' },
                    { text: 'Total', value: 'total', align: 'center' },
                    
                    
                ],
                search: '',
                
                doctor: null,          
                
                doctors: [],
                
                picker: new Date().toISOString().substr(0, 10),
                
                nowDate: new Date().toISOString().slice(0,10),
                appointments: [],                                
            }
        },

        

        methods: {

            formatDate(value) {
                return moment(value).format("MMMM DD YYYY")
            },

            getColor (item) {
                if (item.id_status == 1) {
                    return 'yellow'
                } 
                
                else return 'green'
            },
            
            getAllAppointments () {
                
               if (this.doctor) {
                   this.getAllAppointmentsWithDoctor()
                   return
                }
                axios.get(`http://localhost:3000/appointments/day/${this.picker}`).then((response) => {
                    this.appointments = response.data.data 
                })
            },

            getAllAppointmentsWithDoctor () {
               if (!this.doctor) {
                   return
                }
                axios.get(`http://localhost:3000/appointments/day/${this.picker}/doctor/${this.doctor.id}`).then((response) => {
                    this.appointments = response.data.data 
                })
            },

            getDoctors () {
                axios.get('http://localhost:3000/doctors').then((response) => {
                    this.doctors = response.data.data 
                })
            },

            thisChangeStatus(appointment) {
                if (appointment.id_status == 1) {
                    let status  = {
                        "id_status": 2 
                    }

                    axios.put(`http://localhost:3000/appointments/${appointment.id}`, status).then((response) => {
                        console.log(response)
                    })
                    this.getAllAppointments()
                    return 
                }

                let status2 = {
                    "id_status": 1
                }

                axios.put(`http://localhost:3000/appointments/${appointment.id}`, status2).then((response) => {
                        console.log(response)
                    })
                    this.getAllAppointments()
                    return
            }

            


            
        },

        watch: {
            picker(val) {
                this.getAllAppointments()
                console.log(val)
            },

            doctor(val) {
                this.getAllAppointmentsWithDoctor()
                console.log(val)
            }
        },

        async created() {
            
            // this.getDoctors()
            this.getDoctors()
            this.getAllAppointments()
        }
    }
</script>