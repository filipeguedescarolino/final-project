const router = require('express').Router()
const { validate } = require('indicative/validator')

const db = require('../../db')

router.get('/', (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(doctor_id) FROM doctors', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(doctor_id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM doctors LIMIT ?, ?', [offset, _limit], (error, results, _) => {
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

  db.query(`SELECT * FROM doctors WHERE doctor_id = ${id}`, (error, results) => {
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
    certificate_number: "required",
    name: "required",
    specialization_id: "required",
    date_of_birth: "required",
    address: "required",
    zip_code: "required",
    email: "required",
    cell_phone: "required",
    password: "required",
    status: "required",
    gender:"required",
    name: "required"
  }).then((value) => {
    db.query('INSERT INTO doctors SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }

      const { insertId } = results

      db.query('SELECT * FROM doctors WHERE doctor_id = ? LIMIT 1', [insertId], (error, results, _) => {
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

router.put('/:id', (req, res) => {
  const { id } = req.params
  const status = req.body

  validate(status, {
    status: 'required',
  }).then((value) => {
    db.query('UPDATE doctors SET ? WHERE doctor_id = ?', [value, id], (error, results, _) => {
      if (error) {
        throw error
      }

      db.query('SELECT * FROM doctors WHERE doctor_id = ? LIMIT 1', [id], (error, results, _) => {
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

  db.query('SELECT * FROM doctors WHERE doctor_id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    console.log(results)
    const [doctors] = results

    db.query('DELETE FROM doctors WHERE doctor_id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: doctors
      })
    })
  })
})

module.exports = router