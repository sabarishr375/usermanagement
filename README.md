# Spring Boot User Management System

A full-stack user management application built with Spring Boot and connected to Supabase PostgreSQL database.

## 🚀 Features

- **RESTful API** with full CRUD operations
- **Modern Web Interface** with responsive design
- **Supabase Integration** for PostgreSQL database
- **Real-time Updates** with automatic timestamps
- **User Management**: Create, Read, Update, Delete users

## 📋 Prerequisites

- Java 17 or higher
- Maven 3.6+
- Supabase account (free tier works)

## 🛠️ Tech Stack

- **Backend**: Spring Boot 3.5.5
- **Database**: PostgreSQL (Supabase)
- **ORM**: Hibernate/JPA
- **Frontend**: HTML, CSS, JavaScript
- **Build Tool**: Maven

## 📦 Installation

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/SpringBoot-Java.git
cd SpringBoot-Java
```

### 2. Configure Supabase Database

Copy the example configuration file:

```bash
cp src/main/resources/application.properties.example src/main/resources/application.properties
```

Edit `application.properties` with your Supabase credentials:

```properties
spring.datasource.url=jdbc:postgresql://YOUR_SUPABASE_HOST:5432/postgres?sslmode=require
spring.datasource.username=YOUR_SUPABASE_USERNAME
spring.datasource.password=YOUR_SUPABASE_PASSWORD
```

### 3. Set up Database Table

Run the SQL script `supabase_correct.sql` in your Supabase SQL Editor.

### 4. Run the Application

**Windows:**
```bash
.\mvnw.cmd spring-boot:run
```

**Linux/Mac:**
```bash
./mvnw spring-boot:run
```

The application will start on `http://localhost:8080`

## 🌐 API Endpoints

Base URL: `http://localhost:8080/api/user`

| Method | Endpoint | Description |
|--------|----------|-------------|
| POST | `/create` | Create a new user |
| GET | `/getall` | Get all users |
| GET | `/get/{id}` | Get user by ID |
| PUT | `/update` | Update user |
| DELETE | `/delete/{id}` | Delete user |

### Example Requests

**Create User:**
```json
POST /api/user/create
{
  "username": "johndoe",
  "name": "John Doe",
  "email": "john@example.com"
}
```

**Update User:**
```json
PUT /api/user/update
{
  "id": 1,
  "username": "johndoe",
  "name": "John Updated",
  "email": "john@example.com"
}
```

## 🖥️ Web Interface

Access the web interface at: `http://localhost:8080/index.html`

Features:
- Add new users
- Edit existing users
- Delete users with confirmation
- View all users in a table
- Real-time success/error notifications

## 📁 Project Structure

```
SpringBoot-Java/
├── src/
│   ├── main/
│   │   ├── java/com/codewith/firstApp/
│   │   │   ├── controllers/
│   │   │   ├── model/
│   │   │   ├── repository/
│   │   │   ├── service/
│   │   │   └── FirstAppApplication.java
│   │   └── resources/
│   │       ├── static/
│   │       │   └── index.html
│   │       └── application.properties
│   └── test/
├── supabase_correct.sql
├── pom.xml
└── README.md
```

## 🗄️ Database Schema

```sql
CREATE TABLE users (
    id BIGSERIAL PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
```

## 🧪 Testing

Use the PowerShell test script:

```powershell
powershell -ExecutionPolicy Bypass -File test_api.ps1
```

## 🔒 Security Notes

- Never commit `application.properties` with real credentials
- Use environment variables for production
- Enable Row Level Security (RLS) in Supabase

## 📝 License

This project is open source and available under the MIT License.
