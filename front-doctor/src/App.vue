<template>
    <v-app id="inspire">
        

        
        <side-bar v-if="isLoggedIn"> </side-bar>
        <!-- <top-bar v-if="isLoggedIn"> </top-bar> -->
        

        <v-main>
            <router-view></router-view>
        </v-main>
    </v-app>
</template>


// // validar se tenho token e user na localstorage. se sim -> chamar getters e actions vuex. 
<script>
    import SideBar from '../src/components/SideBar.vue'
    // import TopBar from '../src/components/TopBar.vue'
    import {  mapActions, mapGetters } from 'vuex'
    
    // import { mapActions, mapGetters } from 'vuex'
    import axios from 'axios'
    export default {

        components: {
            SideBar,
            // TopBar           
        },

        props: {
            drawer: Boolean,
            itens: Array,
            patient: Object,
            toggle: Boolean
        },

        data() {
            return {
               loading: false 
            }
        },

        computed: {

        ...mapGetters([
        'user',
        'token'
        ]),

        isLoggedIn() {
            
            if (this.user && this.token) {
                return true
            }
            return false
        }
    },

    methods: {
        ...mapActions([
            'setUser',
            'setToken'
        ]),

        restoreAuth() {
            this.loading = true
            axios.get(`http://localhost:3000/restore-auth`).then((response) => {
                
                this.setUser(response.data.data)
                this.loading = false
            })
            
        },

        refresh() {
            
            if (localStorage && localStorage.token) {
                this.setToken(localStorage.token)
                this.restoreAuth()
            } else {
                this.$router.push('/login').catch(()=>{});
            }
            
            
        }
    },

    created() {
        this.refresh()
        
    }

    }
</script>

<style scoped>



</style>
