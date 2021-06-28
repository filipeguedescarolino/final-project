<template>
  <v-app id="inspire">
    
      <v-navigation-drawer
      v-model="drawer"
      app
      fixed
      dark
      color="#99D3DF"
      
    >

      <v-list-item class="px-2">
        <v-list-item-avatar>
         <v-icon>fas fa-lock</v-icon>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item class="text-h6 grey--text  text--lighten-5"
            :to="'/login'"
            @click="drawer = !drawer">
            Login / Name
          </v-list-item>

          <!-- <v-list-item-subtitle>
            My BooketList
          </v-list-item-subtitle> -->
        </v-list-item-content>
      </v-list-item>
        <!-- <button @click="store"> connect to $store.state.counter </button>
        <h1> {{$store.state.counter}} </h1> -->
      <v-divider></v-divider>

      <v-list
        dense
        nav
      >
        <v-list-item
          v-for="item in items"
          :key="item.title"
          :to="item.to"
          link
        >
          <v-list-item-icon>
            <v-icon>{{ item.icon }}</v-icon>
          </v-list-item-icon>

          <v-list-item-content>
            <v-list-item-title>{{ item.title }}</v-list-item-title>
          </v-list-item-content>

          
         
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app
    color="#88BBD6">
      <v-app-bar-nav-icon @click="drawer = !drawer" class=" white--text text--darken-2"> </v-app-bar-nav-icon>

      <v-toolbar-title   >
        
        <v-list-item   :to="'/about'"> 
          <span class=" white--text text--darken-2">  About us </span>
        </v-list-item>
        
      </v-toolbar-title>
      
      <v-toolbar-title   >
        <v-list-item  :to="'/profile'"> 
          <span class=" white--text text--darken-2 border-bottom">  Our specialists </span> 
        </v-list-item>
      </v-toolbar-title>

      <v-toolbar-title   >
        <v-list-item  :to="'/partnerships'"> 
          <span class=" white--text text--darken-2">  Partnerships </span>
        </v-list-item>
      </v-toolbar-title>

      <v-toolbar-title   >
        <v-list-item  :to="'/prices'"> 
          <span class=" white--text text--darken-2">  Prices </span>
        </v-list-item>
      </v-toolbar-title>
    </v-app-bar>

    <v-main>
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
  export default {
    data() {
      return {
        drawer: null ,
        items: [
          { title: 'Personal Details', icon: 'fas fa-search', to: '/personalDetails' },
          { title: 'History', icon: 'fas fa-list', to: '/appointmentsHistory' },
          { title: 'Appointment', icon: 'fas fa-edit', to: 'appointment' }
        ],
        selectedItem: ''
        }
      },

      computed: {
       
      },
      
      methods: {
        // algo como restore authentication. tenho de ir buscar o id. -> checkar isto para finalizar
      }
    
    }
</script>

<style scoped>



</style>
