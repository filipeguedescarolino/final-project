const auth = require('../middlewares/auth')
const bcrypt = require('bcrypt')
const patientsRouter = require('./internal/patients')
const doctorsRouter = require('./internal/doctors')
// const todosRouter = require('./internal/todos')

const login = require('./public/login')

module.exports = {
  register(app) {
    app.use('/patients', patientsRouter)
    app.use('/doctors', doctorsRouter)
    // app.use('/todos', auth, todosRouter)
    
    app.post('/login', login)
    app.get('/encrypt', async (req,res) =>{
      // receber 1 string e converter para hash
      let result = await bcrypt.hash('filasGay', 10)
      res.send(
        {
          unencrypted: 'filasGay', encrypted: result
        })
        // put da hash na pass do client.

    })
  }
}
