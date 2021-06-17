import Vue from 'vue'
import VueRouter from 'vue-router'
import Movies from '../components/Movies.vue'

Vue.use(VueRouter)

const routes = [
  {
    // componente carregado por todo
    path: '/',
    name: 'Movies',
    component: Movies
  },
  {
    // componente carregado quando é navegado para esta rota
    path: '/todos',
    name: 'Todos',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/Todos.vue')
  },
  {
    // componente carregado quando é navegado para esta rota
    path: '/todos/:todoId',
    name: 'TodoDetails',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/TodoDetails.vue')
  },

]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router