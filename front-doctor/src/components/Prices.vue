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
        :items="specializations"

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
                    <td>{{ props.item.base_price }}€</td>
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
                    text: 'Specialization',
                    align: 'start',
                    sortable: false,
                    value: 'name',
                    },
                    { text: 'Base Price', value: 'Price' },
                ],
            }
        },

        computed: {

        },

        methods: {

            getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
            },


        },

        async created() {
            await this.getSpecializations()
        }
    }

</script>

<style>
    tbody tr:nth-of-type(odd) {
        background-color: rgba(0, 0, 0, .05);
    }
</style>