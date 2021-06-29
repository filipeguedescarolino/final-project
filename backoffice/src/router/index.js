import Vue from 'vue'
import VueRouter from 'vue-router'
import Card from '../components/Card.vue'

Vue.use(VueRouter)

const routes = [
  {
    // componente carregado
    path: '/',
    name: 'card',
    component: Card
  },
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
