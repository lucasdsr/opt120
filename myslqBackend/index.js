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

app.get('/usuarios', async (req, res) => {
    const results = await db.selectUsuarios();
    res.json(results);
})


// ATIVIDADES ---------------------------------------------------------------------------------

app.get('/atividade/:id', async (req, res) => {
  const results = await db.selectAtividadeById(req.params.id);
  res.json(results);
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

app.get('/usuarios-atividades', async (req, res) => {
  const results = await db.selectUsuariosAtividades();
  res.json(results);
})


// INICIAR O SERVIDOR --------------------------------------------------------------------------

app.listen(port);
console.log('API funcionando!');