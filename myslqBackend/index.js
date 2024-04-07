require("dotenv").config();

const express = require('express');

const db = require("./db")

const app = express();

const port = process.env.NODE_PORT;

app.use(express.json());

// Rotas --------------------------------------------------------------------------------------

app.get('/', (req, res) => res.json({ message: 'Funcionando!' }));

app.get('/usuarios', async (req, res) => {
    const results = await db.selectUsuarios();
    res.json(results);
})

app.get('/atividades', async (req, res) => {
  const results = await db.selectAtividades();
  res.json(results);
})

app.get('/usuarios-atividades', async (req, res) => {
  const results = await db.selectUsuariosAtividades();
  res.json(results);
})

//inicia o servidor
app.listen(port);
console.log('API funcionando!');