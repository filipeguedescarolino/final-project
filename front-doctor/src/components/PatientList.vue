
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
            :items="patients"
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
                    <td>{{ props.item.mobile_phone }}</td>
                     <!-- <td @click="thisChangeStatus( props.item)">
                        {{ props.item.status }}                      
                        <i  class="fas fa-ban" style="cursor: pointer" > </i>
                                                                            
                    </td> -->
                    
                    <td >                        
                        <i class="fas fa-search mr-3" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'check')"> </i>
                        <i class="fas fa-edit" style="cursor: pointer" @click="openMaintenaceModal(props.item, 'edit')"> </i>
                                                                                 
                    </td>                    
                </tr>
            </template>
        </v-data-table>
       
          
        
         
            
       
    </v-card>
</template>

<script>
import axios from 'axios'



    export default {
       

        
  
        data () {
            return {
                // idDoctor: null,
                // specializations: null,
                // specialization: null, 
                patients: [],
                search: '',
                show: false,
                headers: [
                    {
                        text: 'Patient',
                        align: 'center',
                        sortable: false,
                        value: 'name',
                    },       
                    { text: 'Email', value: 'email', align: 'center' },
                    { text: 'mobile Phone', value: 'mobile_phone', align: 'center' },
                    // { text: 'Status', value: 'status', align: 'center' },
                    
                    { text: 'Edit', value: 'edit', align: 'center'}
                ],
                user: null,
                mode: null,
                

                
                

                
            }
        },
    
        methods: {

            getPatientsWithAppointment () {
                axios.get('http://localhost:3000/doctors').then((response) => {
                   
                    this.doctors = response.data.data 
                })
            },           

            

           getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
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
                this.getPatientsWithAppointment()                        
            },


            async postDoctor() {
                if (this.create.password != this.create.password2) {
                    return
                }
                
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

                
                this.getPatientsWithAppointment()
                
            }
                
        },

        

        created() {
            this.getPatientsWithAppointment()
            this.getSpecializations()
            
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>

