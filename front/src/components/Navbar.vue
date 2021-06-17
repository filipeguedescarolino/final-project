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
      <v-app-bar-nav-icon @click="drawer = true"><v-avatar color="indigo">
      <v-icon dark 
      >
        mdi-account-circle
      </v-icon>
      
    </v-avatar> <span style="margin-left: 10px;" v-if="authenticated"> {{patient.name}}  </span></v-app-bar-nav-icon>
      
    <div style="display: flex; align-items: center; justify-content: space-around;">    
      <v-toolbar-title style="margin-right: 300px; margin-left: 150px;">Who are we</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">What we do</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">Our Team</v-toolbar-title>
      <v-toolbar-title style="margin-right: 300px;">Appointment</v-toolbar-title>
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
          <v-list-item v-if="!authenticated" >
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Log-in</v-list-item-title>
          </v-list-item>

          <v-list-item v-if="!authenticated">
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Register</v-list-item-title>
          </v-list-item>
        </v-list-item-group>
          
          <v-list-item v-if="authenticated" >
            
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>History</v-list-item-title>
          </v-list-item>

          <v-list-item v-if="authenticated" >
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Appointment</v-list-item-title>
          </v-list-item>

          
        
      </v-list>
    </v-navigation-drawer>
  </v-card>
</template>


<script>
  export default {
    data: () => ({
      drawer: true,
      group: null,
      authenticated: true,
      patient: {
        "name": "Filipe" 
      }
    }),
  }
</script>