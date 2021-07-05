<template>
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
                    <td>{{ props.item.specializationDescription }}</td>
                    <td>{{ formatDate(props.item.day )}}</td>
                    <td>{{ props.item.hour }}</td>
                    
                    
                    <td>
                        <v-chip
                            :color="getColor(props.item.id_status)"
                            dark>

                            <span style="color: black;">{{ props.item.statusDescription }}</span>
                        </v-chip>
                    </td>
                    <td v-if="props.item.id_status = 1">                        
                        <i class="far fa-trash-alt pointer" @click="thisDelete(props.item.id, props.item.id_status)"> </i>                                                    
                    </td>
                    <td v-else>
                        Already occured
                    </td>
                </tr>
            </template>    
        </v-data-table>
    </v-card>
</template>


<script>
    import axios from 'axios'
    import moment from 'moment'
    export default {
        data () {
            return {
                appointments: [],
                search: '',
                headers: [
                    {
                        text: 'Doctor',
                        align: 'start',
                        sortable: false,
                        value: 'Doctor_id',
                    },
                    
                    { text: 'Specialization', value: 'id_specialization'},
                    { text: 'day', value: 'day' },
                    { text: 'hour', value: 'hour' },
                    { text: 'status', value: 'status' },
                    { text: 'Remove', value: 'remove'}
                    
                ],
                
            }
        },

        computed: {
            localStorageUser() {
            if (!localStorage || !localStorage.user) {
                return ''
            }
            return JSON.parse(localStorage.user)
            
            },

            momentDates () { 
                let a =this.appointments.map(({day}) => {
                    return  moment(day).format('YYYY-MM-DD') 
                })
                return a   
            }
                
        },

        methods: {

            getAppointments () {
                if (!localStorage || !this.localStorageUser) {
                    return
                }
                
                let userId = this.localStorageUser.id
                axios.get(`http://localhost:3000/appointments/history/${userId}`).then((response) => {
                    this.appointments = response.data.data 
                })
            },

            getColor (id_status) {
                if (id_status == 1) {
                    return 'yellow'
                } 
                
                else return 'green'
            },

            formatDate(value) {
                return moment(value).format("MMMM DD YYYY")
            },

            thisDelete(id, status) {
                if ( status != 1 ) {
                    return
                }

                axios.delete(`http://localhost:3000/appointments/${id}`).then((response) => {
                console.log(response) 
                })
                this.getAppointments()

            }


        },

        async created() {
            await this.getAppointments()
        }
    }
</script>

<style>