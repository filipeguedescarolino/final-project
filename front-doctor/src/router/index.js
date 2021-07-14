import Vue from 'vue'
import VueRouter from 'vue-router'
// import Homepage from '../components/Homepage.vue'

import Login from '../components/Login.vue'
import PatientList  from '../components/PatientList.vue'
import PersonalDetails  from '../components/personalDetails.vue'
import PrescriptionList  from '../components/prescription/List.vue'


import AppointmentsHistory from '../components/AppointmentsHistory.vue'



Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/patients/:id/:appointment_id',
    name: 'PersonalDetails',
    component: PersonalDetails
  },

  {
    // componente carregado
    path: '/prescription/:id/:appointment_id',
    name: 'PrescriptionList',
    component: PrescriptionList
  },

  {
    // componente carregado
    path: '/login',
    name: 'login',
    component: Login
  },


  

  {
    // componente carregado
    path: '/appointmentsHistory',
    name: 'appointmentsHistory',
    component: AppointmentsHistory
  },

  {
    // componente carregado
    path: '/patient-list',
    name: 'patientList',
    component: PatientList
  },


  // {
  //   // componente carregado
  //   path: '/patient-list',
  //   name: 'patientList',
  //   component: 
  // },




  



 

 

  
  

  // {
    // componente carregado quando é navegado para esta rota
    // path: '/patients/:patientId',
    // name: 'PatientDetails',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/PatientsDetails.vue')
  // },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router