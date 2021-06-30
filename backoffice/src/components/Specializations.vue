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
                    <td>{{ props.item.id }}</td>
                    <td>{{ props.item.description }}%</td>
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
                specializations: [],
                search: '',
                headers: [
                    {
                        text: 'Id',
                        align: 'start',
                        sortable: false,
                        value: 'id',
                    },
                { text: 'Description', value: 'description' },

                ],
                
            }
        },

        methods: {

            getInsurances () {
                axios.get('http://localhost:3000/specializations').then((response) => {
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
