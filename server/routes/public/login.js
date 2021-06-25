const { validate } = require('indicative/validator')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const db = require('../../db')

module.exports = (req, res) => { validate(req.body,
    {
      email: 'required|email',
      password: 'required'
    }).then((value) => {
      db.query('SELECT * FROM patients WHERE email = ? AND password = ?', [value.email, value.password], (error, results) => {
        
        if (results.length === 0) {
          res.status(400).send('Cannot find any account that matches the given email and password')
  
        } else {
          bcrypt.compare(value.password, results[0].password).then((match) => {
          console.log(value.password)
          console.log(results[0].password)
            
                console.log(match)
            //   if (match) {
                const secret = "123456"
  
                delete results[0].password // para não ter de ser preciso a row na BD
  
                // sign para criptografar um valor usando o secret
                const token = jwt.sign({id: results[0].id}, secret) // will give me my token
  
                res.send(token)
  
            //   } else {
            //     res.status(400).send('Cannot find any account that matchesss the given email and password')
            //   }
            }).catch((error) => { throw error })
        }
      })
    }).catch((error) => res.status(400).send(error))
  }