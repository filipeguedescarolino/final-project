<template>
  <v-app id="inspire">
    <v-main>
      <v-container class="fill-height" fluid>
        <v-row align="center" justify="center">
          <v-col cols="12" sm="8" md="8">
            <v-card class="elevation-12">
              <v-window v-model="step">
                <v-window-item :value="1">
                  <v-row>
                    <v-col cols="12" md="8">
                      <v-card-text class="mt-12">
                        <h1  class="text-center display-2 blue--text text--accent-3"> 
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
                            color="blue accent-3">
                          </v-text-field>
                          
                          <v-text-field
                            id="password"
                            label="Password"
                            name="password"
                            prepend-icon="lock"
                            type="password"
                            color="blue accent-3">
                          </v-text-field>                          
                        </v-form>                        
                      </v-card-text>

                      <div class="text-center mt-3 mb-2">
                        <v-btn rounded color="blue accent-3" dark>
                          Login
                        </v-btn>
                      </div>
                    </v-col>

                    <v-col cols="12" md="4" class="blue accent-3">
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
                    <v-col cols="12" md="4" class="blue accent-3">
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
                      <v-card-text class="mt-12">
                        <h1 class="text-center display-2 blue--text text--accent-3">
                          Create Account
                        </h1>
                        
                        <v-form>
                          <v-text-field
                            label="Name"
                            name="Name"
                            prepend-icon="person"
                            type="text"
                            color="blue accent-3">
                          </v-text-field>
                          
                          <v-text-field
                            label="Email"
                            name="Email"
                            prepend-icon="email"
                            type="text"
                            color="blue accent-3">
                          </v-text-field>

                          <v-text-field
                            id="password"
                            label="Password"
                            name="password"
                            prepend-icon="lock"
                            type="password"
                            color="blue accent-3">
                          </v-text-field>

                          <v-text-field
                            id="password"
                            label="Password Confirmation"
                            name="password"
                            prepend-icon="lock"
                            type="password"
                            color="blue accent-3">
                          </v-text-field>
                        </v-form>
                      </v-card-text>

                      <div class="text-center mt-n5 mb-3">
                        <v-btn rounded color="blue accent-3" 
                          @click="registrationForm" dark>

                          Finish Registration
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
export default {
  data: () => ({
    step: 1
  }),
  props: {
    source: String
  },

  methods: {
    registrationForm() {
      
      this.step = 1
    }
  }
};
</script>