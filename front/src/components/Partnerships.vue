<template>
  <v-card>
    <v-card-title>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      :headers="headers"
      :items="Insurances"
      :search="search"
      :items-per-page="5"
      item-key="name"
      class="elevation-1 pa-4"
      :footer-props="{
        showFirstLastPage: true,
        firstIcon: 'mdi-arrow-collapse-left',
        lastIcon: 'mdi-arrow-collapse-right',
        prevIcon: 'mdi-minus',
        nextIcon: 'mdi-plus'
      }"
    ></v-data-table>
  </v-card>
</template>


<script>
  export default {
    data () {
      return {
        search: '',
        headers: [
          {
            text: 'Insurance',
            align: 'start',
            sortable: false,
            value: 'name',
          },
          { text: 'Covered', value: 'Reimbursed_Value' },
         
        ],
        Insurances: [
          {
            name: 'Médis',
            Reimbursed_Value: '30%',
          },  
           {
            name: 'Multicare',
            Reimbursed_Value: '35%',
          },  
           {
            name: 'AdvanceCare',
            Reimbursed_Value: '40%',
          },  
          {
            name: 'Allianz',
            Reimbursed_Value: '25%',
          },
          {
            name: 'Generali',
            Reimbursed_Value: '45%',
          },
           
          {
            name: 'Montepio',
            Reimbursed_Value: '45%',
          },
        ],
      }
    },
  }
</script>

<style>
tbody tr:nth-of-type(odd) {
  background-color: rgba(0, 0, 0, .05);
}
</style>
