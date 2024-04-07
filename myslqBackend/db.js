const mysql = require('mysql2/promise');
 
const client = mysql.createPool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
});

// const client = mysql.createPool(process.env.CONNECTION_STRING);

async function selectUsuarios() {
    const res = await client.query('SELECT * FROM usuario');
    return res[0];
}

async function selectAtividades() {
    const res = await client.query('SELECT * FROM atividade');
    return res[0];
}

async function selectUsuariosAtividades() {
    const res = await client.query('SELECT * FROM usuario_atividade');
    return res[0];
}
 
module.exports = { selectUsuarios, selectAtividades, selectUsuariosAtividades }