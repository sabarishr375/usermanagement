# Test API Script for PowerShell

Write-Host "Testing User Management API..." -ForegroundColor Green
Write-Host ""

# Test 1: Get All Users
Write-Host "1. Getting all users..." -ForegroundColor Yellow
$response = Invoke-RestMethod -Uri "http://localhost:8080/api/user/getall" -Method Get
$response | ConvertTo-Json
Write-Host ""

# Test 2: Create New User
Write-Host "2. Creating new user..." -ForegroundColor Yellow
$newUser = @{
    username = "newuser"
    name = "New User"
    email = "newuser@example.com"
} | ConvertTo-Json

$created = Invoke-RestMethod -Uri "http://localhost:8080/api/user/create" -Method Post -Body $newUser -ContentType "application/json"
$created | ConvertTo-Json
Write-Host ""

# Test 3: Get User by ID
Write-Host "3. Getting user by ID..." -ForegroundColor Yellow
$userId = $created.id
$user = Invoke-RestMethod -Uri "http://localhost:8080/api/user/get/$userId" -Method Get
$user | ConvertTo-Json
Write-Host ""

# Test 4: Update User
Write-Host "4. Updating user..." -ForegroundColor Yellow
$updateUser = @{
    id = $userId
    username = "updateduser"
    name = "Updated User"
    email = "updated@example.com"
} | ConvertTo-Json

$updated = Invoke-RestMethod -Uri "http://localhost:8080/api/user/update" -Method Put -Body $updateUser -ContentType "application/json"
$updated | ConvertTo-Json
Write-Host ""

# Test 5: Delete User
Write-Host "5. Deleting user..." -ForegroundColor Yellow
$deleted = Invoke-RestMethod -Uri "http://localhost:8080/api/user/delete/$userId" -Method Delete
Write-Host $deleted
Write-Host ""

Write-Host "All tests completed!" -ForegroundColor Green
