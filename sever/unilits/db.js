const mysql = require('mysql');
require('dotenv').config();
const Promise = require('bluebird');

let connection = mysql.createPool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASS,
    database: process.env.DB_NAME,

    dateStrings:true,
})

connection = Promise.promisifyAll(connection);

module.exports = connection;