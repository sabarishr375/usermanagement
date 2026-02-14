-- Add username column to existing users table
-- Run this in Supabase SQL Editor

-- Add username column (allow NULL temporarily)
ALTER TABLE users ADD COLUMN IF NOT EXISTS username VARCHAR(255);

-- Create index on username
CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);

-- Update existing rows with a default username based on name
UPDATE users 
SET username = LOWER(REPLACE(name, ' ', ''))
WHERE username IS NULL;

-- Now make username NOT NULL and UNIQUE
ALTER TABLE users ALTER COLUMN username SET NOT NULL;
ALTER TABLE users ADD CONSTRAINT users_username_unique UNIQUE (username);
