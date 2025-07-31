const mariadb = require('mariadb');
const fs = require('fs');
require('dotenv').config(); // Or your own env config

const isProduction = process.env.NODE_ENV === 'production';

const sslOptions = isProduction
  ? {
      ca: fs.readFileSync('../ca.pem'),
      rejectUnauthorized: true
    }
  : { 
      rejectUnauthorized: false // Optional: allow self-signed or skip in dev
    };

const pool = mariadb.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  connectionLimit: 10,
  acquireTimeout: 120000,
  ssl: sslOptions
});

module.exports = pool;
