<template>
  <div class="pa-0 m-0"> 
    <v-card hover class="mx-auto pa-2 mt-2 mb-2" v-for="doctor in doctors" :key="doctor.id">
    <v-card-title class="justify-center">{{doctor.name}}</v-card-title>
    <!-- <v-card-subtitle style="justify-content: flex-start;">Learn Web Development In Chunks</v-card-subtitle> -->
    <v-card-text>Specializations : Mobile_phone: <span class="text-lg-h6">{{doctor.mobile_phone}}</span> </v-card-text>
    </v-card>
  </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                doctors: [],
                
                   
                
            }
        },

        methods: {

            getDoctors () {
                axios.get('http://localhost:3000/doctors').then((response) => {
                    this.doctors = response.data.data 
                })
            },

            // getDoctorSpecializations () {
            //     axios.get('http://localhost:3000/doctors').then((response) => {
            //         this.doctors = response.data.data 
            //     })
            // },
        },

        async created() {
            await this.getDoctors()
        }
    }
</script>

<style>