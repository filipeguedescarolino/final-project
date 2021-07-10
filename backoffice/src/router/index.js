import Vue from 'vue'
import VueRouter from 'vue-router'
import WorkingHours from '../components/WorkingHours.vue'
import CheckAppointments from '../components/CheckAppointments.vue'
import MedicationsList from '../components/medications/List.vue'
import DoctorsList from '../components/doctors/List.vue'
import InsuranceList from '../components/insurances/List.vue'
import SpecializationList from '../components/specializations/List.vue'
import OfficeList from '../components/offices/List.vue'
import Graphs from '../components/graphs.vue'

// import Specializations from '../components/Specializations.vue'
// import HelloWorld from '../components/HelloWorld.vue'
// import PatientsList from '../components/PatientsList.vue'
Vue.use(VueRouter)

const routes = [
  

  {
    // componente carregado
    path: '/office-list',
    name: 'OfficeList',
    component: OfficeList
  },

  {
    // componente carregado
    path: '/graphs',
    name: 'Graphs',
    component: Graphs
  },


  {
    // componente carregado
    path: '/doctors-list',
    name: 'DoctorsList',
    component: DoctorsList
  },

  {
    // componente carregado
    path: '/medications-list',
    name: 'MedicationsList',
    component: MedicationsList
  },

  {
    // componente carregado
    path: '/insurance-list',
    name: 'InsuranceList',
    component: InsuranceList
  },

  {
    // componente carregado
    path: '/specialization-list',
    name: 'SpecializationList',
    component: SpecializationList
  },

  

  {
    // componente carregado
    path: '/working-hours',
    name: 'WorkingHours',
    component: WorkingHours
  },



  // {
  //   // componente carregado
  //   path: '/patients-list',
  //   name: 'PatientsList',
  //   component: PatientsList
  // },

  {
    // componente carregado
    path: '/appointments',
    name: 'CheckAppointments',
    component: CheckAppointments
  },

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
