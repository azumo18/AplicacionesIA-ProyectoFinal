// index.js
const express = require('express');
const { asyncTauQuery } = require('./public/scripts/tau');
const { asyncExtractAllCandidates } = require('./public/scripts/candidate-facts');

const fs = require('fs');
const path = require('path');
const config = require('./config.json');

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
    const prologResponse = await asyncTauQuery(path.join(__dirname, 'prolog'), dynamicRules, query);
    const resultsText = prologResponse.results.join('\n');

    const prompt = `You are an HR assistant. The following is structured output from an AI-powered Applicant Tracking System that ranked candidates against job requirements. Present it as a clear, concise summary in natural language for a hiring manager:\n\n${resultsText}`;

    let naturalLanguageResponse;
    try {
      const ollamaRes = await fetch('http://localhost:11434/api/generate', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ model: config.ollamaModel, prompt, stream: false })
      });
      const ollamaData = await ollamaRes.json();
      naturalLanguageResponse = ollamaData.response;
    } catch (_) {
      // Ollama unavailable — client will fall back to raw results
    }

    res.json({ ...prologResponse, naturalLanguageResponse });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

app.get('/extract-candidates', async (req, res) => {
  try {
    const response = await asyncExtractAllCandidates(path.join(__dirname, config.cvsFolder));
    res.json(response);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});