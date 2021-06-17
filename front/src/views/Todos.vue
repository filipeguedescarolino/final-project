<template>
  <div class="container">
    <!-- <pre>
      {{JSON.stringify(todo)}}
    </pre> -->

    <div class="row mt-4">
      <div class="col-lg-12">
        <table class="table table-striped">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">ID do Utilizador</th>
              <th scope="col">Descrição</th>
              <th scope="col">Estado</th>
              <th scope="col">Criado a</th>
              <th scope="col">Actualizado a</th>
              <th></th>
            </tr>
          </thead>

          <tbody>
            <!-- To access to my user with value null only after we have a todo. Because my HTML runs first than my API -->
            <!-- What prevents me for getting error of null -->
            <!-- Super important -->
            <tr v-if="todo">
              <td class="align-middle">{{ todo.id }}</td>
              <td class="align-middle">{{ todo.user_id }}</td>
              <td class="align-middle">{{ todo.title }}</td>
              <td class="align-middle">
                <i
                  v-if="todo.completed"
                  class="fas fa-check text-success">
                </i>

                <i
                  v-else
                  class="fas fa-times text-danger">
                </i>
              </td>

              <td class="align-middle">{{ formatDate(todo.created_at) }}</td>
              <td class="align-middle">{{ formatDate(todo.updated_at) }}</td>

              <td class="align-middle">
                <button
                  @click="openEditTodoModal()"
                  type="button"
                  class="btn btn-outline-primary custom-button"
                  data-bs-toggle="modal"
                  data-bs-target="#todoModal">

                  <i
                    class="fas fa-pencil-alt">
                  </i>
                </button>

                <button
                  @click="removeTodo()"
                  type="button"
                  class="btn btn-outline-danger custom-button">

                  <i
                    class="fas fa-trash">
                  </i>
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>

      <div
        class="card"
        v-if="user">

        <div class="card-body">
          <div>
            <h3 class="mb-3">
              User Detail Information
            </h3>
          </div>

          <div>
            <b>User:</b> {{ user.id }} - {{ user.name }}

            <i :class="genderClass"></i>
          </div>

          <div>
            <b>Email:</b> {{ user.email }}
          </div>

          <div>
            <b>Criado a:</b> {{ formatDate(user.created_at) }}
          </div>


          <div>
            <b>Actualizado a:</b> {{ formatDate(user.updated_at) }}
          </div>

          <div>
            <b>Status:</b> <span :style="statusStyle">{{ user.status }}</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal -->
    <div
      class="modal fade"
      id="todoModal"
      tabindex="-1"
      aria-labelledby="todoModalLabel"
      aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5
              class="modal-title">
              TODO
            </h5>

            <button
              type="button"
              class="btn-close"
              data-bs-toggle="modal"
              data-bs-target="#todoModal"
              aria-label="Close">
            </button>
          </div>

          <div class="modal-body">
            <form v-if="todo">
              <div class="form-group mt-4">
                <label>ID do Utilizador</label>

                <input
                  v-model="editDetailTodo.userId"
                  type="text"
                  class="form-control"
                  placeholder="ID do Utilizador" />
              </div>

              <div class="form-group mt-4">
                <label>Descrição</label>

                <input
                  v-model="editDetailTodo.title"
                  type="text"
                  class="form-control"
                  placeholder="Descrição" />
              </div>

              <div class="form-check mt-4">
                <label>Realizada</label>

                <input
                  v-model="editDetailTodo.completed"
                  type="checkbox"
                  class="form-check-input" />
              </div>
            </form>
          </div>

          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-primary"
              data-bs-toggle="modal"
              data-bs-target="#todoModal"
              @click="editTodo()">
              Gravar
            </button>

            <button
              type="button"
              class="btn btn-secondary"
              data-bs-toggle="modal"
              data-bs-target="#todoModal">
              Fechar
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import moment from 'moment'

export default {
  name: 'TodoDetails',

  data () {
    return {
      id: this.$route.params.todoId,
      todo: null, // What we get from the server
      user: null, // What we get from the server about the user

      editDetailTodo: {
        userId: null,
        title: null,
        completed: false
      }
    }
  },

  computed: {
    genderClass () {
      if (!this.user) {
        return ''
      }

      if (this.user.gender === 'Female') {
        return 'fas fa-female'
      } else {

        return 'fas fa-male'
      }
    },

    statusStyle () {
      if (!this.user) {
        return ''
      }

      let styleObject = {
        'font-weight': '600'
      }

      if (this.user.status === 'Active') {
        styleObject.color = '#3ab73a'

      } else if (this.user.status === 'Inactive') {
        styleObject.color = '#d4c8c8'

      } else {
        styleObject = styleObject.color = '#ff4040'
      }

      return styleObject
    }
  },

  methods: {
    getTodo () {
      this.axios.get('https://gorest.co.in/public-api/todos/' + this.id).then((response) => {

        if (response.data.code !== 200) {
          alert('Erro ao carregar a tarefa!')
          return
        }

        this.todo = response.data.data // get the answer from our API and replace the null value into the todo info
        this.getUser(response.data.data.user_id) // Its only 'draw' after I get my todo first. What the server give us about the user info
      })
    },

    getUser (userId) {
      this.axios.get('https://gorest.co.in/public-api/users/' + userId).then((response) => {
        if (response.data.code !== 200) {
          alert('Erro ao carregar detalhes do utilizador!')
          return
        }

        this.user = response.data.data
      })
    },

    formatDate (date) {
      if (!date) {
        return
      }

      var splitedDate = date.split('.')[0]

      return moment(splitedDate, 'YYYY-MM-DDTHH:mm:ss').format('DD/MM/YYYY HH:mm:ss') // O formato da data que a API trás e o formato que quero
    },

    editTodo () {
      let apiTodo = {
        user_id: this.editDetailTodo.userId,
        title: this.editDetailTodo.title,
        completed: this.editDetailTodo.completed
      }

      let headers = {
        headers: {
          Authorization: 'Bearer 19cba85ee0aae784b1ebd27da60e9fda8750deaa140b5da0411cbcefc2f2a2c3'
        }
      }

      this.axios.put(
        'https://gorest.co.in/public-api/todos/' + this.id,
        apiTodo,
        headers
      ).then((response) => {
        if (response.data.code === 200) {
          this.getTodo()

        } else {
          alert('Erro ao editar a tarefa!')
        }
      })
    },

    openEditTodoModal() {
      this.editDetailTodo.userId = this.todo.user_id
      this.editDetailTodo.title = this.todo.title,
      this.editDetailTodo.completed = this.todo.completed
    },

    removeTodo () {
      // don't need to pass an argument because I have scope using this.id that we get from our route/URL

      this.axios.delete('https://gorest.co.in/public-api/todos/' + this.id,
      {
        headers: {
          Authorization: 'Bearer 19cba85ee0aae784b1ebd27da60e9fda8750deaa140b5da0411cbcefc2f2a2c3'
        }
      }).then((response) => {
        if (response.data.code === 204) {
          this.$router.push({ name: 'Todos' }) // to redirect after delete successfully

        } else {
          alert(response.data.data.message)
        }
      })
    }
  },

  created () {
    this.getTodo()

    // com o id do user devolvido do pedido getTodo, vamos buscar mais informação do utilizador
  }
}
</script>

<style>
  .pagination {
    justify-content: center;
  }

  .disabled {
    color: currentColor;
    cursor: not-allowed;
    opacity: 0.5;
    text-decoration: none;
  }

  .custom-button {
    border-radius: 50%;
    margin-right: 5px;
  }
</style>