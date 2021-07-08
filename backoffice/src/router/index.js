import Vue from 'vue'
import VueRouter from 'vue-router'
// import WorkingHours from '../components/WorkingHours.vue'

import DoctorsList from '../components/doctors/List.vue'
import InsuranceList from '../components/insurances/List.vue'
// import Specializations from '../components/Specializations.vue'
// import HelloWorld from '../components/HelloWorld.vue'
// import PatientsList from '../components/PatientsList.vue'
Vue.use(VueRouter)

const routes = [
  

  {
    // componente carregado
    path: '/doctors-list',
    name: 'DoctorsList',
    component: DoctorsList
  },

  {
    // componente carregado
    path: '/insurance-list',
    name: 'InsuranceList',
    component: InsuranceList
  },

  

  // {
  //   // componente carregado
  //   path: '/teste',
  //   name: 'DoctorsShow',
  //   component: HelloWorld
  // },



  // {
  //   // componente carregado
  //   path: '/patients-list',
  //   name: 'PatientsList',
  //   component: PatientsList
  // },

  // {
  //   // componente carregado
  //   path: '/create_doctor',
  //   name: 'CreateDoctor',
  //   component: CreateDoctor
  // },

  // {
  //   // componente carregado
  //   path: '/specializations',
  //   name: 'Specializations',
  //   component: Specializations
  // },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
