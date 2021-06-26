const { validate } = require('indicative/validator')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const db = require('../../db')

module.exports = (req, res) => {
  validate(req.body, {
      username: 'required|email',
      password: 'required'
    }).then((value) => {
      db.query('SELECT * FROM patients WHERE email = ? AND status = "active"', [value.username], (error, results) => {
        
        if (results.length === 0) {
          res.status(400).send('Cannot find any account that matches the given email and password')
  
        } else {
          bcrypt.compare(value.password, results[0].password).then((match) => {
          console.log(value.password)
          console.log(results[0].password)
          debugger; // eslint-disable-line no-debugger
            
                console.log(match)
              if (results.length != 0) {
                const secret = 'B18fbWIyeU1utFA31mzGaVyzjyL9ZnfP'
                const data = { id: results[0].id }
                delete results[0].password // para não ter de ser preciso a row na BD
  
                // sign para criptografar um valor usando o secret
                const authToken = jwt.sign(data, secret) // will give me my token
  
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