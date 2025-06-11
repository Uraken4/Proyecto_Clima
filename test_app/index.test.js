const { getEnvVars } = require('./index');

test('las variables de entorno están definidas', () => {
  const env = getEnvVars();
  expect(env.apiUrl).toBeDefined();
  expect(env.apiKey).toBeDefined();
});
