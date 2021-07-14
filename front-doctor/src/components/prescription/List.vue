
<template>
    <v-card>
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
            :items="prescriptions"
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
                    <td >{{ props.item.namePatient }}</td>
                    <td>{{ props.item.email }}</td>
                    <td>{{ props.item.nameMedication }}</td>
                    <td>{{ props.item.observationMedication }}</td>
                    <td>{{ formatDate(props.item.day) }} - {{ props.item.hour }} </td>
                    <td >{{ props.item.observation }}</td>          
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>                                                                                
                    </td>                    
                </tr>
            </template>
        </v-data-table>




       
          
        <show-and-edit  v-model="show" v-if="show"   :prescription="prescription"  :mode="mode"  @save="savePrescription" > </show-and-edit>
         <!-- Inicia dialog  -->
            <v-dialog v-model="dialogCreate" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar style="text: center">  Create Prescription</v-system-bar>
                    
                    <v-divider></v-divider>
                    <v-form>
                        <v-container>
                        <v-row>                            

                            <v-col cols="12" sm="12">
                            <v-text-field
                                v-model="observation"
                                
                                label="Observations"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>


                            <v-col cols="12" sm="12">
                                <v-select              
                                    label='Choose The medication'
                                    v-model='medication'
                                    :items='medications'
                                    item-value='id'
                                    item-text='description'
                                    return-object>

                                    <template slot='item' slot-scope='{ item }'>
                                        {{ item.description }}
                                    </template>
                                </v-select>     
                            </v-col>
                            
                        </v-row>
                        </v-container>
                    </v-form>


                    
                    </v-navigation-drawer>
                    <v-card-actions>
                        <v-btn color="primary"  @click=" dialogCreate = false">
                            Return
                        </v-btn>
                        <v-btn
                            depressed
                            color="primary"
                            @click="postPrescription()">
                            Create Prescription
                        </v-btn>                                                
                    </v-card-actions>
                </v-card>
            </v-dialog>

            <div class="text-center">
                <v-btn
                
                color="primary"
                dark
                
                @click="dialogCreate = !dialogCreate"
                >Adicionar nova Prescrição
                    <i class="fas fa-plus ml-3" style="cursor: pointer" > </i>
                </v-btn>
            </div>
            
            <v-system-bar class="mt-3" color="#60BACD"></v-system-bar>

            <v-card class="mt-3 pa-2">
                <v-card-title class="justify-center">
                   {{prescriptions[0].namePatient}} - Clinical Process
                    <v-card-subtitle>
                        last update:
                    </v-card-subtitle>
                </v-card-title>
                <v-container fluid>
    <v-textarea
      name="input-7-1"
      filled
      label="Last Clinical observations"
      auto-grow
      v-model="clinicalObservations"
    ></v-textarea>
 
                <v-file-input
                    accept="image/*"
                    label="Patient Files"
                ></v-file-input>
             </v-container>
                <!-- <v-text-field
                        v-model="clinicalObservations"
                        append-icon="mdi-magnify"
                        label="Last Update"
                        single-line
                        hide-details
                ></v-text-field>  Colocar em cima com clinical process-->


            
            </v-card>
       
    </v-card>
</template>

