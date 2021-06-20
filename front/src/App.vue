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
         <v-icon>person</v-icon>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item class="text-h6 grey--text  text--lighten-5"
            :to="'/login'"
            @click="drawer = !drawer">
            Login
          </v-list-item>

          <!-- <v-list-item-subtitle>
            My BooketList
          </v-list-item-subtitle> -->
        </v-list-item-content>
      </v-list-item>

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
      <v-app-bar-nav-icon @click="drawer = !drawer" ></v-app-bar-nav-icon>

      <v-toolbar-title  style="margin-left: 140px;" >
        
        <v-list-item   :to="'/about'"> 
          <span class=" white--text text--darken-2">  About us </span>
        </v-list-item>
        
      </v-toolbar-title>
      
      <v-toolbar-title   style="margin-left: 140px;">
        <v-list-item  :to="'/specialists'"> 
          <span class=" white--text text--darken-2">  Our specialists </span> 
        </v-list-item>
      </v-toolbar-title>

      <v-toolbar-title  style="margin-left: 140px;" :to="'/appointment'">
        <v-list-item  :to="'/about'"> 
          <span class=" white--text text--darken-2">  Appointment </span>
        </v-list-item>
      </v-toolbar-title>

      <v-toolbar-title  style="margin-left: 140px;" >
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
          { title: 'My appointments', icon: 'home', to: '/appointments' },
          { title: 'Book Preview', icon: 'mdi-book-open-page-variant-outline', to: 'book-preview' },
          { title: 'List', icon: 'mdi-bookshelf', to: 'list' }
        ],
        selectedItem: ''
        }
      } 
    
    }
</script>
