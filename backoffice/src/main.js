import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSweetalert2 from 'vue-sweetalert2';


import vuetify from '@/plugins/vuetify' // path to vuetify export

import axios from 'axios'
import VueAxios from 'vue-axios'
import 'sweetalert2/dist/sweetalert2.min.css';
Vue.use(VueSweetalert2);
Vue.use(VueAxios, axios)

Vue.config.productionTip = false


  new Vue({
    router,
    store,
    vuetify,
    
    render: h => h(App),
  }).$mount('#app')

