#!/bin/bash

# Build the Docker image
docker-compose build

# Create the Rails application
docker-compose run --rm web rails new . --force --api --database=postgresql --skip-git

# Update database.yml with correct configuration
cat > config/database.yml << EOL
default: &default
  adapter: postgresql
  encoding: unicode
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>
  host: db
  username: postgres
  password: password

development:
  <<: *default
  database: blog_app_development

test:
  <<: *default
  database: blog_app_test

production:
  <<: *default
  database: blog_app_production
  username: blog_app
  password: <%= ENV["BLOG_APP_DATABASE_PASSWORD"] %>
EOL

# Build the image again with updated Gemfile
docker-compose build

# Create and setup the database
docker-compose run --rm web rails db:create
docker-compose run --rm web rails db:migrate 