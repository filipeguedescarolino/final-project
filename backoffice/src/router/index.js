import Vue from 'vue'
import VueRouter from 'vue-router'
import WorkingHours from '../components/WorkingHours.vue'
import CreateDoctor from '../components/CreateDoctor.vue'
import Specializations from '../components/Specializations.vue'
// import DoctorsList from '../components/DoctorsList.vue'
Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/working-hours',
    name: 'WorkingHours',
    component: WorkingHours
  },

  // {
  //   // componente carregado
  //   path: '/doctors-list',
  //   name: 'DoctorsList',
  //   component: CreateDoctor
  // },

  {
    // componente carregado
    path: '/create_doctor',
    name: 'CreateDoctor',
    component: CreateDoctor
  },

  {
    // componente carregado
    path: '/specializations',
    name: 'Specializations',
    component: Specializations
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
