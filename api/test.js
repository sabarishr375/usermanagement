const pool = require('./db');

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
  
  // Try to connect using the shared pool
  try {
    const result = await pool.query('SELECT NOW()');
    
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
