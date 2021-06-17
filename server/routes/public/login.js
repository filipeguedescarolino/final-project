// const { validate } = require('indicative/validator')
// const bcrypt = require('bcrypt')
// const jwt = require('jsonwebtoken')

// const db = require('../../db')

// module.exports = (req, res) => {
//   validate(req.body, {
//     email: 'required|email',
//     password: 'required'
//   }).then((value) => {
    
    
//     console.log(value)
//     console.log(req.body)
//     db.query('SELECT * FROM patients WHERE email = ? AND status != 0', [value.email], (error, results) => {
//     console.log(results)
//       if (results.length === 0) {
//         console.log('bateu aqui')
//         // res.status(400).send('Cannot find any account that matches the given email and password')
//       } else {
//         console.log(value.password)
//         console.log(results[0].password)
        
//         bcrypt.compare(toString(value.password), toString(results[0].password))
//           .then((match) => {
//             if (match) {
//               const secret = 'B18fbWIyeU1utFA31mzGaVyzjyL9ZnfP'
//               const data = { id: results[0].client_id,
//                              type: type 
//                             }
//                             // este type vem no form com cliente/medico
//               console.log(data)

//               delete results[0].password

//               const authToken = jwt.sign(data, secret)

//               res.send({
//                 user: results[0],
//                 token: authToken
                
//               })
//             } else {
              
//               res.status(400).send('Cannot find any account that matches the given email and password')
//             }
//           }).catch((error) => { throw error })
//       }
//     })
//   }).catch((error) => res.status(400).send(error))
// }
