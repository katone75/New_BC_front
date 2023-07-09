import express from 'express';
import pkg from 'pg';
const { Pool } = pkg;

const app = express();
const port = 3000;

const pool = new Pool({
  user: 'ourblog_bc',
  host: 'localhost',
  database: 'ourblog_bc',
  password: 'ourblog',
  port: 5432,
});

app.get('/user', async (req, res) => {
  try {
    const client = await pool.connect();
    const result = await client.query('SELECT * FROM "user"'); // Utilisation de guillemets pour éviter une collision avec un mot-clé SQL réservé
    res.json(result.rows);
    client.release();
  } catch (err) {
    console.error(err);
    res.status(500).send('Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
