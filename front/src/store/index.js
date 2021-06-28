import Vue from "vue";
import Vuex from "vuex";


Vue.use(Vuex)

export default new Vuex.Store({
  state: {    
    user: null,
    token: null        
  },

  getters: {
    user: state => state.user,
    token: state  => state.user
  },

  mutations: {
    setUser(state, user) {
      state.user = user
       
    },
    setToken(state, token) {
      state.token = token
      localStorage.setItem('token', token)   
    }    
  },

  
  
  actions: {
    setUser ({ commit }, user) {
      commit('setUser', user)
  },
    setToken ({ commit }, token) {
      commit('setToken', token)
    },
  },
  modules: {
  }
})






