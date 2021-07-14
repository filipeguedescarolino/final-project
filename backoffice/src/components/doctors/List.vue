
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
            :items="doctors"
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
                    <td >{{ props.item.name }}</td>
                    <td>{{ props.item.email }}</td>
                    <td>{{ props.item.certificate_number }}</td>
                     <td @click="thisChangeStatus( props.item)">
                        {{ props.item.status }}                      
                        <i  class="fas fa-ban" style="cursor: pointer" > </i>
                                                                            
                    </td>
                    
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>
                                                                                 
                    </td>                    
                </tr>
            </template>
        </v-data-table>
       
          
        <show-and-edit  v-model="show" v-if="show"   :user="user"  :mode="mode"  @save="saveUser" > </show-and-edit>
         <!-- Inicia dialog  -->
            <v-dialog v-model="dialogCreate" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar style="text: center">  Create Doctor</v-system-bar>
                    
                    <v-divider></v-divider>
                    <v-form>
                        <v-container>
                        <v-row>
                            <v-col cols="12" sm="6" >
                            <v-text-field
                                v-model="create.name"
                                
                                
                                label="Name"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6" >
                            <v-text-field
                                v-model="create.email"
                                
                                label="Email"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.gender"
                                
                                label="Gender"
                                outlined
                                shaped
                            >
                            </v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.birthdate "
                                
                                label="Birthdate"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.address"
                                
                                label="Address"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.zip_code"
                                
                                label="Zip-Code"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.mobile_phone"
                                
                                label="Mobile Phone"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.nif"
                                
                                label="Nif"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.certificate_number"
                                
                                label="Certificate Number"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.status"
                                
                                label="Status"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.password"
                                
                                label="Password"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>

                            <v-col cols="12" sm="6">
                            <v-text-field
                                v-model="create.password2"
                                
                                label="Password Confirmation"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>
                            
                            <v-col cols="12" sm="12">
                            <v-text-field
                                v-model="create.image_src"
                                
                                label="Image Src"
                                outlined
                                shaped
                            ></v-text-field>
                            </v-col>
                            <v-col cols="12" sm="12">
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
                            @click="postDoctor()">
                            Create Doctor
                        </v-btn>                                                
                    </v-card-actions>
                </v-card>
            </v-dialog>

            <div class="text-center">
                <v-btn
                
                color="primary"
                dark
                
                @click="dialogCreate = !dialogCreate"
                >Adicionar novo Médico
                    <i class="fas fa-plus ml-3" style="cursor: pointer" > </i>
                </v-btn>
            </div>
       
    </v-card>
</template>

<script>
import axios from 'axios'
import ShowAndEdit from './ShowAndEdit.vue'


    export default {
        components: { ShowAndEdit },

        
  
        data () {
            return {
                idDoctor: null,
                specializations: null,
                specialization: null, 
                doctors: [],
                search: '',
                show: false,
                headers: [
                    {
                        text: 'Doctor',
                        align: 'center',
                        sortable: false,
                        value: 'name',
                    },       
                    { text: 'Email', value: 'email', align: 'center' },
                    { text: 'Certificate number', value: 'certificate_number', align: 'center' },
                    { text: 'Status', value: 'status', align: 'center' },
                    
                    { text: 'Edit', value: 'edit', align: 'center'}
                ],
                user: null,
                mode: null,
                create: {
                    "birthdate": null,
                    "address": null,
                    "zip_code": null,
                    "email": null,
                    "mobile_phone": null,
                    "password": null,
                    "status": null,
                    "gender": null,
                    "name": null,
                    "certificate_number": null,
                    "image_src": null,
                    "nif": null,                    
                    "password2": null 
                    
                },

                dialogCreate: false
                

                
            }
        },
    
        methods: {

            getDoctors () {
                axios.get('http://localhost:3000/doctors').then((response) => {
                   
                    this.doctors = response.data.data 
                })
            },           

            

           getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
            },

            postSpecialization () {
                debugger
                let pivotDoctorSpecialization = {
                    "id_doctor": this.idDoctor,
                    "id_specialization": this.specialization.id
                }
                axios.post('http://localhost:3000/pivot_doctor_specialization', pivotDoctorSpecialization).then((response) => {
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
            },

            thisChangeStatus(doctor) {
                if (doctor.status == "active") {
                    let status  = {
                        "status": "inactive" 
                    }

                    axios.put(`http://localhost:3000/doctors/status/${doctor.id}`, status).then((response) => {
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
                    this.getDoctors()
                    return 
                }

                let status2 = {
                    "status": "active"
                }

                axios.put(`http://localhost:3000/doctors/status/${doctor.id}`, status2).then((response) => {
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
                    this.getDoctors()
                    return
            },

            openMaintenaceModal (row, mode) {
                // user que estas a editar
        
                this.user = row
                this.mode= mode
                this.show = true
            },


            async saveUser (user, mode) {
                
                this.show = false
                if (mode == 'check') {
                    return
                }

                console.log(user)
                
                let doctorUpdate = {
                    "certificate_number": user.certificate_number,
                    "name": user.name,
                    "birthdate": user.birthdate,
                    "address": user.address,
                    "zip_code": user.zip_code,
                    "email": user.email,
                    "mobile_phone": user.mobile_phone,
                    "nif": user.nif,
                    "password": user.password,
                    "status":user.status,
                    "gender": user.gender,
                    "image_src": user.image_src
                }
                

                await axios.put(`http://localhost:3000/doctors/${user.id}`, doctorUpdate).then((response) => {
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
                this.getDoctors()                        
            },


            async postDoctor() {
                if (this.create.password != this.create.password2) {
                    return
                }
                debugger
                let doctorCreate = {
                    "certificate_number": this.create.certificate_number,
                    "name": this.create.name,
                    "birthdate": this.create.birthdate,
                    "address": this.create.address,
                    "zip_code": this.create.zip_code,
                    "email": this.create.email,
                    "mobile_phone": this.create.mobile_phone,
                    "nif": this.create.nif,
                    "password": this.create.password,
                    "status":this.create.status,
                    "gender": this.create.gender,
                    "image_src": this.create.image_src
                }

                await axios.post(`http://localhost:3000/doctors`, doctorCreate).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    }) 
                    this.idDoctor = response.data.data.id
                    
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

                this.postSpecialization() 
                this.getDoctors()
                this.dialogCreate = false
            }
                
        },

        

        created() {
            this.getDoctors()
            this.getSpecializations()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

