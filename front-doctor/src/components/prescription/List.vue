
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
                <tr v-if="props.item">
                    <td >{{ props.item.namePatient }}</td>
                    <td>{{ props.item.email }}</td>
                    <td>{{ props.item.nameMedication }}</td>
                    <td>{{ props.item.observationMedication }}</td>
                    <td>{{ formatDate(props.item.day) }} - {{ props.item.hour }} </td>
                    <td >{{ props.item.observation }}</td>          
                    <td >                        
                        <i class="fas fa-trash-alt" style="cursor: pointer" @click="removePrescription(props.item.id)"> </i>
                                                                                                       
                    </td>                    
                </tr>
            </template>
        </v-data-table>




       
          
        
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

            <v-card class="mt-3 pa-2" v-if="clinicalProcess && clinicalProcess.observations != null"> 
                <v-card-title class="justify-center">
                    Clinical Process
                    <v-card-subtitle>
                        last update: {{formatDate(clinicalProcess.created_at)}}
                    </v-card-subtitle>
                </v-card-title>
                
                <v-container fluid  >
                    <v-textarea
                    name="input-7-1"
                    filled
                    label="Last Clinical observations"
                    auto-grow
                    v-model="clinicalProcess.observations"
                    ></v-textarea>
 
                    <v-file-input
                        accept="image/*"
                        label="Patient Files"
                    ></v-file-input>
                </v-container>
            
                <v-btn               
                    color="primary"
                    dark
                    class="text-center"
                    @click="updateClinicalProcess()"
                    >Update clinical Process
                    
                </v-btn>           
            </v-card>

            <v-card v-else class="mt-3 pa-2">
                <v-btn               
                    color="primary"
                    dark
                    class="text-center"
                    @click="dialogClinicalProcess = !dialogClinicalProcess"
                    >Create Clinical Process
                    
                </v-btn>    

            </v-card>

            <v-dialog v-model="dialogClinicalProcess" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar style="text: center">  Create Clinical Process</v-system-bar>
                    
                    <v-divider></v-divider>
                    <v-form>
                       <v-container fluid  >
                            <v-textarea
                            name="input-7-1"
                            filled
                            label="Last Clinical observations"
                            auto-grow
                            v-model="createObservations"
                            ></v-textarea>
        
                            <v-file-input
                                accept="image/*"
                                label="Patient Files"
                            ></v-file-input>
                        </v-container>
                    </v-form>                    
                    </v-navigation-drawer>
                    <v-card-actions>
                        <v-btn color="primary"  @click=" dialogClinicalProcess = false">
                            Return
                        </v-btn>
                        <v-btn
                            depressed
                            color="primary"
                            @click="postClinicalProcess()">
                            Create Prescription
                        </v-btn>                                                
                    </v-card-actions>
                </v-card>
            </v-dialog>
       
    </v-card>
</template>

<script>
import axios from 'axios'
import {  mapGetters } from 'vuex'
import moment from 'moment'



    export default {
        

        
  
        data () {
            return {
                prescriptions: [],
                prescription: [],
                search: '',
                show: false,
                dialogClinicalProcess: false,
                createObservations: null,
                
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

                    { text: 'Remove', value: 'edit', align: 'center'}
                ],
               
                mode: null,
                observation: null,
                medication: null,
                medications: [],
                clinicalProcess: {
                    observations: null
                },


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
                await axios.get(`http://localhost:3000/prescription/patient/${this.$route.params.id}/doctor/${this.user.id}`).then((response) => {
                   
                    this.prescriptions = response.data.data 
                })
            },
            
        


            getClinicalProcess () {
                axios.get(`http://localhost:3000/clinical_process/${this.$route.params.id}`).then((response) => {
                    
                    this.clinicalProcess = response.data.data 
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


            updateClinicalProcess () {
                let clinical = {
                    "observations": this.clinicalProcess.observations,
                    "id_patient": this.$route.params.id
                }
                axios.put(`http://localhost:3000/clinical_process/${this.clinicalProcess.id}`, clinical).then((response) => {
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

                this.getClinicalProcess()
                
            },

            removePrescription(id) {

                axios.delete(`http://localhost:3000/prescription/${id}`).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    })  
                    this.getPrescriptions()                                      
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

                
            },





            postClinicalProcess () {
                
                let clinicalPost = {
                    "observations": this.createObservations,
                    "id_patient": this.$route.params.id
                }
                axios.post(`http://localhost:3000/clinical_process`, clinicalPost).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    })
                    
                    this.getClinicalProcess()
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
                this.dialogClinicalProcess = false
                this.getClinicalProcess()
                
            },





            postPrescription () {
                
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

            
           
            openMaintenaceModal (row, mode) {
                // user que estas a editar
        
                this.prescription = row
                this.mode= mode
                this.show = true
            },


            

            
                
        },

        

        async created() {
            await this.getPrescriptions()
            await this.getMedications()
            await this.getClinicalProcess()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

