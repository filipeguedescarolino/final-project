const router = require('express').Router()
const { validate } = require('indicative/validator')

const db = require('../../db')

router.get('/', (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(id) FROM appointments', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM appointments LIMIT ?, ?', [offset, _limit], (error, results, _) => {
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

  db.query(`SELECT * FROM appointments WHERE id_patient = ${id}`, (error, results) => {
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


router.get('/day/:day', (req, res) => {
  const { day } = req.params

  db.query(` SELECT p.id, p.day, p.hour, p.id_doctor, p.id_patient,  c.name as patientName, d.name as doctorName,  s.description as specializationDescription,  t.description as statusDescription
            FROM appointments p 
            join doctors d on (d.id = p.id_doctor)
            join specializations s on (s.id = p.id_specialization)
            join patients c on (c.id = p.id_patient)
            join status t on (t.id = p.id_status)
            WHERE p.day =  ${day}`, (error, results) => {
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

router.get('/day/:day/doctor/:doctorId', (req, res) => {
  const { day, doctorId } = req.params

  db.query(` SELECT p.id, p.day, p.hour, p.id_doctor, p.id_patient,  c.name as patientName, d.name as doctorName,  s.description as specializationDescription,  t.description as statusDescription
            FROM appointments p 
            join doctors d on (d.id = p.id_doctor)
            join specializations s on (s.id = p.id_specialization)
            join patients c on (c.id = p.id_patient)
            join status t on (t.id = p.id_status)
            WHERE p.day =  ${day} AND p.id_doctor = ${doctorId}`, (error, results) => {
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

router.get('/:id/doctor', (req, res) => {
  console.log('here')
  const { id } = req.params

  db.query(`SELECT DISTINCT day  FROM time_slots Where id_doctor =  ${id} AND id NOT IN (SELECT id_time_slot FROM appointments)`, (error, results) => {
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





router.get('/history/:id', (req, res) => {
  const { id } = req.params

  db.query(` SELECT p.id, p.day, p.hour, p.id_doctor, p.id_status, p.id_specialization,  d.name as doctorName,  s.description as specializationDescription,  t.description as statusDescription
            FROM appointments p 
            join doctors d on (d.id = p.id_doctor)
            join specializations s on (s.id = p.id_specialization)
            join status t on (t.id = p.id_status)
            WHERE p.id_patient =  ${id}`, (error, results) => {
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
  const appointments = req.body

  validate(appointments, {
    id_patient: "required",
    id_doctor: "required",  
    day: "required",
    hour: "required",
    id_insurance: "required",
    id_specialization: "required",
    id_time_slot: "required",
    
  }).then((value) => {
    db.query('INSERT INTO appointments SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }

      const { insertId } = results

      db.query('SELECT * FROM appointments WHERE id_patient = ? LIMIT 1', [insertId], (error, results, _) => {
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
    db.query('UPDATE appointments SET ? WHERE id = ?', [value, id], (error, results, _) => {
      if (error) {
        throw error
      }

      db.query('SELECT * FROM appointments WHERE id = ? LIMIT 1', [id], (error, results, _) => {
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

  db.query('SELECT * FROM appointments WHERE id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    console.log(results)
    const [appointments] = results

    db.query('DELETE FROM appointments WHERE id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: appointments
      })
    })
  })
})

module.exports = router
