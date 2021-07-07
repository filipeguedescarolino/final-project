
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
                    <td @click="showDoctor(props.item.id)">{{ props.item.name }}</td>
                    <td>{{ props.item.email }}</td>
                    <td>{{ props.item.certificate_number }}</td>
                     <td>
                        {{ props.item.status }}                      
                        <i v-if="props.item.status = 'active'" class="fas fa-ban" style="cursor: pointer" @click="toggleInactive( props.item.id)"> </i>
                        <i v-else  class="fas fa-first-aid " style="cursor: pointer" @click="toggleActive( props.item.id)"> </i>                                                    
                    </td>
                    <td >                        
                        <i class="far fa-trash-alt pointer" @click="thisDelete(props.item.id)"> </i>                                                    
                    </td>
                    <td >                        
                        <i class="fas fa-search" @click="openMaintenaceModal(props.item, 'edit')"> </i>                                                    
                    </td>


                    
                </tr>
            </template>
        </v-data-table>
        <show-and-edit v-if="show" :user="user"  :mode="mode" > </show-and-edit>
    </v-card>
</template>

<script>
import axios from 'axios'
import ShowAndEdit from './ShowAndEdit.vue'


    export default {
  components: { ShowAndEdit },
  
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
                    { text: 'Remove', value: 'remove', align: 'center'},
                    { text: 'Edit', value: 'edit', align: 'center'}
                ],                                
                
            }
        },
    
        methods: {

            getDoctors () {
                axios.get('http://localhost:3000/doctors').then((response) => {
                   
                    this.doctors = response.data.data 
                })
            },           

            showDoctor(id) {
                this.$router.push(`/doctors-show/${id}`)
            },

            thisDelete(id) {
               
                axios.delete(`http://localhost:3000/doctors/${id}`).then((response) => {
                console.log(response) 
                })
                this.getDoctors()

            },

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

