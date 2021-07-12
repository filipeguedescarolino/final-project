<template>
    
    <v-navigation-drawer
            v-model="drawer"

            app
            fixed
            dark
            color="#60BACD">

        
            
        <v-list-item>
            <v-list-item-avatar height="100" width="100">
                <v-img  src="https://cdn.vuetifyjs.com/images/john.png"> </v-img>
            </v-list-item-avatar>

            <h3> {{user.name}} </h3>

        </v-list-item>
        
            <v-divider></v-divider>


        <v-list
            
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

import {  mapActions, mapGetters } from 'vuex'
export default {

    

    data() {
            return {
                drawer: true ,  	
                items: [
                    {title: 'Your Patients-List', icon: 'fas fa-hospital', to: '/patient-list' },
                    { title: 'Schedule', icon: 'fas fa-list', to: '/appointmentsHistory' },
                    
                ],
                
                
            }
        },

    computed: {

        ...mapGetters([
        'user',
        'token'
        ]),


        
        

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

            

        Logout() {
            
            this.setUser(null)
            this.setToken(null)
            this.$router.push('/login').catch(()=>{});
        },

            
    },


        
}
</script>