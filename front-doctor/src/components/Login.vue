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
                                                        Thank you for being a part of our team
                                                    </h4>
                                                </div>

                                                <h4 class="text-center mt-4">
                                                Fill up the data to login
                                                </h4>

                                                <v-form>
                                                    <v-text-field
                                                        v-model="logEmail"
                                                        label="Email"
                                                        name="Email"
                                                        prepend-icon="email"
                                                        type="text"
                                                        color="blue darken-1">
                                                    </v-text-field>

                                                    <v-text-field
                                                        v-model="logPassword"
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

                                                <v-btn rounded color="blue lighten-1" dark @click="loginDoctor()">
                                                    Login
                                                </v-btn>
                                            </div>
                                        </v-col>

                                        <v-col cols="12" md="4"  class="blue lighten-1">
                                            <v-card-text class="white--text mt-12">
                                                <h1 class="text-center display-1">
                                                    Hello Doctor
                                                </h1>

                                               
                                            </v-card-text>

                                            
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
    import { mapActions, mapGetters } from 'vuex'

    export default {

        props: {
            source: String
        },

        computed:{
            ...mapGetters([
            'user',
            'token'
            ]),

        },

        data () {
            return {
                logPassword: '',
                logEmail: '',
                valid: true,
                step: 1

            }
        },

        methods: {

            ...mapActions([
            'setUser',
            'setToken'
            ]),

                loginDoctor() {
                    let logUser = {
                        "username": this.logEmail,
                        "password": this.logPassword
                    }

                    axios.post('http://localhost:3000/doctors-login', logUser).then((response) => {
                    this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    }) 
                    
                    this.$router.push('/appointmentsHistory')
                    this.setUser(response.data.patient)
                    this.setToken(response.data.token)
                    
                    
                })
                .catch((error) => {
                    this.$swal.fire({
                        icon: 'error',
                        title: 'ERROR!',
                        text: error,
                        showConfirmButton: false,
                        timer: 1500
                    })
                });
                        
                        

                    


                },

               

        },
    } 

</script>

<style scoped>



</style>