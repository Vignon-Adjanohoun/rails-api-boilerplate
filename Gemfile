source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3', '>= 6.1.3.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Test data generator
  gem 'factory_bot_rails'
  # fake data generator
  gem 'faker', git: 'https://github.com/faker-ruby/faker.git', branch: 'master'
  # Rspec for testing
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
      gem lib, git: "https://github.com/rspec/#{lib}.git", branch: 'main' # Previously '4-0-dev' or '4-0-maintenance' branch
  end
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # ruby documentation
  gem 'solargraph'
end

group :test do
  # empty test db
  gem 'database_cleaner-mongoid'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# using mongoDB
gem 'mongoid', '~> 7.2.0'
# devise for authentication
gem 'devise'
# queue processing
gem 'sidekiq'
# pundit for authorization 
gem "pundit"
# json serializers
gem 'blueprinter'
# rest api framework
gem 'grape'
# CORSfor api
gem 'rack-cors', :require => 'rack/cors'
# api documentation
gem 'grape-swagger'
# documentation UI
gem 'grape-swagger-rails'
# hashi hash helper
gem 'hashie'
# token auth fo api
gem 'devise_token_auth'
gem 'grape_devise_token_auth'
gem 'mongoid-locker'