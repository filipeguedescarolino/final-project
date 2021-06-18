<template>
  <v-app id="app">
    <router-link to="/home">What we do</router-link>
    <Navbar/>
    <login />
    <h1 class="text-center">
      Client Registration
    </h1>
    <Homepage/>
    <DatePicker/>

  </v-app>
  
  
</template>

<script>
import Homepage from "./components/Homepage.vue"
import Navbar from "./components/Navbar.vue"
import DatePicker from "./components/DatePicker.vue"
import Login  from "./components/Login.vue"




export default {
  name: 'App',

  components: {
    Homepage,
    Navbar,
    DatePicker,
    Login
    
    
  },

   data () {
        return {
        

      }
   }
};
</script>
