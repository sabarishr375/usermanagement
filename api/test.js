export default async function handler(req, res) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  
  // Check environment variable
  const dbUrl = process.env.DATABASE_URL;
  
  if (!dbUrl) {
    return res.status(500).json({ 
      error: 'DATABASE_URL not set',
      env: Object.keys(process.env)
    });
  }
  
  // Try to connect
  try {
    const { Pool } = require('pg');
    const pool = new Pool({
      connectionString: dbUrl,
      ssl: {
        rejectUnauthorized: false
      }
    });
    
    const result = await pool.query('SELECT NOW()');
    await pool.end();
    
    return res.status(200).json({ 
      success: true,
      message: 'Database connection successful',
      time: result.rows[0].now
    });
  } catch (error) {
    return res.status(500).json({ 
      error: error.message,
      stack: error.stack
    });
  }
}
