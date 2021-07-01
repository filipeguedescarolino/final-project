<template>
    <v-app-bar app
        color="#88BBD6">

        <v-app-bar-nav-icon @click="toggle = !toggle" class=" white--text text--darken-2"> </v-app-bar-nav-icon>

        <v-toolbar-title>
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
</template>


<script>
export default {
    data() {
        return {
            toggle: null
        }
    }
   
}
</script>