<template>
  <v-card
    class="mx-auto"
    max-width="900"
    outlined
  >
    <v-list-item three-line>
      <v-list-item-content>
        <div class="text-overline mb-4">
          OVERLINE
        </div>
        <v-list-item-title class="text-h5 mb-1">
          Headline 5
        </v-list-item-title>
        <v-list-item-subtitle>Greyhound divisely hello coldly fonwderfully</v-list-item-subtitle>
      </v-list-item-content>

      <v-list-item-avatar
        tile
        size="80"
        color="grey"
      ></v-list-item-avatar>
    </v-list-item>

    
  </v-card>
</template>

<script>
import axios from 'axios'
export default {
    data() {
        return {
            medics: ''
        }
    },

    methods: {
        getDoctors () {
            axios.get('http://localhost:3000/doctors?page=1&limit=5').then((response) => {
                console.log(response)
                this.medics = response.data.data
            })

        }
    },

    created() {
        this.getDoctors()
    }

        
}
</script>