<script>
import axios from 'axios'
import {  mapGetters } from 'vuex'
import moment from 'moment'
import ShowAndEdit from './ShowAndEdit.vue'


    export default {
        components: { ShowAndEdit },

        
  
        data () {
            return {
                prescriptions: [],
                prescription: [],
                search: '',
                show: false,
                clinicalObservations: null,
                headers: [
                    {
                        text: 'Patient',
                        align: 'center',
                        sortable: false,
                        value: 'description',
                    },       
                    { text: 'Email', value: 'email', align: 'center' },
                    { text: 'Medication ', value: 'medication', align: 'center' }, 
                    { text: 'Medication OBS', value: 'observation', align: 'center' },
                    { text: 'Appointment ', value: 'appointment', align: 'center' }, 
                    { text: 'Clinic OBS', value: 'observations', align: 'center' },

                    { text: 'Edit', value: 'edit', align: 'center'}
                ],
               
                mode: null,
                observation: null,
                medication: null,
                medications: [],



                dialogCreate: false          
            }
        },

        computed: {

        ...mapGetters([
        'user',
        'token'
        ]),

        },
    
        methods: {

            async getPrescriptions () {
                await axios.get('http://localhost:3000/prescription/patient/11/doctor/24').then((response) => {
                   
                    this.prescriptions = response.data.data 
                })
            },
            
        



            

           getMedications () {
                axios.get('http://localhost:3000/medications').then((response) => {
                    this.medications = response.data.data 
                })
            },

            formatDate(value) {
                return moment(value).format("MMMM DD YYYY")
            },





            postPrescription () {
                debugger
                let prescription = {
                    "observation": this.observation,
                    "id_doctor": this.user.id,
                    "id_patient": this.$route.params.id,
                    "id_medication": this.medication.id,
                    "id_appointment": this.$route.params.appointment_id
                }
                axios.post('http://localhost:3000/prescription', prescription).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    })                                         
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

                this.getPrescriptions()
                this.dialogCreate = !this.dialogCreate
            },

            // thisChangeStatus(doctor) {
            //     if (doctor.status == "active") {
            //         let status  = {
            //             "status": "inactive" 
            //         }

            //         axios.put(`http://localhost:3000/doctors/status/${doctor.id}`, status).then((response) => {
            //         this.$swal.fire({
            //             icon: 'success',
            //             title: 'Success!',
            //             text: response.status,
            //             showConfirmButton: false,
            //             timer: 1500
            //         })                     
            //     })
            //     .catch((error) => {
            //         this.$swal.fire({
            //             icon: 'error',
            //             title: 'ERROR!',
            //             text: error,
            //             showConfirmButton: false,
            //             timer: 1500
            //         })
            //     });
            //         this.getDoctors()
            //         return 
            //     }

            //     let status2 = {
            //         "status": "active"
            //     }

            //     axios.put(`http://localhost:3000/doctors/status/${doctor.id}`, status2).then((response) => {
            //         this.$swal.fire({
            //             icon: 'success',
            //             title: 'Success!',
            //             text: response.status,
            //             showConfirmButton: false,
            //             timer: 1500
            //         })                    
            //     })
            //     .catch((error) => {
            //         this.$swal.fire({
            //             icon: 'error',
            //             title: 'ERROR!',
            //             text: error,
            //             showConfirmButton: false,
            //             timer: 1500
            //         })
            //     });
            //         this.getDoctors()
            //         return
            // },

            openMaintenaceModal (row, mode) {
                // user que estas a editar
        
                this.prescription = row
                this.mode= mode
                this.show = true
            },


            // async savePrescription (user, mode) {
            //     console.log(user)
            //     console.log(mode)
                // this.show = false
                // if (mode == 'check') {
                //     return
                // }

                // console.log(user)
                
                // let doctorUpdate = {
                //     "observation": this.observation,
                //     "id_medication": this.medication.id,
                //     "id_patient": this.$route.params.id,
                //     "id_doctor": this.user.id
                // }
                

                // await axios.put(`http://localhost:3000/prescription/${user.id}`, doctorUpdate).then((response) => {
                //     this.$swal.fire({
                //         icon: 'success',
                //         title: 'Success!',
                //         text: response.status,
                //         showConfirmButton: false,
                //         timer: 1500
                //     })                  
                // })
                // .catch((error) => {
                //     this.$swal.fire({
                //         icon: 'error',
                //         title: 'ERROR!',
                //         text: error,
                //         showConfirmButton: false,
                //         timer: 1500
                //     })
                // });   
                // this.getDoctors()                        
            // },


            // async postPrescription() {
            //     if (this.create.password != this.create.password2) {
            //         return
            //     }
            //     debugger
            //     let doctorCreate = {
            //         "certificate_number": this.create.certificate_number,
            //         "name": this.create.name,
            //         "birthdate": this.create.birthdate,
            //         "address": this.create.address,
            //         "zip_code": this.create.zip_code,
            //         "email": this.create.email,
            //         "mobile_phone": this.create.mobile_phone,
            //         "nif": this.create.nif,
            //         "password": this.create.password,
            //         "status":this.create.status,
            //         "gender": this.create.gender,
            //         "image_src": this.create.image_src
            //     }

            //     await axios.post(`http://localhost:3000/doctors`, doctorCreate).then((response) => {
            //         this.$swal.fire({
            //             icon: 'success',
            //             title: 'Success!',
            //             text: response.status,
            //             showConfirmButton: false,
            //             timer: 1500
            //         }) 
            //         this.idDoctor = response.data.data.id
                    
            //     })
            //     .catch((error) => {
            //         this.$swal.fire({
            //             icon: 'error',
            //             title: 'ERROR!',
            //             text: error,
            //             showConfirmButton: false,
            //             timer: 1500
            //         })
                    
            //     });

            //     this.postSpecialization() 
            //     this.getDoctors()
            //     this.dialogCreate = false
            // }
                
        },

        

        async created() {
             await this.getPrescriptions()
            this.getMedications()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

