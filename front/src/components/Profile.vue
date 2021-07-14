<template>
    
    <div>
        <v-row
            
            no-gutters
            style="height: 150px;"
        >
        
            <v-col
            v-for= "(profile,index) in profiles" :key="index"
            cols=12 sm="4"
            >
                <v-card max-width="350" class="mx-auto my-12">
                    

                    <v-img width="500" height="400"
                        :src= profile.image_src />
                    <v-card-title> 
                       DR: {{profile.name}} 
                    </v-card-title>

                    <v-card-text>
                        <v-row align="center"
                            class="mx-0">

                            <v-rating
                                :value="profile.rating"
                                color="indigo"
                                size="14"
                                dense
                                half-increments/>

                            <div class="grey--text ml-4 text-uppercase">
                                {{profile.rating}}
                            </div>
                            
                        </v-row>

                        <v-row align="center" class="mx-0" v-for="specialization in specializations" :key="specialization.id">
                            
                                <div class="grey--text mt-2 text-uppercase" v-if="specialization.id_doctor == profile.id">
                                       {{specialization.description}}
                                </div>
                            
                        </v-row>

                        <div class="my-4 subtitle-1 black--text">
                             {{profile.mobile_phone}} 
                        </div>

                        

                    </v-card-text>
                    <v-divider> </v-divider>
               
                </v-card>
            </v-col>
        </v-row> 
    </div>
   

</template>

<script>
import axios from 'axios'

export default {
    name: 'Profile',
    data () {
        return {

            profiles: [],
            specializations: []
                
            
        }
    },

    methods: {

        getDoctors () {
            axios.get('http://localhost:3000/doctors').then((response) => {
                this.profiles = response.data.data 
            })
        },

        getDoctorsPivotSpecializations () {
            axios.get('http://localhost:3000/pivot_doctor_specialization/specialization-name').then((response) => {
                this.specializations = response.data.data 
            })
        },


    
    },

    async created() {
        await this.getDoctors()
        this.getDoctorsPivotSpecializations()
    }
    
}
</script>