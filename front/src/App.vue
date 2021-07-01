<template>
    <v-app id="inspire">

        
        <side-bar > </side-bar>
        <top-bar> </top-bar>
        

        <v-main>
            <router-view></router-view>
        </v-main>
    </v-app>
</template>


// // validar se tenho token e user na localstorage. se sim -> chamar getters e actions vuex. 
<script>
    import SideBar from '../src/components/SideBar.vue'
    import TopBar from '../src/components/TopBar.vue'

    // import { mapActions, mapGetters } from 'vuex'
    // import axios from 'axios'
    export default {

        components: {
            SideBar,
            TopBar           
        },

        props: {
            drawer: Boolean,
            itens: Array,
            patient: Object,
            toggle: Boolean
        },

        data() {
            return {
                
            }
        },

        

    }
</script>

<style scoped>



</style>
