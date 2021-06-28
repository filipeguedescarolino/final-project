// import { response } from 'express'
// import Vue from 'vue'
// import Vuex from 'vuex'
// import { format } from '../../../server/db'
// import { post } from '../../../server/routes/internal/doctors'
// import login from '../../../server/routes/public/login'

// Vue.use(Vuex)

// export default new Vuex.Store({
//   state() {
//     return {
//       userId: null,
//       token: null
//     }
    
//   },
//   mutations: {
//   setUser(state, payload) {
//     state.token = payload.token;
//     state.userId = payload.userId;
    
//   }  
  
//   },
  
  
//   actions: {
//    login() {

//    },

  //  signup(context, payload) {
  //   fetch('https://....key=[API]', configuration)
  //   method: post,
  //   body: JSON.stringify({
  //     email: payload.email,
  //     password: payload.password,
  //     returnSecureToken: true
  //   })

  //  if e else response ok caso certto
    // context.commit('setUser', {
    //   token: response.data.idToken,
    //   userId: responseData.localId
    // } )
  //  }
//   },
//   modules: {
//   }
// })



// em baixo qd faz login, caso validações estejam certas:
// nos metodos::
// submitForm:

// this.$store.dispatch('signup', {
//   email: this.email,
//   password: this.password,

// }) -> action

