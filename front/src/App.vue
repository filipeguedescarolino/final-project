<template>
  <v-app id="inspire">
    
      <v-navigation-drawer
      v-model="drawer"
      app
      fixed
      dark
      class="blue lighten-1"
      
    >

      <v-list-item class="px-2">
        <v-list-item-avatar>
         <v-icon>person</v-icon>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item class="text-h6"
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
    class="blue lighten-1">
      <v-app-bar-nav-icon @click="drawer = !drawer"></v-app-bar-nav-icon>

      <v-toolbar-title>Application</v-toolbar-title>
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
