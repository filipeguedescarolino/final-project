const router = require('express').Router()
const { validate } = require('indicative/validator')

const db = require('../../db')

router.get('/', (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(id) FROM pivot_doctor_specialization', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM pivot_doctor_specialization LIMIT ?, ?', [offset, _limit], (error, results, _) => {
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

router.get('/specialization/:id', (req, res) => {
  const { id } = req.params
  db.query(`SELECT p.id_specialization, p.id_doctor, d.name, s.description 
    FROM pivot_doctor_specialization p join doctors d
    on (d.id = p.id_doctor)
    join specializations s on (s.id = p.id_specialization)
    WHERE s.id = ${id}`, (error, results) => {
    if (error) {
      throw error
    }

    res.send({
      code: 200,
      meta: null,
      data: results
    })
  })
})

router.get('/doctor/:id', (req, res) => {
  const { id } = req.params
  db.query(`SELECT p.id_specialization, p.id_doctor, d.name, s.description 
    FROM pivot_doctor_specialization p join doctors d
    on (d.id = p.id_doctor)
    join specializations s on (s.id = p.id_specialization)
    WHERE d.id = ${id}`, (error, results) => {
    if (error) {
      throw error
    }

    res.send({
      code: 200,
      meta: null,
      data: results
    })
  })
})



router.post('/', (req, res) => {
  const pivotDoctorSpecialization = req.body

  validate(pivotDoctorSpecialization, {
    id_specialization: "required",
    id_doctor: "required",
    
    
    
  }).then((value) => {
    db.query('INSERT INTO pivot_doctor_specialization SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }

      const { insertId } = results

      db.query('SELECT * FROM pivot_doctor_specialization WHERE id = ? LIMIT 1', [insertId], (error, results, _) => {
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
    db.query('UPDATE pivot_doctor_specialization SET ? WHERE id = ?', [value, id], (error, results, _) => {
      if (error) {
        throw error
      }

      db.query('SELECT * FROM pivot_doctor_specialization WHERE id = ? LIMIT 1', [id], (error, results, _) => {
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

  db.query('SELECT * FROM pivot_doctor_specialization WHERE id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    console.log(results)
    const [pivotDoctorSpecialization] = results

    db.query('DELETE FROM pivot_doctor_specialization WHERE id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: pivotDoctorSpecialization
      })
    })
  })
})

module.exports = router
