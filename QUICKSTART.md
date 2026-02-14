# Quick Start Guide

## Your Supabase is Already Configured! 🎉

The application is pre-configured with your Supabase credentials. Just run and go!

## Start the Application

### Windows:
```bash
mvnw.cmd spring-boot:run
```

### Linux/Mac:
```bash
./mvnw spring-boot:run
```

## Access Your Application

Once the application starts, open your browser:

- **Web Interface**: http://localhost:8080/index.html
- **API Base URL**: http://localhost:8080/api/user

## Test the API

### Using Browser
Just open http://localhost:8080/index.html and use the interface to:
- ➕ Add users
- ✏️ Edit users
- 🗑️ Delete users
- 👁️ View all users

### Using cURL (Windows CMD)

**Create User:**
```bash
curl -X POST http://localhost:8080/api/user/create -H "Content-Type: application/json" -d "{\"name\":\"John Doe\",\"email\":\"john@example.com\"}"
```

**Get All Users:**
```bash
curl http://localhost:8080/api/user/getall
```

**Get User by ID:**
```bash
curl http://localhost:8080/api/user/get/1
```

**Update User:**
```bash
curl -X PUT http://localhost:8080/api/user/update -H "Content-Type: application/json" -d "{\"id\":1,\"name\":\"John Updated\",\"email\":\"john.updated@example.com\"}"
```

**Delete User:**
```bash
curl -X DELETE http://localhost:8080/api/user/delete/1
```

## Database Connection Details

Your app connects to:
- **Host**: aws-1-ap-south-1.pooler.supabase.com
- **Port**: 5432
- **Database**: postgres
- **User**: postgres.eidskpfgesrphcwfslap

The `users` table will be created automatically when you first run the application!

## Troubleshooting

If you get connection errors:
1. Check your internet connection
2. Verify Supabase project is active at https://eidskpfgesrphcwfslap.supabase.co
3. Check the application logs for detailed error messages

## Next Steps

- The web interface is fully functional with add/edit/delete operations
- All API endpoints are ready to use
- Data persists in your Supabase PostgreSQL database
- CORS is configured for localhost:3000 if you want to build a React/Next.js frontend

Enjoy your user management system! 🚀
