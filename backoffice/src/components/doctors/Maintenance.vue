<template>
 <!-- eslint-disable  -->
  

  <div class="text-center">
    <v-dialog
      v-model="dialog"
      width="1500"
    >
      <template v-slot:activator="{ on, attrs }">
        <v-btn
          color="red lighten-2"
          dark
          v-bind="attrs"
          v-on="on"
        >
          Click Me
        </v-btn>
      </template>

      <v-card>
        <v-card-title class="text-h5 blue lighten-2" align= "center">
          Privacy Policy
        </v-card-title>

        <v-card-text>
          <v-app id="inspire">
    <v-main>
      <v-container   class="fill-height" fluid>
       
          
            <v-card class="elevation-12" width= 120% >
              
              <v-window v-model="step">
                

                
                  <v-row class="fill-height">
                   

                    <v-col cols="12" md="12" center>
                      <v-card-text class="mt-6">
                        <h1 class="text-center display-1 blue--text text--lighten-1">
                          Create Doctor Account Account
                        </h1>
                        
                        <v-form>
                          <v-text-field
                            v-model="name"
                            :counter="50"
                            color="blue accent-3"
                            :rules="nameRules"
                            label="Name"
                            prepend-icon="person"
                            required>
                          </v-text-field>
                          
                          <!-- field Gender -->
                          <v-select
                            v-model="select"
                            :items="items"
                            color="blue accent-3"
                            :rules="[v => !!v || 'Item is required']"
                            label="Gender"
                            prepend-icon="person"
                            required
                          ></v-select>

                          <!-- Date -->
                          <v-text-field
                            v-model="birthDate"
                            color="blue accent-3"
                            :rules="birthDateRules"
                            type="date"
                            label="birthDate"
                            prepend-icon="event"
                            required>

                          </v-text-field>

                          <!-- Field Address -->
                          <v-text-field
                            v-model="address"
                            :counter="200"
                            color="blue accent-3"
                            :rules="addressRules"
                            prepend-icon="home"
                            label="Address"
                            required>

                          </v-text-field>

                          <!-- zipCode field -->
                          <v-text-field
                            v-model="zipCode"
                            
                            :counter="10"
                            color="blue accent-3"
                            :rules="zipCodeRules"
                            prepend-icon="home"
                            label="zipCode">

                          </v-text-field>

                          <!-- Field email -->
                          <v-text-field
                            v-model="email"
                            color="blue accent-3"
                            :rules="emailRules"
                            label="E-mail"
                            prepend-icon="email"
                            required>

                          </v-text-field>

                          <!-- mobilePhone field -->
                          <v-text-field
                            v-model="mobilePhone"
                            
                            :counter="9"
                            color="blue accent-3"
                            prepend-icon="phone"
                            :rules="mobilePhoneRules"
                            label="mobilephone">

                          </v-text-field>                          

                          
                          <!-- SNS field -->
                          <v-text-field
                            v-model.number="certificate"
                            :type="number"
                            :counter="15"
                            color="blue accent-3"
                            :rules="certificateRules"
                            prepend-icon="person"
                            label="certificate">

                          </v-text-field>

                          <!-- NIF field -->
                          <v-text-field
                            v-model="nif"
                            
                            :counter="20"
                            color="blue accent-3"
                            :rules="nifRules"
                            prepend-icon="person"
                            label="nif">

                          </v-text-field>

                          <v-text-field
                            v-model="image"
                            :counter="200"
                            color="blue accent-3"
                            :rules="imageRules"
                            prepend-icon="image"
                            label="Image Source"
                            required>

                          </v-text-field>
                          

                          <!-- Password and Password Conf  -->
                          <v-text-field
                            v-model="password"
                            :counter="8"      
                            type="password"
                            label="password"
                            prepend-icon="lock"
                            required>

                          </v-text-field>
                          <!-- Passwordconf -->
                          <v-text-field
                            v-model="passwordConfirmation"
                            name= "password"
                            type="password"
                            :counter="8"      
                            label="passwordConfirmation"
                            prepend-icon="lock"
                            required>

                          </v-text-field>
                        </v-form>
                      </v-card-text>

                      <div class="text-center mt-n5 mb-3">
                        <v-btn rounded color="blue accent-3" 
                          @click="registerDoctor" dark>

                         Complete Registration
                        </v-btn>
                      </div>
                    </v-col>
                  
                  </v-row>
              </v-window>
            </v-card>
         
        
      </v-container>
    </v-main>
  </v-app>
        </v-card-text>

        <v-divider></v-divider>

        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn
            color="primary"
            text
            @click="dialog = false"
          >
            I accept
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>

  import axios from 'axios';
  
  
  export default {

    props: {
      source: String
    },

    

    data () {
      return {
        logPassword: '',
        logEmail: '',
        editMode: false,
        valid: true,
        name: '',
        nameRules: [
          v => !!v || 'Name is required',
          v => (v && v.length <= 50) || 'Name must be less than 50 characters',
        ],
        email: '',
        emailRules: [
          v => !!v || 'E-mail is required',
          v => /.+@.+\..+/.test(v) || 'E-mail must be valid',
        ],
        select: null,
        items: [
          'Male',
          'Female',
        ],

        
        checkbox: false,
        
        

        mobilePhone: '',
        mobilePhoneRules: [
          v => !!v || 'mobilePhone is required',
          v => (v && v.length <= 13) || 'Name must be less than 13 characters'
        ],

        zipCode: '',
        zipCodeRules: [
          v => !!v || 'zipCode is required',
          v => (v && v.length <= 10) || 'Name must be less than 10 characters'
        ],

        certificate: '',
        certificateRules: [
          v => !!v || 'Certificate is required',
          
        ],

        nif: '',
        nifRules: [
          v => !!v || 'Nif is required',
          v => (v && v.length <= 9) || 'Name must be equal to 9 characters'
        ],

        address: '',
        addressRules: [
          v => !!v || 'Address is required',
          v => (v && v.length <= 250) || 'Address must be less than 200 characters',
        ],
        
        image: '',
        imageRules: [
            v => !!v || 'Image source is required',
            v => (v && v.length <= 200) || 'Image must be less than 200 characters',
        ],

        password: '',
        passwordRules: [
            v => !!v || 'password is required',
            v => (v && v.length <= 15) || 'Address must be less than 15 characters',
        ],
        passwordConfirmation: '',
        passwordConfirmationRules: [
            v => !!v || 'passwordConfirmation is required',
            v => (v && v.length <= 15) || 'Address must be less than 15 characters',
        ],

        birthDate: '',
        birthDateRules: [
          v => !!v || 'birthDate is required'
        ],
        step: 2,
        dialog: false,

      }
    },

    methods: {
      
        
      // get() {
      //   axios.get('http://localhost:3000/patients?page=1&limit=5').then((response) => {
      //     console.log(response)
      //   })
      // },

      registerDoctor() {
        if (this.editMode) {
          return
        }
        if (this.password != this.passwordConfirmation) {
          alert('password is not equal')
          return
        }
        let doctor2 = {
          "name":'Filipe',
          "gender": 'Male',
          "birthdate": "1991-12-12",
          "address": 'ra',
          "zip_code": '123',
          "email": "filsss@gmail.com",
          "mobile_phone": "919191991",
          
          "certificate_number": 2203331,
          "nif": "254245211",
          "password": "123456",
          "image_src": "https://www.hsmporto.pt/wp-content/uploads/2015/12/placeholder_homem.png"    
        }
              
        console.log(doctor2)
        
        axios.post('http://localhost:3000/doctors', doctor2).then((response) => {
              // Takes 4 seconds, 4 more seconds, 4 more seconds, etc
              // Ideally: Takes 4 seconds, returns in the same ~4 seconds, returns in the same ~4 seconds, etc
              console.log(response);
              console.log('Que Fking animal Beast')
          })
          .catch((error) => {
              console.log(error);
              console.log('deuBosta')
          });
      },
      
    },

    

    

    
  } 

</script>

<style scoped>



</style>