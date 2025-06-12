require('dotenv').config();
const express = require('express');
const app = express();
const port = 3000;

function getEnvVars() {
  return {
    apiUrl: process.env.API_URL,
    apiKey: process.env.OPENWEATHER_API_KEY,
  };
}

app.get('/', async (req, res) => {
  const env = getEnvVars();
  const city = 'Lima'; // Puedes cambiar la ciudad aquí
  const url = `${env.apiUrl}weather?q=${city}&appid=${env.apiKey}&units=metric&lang=es`;

  try {
    const fetch = (await import('node-fetch')).default;
    const response = await fetch(url);
    if (!response.ok) throw new Error('No se pudo obtener el clima');
    const data = await response.json();
    res.send(`
      <h1>Clima en ${data.name}</h1>
      <p><strong>Temperatura:</strong> ${data.main.temp} °C</p>
      <p><strong>Descripción:</strong> ${data.weather[0].description}</p>
      <p><strong>Humedad:</strong> ${data.main.humidity}%</p>
      <p><strong>Viento:</strong> ${data.wind.speed} m/s</p>
    `);
  } catch (err) {
    res.status(500).send(`<p>Error: ${err.message}</p>`);
  }
});

app.listen(port, '0.0.0.0', () => {
  console.log(`Servidor escuchando en http://localhost:${port}`);
});
