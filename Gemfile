source "https://rubygems.org"

ruby "3.2.2"

# Rails core
gem "rails", "~> 7.1.0"
gem "puma", "~> 6.0"

# Database
gem "pg", "~> 1.1"

# API and Authentication
gem "jwt", "~> 2.7"
gem "bcrypt", "~> 3.1.7"
gem "rack-cors"

# Background Processing
gem "sidekiq", "~> 7.0"
gem "redis", "~> 5.0"

# API Serialization
gem "active_model_serializers", "~> 0.10.0"

# Development and Test dependencies
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem "rspec-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "database_cleaner-active_record"
end

group :development do
  gem "error_highlight", ">= 0.4.0", platforms: [:ruby]
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false 