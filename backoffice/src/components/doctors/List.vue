
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
                     <td>
                        {{ props.item.status }}                      
                        <i v-if="props.item.status = 'active'" class="fas fa-ban" style="cursor: pointer" @click="toggleInactive( props.item.id)"> </i>
                        <i v-else  class="fas fa-first-aid " style="cursor: pointer" @click="toggleActive( props.item.id)"> </i>                                                    
                    </td>
                    
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>
                                                                                 
                    </td>                    
                </tr>
            </template>
        </v-data-table>
        <i class="fas fa-plus" style="cursor: pointer" @click="dialogCreate = true"> </i>  
        <show-and-edit  v-model="show" v-if="show"   :user="user"  :mode="mode"  @save="saveUser(user, mode)" > </show-and-edit>
         <!-- Inicia dialog  -->
            <v-dialog v-model="dialogCreate" max-width="900px">
                <v-card>
                    <v-navigation-drawer permanent
                    width="900" class="pa-4">
                    <v-system-bar></v-system-bar>
                    
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

                            <v-col cols="12" sm="5">
                            </v-col>
                            <v-col cols="12" sm="3">
                            
                            <v-btn
                                depressed
                                color="primary"
                                @click="postDoctor()">
                                Create Doctor
                            </v-btn>
                            </v-col>
                            

                        </v-row>
                        </v-container>
                    </v-form>


                    
                    </v-navigation-drawer>
                    <v-card-actions>
                    <v-btn color="primary"  @click=" dialogCreate = false">Return</v-btn>
                    </v-card-actions>
                </v-card>
            </v-dialog>



        <!-- termina dialog  -->
    </v-card>
</template>

<script>
import axios from 'axios'
import ShowAndEdit from './ShowAndEdit.vue'


    export default {
  components: { ShowAndEdit },

        props: {
            user: {
                type: Object
            }
      

        },
  
        data () {
            return {
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

            

            // thisDelete(id) {
               
            //     axios.delete(`http://localhost:3000/doctors/${id}`).then((response) => {
            //     console.log(response) 
            //     })
            //     this.getDoctors()

            // },

            toggleActive(id) {
                
                let currentStatus = {
                    "status" : "active"
                }
                axios.put(`http://localhost:3000/doctors/status/${id}`, currentStatus).then((response) => {
                        // Takes 4 seconds, 4 more seconds, 4 more seconds, etc
                        // Ideally: Takes 4 seconds, returns in the same ~4 seconds, returns in the same ~4 seconds, etc
                        console.log(response);
                        console.log('Que Fking animal Beast')
                })
                    .catch((error) => {
                        console.log(error);
                        console.log('deuBosta')
                });

                this.getDoctors()

                
            },

            toggleInactive(id) {
                
                let currentStatus = {
                    "status" : "inactive"
                }
                axios.put(`http://localhost:3000/doctors/status/${id}`, currentStatus).then((response) => {
                        // Takes 4 seconds, 4 more seconds, 4 more seconds, etc
                        // Ideally: Takes 4 seconds, returns in the same ~4 seconds, returns in the same ~4 seconds, etc
                        console.log(response);
                        console.log('Que Fking animal Beast')
                })
                    .catch((error) => {
                        console.log(error);
                        console.log('deuBosta')
                });

                this.getDoctors()

                
            },

            openMaintenaceModal (row, mode) {
                // user que estas a editar
        
                this.user = row
                this.mode= mode
                this.show = true
            },

            async saveUser (user, mode) {
                debugger
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
                    console.log(response);
                    alert('correu bem')
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getDoctors()
                        
            },


            postDoctor() {
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

                axios.post(`http://localhost:3000/doctors`, doctorCreate).then((response) => {
                    console.log(response);
                    alert('correu bem')
                    console.log('Que Fking animal Beast')
                })
                .catch((error) => {
                    console.log(error);
                    console.log('deuBosta')
                });
                
                this.getDoctors()
                this.dialogCreate = false
            }
                
        },

        

        created() {
            this.getDoctors()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

