<template>
  <v-card
    class="mx-auto overflow-hidden"
    height="100"
    width="2000"
  >
    <v-app-bar
      color="deep-purple"
      dark
    >
      <v-app-bar-nav-icon @click="drawer = true"><v-icon>mdi-account</v-icon></v-app-bar-nav-icon>
      
    <div style="display: flex; align-items: center; justify-content: space-around;">    
      <v-toolbar-title style="margin-right: 300px; margin-left: 150px;">Title</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">Title</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">Title</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">Title</v-toolbar-title>
    </div>
    </v-app-bar>

    <v-navigation-drawer
      v-model="drawer"
      absolute
      temporary
    >
      <v-list
        nav
        dense
      >
        <v-list-item-group
          v-model="group"
          active-class="deep-purple--text text--accent-4"
        >
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Log-in</v-list-item-title>
          </v-list-item>

          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Register</v-list-item-title>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </v-card>
</template>


<script>
  export default {
    data: () => ({
      drawer: true,
      group: null,
    }),
  }
</script>