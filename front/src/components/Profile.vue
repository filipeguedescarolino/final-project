<template>
    
    <div>
        <v-row
            
            no-gutters
            style="height: 150px;"
        >
        
            <v-col
            v-for= "(profile,index) in profiles" :key="index"
            
            >
                <v-card max-width="300" class="mx-auto my-12">
                    

                    <v-img width="400" height="300"
                        :src=profile.image_src />
                    <v-card-title> 
                        {{profile.name}} 
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

                        <div class="my-4 subtitle-1 black--text">
                            {{profile.specialty}}
                        </div>

                        <div class="my-4 subtitle-1 black--text">
                            Address: {{profile.address}}
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

            profiles: [
                
            ]
        }
    },

    methods: {

        getDoctors () {
            axios.get('http://localhost:3000/doctors').then((response) => {
                this.profiles = response.data.data 
            })
        },

        getDoctorsPivotSpecializations () {
            axios.get('http://localhost:3000/doctors').then((response) => {
                this.profiles = response.data.data 
            })
        },
    
    },

    async created() {
        await this.getDoctors()
    }
    
}
</script>