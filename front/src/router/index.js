import Vue from 'vue'
import VueRouter from 'vue-router'
// import Homepage from '../components/Homepage.vue'
import Home from '../views/Home.vue'
import Login from '../components/Login.vue'



Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/login',
    name: 'login',
    component: Login
  },

  
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  {
    // componente carregado quando é navegado para esta rota
    path: '/patients/:patientId',
    name: 'PatientDetails',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/PatientsDetails.vue')
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router