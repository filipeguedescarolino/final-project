<template>
  <div class="pa-0 m-0"> 
    <v-card hover class="mx-auto pa-2 mt-2 mb-2" v-for="specialization in specializations" :key="specialization.id">
    <v-card-title class="justify-center">{{specialization.description}}</v-card-title>
    <v-card-text class="justify-space-around"> Base_price: <span class="text-lg-h6"> {{specialization.base_price}} </span>  </v-card-text>
    </v-card>
    <!-- <v-card-subtitle style="justify-content: flex-start;">Learn Web Development In Chunks</v-card-subtitle> -->
  </div>
</template>

<script>
    import axios from 'axios'

    export default {
        data () {
            return {
                specializations: [],
                
                   
                
            }
        },

        methods: {

            getSpecializations () {
                axios.get('http://localhost:3000/specializations').then((response) => {
                    this.specializations = response.data.data 
                })
            },

            // getspecializationSpecializations () {
            //     axios.get('http://localhost:3000/specializations').then((response) => {
            //         this.specializations = response.data.data 
            //     })
            // },
        },

        async created() {
            await this.getSpecializations()
        }
    }
</script>

<style>