<template>
  <v-card
    class="mx-auto mt-10 pa-5"
    width="256"
    tile
  >
    <v-navigation-drawer permanent>
      <v-system-bar></v-system-bar>
      <v-list>
        <v-list-item>
          <v-list-item-avatar>
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

          <v-list-item-action>
            <v-icon>mdi-menu-down</v-icon>
          </v-list-item-action>
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="selectedItem"
          
        >
          <v-list-item
           
          >
            

            <v-list-item-content class="pa-5 ">
                <v-list-item-title class="mb-1 pa-2"> Gender: {{patient.gender}}</v-list-item-title>
                <v-list-item-title class="mb-1 pa-2"> birthDate: {{patient.birthDate}}</v-list-item-title>  
                <v-list-item-title class="mb-1 pa-2"> Adress: {{patient.address}}</v-list-item-title>
                <v-list-item-title class="mb-1 pa-2"> Zip-Code: {{patient.zip_code}}</v-list-item-title>
                <v-list-item-title class="mb-1 pa-2"> Mobile: {{patient.mobile_phone}}</v-list-item-title>
                <v-list-item-title class="mb-1 pa-2"> SNS: {{patient.sns}}</v-list-item-title>
                <v-list-item-title class="mb-1 pa-2"> Nif: {{patient.nif}}</v-list-item-title>                
                <v-list-item-title class="pa-2"> Status: {{patient.status}}</v-list-item-title>

            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </v-card>
</template>


<script>
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

    async created() {
        await this.getPatient()
    }


  }
</script>