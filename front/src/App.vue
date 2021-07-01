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
                // drawer: null ,
                // items: [
                //     { title: 'Personal Details', icon: 'fas fa-search', to: '/personalDetails' },
                //     { title: 'History', icon: 'fas fa-list', to: '/appointmentsHistory' },
                //     { title: 'Appointment', icon: 'fas fa-edit', to: 'appointment' }
                // ],
                
                // patient: {},
            }
        },

        // computed: {

        //     ...mapGetters([
        //     'user',
        //     'token'
        //     ]),

        //     isLoggedIn() {
        //         if (this.user && this.token) {
        //             return true
        //         }
        //         return false
        //     }

            // localStorageToken() {
            //     if (localStorage && localStorage.token) {
            //         return localStorage.token
            //     }
            //     return null
            // },

            // localStorageUser() {
            //     if (localStorage && localStorage.user) {
            //         return JSON.parse(localStorage.user)
            //     }
            //     return null
            // }
        // },

        // methods: {

        //     ...mapActions([
        //     'setUser',
        //     'setToken'
        //     ]),

        //     getPatientDetails() {
        //         if (!this.isLoggedIn) {
        //         this.$router.push('/login')
        //         return
        //     }

        //         let userId = this.user.id

        //         axios.get(`http://localhost:3000/patients/${userId}`).then((response) => {
        //             this.patient = response.data.data 
        //         })
        //     },

        //     Logout() {
                
        //         this.setUser(null)
        //         this.setToken(null)
        //         this.$router.push('/login')
        //     },

        //     refresh() {
                
        //         if (localStorage && localStorage.token) {
        //             this.setUser(JSON.parse(localStorage.user))
        //             this.setToken(localStorage.token)
        //         }
        //         this.getPatientDetails()
        //     }
        // },

        // async created() {
        //     await this.getPatientDetails()
        //     this.refresh()
        // }

    }
</script>

<style scoped>



</style>
