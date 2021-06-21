<template>
  <v-app id="inspire">
    <v-main>
      <v-container   class="fill-height" fluid>
        <v-row align="center" justify="center">
          <v-col cols="12" sm="8" md="8">
            <v-card class="elevation-12">
              
              <v-window v-model="step">
                <v-window-item :value="1">
                  <v-row>
                    <v-col cols="12" md="8">
                      <v-card-text class="mt-6">
                        <h1  class="text-center display-2 blue--text text--lighten-1"> 
                          Medical Clinic Rui Carolino
                        </h1>

                        <div class="text-center mt-4">
                          <h4 class="mx-2 bold" fab color="black" outlined>
                            We are currently located in Porto, Santo Antonio
                          </h4>
                        </div>

                        <h4 class="text-center mt-4">
                          Fill up the data to login
                        </h4>

                        <v-form>
                          <v-text-field
                            label="Email"
                            name="Email"
                            prepend-icon="email"
                            type="text"
                            color="blue darken-1">
                          </v-text-field>
                          
                          <v-text-field
                            id="password"
                            label="Password"
                            name="password"
                            prepend-icon="lock"
                            type="password"
                            color="blue darken-1">
                          </v-text-field>                          
                        </v-form>                        
                      </v-card-text>

                      <div class="text-center mt-3 mb-2">
                        <v-btn rounded color="blue lighten-1" dark>
                          Login
                        </v-btn>
                      </div>
                    </v-col>

                    <v-col cols="12" md="4"  class="blue lighten-1">
                      <v-card-text class="white--text mt-12">
                        <h1 class="text-center display-1">
                          Hello, Friend!
                        </h1>

                        <h5 class="text-center">                          
                        Not registered yet?
                        </h5>
                      </v-card-text>

                      <div class="text-center">
                        <v-btn rounded outlined dark @click="step++">
                          Registration
                        </v-btn>
                      </div>
                    </v-col>                    
                  </v-row>                  
                </v-window-item>

                <v-window-item :value="2">
                  <v-row class="fill-height">
                    <v-col cols="12" md="4" class="blue lighten-1">
                      <v-card-text class="white--text mt-12" 
                        style="margin-top: 50px">
                        <h1 class="text-center display-1 ">
                          Welcome
                        </h1>

                        <h5 class="text-center mb-2">
                          To  connect with us please register with your personnel info
                        </h5>

                        <h5 class="text-center">  
                          After you will be redirected to login
                        </h5>
                      </v-card-text>                      
                    </v-col>

                    <v-col cols="12" md="8">
                      <v-card-text class="mt-6">
                        <h1 class="text-center display-1 blue--text text--lighten-1">
                          Create Account
                        </h1>
                        
                        <v-form>
                          <v-text-field
                            v-model="name"
                            :counter="30"
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
                            v-model.number="zipCode"
                            type="number"
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
                            v-model.number="mobilePhone"
                            type="number"
                            :counter="9"
                            color="blue accent-3"
                            prepend-icon="phone"
                            :rules="mobilePhoneRules"
                            label="mobilephone">

                          </v-text-field>

                          <!-- Phone field -->
                          <v-text-field
                            v-model.number="phone"
                            type="number"
                            :counter="9"
                            color="blue accent-3"
                            prepend-icon="phone"
                            :rules="phoneRules"
                            label="phone">
                          </v-text-field>



                          
                          <!-- SNS field -->
                          <v-text-field
                            v-model.number="sns"
                            type="number"
                            :counter="20"
                            color="blue accent-3"
                            :rules="snsRules"
                            prepend-icon="person"
                            label="sns">

                          </v-text-field>

                          <!-- NIF field -->
                          <v-text-field
                            v-model.number="nif"
                            type="number"
                            :counter="20"
                            color="blue accent-3"
                            :rules="nifRules"
                            prepend-icon="person"
                            label="nif">

                          </v-text-field>

                          <!-- field Insurance -->
                          <v-select
                            v-model="selectInsurance"
                            :items="insurance"
                            color="blue accent-3"
                            :rules="[v => !!v || 'Item is required']"
                            label="Select Insurance"
                            prepend-icon="book"
                            required
                          ></v-select>

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
                          @click="registerClient" dark>

                         Complete Registration
                        </v-btn>
                      </div>
                    </v-col>
                  </v-row>
                </v-window-item>
              </v-window>
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>

  import axios from 'axios';

  export default {

    props: {
      source: String
    },
    data () {
      return {
      
        valid: true,
        name: '',
        nameRules: [
          v => !!v || 'Name is required',
          v => (v && v.length <= 10) || 'Name must be less than 10 characters',
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

        selectInsurance: null,
        insurance: [
          'None',
          'Multicare',
          'Medis',
          'AdvanceCare'
        ],
        checkbox: false,
        phone: '',
        phoneRules: [
          
          v => Number.isInteger(Number(v)) || "The value must be an integer number"
        ],

        mobilePhone: '',
        mobilePhoneRules: [
          v => !!v || 'mobilePhone is required',
          v => Number.isInteger(Number(v)) || "The value must be an integer number"
        ],

        zipCode: '',
        zipCodeRules: [
          v => !!v || 'zipCode is required',
          v => Number.isInteger(Number(v)) || "The value must be an integer number"
        ],

        sns: '',
        snsRules: [
          v => !!v || 'SNS is required',
          v => Number.isInteger(Number(v)) || "The value must be an integer number"
        ],

        nif: '',
        nifRules: [
          v => !!v || 'Nif is required',
          v => Number.isInteger(Number(v)) || "The value must be an integer number"
        ],

        address: '',
        addressRules: [
          v => !!v || 'Address is required',
          v => (v && v.length <= 200) || 'Address must be less than 200 characters',
        ],
        password: '',
        passwordRules: [
            v => !!v || 'password is required',
        ],
        passwordConfirmation: '',
        passwordConfirmationRules: [
            v => !!v || 'passwordConfirmation is required',
        ],

        birthDate: '',
        birthDateRules: [
          v => !!v || 'Address is required'
        ],
        step: 1

      }
    },

    methods: {

      // get() {
      //   axios.get('http://localhost:3000/patients?page=1&limit=5').then((response) => {
      //     console.log(response)
      //   })
      // },

      registerClient() {
        if (this.password != this.passwordConfirmation) {
          alert('password is not equal')
          return
        }

        let patient = {
          "name": this.name,
          "gender": this.select,
          "birthdate": this.birthDate,
          "address": this.address,
          "zip_code": this.zipCode,
          "email": this.email,
          "mobile_phone": this.mobilePhone,
          "phone": this.phone,
          "sns": this.sns,
          "nif": this.nif,
          "password": this.password
        }

        console.log(patient)
        axios.post('http://localhost:3000/patients', patient).then(response =>  console.log(response.data.id))      
        .catch(error => {
          this.errorMessage = error.message
          console.error("There was an error!", error);    
        });
    
      }

    },

    
  } 

</script>

<style scoped>



</style>