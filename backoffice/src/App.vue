<template>
  <!-- App.vue -->

    <v-app>
        <v-navigation-drawer app permanent>

            <v-list-item>
                <v-list-item-content>
                    <v-list-item-title class="text-h6">
                        Doctor
                    </v-list-item-title>
                    <v-list-item-subtitle>
                        application
                    </v-list-item-subtitle>
                </v-list-item-content>
            </v-list-item>

            <v-divider></v-divider>

            <v-list
                dense
                nav>
            
                <v-list-item
                    :to="item.to"
                    v-for="item in items"
                    :key="item.title"
                    link>
                
                    <v-list-item-icon>
                        <v-icon>{{ item.icon }}</v-icon>
                    </v-list-item-icon>

                    <v-list-item-content>
                        <v-list-item-title>{{ item.title }}</v-list-item-title>
                    </v-list-item-content>
                </v-list-item>
            </v-list>

        </v-navigation-drawer>

    
        <v-main>

        <!-- Provides the application the proper gutter -->
            <v-container fluid>

        <!-- If using vue-router -->
                <router-view></router-view>
            </v-container>
        </v-main>

        <v-footer app
            color="primary lighten-1"
            padless
            center>
        
            <v-row
                justify="center"
                no-gutters>
        

                <v-col
                    class="primary lighten-2 py-4 text-center white--text"
                    cols="12">
                
                    {{ new Date().getFullYear() }} — <strong>Vuetify</strong>
                </v-col>
            </v-row>

        </v-footer>
    </v-app>
</template>

<script>
    export default {
        data () {
            return {
                drawer: true,
                items: [
                { title: 'Create Doctor', to: '/create_doctor' },
                { title: 'Working period', to: 'working-hours' },
                { title: 'Specialties', to: 'specialties' },
                { title: 'Prices', to: 'prices' },
                { title: 'Income Doctors', to: 'incomedoctor' },
                { title: 'Income Patients', to: 'incomepatients' },
                ],
            }
        },
    }   
</script>

<style>
    #app {
    font-family: Avenir, Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
    }

    #nav {
    padding: 30px;
    }

    #nav a {
    font-weight: bold;
    color: #2c3e50;
    }

    #nav a.router-link-exact-active {
    color: #42b983;
    }
</style>
