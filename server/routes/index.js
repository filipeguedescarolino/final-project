const auth = require('../middlewares/auth')
const bcrypt = require('bcrypt')
const patientsRouter = require('./internal/patients')
const doctorsRouter = require('./internal/doctors')
const specializationsRouter = require('./internal/specializations')
const workingHours = require('./internal/workingHours')
const insuranceRouter = require('./internal/insurance')
const timeSlots = require('./internal/timeSlots')
const appointments = require('./internal/appointments')
// const todosRouter = require('./internal/todos')

const login = require('./public/login')

module.exports = {
  register(app) {
    app.use('/patients', patientsRouter)
    app.use('/doctors', doctorsRouter)
    app.use('/specializations', specializationsRouter)
    app.use('/insurance', insuranceRouter)
    app.use('/workingHours', workingHours)
    app.use('/timeSlots', timeSlots)
    app.use('/appointments', appointments)
    // app.use('/todos', auth, todosRouter)
    
    app.post('/login', login)
    
  }
}
