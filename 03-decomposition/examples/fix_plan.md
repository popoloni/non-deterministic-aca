# Feature: User Authentication

## Branch: feature/user-auth

## Tasks

### 1. Login Form Component
- [ ] Create LoginForm.tsx with email and password fields
- [ ] Add client-side validation (email format, password min length)
- [ ] Style using design system components
**Acceptance:** Form renders; validation prevents submission of invalid data

### 2. Login API Endpoint  
- [ ] Create POST /api/auth/login route
- [ ] Validate request body schema
- [ ] Return JWT on success, 401 on failure
**Acceptance:** curl test returns 200 with token for valid creds, 401 for invalid

### 3. Session Management
- [x] Store JWT in httpOnly cookie
- [x] Add middleware to verify JWT on protected routes
- [ ] Implement logout endpoint that clears cookie
**Acceptance:** Protected routes return 401 without valid cookie
