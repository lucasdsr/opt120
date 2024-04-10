const mysql = require('mysql2/promise');
 
const client = mysql.createPool({
    user: process.env.DB_USER,
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,
});

// USUARIOS -----------------------------------------------------------------------------------

async function selectUsuarios() {
    const res = await client.query('SELECT * FROM usuario');
    return res[0];
}

async function selectUsuarioById(id) {
    const res = await client.query('SELECT * FROM usuario WHERE ID=?', [id]);
    return res[0];
}

async function insertUsuario(usuario) {
    const sql = 'INSERT INTO usuario(nome,email,password) VALUES (?,?,?);';
    const values = [usuario.nome, usuario.email, usuario.senha];
    await client.query(sql, values);
}

async function updateUsuario(id, usuario) {
    const sql = 'UPDATE usuario SET nome=?, email=?, password=? WHERE id=?';
    const values = [usuario.nome, usuario.email, usuario.password, id];
    await client.query(sql, values);
}

async function deleteUsuario(id) {
    return await client.query('DELETE FROM usuario where id=?;', [id]);
}

// ATIVIDADES ---------------------------------------------------------------------------------

async function selectAtividades() {
    const res = await client.query('SELECT * FROM atividade');
    return res[0];
}

async function selectAtividadeById(id) {
    const res = await client.query('SELECT * FROM atividade WHERE ID=?', [id]);
    return res[0];
}

async function insertAtividade(atividade) {
    const sql = 'INSERT INTO atividade(titulo,descricao,nota,data-limite) VALUES (?,?,?,?);';
    const values = [atividade.titulo, atividade.descricao, atividade.nota, atividade.data-limite];
    await client.query(sql, values);
}

async function updateAtividade(id, atividade) {
    const sql = 'UPDATE atividade SET titulo=?, descricao=?, data-limite=? WHERE id=?';
    const values = [atividade.titulo, atividade.descricao, atividade.data-limite, id];
    await client.query(sql, values);
}

async function deleteAtividade(id) {
    return await client.query('DELETE FROM atividade where id=?;', [id]);
}

// USUARIO-ATIVIDADE -------------------------------------------------------------------------

async function selectUsuariosAtividades() {
    const res = await client.query('SELECT * FROM usuario_atividade');
    return res[0];
}

async function selectUsuarioAtividadeById(id) {
    const res = await client.query('SELECT * FROM usuario_atividade WHERE ID=?', [id]);
    return res[0];
}

async function insertUsuarioAtividade(usuarioAtividade) {
    const sql = 'INSERT INTO usuario_atividade(usuario_id,atividade_id,entrega,nota) VALUES (?,?,?,?);';
    const values = [usuarioAtividade.usuario_id, usuarioAtividade.atividade_id, usuarioAtividade.entrega, usuarioAtividade.nota];
    await client.query(sql, values);
}

// async function updateUsuarioAtividade(id, usuario) {
//     const sql = 'UPDATE usuario_atividade SET nome=?, email=?, password=? WHERE id=?';
//     const values = [usuario.nome, usuario.email, usuario.password, id];
//     await client.query(sql, values);
// }

async function deleteUsuarioAtividade(id) {
    return await client.query('DELETE FROM usuario_atividade where id=?;', [id]);
}

module.exports = {
    selectUsuarios,
    selectUsuarioById,
    insertUsuario,
    deleteUsuario,
    selectAtividades,
    selectAtividadeById,
    insertAtividade,
    deleteAtividade,
    selectUsuariosAtividades,
    selectUsuarioAtividadeById,
    insertUsuarioAtividade,
    deleteUsuarioAtividade
}