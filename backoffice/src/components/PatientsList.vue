<template>
  <div class="pa-0 m-0"> 
    <v-card hover class="mx-auto pa-2 mt-2 mb-2" v-for="patient in patients" :key="patient.id">
    <v-card-title class="justify-center">{{patient.name}}</v-card-title>
    <!-- <v-card-subtitle style="justify-content: flex-start;">Learn Web Development In Chunks</v-card-subtitle> -->
    <v-card-text class="justify-space-around">Email: <span class="text-lg-h6"> {{patient.email}} </span> | Mobile_phone:<span class="text-lg-h6"> {{patient.mobile_phone}}</span> </v-card-text>
    </v-card>
  </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                patients: [],
                
                   
                
            }
        },

        methods: {

            getPatients () {
                axios.get('http://localhost:3000/patients').then((response) => {
                    this.patients = response.data.data 
                })
            },

            // getPatientspecializations () {
            //     axios.get('http://localhost:3000/Patients').then((response) => {
            //         this.Patients = response.data.data 
            //     })
            // },
        },

        async created() {
            await this.getPatients()
        }
    }
</script>

<style>