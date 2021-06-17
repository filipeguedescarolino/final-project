// const auth = require('../middlewares/auth')

const patientsRouter = require('./internal/patients')
// const todosRouter = require('./internal/todos')

// const login = require('./public/login')

module.exports = {
  register(app) {
    app.use('/patients', patientsRouter)
    // app.use('/todos', auth, todosRouter)
    
    // app.post('/login', login)
  }
}
