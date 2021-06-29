const { validate } = require('indicative/validator')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const db = require('../../db')

module.exports = (req, res) => {
  console.log('AQUI')
  console.log(req.route.path)
  console.log('AQUI')
  validate(req.body, {
      username: 'required|email',
      password: 'required'
    }).then((value) => {
      let query = ''

      if (req.route.path === '/doctors-login') {
        query = 'SELECT * FROM patients WHERE email = ? AND status = "active"'
      } else if (req.route.path === '/patients-login') {
        query = 'SELECT * FROM patients WHERE email = ? AND status = "active"'
      } else  {
        query = 'SELECT * FROM patients WHERE email = ? AND status = "active"'
      }

      
      db.query(query, [value.username], (error, results) => {
        
        if (results.length === 0) {
          res.status(400).send('Cannot find any account that matches the given email and password')
  
        } else {
          bcrypt.compare(value.password, results[0].password).then((match) => {
          
          debugger; // eslint-disable-line no-debugger
            
               
              if (results.length != 0) {
                const secret = 'B18fbWIyeU1utFA31mzGaVyzjyL9ZnfP'
                const data = { id: results[0].id }
                delete results[0].password // para não ter de ser preciso a row na BD
  
                // sign para criptografar um valor usando o secret
                const authToken = jwt.sign(data, secret, { expiresIn: '48h' }) // will give me my token
  
                res.send({
                  patient: results[0],
                  token: authToken
                })
  
              } else {
                res.status(400).send('Cannot find any account that matchesss2 the given email and password')
              }
            }).catch((error) => { throw error })
        }
      })
    }).catch((error) => res.status(400).send(error))
  }