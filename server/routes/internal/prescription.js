const router = require('express').Router()
const { validate } = require('indicative/validator')

const db = require('../../db')

router.get('/', (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(id) FROM prescription', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM prescription LIMIT ?, ?', [offset, _limit], (error, results, _) => {
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

router.get('/patient/:id/doctor/:doc', (req, res) => {

    
  const { id, doc } = req.params
    console.log(req.params)
  db.query(`SELECT p.id, p.id_doctor, p.id_patient, p.id_medication, p.observation, p.id_appointment, m.description as nameMedication, m.observations as observationMedication, pa.name as namePatient, pa.email as email, a.day, a.hour  
  FROM prescription p
  join patients pa on (pa.id = p.id_patient)
  join medication m on (m.id = p.id_medication)
  join appointments a on (a.id = p.id_appointment)
WHERE p.id_patient = ${id} AND p.id_doctor = ${doc}`, (error, results) => {
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
  const prescription = req.body

  validate(prescription, {
    observation: "required",
    id_doctor: "required",
    id_patient: "required",
    id_medication: "required",
    id_appointment: "required"
  }).then((value) => {
    db.query('INSERT INTO prescription SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }

      const { insertId } = results

      db.query('SELECT * FROM prescription WHERE id = ? LIMIT 1', [insertId], (error, results, _) => {
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

// router.put('/:id', (req, res) => {
//   const { id } = req.params
//   const prescription = req.body

//   validate(prescription, {
//     description: 'required',
//     reimbursed_value: 'required',
//   }).then((value) => {
//     db.query('UPDATE prescription SET ? WHERE id = ?', [value, id], (error, results, _) => {
//       if (error) {
//         throw error
//       }

//       db.query('SELECT * FROM prescription WHERE id = ? LIMIT 1', [id], (error, results, _) => {
//         if (error) {
//           throw error
//         }

//         res.send({
//           code: 200,
//           meta: null,
//           data: results[0]
//         })
//       })
//     })
//   }).catch((error) => {
//     res.status(400).send(error)
//   })
// })

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

  db.query('SELECT * FROM prescription WHERE id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    console.log(results)
    const [prescription] = results

    db.query('DELETE FROM prescription WHERE id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: prescription
      })
    })
  })
})

module.exports = router
