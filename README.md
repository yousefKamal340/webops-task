# Blog Application API

This is a RESTful API for a blog application built with Ruby on Rails, PostgreSQL, Redis, and Sidekiq.

## Features

- User Authentication (Login, Signup)
- CRUD operations for Posts
- Comments system
- Tag management
- Automatic post deletion after 24 hours
- JWT-based authentication
- Background job processing with Sidekiq

## Requirements

- Docker
- Docker Compose

## Setup

1. Clone this repository
2. Make the setup script executable:
   ```bash
   chmod +x setup.sh
   ```
3. Run the setup script:
   ```bash
   ./setup.sh
   ```
4. Start the application:
   ```bash
   docker-compose up
   ```

The API will be available at http://localhost:3000

## API Endpoints

### Authentication
- POST /api/v1/signup - Register a new user
- POST /api/v1/login - Login user

### Posts
- GET /api/v1/posts - List all posts
- POST /api/v1/posts - Create a new post
- GET /api/v1/posts/:id - Get a specific post
- PUT /api/v1/posts/:id - Update a post
- DELETE /api/v1/posts/:id - Delete a post

### Comments
- POST /api/v1/posts/:post_id/comments - Add a comment
- PUT /api/v1/posts/:post_id/comments/:id - Update a comment
- DELETE /api/v1/posts/:post_id/comments/:id - Delete a comment

## Testing

To run the test suite:

```bash
docker-compose run --rm web rspec
```