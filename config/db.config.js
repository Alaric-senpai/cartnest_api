const mariadb = require('mariadb');

const pool = mariadb.createPool(
    {
        host: 'localhost',
        user: 'alaric',
        password: 'alaric',
        database: 'cartnest',
        connectionLimit: 100
    }
);

module.exports = pool