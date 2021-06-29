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

          
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-container class="mt-5">
      
      <v-row class="pa-3">
        <v-col
          cols="12"
          md="12">
          
        
          <v-select
            v-model="doctor"
            :items='doctors'
            item-value='id'
            item-text='name'
            label="Doctor's name"
            required>

            <template slot='item' slot-scope='{ item }'>
                DR: {{ item.name }}
            </template>

          </v-select>
        </v-col>

        
        
        <v-col
          cols="12"
          sm="4">


          <v-text-field
            v-model="day"
            color="blue accent-3"
            
            type="date"
            label="day"
            prepend-icon="event"
            required>

          </v-text-field>

        </v-col>


        <v-col
          cols="12"
          sm="3"
        >
          <v-dialog
            ref="dialog1"
            v-model="modal1"
            :return-value.sync="timeIn"
            persistent
            width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="timeIn"
                label="Start Hour"
                prepend-icon="mdi-clock-time-four-outline"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-time-picker
              v-if="modal1"
              v-model="timeIn"
              full-width
              format="24hr"
              min="9:00"
              max="20:00"
              :allowed-minutes="allowedStep"
            >
              <v-spacer></v-spacer>
              <v-btn
                text
                color="primary"
                @click="modal1 = false"
              >
                Cancel
              </v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.dialog1.save(timeIn)"
              >
                OK
              </v-btn>
            </v-time-picker>
          </v-dialog>
        </v-col>
        <v-spacer></v-spacer>
        <v-col
          cols="12"
          sm="3"
        >
          <v-dialog
            ref="dialog"
            v-model="modal2"
            :return-value.sync="timeOut"
            persistent
            width="290px"
          >
            <template v-slot:activator="{ on, attrs }">
              <v-text-field
                v-model="timeOut"
                label="End Hour"
                prepend-icon="mdi-clock-time-four-outline"
                readonly
                v-bind="attrs"
                v-on="on"
              ></v-text-field>
            </template>
            <v-time-picker
              v-if="modal2"
              v-model="timeOut"
              full-width
              format="24hr"
              :min= timeIn
              max="20:00"
              :allowed-minutes="allowedStep"
            >
              <v-spacer></v-spacer>
              <v-btn
                text
                color="primary"
                @click="modal2 = false"
              >
                Cancel
              </v-btn>
              <v-btn
                text
                color="primary"
                @click="$refs.dialog.save(timeOut)"
              >
                OK
              </v-btn>
            </v-time-picker>
          </v-dialog>
        </v-col>
        
        <v-col
          cols="12"
          md="12"
        >
          <v-select
            v-model="clinicalOffice"
            :items='clinicalOffices'
            item-value='id'
            item-text='description'
            label="Choose the office"
            required>

            <template slot='item' slot-scope='{ item }'>
              {{ item.description }}
            </template>

          </v-select>
        </v-col>

        <v-col
          cols="12"
          md="4">
        </v-col>

        <v-col
          cols="12"
          md="4">

          <v-btn
            depressed
            color="primary"
            @click="registerClient()"
          >
            Submit
          </v-btn>


        </v-col>
      </v-row>
    </v-container>


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
                <v-list-item-title class="mb-1 pa-2"> birthDate: {{patient.birthdate}}</v-list-item-title>  
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