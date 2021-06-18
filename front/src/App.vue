<template>
  <v-app id="inspire">
    
      <v-navigation-drawer
      v-model="drawer"
      app
      absolute
      dark
      
    >

      <v-list-item class="px-2">
        <v-list-item-avatar>
          <v-img src="https://64.media.tumblr.com/89bc148ede0b273a79fc3599d1b9da4c/6c89bb77ae2c792e-3f/s1280x1920/142e8810788d75cc26e65d285e2882f63f64c484.jpg"></v-img>
        </v-list-item-avatar>

        <v-list-item-content>
          <v-list-item-title class="text-h6">
            Menu
          </v-list-item-title>

          <v-list-item-subtitle>
            My BooketList
          </v-list-item-subtitle>
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
          <v-divider></v-divider>
        </v-list-item>
      </v-list>
    </v-navigation-drawer>

    <v-app-bar app>
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
        drawer: true ,
        items: [
          { title: 'Dashboard', icon: 'mdi-ghost', to: '/' },
          { title: 'Book Preview', icon: 'mdi-book-open-page-variant-outline', to: 'book-preview' },
          { title: 'List', icon: 'mdi-bookshelf', to: 'list' }
        ],
        selectedItem: ''
        }
      } 
    
    }
</script>
