const mariadb = require('mariadb');
const envConfig = require('../env.config')
const pool = mariadb.createPool(
    {
        host: envConfig.DB_HOST,
        user: envConfig.DB_USERNAME,
        password: envConfig.DB_PASSWORD,
        database: envConfig.DB_DATABASE,
        connectionLimit: 100000000
    }
);

module.exports = pool