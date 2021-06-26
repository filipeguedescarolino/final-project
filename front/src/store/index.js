import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    savedSingleUserConnections: {}
    
  },
  mutations: {
    saveSingleUserConnections: (state, connections) =>
       {state.savedSingleUserConnections = connections;}
  
  }
  
  ,
  actions: {
    // chamar  setUser()
  },
  modules: {
  }
})
