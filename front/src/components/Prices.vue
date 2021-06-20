<template>
  <v-data-table
    :headers="headers"
    
    :items="price"
    :items-per-page="5"
    item-key="name"
    class="elevation-1 mt-4"
    :footer-props="{
      showFirstLastPage: true,
      firstIcon: 'mdi-arrow-collapse-left',
      lastIcon: 'mdi-arrow-collapse-right',
      prevIcon: 'mdi-minus',
      nextIcon: 'mdi-plus'
    }"
  >
    
  
  </v-data-table>
</template>

<script>
  import axios from 'axios'
  export default {
    data () {
      return {
        specialization: '',
        headers: [
          {
            text: 'Specialization',
            align: 'start',
            value: 'name',
          },
          { text: 'Price', value: 'Price' },
          { text: 'Insurance', value: 'range' },
        ],
        price: [
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            Price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            price: '40£',
            range: '20 to 25'
          },
          {
            name: 'pediatrics',
            price: '40£',
            range: '20 to 25'
          },
        ],
      }
    },

    methods: {
        getPricesAndSpecializations () {
            axios.get('http://localhost:3000/appointmentType').then((response) => {
                console.log(response)
                this.specialization = response.data.data

                
            })

        }
    },

    created() {
        this.getPricesAndSpecializations()
    }
  }
</script>