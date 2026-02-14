# Supabase Database Setup Guide

## Option 1: Run SQL in Supabase Dashboard (Recommended)

### Steps:

1. **Go to Supabase Dashboard**
   - Open: https://supabase.com/dashboard/project/eidskpfgesrphcwfslap

2. **Navigate to SQL Editor**
   - Click on "SQL Editor" in the left sidebar
   - Click "New Query"

3. **Copy and Paste SQL**
   - Open the file `supabase_setup.sql`
   - Copy all the SQL code
   - Paste it into the SQL Editor

4. **Run the Query**
   - Click "Run" or press `Ctrl+Enter`
   - You should see "Success. No rows returned"

5. **Verify Table Creation**
   - Go to "Table Editor" in the left sidebar
   - You should see the `users` table with sample data

---

## Option 2: Let Spring Boot Create the Table Automatically

Your `application.properties` is already configured with:
```properties
spring.jpa.hibernate.ddl-auto=update
```

This means Spring Boot will automatically create the `users` table when you run the application!

### Just run:
```bash
mvnw.cmd spring-boot:run
```

The table will be created automatically based on your `User.java` entity.

---

## Option 3: Use Supabase CLI

If you have Supabase CLI installed:

```bash
# Login to Supabase
supabase login

# Link to your project
supabase link --project-ref eidskpfgesrphcwfslap

# Run the SQL file
supabase db execute -f supabase_setup.sql
```

---

## Table Structure

The `users` table will have:

| Column     | Type      | Description                    |
|------------|-----------|--------------------------------|
| id         | BIGSERIAL | Primary key (auto-increment)   |
| name       | VARCHAR   | User's full name               |
| email      | VARCHAR   | User's email (unique)          |
| created_at | TIMESTAMP | When user was created          |
| updated_at | TIMESTAMP | When user was last updated     |

---

## Security Features Included

✅ **Row Level Security (RLS)** enabled
✅ **Unique constraint** on email
✅ **Automatic timestamps** for created_at and updated_at
✅ **Indexes** for faster queries
✅ **Sample data** for testing

---

## Verify Your Setup

After running the SQL, test with:

### 1. Check in Supabase Dashboard
- Go to Table Editor
- Click on `users` table
- You should see 3 sample users

### 2. Test with your Spring Boot API
```bash
# Start your application
mvnw.cmd spring-boot:run

# Get all users
curl http://localhost:8080/api/user/getall
```

### 3. Use the Web Interface
Open: http://localhost:8080/index.html

---

## Troubleshooting

### Error: "relation 'users' already exists"
- The table is already created. You're good to go!

### Error: "permission denied"
- Make sure you're logged into the correct Supabase project
- Check that your database password is correct

### Table not showing in Table Editor
- Refresh the page
- Check the "public" schema
- Run: `SELECT * FROM users;` in SQL Editor

---

## Next Steps

Once the table is set up:
1. Start your Spring Boot application
2. Open http://localhost:8080/index.html
3. Start adding, editing, and deleting users!

Your data will persist in Supabase PostgreSQL database. 🎉
