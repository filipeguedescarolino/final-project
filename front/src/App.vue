<template>
  <v-app id="app">
    
    <Navbar/>   
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
    
    
  }
};
</script>
