<template>
   <div>
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
                        
                        
                        <td>
                            <v-chip
                                :color="getColor(props.statusDescription)"
                                dark>

                                <span style="color: black;">{{ props.item.statusDescription }}</span>
                            </v-chip>
                        </td>
                        <td>                        
                            <i class="far fa-trash-alt pointer" @click="thisChangeStatus(props.item.id)"> </i>                                                    
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
                        align: 'start',
                        sortable: false,
                        value: 'id_doctor',
                    },
                    
                    { text: 'Day', value: 'day', align: 'center'},
                    { text: 'Hour', value: 'hour', align: 'center' },
                    { text: 'Patient', value: 'patientName', align: 'center' },
                    { text: 'Specialization', value: 'specializationDescription', align: 'center'},
                    { text: 'Status', value: 'statusDescription', align: 'center' },
                    { text: 'Completed?', value: 'status_id', align: 'center' },
                    
                    
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

            getColor (id_status) {
                if (id_status == 1) {
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