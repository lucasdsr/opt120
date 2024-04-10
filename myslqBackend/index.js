require("dotenv").config();

const express = require('express');

const db = require("./db")

const app = express();

const port = process.env.NODE_PORT;

app.use(express.json());

// ROTAS --------------------------------------------------------------------------------------

app.get('/', (req, res) => res.json({ message: 'Funcionando!' }));

// USUARIOS -----------------------------------------------------------------------------------

app.get('/usuario/:id', async (req, res) => {
  const results = await db.selectUsuarioById(req.params.id);
  res.json(results);
})

app.delete('/usuario/:id', async (req, res) => {
  await db.deleteUsuario(req.params.id);
  res.sendStatus(204);
})

app.post('/usuario', async (req, res) => {
  await db.insertUsuario(req.body);
  res.sendStatus(201);
});

app.patch('/usuario/:id', async (req, res) => {
  await db.updateUsuario(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/usuarios', async (req, res) => {
    const results = await db.selectUsuarios();
    res.json(results);
})


// ATIVIDADES ---------------------------------------------------------------------------------

app.get('/atividade/:id', async (req, res) => {
  const results = await db.selectAtividadeById(req.params.id);
  res.json(results);
})

app.delete('/atividade/:id', async (req, res) => {
  await db.deleteAtividade(req.params.id);
  res.sendStatus(204);
})

app.post('/atividade', async (req, res) => {
  await db.insertAtividade(req.body);
  res.sendStatus(201);
});

app.patch('/atividade/:id', async (req, res) => {
  await db.updateAtividade(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/atividades', async (req, res) => {
  const results = await db.selectAtividades();
  res.json(results);
})


// USUARIOS-ATIVIDADES ------------------------------------------------------------------------

app.get('/usuario-atividade/:id', async (req, res) => {
  const results = await db.selectUsuarioAtividadeById(req.params.id);
  res.json(results);
})

app.delete('/usuario-atividade/:id', async (req, res) => {
  await db.deleteUsuarioAtividade(req.params.id);
  res.sendStatus(204);
})

app.post('/usuario-atividade', async (req, res) => {
  await db.insertUsuarioAtividade(req.body);
  res.sendStatus(201);
});

app.patch('/usuario-atividade/:id', async (req, res) => {
  await db.updateUsuarioAtividade(req.params.id, req.body);
  res.sendStatus(200);
})

app.get('/usuarios-atividades', async (req, res) => {
  const results = await db.selectUsuariosAtividades();
  res.json(results);
})


// INICIAR O SERVIDOR --------------------------------------------------------------------------

app.listen(port);
console.log('API funcionando!');