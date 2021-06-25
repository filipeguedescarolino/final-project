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
                    <td>{{ props.item.id_patient }}</td>
                    <td>{{ props.item.id_doctor }}</td>
                    <td>{{ props.item.id_specialization }}</td>
                    <td>{{ props.item.day }}</td>
                    <td>{{ props.item.hour }}</td>
                    
                    <td>
                        <v-chip
                            :color="getColor(props.item.id_status)"
                            dark>

                            {{ props.item.id_status }}
                        </v-chip>
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
                appointments: [],
                search: '',
                headers: [
                    {
                        text: 'Patient',
                        align: 'start',
                        sortable: false,
                        value: 'name',
                    },
                { text: 'Doctor', value: 'Doctor_id' },
                { text: 'Specialization', value: 'id_specialization'},
                { text: 'day', value: 'day' },
                { text: 'hour', value: 'hour' },
                { text: 'status', value: 'status' },
                

                ],
                
            }
        },

        methods: {

            getAppointments () {
                axios.get('http://localhost:3000/appointments').then((response) => {
                    this.appointments = response.data.data 
                })
            },

            getColor (id_status) {
                if (id_status == 1) return 'red'
                
                else return 'green'
            },


        },

        async created() {
            await this.getAppointments()
        }
    }
</script>

<style>