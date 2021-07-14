const router = require('express').Router()
const { validate } = require('indicative/validator')
const bcrypt = require('bcrypt')

const db = require('../../db')

function removePasswordProperty(object) {
  delete object.password
}

router.get('/',  (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(id) FROM patients', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM patients LIMIT ?, ?', [offset, _limit], (error, results, _) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: {
          pagination: {
            total: total,
            pages: pageCount,
            page: _page,
            limit: _limit
          }
        },
        data: results
      })
    })
  })
})

router.get('/:id', (req, res) => {
  const { id } = req.params
  

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







router.post('/', (req, res) => {
  const patient = req.body

  validate(patient, {
    name: "required",
    birthdate: "required|date",
    address: "required",
    zip_code: "required",
    email: "required",
    mobile_phone: "required",
    sns: "required",
    nif: "required",
    password: "required",
    gender: "required",
  }).then((value) => {

    bcrypt.hash(value.password, 10).then((hash) => {
    value.password = hash
    
    
    db.query('INSERT INTO patients SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }

      const { insertId } = results

      db.query('SELECT * FROM patients WHERE id = ? LIMIT 1', [insertId], (error, results, _) => {
        if (error) {
          throw error
        }

        removePasswordProperty(results[0])

        res.send({
          code: 200,
          meta: null,
          data: results[0]
        })
      })
    })
  }).catch((error) => {
    res.status(400).send(error)
  })})
})

router.put('/:id', (req, res) => {
  const { id } = req.params
  const patient = req.body

  

  validate(patient, {
    name: "required",
    birthdate: "required|date",
    address: "required",
    zip_code: "required",
    email: "required",
    mobile_phone: "required",
    sns: "required",
    nif: "required",
    password: "required",
    gender: "required",
  }).then((value) => {
    db.query('UPDATE patients SET ? WHERE id = ?', [value, id], (error, results, _) => {
      if (error) {
        throw error
      }

      db.query('SELECT * FROM patients WHERE id = ? LIMIT 1', [id], (error, results, _) => {
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
  }).catch((error) => {
    res.status(400).send(error)
  })
})

// router.patch('/:id/completed', (req, res) => {
//   const { id } = req.params

//   const data = req.body

//   validate(data, {
//     completed: 'boolean',
//   }).then((value) => {
//     db.query(`UPDATE todos SET completed = ${value.completed} WHERE id = ${id}`, (error, results, _) => {
//       if (error) {
//         throw error
//       }

//       res.send(value.completed)
//     })
//   }).catch((error) => {
//     res.status(400).send(error)
//   })
// })

router.delete('/:id', (req, res) => {
  const { id } = req.params

  db.query('SELECT * FROM patients WHERE id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    
    const [patients] = results

    db.query('DELETE FROM patients WHERE id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: patients
      })
    })
  })
})

module.exports = router
