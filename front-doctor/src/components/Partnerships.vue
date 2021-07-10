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
            :items="insurances"
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
            }">

            <template v-slot:item="props">
                <tr>
                    <td>{{ props.item.description }}</td>
                    <td>{{ props.item.reimbursed_value }}%</td>
                </tr>
            </template>
        </v-data-table>
    </v-card>
</template>


<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                insurances: [],
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
                
            }
        },

        methods: {

            getInsurances () {
                axios.get('http://localhost:3000/insurance').then((response) => {
                    this.insurances = response.data.data 
                })
            },


        },

        async created() {
            await this.getInsurances()
        }
    }
</script>

<style>
tbody tr:nth-of-type(odd) {
background-color: rgba(0, 0, 0, .05);
}
</style>
