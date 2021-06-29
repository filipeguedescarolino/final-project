import Vue from 'vue'
import VueRouter from 'vue-router'
import WorkingHours from '../components/WorkingHours.vue'
import CreateDoctor from '../components/CreateDoctor.vue'

Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/working-hours',
    name: 'WorkingHours',
    component: WorkingHours
  },

  {
    // componente carregado
    path: '/create_doctor',
    name: 'CreateDoctor',
    component: CreateDoctor
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
