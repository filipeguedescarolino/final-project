const router = require('express').Router()
const { validate } = require('indicative/validator')
const jwt = require('jsonwebtoken')

const db = require('../../db')



router.get('/', (req, res) => {
    console.log('gogo')
    const authorization = req.header('Authorization')
    const secret = 'B18fbWIyeU1utFA31mzGaVyzjyL9ZnfP'
  
    const { id } = jwt.verify(authorization, secret)
  
  
    db.query(`SELECT * FROM patients WHERE id = ${id}`, (error, results) => {
      if (error) {
        throw error
      }
  
      res.send({
        code: 200,
        meta: null,
        data: results[0]
      })
    })
  })


  module.exports = router