import Vue from 'vue'
import VueRouter from 'vue-router'
// import Homepage from '../components/Homepage.vue'
import Home from '../views/Home.vue'
import Login from '../components/Login.vue'
import medics from '../components/medics.vue'
import Prices from  '../components/Prices.vue'
import Profile from '../components/Profile.vue'
import About from '../components/About.vue'
import MakeAppointment from '../components/MakeAppointment.vue'



Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/login',
    name: 'login',
    component: Login
  },

  {
    // componente carregado
    path: '/appointment',
    name: 'appointment',
    component: MakeAppointment
  },

  {
    // componente carregado
    path: '/Profile',
    name: 'profile',
    component: Profile
  },

  {
    // componente carregado
    path: '/prices',
    name: 'prices',
    component: Prices
  },
  {
    path: '/about',
    name: 'about',
    component: About
  },
  
  {
    path: '/home',
    name: 'home',
    component: Home
  },
  {
    path: '/specialists',
    name: 'specialists',
    component: medics
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