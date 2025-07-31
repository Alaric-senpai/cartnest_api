const mariadb = require('mariadb');
const fs = require('fs');
const path = require('path');
require('dotenv').config();

const isProduction = process.env.NODE_ENV === 'production';

const sslOptions = isProduction
  ? {
      ca: fs.readFileSync(path.resolve(__dirname, '../ca.pem'), 'utf8'),
      rejectUnauthorized: true
    }
  : {
      rejectUnauthorized: false // for local/dev environments
    };

const pool = mariadb.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  connectionLimit: 1000,
  acquireTimeout: 120000,
  ssl: sslOptions
});

module.exports = pool;
