<template>
  <v-card
    class="mx-auto mt-10 pa-2"
    width="60%"
    tile
    center
  >
    <v-navigation-drawer permanent
    width="900" class="pa-4">
      <v-system-bar></v-system-bar>
      <v-list>
        <v-list-item>
          <v-list-item-avatar height="100" width="100">
            <v-img :src= patient.image></v-img>
          </v-list-item-avatar>
        </v-list-item>

        <v-list-item v-if="patient">
          <v-row>
            <v-col cols="12" sm="10">
              <v-list-item-content>
                <v-list-item-title class="text-h6">
                  {{patient.name}}
                </v-list-item-title>
                <v-list-item-subtitle>{{patient.email}}</v-list-item-subtitle>
              </v-list-item-content>
            </v-col>
            <v-col cols="12" sm="2">
              <v-list-item-content>
                <v-list-item-icon>
                  
                  <v-icon color="blue"
                    v-if="!editMode"
                    @click="editMode = !editMode">
                      fas fa-edit
                  </v-icon>
                  <v-icon v-else
                    color="blue">
                      fas fa-save
                  </v-icon>
                </v-list-item-icon>                  
              </v-list-item-content>
            </v-col>
          </v-row>

          
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-form>
        <v-container v-if="patient">
          <v-row>
            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="patient.name"
                
                :readonly= "!editMode"
                label="Name"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6" v-if="editMode">
              <v-text-field
                v-model="patient.email"
                :readonly= "!editMode"
                label="Email"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.gender"
                :readonly= "!editMode"
                label="Gender"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="parsedDate "
                :readonly= "!editMode"
                label="Birthdate"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.address"
                :readonly= "!editMode"
                label="Address"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.zip_code"
                :readonly= "!editMode"
                label="Zip-Code"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.mobile_phone"
                :readonly= "!editMode"
                label="Mobile Phone"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.nif"
                :readonly= "!editMode"
                label="Nif"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.sns"
                :readonly= "!editMode"
                label="Sns"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.status"
                :readonly= "!editMode"
                label="Status"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="5">
            </v-col>
            <v-col cols="12" sm="3"
              v-if="editMode">
              <v-btn
                depressed
                color="primary"
                @click="updatePatient()">
                Update
              </v-btn>
            </v-col>
            

          </v-row>
        </v-container>
      </v-form>


     
    </v-navigation-drawer>
  </v-card>
</template>


<script>
    import {  mapActions, mapGetters } from 'vuex'
    import moment from 'moment'
    import axios from 'axios'
    export default {
        data: () => ({
        editMode: false,
        selectedItem: 0,
        items: [
            { text: 'My Files', icon: 'mdi-folder' },
            { text: 'Shared with me', icon: 'mdi-account-multiple' },
            { text: 'Starred', icon: 'mdi-star' },
            { text: 'Recent', icon: 'mdi-history' },
            { text: 'Offline', icon: 'mdi-check-circle' },
            { text: 'Uploads', icon: 'mdi-upload' },
            { text: 'Backups', icon: 'mdi-cloud-upload' },
        ],
        patient: []
        }),

    methods: {

        ...mapActions([
        'setUser',
        'setToken'
        ]),

        getPatient () {
            
            axios.get(`http://localhost:3000/patients/${this.user.id}`).then((response) => {
                
                this.patient = response.data.data 
            })
        },

        updatePatient () {
          
          
          let updatedPatient = {
            "name": this.patient.name,
            "birthdate": this.parsedDate,
            "address": this.patient.address,
            "zip_code": this.patient.zip_code,
            "email": this.patient.email,
            "mobile_phone": this.patient.mobile_phone,
            "sns": this.patient.sns,
            "nif": this.patient.nif,
            "password": this.patient.password,
            "status": this.patient.status,
            "gender": this.patient.gender,
            "id_insurance": this.patient.id_insurance
          }

          axios.put(`http://localhost:3000/patients/${this.patient.id}`, updatedPatient).then((response) => {
              this.$swal.fire({
                        icon: 'success',
                        title: 'Success!',
                        text: response.status,
                        showConfirmButton: false,
                        timer: 1500
                    }) 
              this.setUser(response.data.data)
              
          })
          .catch((error) => {
              console.log(error);
              
          });

          this.editMode = false 
          this.getPatient()


    

        }
    },

    

    computed: {
      parsedDate () {
        return  moment(this.patient.birthdate).format("YYYY-MM-DD");
      },

      ...mapGetters([
        'user',
        'token'
        ]),

    },

    async created() {
        await this.getPatient()
    }


  }
</script>