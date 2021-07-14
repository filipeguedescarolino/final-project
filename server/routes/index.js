const auth = require('../middlewares/auth')
const bcrypt = require('bcrypt')
const medicationsRouter = require('./internal/medications')
const patientsRouter = require('./internal/patients')
const doctorsRouter = require('./internal/doctors')
const specializationsRouter = require('./internal/specializations')
const workingHours = require('./internal/workingHours')
const insuranceRouter = require('./internal/insurance')
const timeSlots = require('./internal/timeSlots')
const appointments = require('./internal/appointments')
const pivotDoctorSpecialization = require('./internal/pivot_doctor_specialization')
const clinicalOffices = require('./internal/clinical_offices')
const authorization = require('./internal/restore_auth')
const adminsRouter = require('./internal/admins')
const prescriptionRouter = require('./internal/prescription')

// const todosRouter = require('./internal/todos')

const login = require('./public/login')
// auth('doctors'), 
// auth('patients'), 

module.exports = {
  register(app) {
    app.use('/admins',  adminsRouter)
    app.use('/prescription',  prescriptionRouter)
    app.use('/patients', patientsRouter)
    app.use('/medications',  medicationsRouter)
    app.use('/doctors',  doctorsRouter)
    app.use('/specializations',  specializationsRouter)
    app.use('/insurance',  insuranceRouter)
    app.use('/workingHours', workingHours)
    app.use('/timeSlots', timeSlots)
    app.use('/appointments',  appointments)
    app.use('/pivot_doctor_specialization',  pivotDoctorSpecialization)
    app.use('/clinical_offices', clinicalOffices)
    app.use('/restore-auth', authorization )
    
    
    app.post('/patients-login', login)
    
    app.post('/doctors-login', login)
    app.post('/admins-login', login)
    // app.post('/backoffice-login', loginPatient)
    
  }
}
