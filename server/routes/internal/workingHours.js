const router = require('express').Router()
const { validate } = require('indicative/validator')
const db = require('../../db')
const moment = require('moment');
const { parseTwoDigitYear } = require('moment');

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
    
    let toInt  = time => ((h,m) => h*2 + m/30)(...time.split(':').map(parseFloat))
    let toTime = int => [Math.floor(int/2), int%2 ? '30' : '00'].join(':')
    let range  = (from, to) => Array(to-from+1).fill().map((_,i) => from + i)
    let eachHalfHour = (t1, t2) => range(...[t1, t2].map(toInt)).map(toTime);
    return  eachHalfHour(a, b)
  },
  
}

var checkDaysDifference = {
  days: function(a,b) {
    let firstDate = new Date(a),
    secondDate = new Date(b),
    timeDifference = Math.abs(secondDate.getTime() - firstDate.getTime());
    let differentDays = Math.ceil(timeDifference / (1000 * 3600 * 24));
    return differentDays
  }

}

var getDateArray = function(start, end) {
    var arr = new Array();
    var dt = new Date(start);
    while (dt <= end) {
        arr.push(new Date(dt));
        dt.setDate(dt.getDate() + 1);
    }
    return arr;
}


var createTimeSlotsForWorkingHourPeriod = function(day, begin_hour, end_hour, doctorId) {
  var brackets = utilityFunction.getTime(begin_hour, end_hour) // [10:00, 10:30, 11:00, 11:30, 12:00]

  for( var i = 0;  i < brackets.length - 1;  i++ ) {
    
    
    var mySchedule = {
      "start_at": brackets[i],
      "end_at": brackets[i + 1],
      "id_doctor": doctorId,
      "day": day
    } 

    db.query('INSERT INTO time_slots SET ?', [mySchedule], (error, results, _) => {
      if (error) {
        throw error
      }          
    })
  }

  
}



router.post('/', (req, res) => {
  const working_hour_periods = req.body
  console.log('aqui')
   
  validate(working_hour_periods, {
    id_doctor: "required",  //1
    begin_hour: "required",  // 10:00   
    day: "required",  //YYYY-MM-DD 2021-08-01
    end_hour: "required",  //12:00
    day2: "required", //YYYY-MM-DD 2021-08-08
    id_clinical_office: "required", //consultorio3

    

  }).then((value) => {
    
    // for( var d = 0;  d < dateArr.length ;  d++ ) {
      

      var all_working_hour_periods = {
        "id_doctor": value.id_doctor,
        "begin_hour": value.begin_hour,
        "day":  new Date(value.day),  // dateArr[0] = 2021-08-01
        "end_hour": value.end_hour,
        "day2": value.day2,
        "id_clinical_office": value.id_clinical_office
      }
    

    db.query('INSERT INTO working_hour_periods SET ?', [all_working_hour_periods], (error, results, _) => {
      if (error) {
        throw error
      }
      var startDate = new Date(working_hour_periods.day); //YYYY-MM-DD 2021-08-01
      var endDate = new Date(working_hour_periods.day2); //YYYY-MM-DD 2021-08-08
      var dateArr = getDateArray(startDate, endDate );
      console.log(dateArr)
      console.log('aqui2')
      for ( var i = 0;  i < dateArr.length ;  i++ ) {
        console.log(dateArr)
        console.log(dateArr[i])
        createTimeSlotsForWorkingHourPeriod(dateArr[i], value.begin_hour, value.end_hour, value.id_doctor)

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
  // }
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
