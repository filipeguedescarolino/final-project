<template>
    
    <div>
        <v-row
            v-if="!editMode"
            no-gutters
            style="height: 150px;"
        >
        
            <v-col
            
            cols=12 sm="12"
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

                        <v-row align="center" class="mx-0" v-for="specialization in specializations" :key="specialization.id">
                            
                                <div class=" text-uppercase mt-2" v-if="specialization && specialization.description">
                                       {{specialization.description}}
                                </div>
                            
                        </v-row>

                        

                        <v-row align="center" class="mx-0">
                            <div class="text-uppercase mt-2">
                                {{profile.email}}
                            </div>

                        </v-row>

                        <v-row align="center" class="mx-0">
                            <div class="text-uppercase mt-2">
                                {{profile.certificate_number}}
                            </div>

                        </v-row>

                        <v-row align="center" class="mx-0">
                            <div class="text-uppercase mt-2">
                                {{profile.status}}
                            </div>

                        </v-row>

                        <v-list-item-content>
                        <v-list-item-icon>
                        
                        <v-icon color="blue"
                            
                            @click="editMode = !editMode">
                            fas fa-search
                        </v-icon>
                        <!-- <v-icon v-else
                            color="blue">
                            fas fa-save
                        </v-icon> -->
                        </v-list-item-icon>                  
                    </v-list-item-content>

                    </v-card-text>
                    <v-divider> </v-divider>
               
                </v-card>
            </v-col>
        </v-row>
        <v-card
            v-if="editMode"
            class="mx-auto mt-10 pa-2"
            width="60%"
            tile
            center
        >
        
            <v-navigation-drawer permanent
            width="900" class="pa-4">
            <v-system-bar color= "blue" center > </v-system-bar>
            <v-list>
                

                <v-list-item >
                <v-row>
                    
                    <v-col cols="12" sm="10">
                    <v-list-item-content>
                        <v-list-item-icon>
                        
                        <v-icon color="blue"
                            
                            @click="editMode = !editMode" >
                            far fa-undo
                        </v-icon>
                        
                        </v-list-item-icon>                  
                    </v-list-item-content>
                    </v-col>
                </v-row>

                
                </v-list-item>
            </v-list>
            <v-divider></v-divider>
            <v-form>
                <v-container v-if="profile">
                    <v-row>
                        <v-col cols="12" sm="6" v-if="editMode">
                        <v-text-field
                            v-model="profile.name"
                            
                            
                            label="Name"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6" v-if="editMode">
                        <v-text-field
                            v-model="profile.email"
                            
                            label="Email"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.gender"
                            
                            label="Gender"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.birthdate"
                            
                            label="Birthdate"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.address"
                            
                            label="Address"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.zip_code"
                            
                            label="Zip-Code"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.mobile_phone"
                            
                            label="Mobile Phone"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.nif"
                            
                            label="Nif"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.certificate_number"
                            
                            label="Certificate Number"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="6">
                        <v-text-field
                            v-model="profile.status"
                        
                            label="Status"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>

                        <v-col cols="12" sm="12">
                            <v-text-field
                            v-model="profile.image_src"
                        
                            label="Image Source"
                            outlined
                            shaped
                        ></v-text-field>
                        </v-col>
                        
                        

                    </v-row>

                    <v-row>
                        
                            <v-btn
                                depressed
                                color="primary"
                                block
                                center
                                @click="updateDoctorDetails()">
                                Update
                            </v-btn>
                        

                    </v-row>
                </v-container>
            </v-form>


            
            </v-navigation-drawer>
        </v-card>
    </div>
   

</template>

<script>
import axios from 'axios'
export default {
    name: 'Profile',
    data () {
        return {

            profile: [],
            specializations: [],
            editMode: false
                
            
        }
    },

    methods: {

        getDoctors () {
            axios.get(`http://localhost:3000/doctors/${this.$route.params.id}`).then((response) => {
                this.profile = response.data.data 
            })
        },

        getDoctorsPivotSpecializations () {
            axios.get(`http://localhost:3000/pivot_doctor_specialization/doctor/${this.$route.params.id}`).then((response) => {
                this.specializations = response.data.data 
            })
        },

        updateDoctorDetails() {
            let updatedDoctor = {
            "name": this.profile.name,
            "birthdate": this.profile.birthdate,
            "address": this.profile.address,
            "zip_code": this.profile.zip_code,
            "email": this.profile.email,
            "mobile_phone": this.profile.mobile_phone,
            "certificate_number": this.profile.certificate_number,
            "nif": this.profile.nif,
            "password": this.profile.password,
            "status": this.profile.status,
            "gender": this.profile.gender,
            "image_src": this.profile.image_src
            
          }

          axios.put(`http://localhost:3000/doctors/${this.$route.params.id}`, updatedDoctor).then((response) => {
              console.log(response);
              
              console.log('Que Fking animal Beast')
          })
          .catch((error) => {
              console.log(error);
              console.log('deuBosta')
          });
          this.editMode = false 
          this.getDoctors()
        }


    
    },

    async created() {
        await this.getDoctors()
        this.getDoctorsPivotSpecializations()
    }
    
}
</script>