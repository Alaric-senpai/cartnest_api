const dotenv = require('dotenv')
dotenv.config()

// console.log(process.env.DB_HOST)

console.log(require('crypto').randomBytes(64).toString('hex'))