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

        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="text-h6">
              {{patient.name}}
            </v-list-item-title>
            <v-list-item-subtitle>{{patient.email}}</v-list-item-subtitle>
          </v-list-item-content>

          
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-form>
        <v-container>
          <v-row>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.gender"
                readonly
                label="Gender"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="parsedDate "
                readonly
                label="Birthdate"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.address"
                readonly
                label="Address"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.zip_code"
                readonly
                label="Zip-Code"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.mobile_phone"
                readonly
                label="Mobile Phone"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.nif"
                readonly
                label="Nif"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.sns"
                readonly
                label="Sns"
                outlined
                shaped
              ></v-text-field>
            </v-col>

             <v-col cols="12" sm="6">
              <v-text-field
                v-model="patient.status"
                readonly
                label="Status"
                outlined
                shaped
              ></v-text-field>
            </v-col>

            

          </v-row>
        </v-container>
      </v-form>


     
    </v-navigation-drawer>
  </v-card>
</template>


<script>
    import moment from 'moment'
    import axios from 'axios'
    export default {
        data: () => ({
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
        getPatient () {
            
            axios.get('http://localhost:3000/patients/1').then((response) => {
                console.log(response)
                this.patient = response.data.data 
            })
        },
    },

    computed: {
      parsedDate () {
        return  moment(this.patient.birthdate).format("YYYY-MM-DD");
      }

    },

    async created() {
        await this.getPatient()
    }


  }
</script>