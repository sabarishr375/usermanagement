# Troubleshooting Guide - 500 Error

## Problem
The API returns a 500 error when trying to fetch users. This is because the Java application expects a `username` column that doesn't exist in your Supabase table yet.

## Solution Options

### Option 1: Add Username Column to Supabase (Recommended)

1. Go to Supabase SQL Editor: https://supabase.com/dashboard/project/eidskpfgesrphcwfslap/sql
2. Run the SQL from `add_username_column.sql`
3. Restart your Spring Boot application (Ctrl+C and run `.\mvnw.cmd spring-boot:run` again)

### Option 2: Remove Username from Java Code

If you don't want a username field, I can update the code to remove it. Let me know!

### Option 3: Check Your Current Table Structure

Run this in Supabase SQL Editor to see what columns you have:

```sql
SELECT column_name, data_type, is_nullable
FROM information_schema.columns
WHERE table_name = 'users'
ORDER BY ordinal_position;
```

Then share the output with me so I can match the Java code to your exact table structure.

## Quick Fix

The easiest solution is to run `add_username_column.sql` in Supabase, which will:
- Add the username column
- Populate it with data from existing users
- Make it required and unique

After running the SQL, restart your application and it should work!
