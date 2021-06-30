const router = require('express').Router()
const { validate } = require('indicative/validator')

const db = require('../../db')

router.get('/', (req, res) => {
  const { limit, page } = req.query

  const _limit = +limit || 20
  const _page = +page || 1

  db.query('SELECT COUNT(id) FROM working_hour_periods', (error, countResults, _) => {
    if (error) {
      throw error
    }

    const offset = (_page - 1) * _limit
    const total = countResults[0]['COUNT(id)']
    const pageCount = Math.ceil(total / _limit)

    db.query('SELECT * FROM working_hour_periods LIMIT ?, ?', [offset, _limit], (error, results, _) => {
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

  db.query(`SELECT * FROM working_hour_periods WHERE id = ${id}`, (error, results) => {
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


var utilityFunction = {

  getTime: function(a,b) {
    console.log('a e b')
    console.log(a)
    console.log(b)
    console.log('a e b')
    let toInt  = time => ((h,m) => h*2 + m/30)(...time.split(':').map(parseFloat))
    let toTime = int => [Math.floor(int/2), int%2 ? '30' : '00'].join(':')
    let range  = (from, to) => Array(to-from+1).fill().map((_,i) => from + i)
    let eachHalfHour = (t1, t2) => range(...[t1, t2].map(toInt)).map(toTime);
    return  eachHalfHour(a, b)
  },
  
}



router.post('/', (req, res) => {
  const working_hour_periods = req.body

  validate(working_hour_periods, {
    id_doctor: "required",
    begin_hour: "required",    
    day: "required",
    end_hour: "required",
    id_clinical_office: "required",
  }).then((value) => {
    db.query('INSERT INTO working_hour_periods SET ?', [value], (error, results, _) => {
      if (error) {
        throw error
      }
      console.log('aqui')
      console.log(value)
      console.log(value.begin_hour)
      console.log('aqui')
      var brackets = utilityFunction.getTime(value.begin_hour, value.end_hour)
      

      for( var i = 0;  i < brackets.length - 1;  i++ ) {

        var mySchedule = {
          "start_at": brackets[i],
          "end_at": brackets[i + 1],
          "id_doctor": value.id_doctor,
          "day": value.day
      }
      
        db.query('INSERT INTO time_slots SET ?', [mySchedule], (error, results, _) => {
          if (error) {
            throw error
          }          
        })
      }

      const { insertId } = results

      db.query('SELECT * FROM working_hour_periods WHERE id = ? LIMIT 1', [insertId], (error, results, _) => {
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
//   const status = req.body

//   validate(status, {
//     status: 'required',
//   }).then((value) => {
//     db.query('UPDATE working_hour_periods SET ? WHERE id = ?', [value, id], (error, results, _) => {
//       if (error) {
//         throw error
//       }

//       db.query('SELECT * FROM working_hour_periods WHERE id = ? LIMIT 1', [id], (error, results, _) => {
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

  db.query('SELECT * FROM working_hour_periods WHERE id = ?', [id], (error, results, _) => {
    if (error) {
      throw error
    }
    console.log(results)
    const [working_hour_periods] = results

    db.query('DELETE FROM working_hour_periods WHERE id = ?', [id], (error, _, __) => {
      if (error) {
        throw error
      }

      res.send({
        code: 200,
        meta: null,
        data: working_hour_periods
      })
    })
  })
})

module.exports = router
