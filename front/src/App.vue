<template>
  <v-app id="app">
    
    <Navbar/>
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




export default {
  name: 'App',

  components: {
    Homepage,
    Navbar,
    DatePicker,
    
    
  },

   data () {
        return {
        authenticated: true

      }
   }
};
</script>
