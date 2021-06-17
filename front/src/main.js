import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'



import vuetify from '@/plugins/vuetify' // path to vuetify export

import axios from 'axios'
import VueAxios from 'vue-axios'

Vue.use(VueAxios, axios)

Vue.config.productionTip = false


  new Vue({
    router,
    store,
    vuetify,
    
    render: h => h(App),
  }).$mount('#app')





// new Vue({
//   router,
//   store,
//   vuetify,
//   render: h => h(App)
// }).$mount('#app')
