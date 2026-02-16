const { Pool } = require('pg');

// Disable SSL certificate validation for Supabase
process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

const pool = new Pool({
  connectionString: process.env.DATABASE_URL
});

module.exports = pool;
