# Django API Documentation

This Django application provides several endpoints for user authentication and interaction with crime hotspots, posts, and alerts.

## Endpoints

### 1. Index
- **URL**: `/api/`
- **Method**: `GET`
- **Description**: Returns a welcome message.

### 2. Signup
- **URL**: `/api/signup/`
- **Method**: `POST`
- **Description**: Registers a new user.

### 3. Login
- **URL**: `/api/login/`
- **Method**: `POST`
- **Description**: Authenticates a user and returns a token.

### 4. Crime Hotspot
- **URL**: `/api/crime_hotspot/`
- **Methods**: `GET`, `POST`
- **Description**: Retrieves and creates crime hotspot data.

### 5. Posts
- **URL**: `/api/posts/`
- **Methods**: `GET`, `POST`
- **Description**: Retrieves and creates user posts.

### 6. Alerts
- **URL**: `/api/alerts/`
- **Methods**: `GET`, `POST`
- **Description**: Manages alerts data.
