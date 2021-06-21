<template>
  <v-container fluid>
    <v-row 
      class="d-flex">
      <v-col
        class="justify-center align-items-center"      
        cols="12"
        sm="6"
        align="center">
      
        <v-select
          v-model="selectedSpecialization"
          :items="specializations"
          item-text="description"
          item-value="description"
          label="Choose the specialization"
          outlined>
        
        </v-select>
      </v-col>
    </v-row>
    <v-row align="center"
      >
      

      <v-col
        
        cols="12"
        sm="6"
      >
          <v-select
            v-if="selectedSpecialization"
            v-model="selectedInsurance"
            :items="insurance"
            label="Outlined style"
            item-text="description"
            item-value="description"
            outlined
          ></v-select>
        
      </v-col>
    </v-row>

    <v-text 
      class="display-1"
      v-if="(selectedSpecialization && selectedInsurance)">
      The estimated value of the appointment is:
    </v-text>
  </v-container>
</template>

<script>
  import axios from 'axios'
  export default {
    data () {
      return {
        selectedSpecialization: '',
        selectedInsurance: '',
        specializations: [],
        items: ['Foo', 'Bar', 'Fizz', 'Buzz'],
        insurance: []
        
      }
    },

    methods: {
        getPricesAndSpecializations () {
            axios.get('http://localhost:3000/appointmentType').then((response) => {
                 debugger; // eslint-disable-line no-debugger
                if (response.status !== 200) {
                return
                }
                debugger; // eslint-disable-line no-debugger
                console.log(response)
                this.specializations = response.data.data
                             
            })
        },

        getInsuranceInfo () {
            axios.get('http://localhost:3000/insurance').then((response) => {
              if (response.status !== 200) {
                return
                }
                console.log(response.data.status)
                this.insurance = response.data.data

                
            })

        }
    },

    async created() {
       await this.getPricesAndSpecializations()
       this.getInsuranceInfo()
    }
  }
</script>