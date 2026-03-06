// index.js
const express = require('express');
const { asyncTauQuery } = require('./public/scripts/tau');

const fs = require('fs');
const path = require('path');

const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(express.json());
app.use(express.static('public'));

// Routes
app.get('/', (req, res) => {
  res.send('Hello, Node.js world!');
});

// API endpoints
app.post('/categories', async (req, res) => {
  try {
    const response = fs.readFileSync(path.join(__dirname, 'data', 'form.json'), 'utf8');
    res.json(response);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

app.post('/query', async (req, res) => {
  const { dynamicRules, query } = req.body;
  try {
    const response = await asyncTauQuery(path.join(__dirname, 'prolog'), dynamicRules, query);
    res.json(response);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});