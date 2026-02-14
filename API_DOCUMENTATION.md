# User Management API Documentation

## API Endpoints

Base URL: `http://localhost:8080/api/user`

### 1. Create User
- **Endpoint**: `POST /api/user/create`
- **Description**: Creates a new user
- **Request Body**:
```json
{
  "name": "John Doe",
  "email": "john@example.com"
}
```
- **Response**: Returns the created user with ID
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com"
}
```

### 2. Get All Users
- **Endpoint**: `GET /api/user/getall`
- **Description**: Retrieves all users
- **Response**: Array of users
```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  },
  {
    "id": 2,
    "name": "Jane Smith",
    "email": "jane@example.com"
  }
]
```

### 3. Get User by ID
- **Endpoint**: `GET /api/user/get/{id}`
- **Description**: Retrieves a specific user by ID
- **Example**: `GET /api/user/get/1`
- **Response**: Single user object
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com"
}
```

### 4. Update User
- **Endpoint**: `PUT /api/user/update`
- **Description**: Updates an existing user
- **Request Body**:
```json
{
  "id": 1,
  "name": "John Updated",
  "email": "john.updated@example.com"
}
```
- **Response**: Returns the updated user
```json
{
  "id": 1,
  "name": "John Updated",
  "email": "john.updated@example.com"
}
```

### 5. Delete User
- **Endpoint**: `DELETE /api/user/delete/{id}`
- **Description**: Deletes a user by ID
- **Example**: `DELETE /api/user/delete/1`
- **Response**: Success message
```json
"User deleted successfully"
```

## Supabase Configuration

### Environment Variables
Set these environment variables before running the application:

```bash
SUPABASE_DB_HOST=your-project.supabase.co
SUPABASE_DB_PORT=5432
SUPABASE_DB_NAME=postgres
SUPABASE_DB_USER=postgres
SUPABASE_DB_PASSWORD=your-password
```

### Getting Supabase Credentials

1. Go to your Supabase project dashboard
2. Navigate to Settings > Database
3. Find the connection string and extract:
   - Host: `db.xxxxxxxxxxxxx.supabase.co`
   - Port: `5432`
   - Database: `postgres`
   - User: `postgres`
   - Password: Your database password

## Running the Application

### Option 1: Using Maven Wrapper (Recommended)
```bash
# Windows
mvnw.cmd spring-boot:run

# Linux/Mac
./mvnw spring-boot:run
```

### Option 2: Using Maven
```bash
mvn spring-boot:run
```

### Option 3: With Environment Variables
```bash
# Windows
set SUPABASE_DB_HOST=your-project.supabase.co
set SUPABASE_DB_PORT=5432
set SUPABASE_DB_NAME=postgres
set SUPABASE_DB_USER=postgres
set SUPABASE_DB_PASSWORD=your-password
mvnw.cmd spring-boot:run
```

## Accessing the Application

- **API Base URL**: http://localhost:8080/api/user
- **Web Interface**: http://localhost:8080/index.html

## Testing with cURL

### Create User
```bash
curl -X POST http://localhost:8080/api/user/create \
  -H "Content-Type: application/json" \
  -d "{\"name\":\"John Doe\",\"email\":\"john@example.com\"}"
```

### Get All Users
```bash
curl http://localhost:8080/api/user/getall
```

### Get User by ID
```bash
curl http://localhost:8080/api/user/get/1
```

### Update User
```bash
curl -X PUT http://localhost:8080/api/user/update \
  -H "Content-Type: application/json" \
  -d "{\"id\":1,\"name\":\"John Updated\",\"email\":\"john.updated@example.com\"}"
```

### Delete User
```bash
curl -X DELETE http://localhost:8080/api/user/delete/1
```

## Web Interface Features

The included HTML interface provides:
- ➕ Add new users with a form
- 👥 View all users in a table
- ✏️ Edit existing users
- 🗑️ Delete users with confirmation
- 🎨 Modern, responsive design
- ✅ Success/error notifications

Access it at: http://localhost:8080/index.html
