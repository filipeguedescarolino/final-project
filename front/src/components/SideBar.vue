<template>
    
    <v-navigation-drawer
            v-model="drawer"
            app
            fixed
            dark
            color="#99D3DF">

        <v-list-item class="px-2"
            v-if="!isLoggedIn">

            <v-list-item-avatar>
                <v-icon>fas fa-lock</v-icon>
            </v-list-item-avatar>

            <v-list-item-content>
                <v-list-item class="text-h6 grey--text  text--lighten-5"
                    :to="'/login'"
                    @click="drawer = !drawer">
                    Login 
                </v-list-item>
            </v-list-item-content>
        </v-list-item>
            
        <v-list-item v-else>
            <v-list-item-avatar>
                <v-img :src="patient.image"> </v-img>
            </v-list-item-avatar>

            <h1> {{patient.name}} </h1>

        </v-list-item>
        
            <v-divider></v-divider>


        <v-list
            v-if="isLoggedIn"
            dense
            nav>
            
            <v-list-item
                v-for="item in items"
                :key="item.title"
                :to="item.to"
                link>
        
                <v-list-item-icon>
                    <v-icon>{{ item.icon }}</v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                    <v-list-item-title>{{ item.title }}</v-list-item-title>
                </v-list-item-content>



            </v-list-item>

            <v-list-item link @click="Logout()">
                <v-list-item-icon>
                    <v-icon>fas fa-home</v-icon>
                </v-list-item-icon>

                <v-list-item-content>
                    <v-list-item-title> Logout </v-list-item-title>
                </v-list-item-content>
            </v-list-item>
        </v-list>
    </v-navigation-drawer>

</template>

<script>
import axios from 'axios'
import {  mapActions, mapGetters } from 'vuex'
export default {

    

    data() {
            return {
                drawer: null ,
                items: [
                    { title: 'Personal Details', icon: 'fas fa-search', to: '/personalDetails' },
                    { title: 'History', icon: 'fas fa-list', to: '/appointmentsHistory' },
                    { title: 'Appointment', icon: 'fas fa-edit', to: 'appointment' }
                ],
                
                patient: {},
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
    },


    methods: {

            ...mapActions([
            'setUser',
            'setToken'
            ]),

            getPatientDetails() {
                if (!this.isLoggedIn) {
                this.$router.push('/login')
                return
            }

                let userId = this.user.id

                axios.get(`http://localhost:3000/patients/${userId}`).then((response) => {
                    this.patient = response.data.data 
                })
            },

            Logout() {
                
                this.setUser(null)
                this.setToken(null)
                this.$router.push('/login')
            },

            refresh() {
                
                if (localStorage && localStorage.token) {
                    this.setUser(JSON.parse(localStorage.user))
                    this.setToken(localStorage.token)
                }
                this.getPatientDetails()
            }
        },


        async created() {
            await this.getPatientDetails()
            this.refresh()
        }
}
</script>