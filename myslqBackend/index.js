require("dotenv").config();

const express = require('express');

const db = require("./db")
const cors = require('cors');

const app = express();

const port = process.env.NODE_PORT;

app.use(cors());
app.use(express.json());

// ROTAS --------------------------------------------------------------------------------------

app.get('/', (req, res) => res.json({ message: 'Funcionando!' }));

// USUARIOS -----------------------------------------------------------------------------------

app.get('/user/:id', async (req, res) => {
  const results = await db.selectUsuarioById(req.params.id);
  res.json(results);
})

app.delete('/user/:id', async (req, res) => {
  await db.deleteUsuario(req.params.id);
  res.sendStatus(204);
})

app.post('/user', async (req, res) => {
  await db.insertUsuario(req.body);
  console.log('usuario cadastrado')
  res.sendStatus(201);
});

app.patch('/user/:id', async (req, res) => {
  await db.updateUsuario(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/users', async (req, res) => {
    const results = await db.selectUsuarios();
    res.json(results);
})


// ATIVIDADES ---------------------------------------------------------------------------------

app.get('/activity/:id', async (req, res) => {
  const results = await db.selectAtividadeById(req.params.id);
  res.json(results);
})

app.delete('/activity/:id', async (req, res) => {
  await db.deleteAtividade(req.params.id);
  res.sendStatus(204);
})

app.post('/activity', async (req, res) => {
  await db.insertAtividade(req.body);
  res.sendStatus(201);
});

app.patch('/activity/:id', async (req, res) => {
  await db.updateAtividade(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/activities', async (req, res) => {
  const results = await db.selectAtividades();
  res.json(results);
})

// USUARIOS-ATIVIDADES ------------------------------------------------------------------------

app.get('/user-activity/:id', async (req, res) => {
  const results = await db.selectUsuarioAtividadeById(req.params.id);
  res.json(results);
})

app.delete('/user-activity/:id', async (req, res) => {
  await db.deleteUsuarioAtividade(req.params.id);
  res.sendStatus(204);
})

app.post('/user-activity', async (req, res) => {
  await db.insertUsuarioAtividade(req.body);
  res.sendStatus(201);
});

app.patch('/user-activity/:id', async (req, res) => {
  await db.updateUsuarioAtividade(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/user-activity', async (req, res) => {
  const results = await db.selectUsuariosAtividades();
  res.json(results);
})


// INICIAR O SERVIDOR --------------------------------------------------------------------------

console.log('API funcionando! na porta 3000');
app.listen(port);