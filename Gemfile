source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record
#gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'carrierwave'
gem 'sidekiq'
gem 'mail_form'
gem 'unicorn-worker-killer'

gem 'sendgrid-ruby'
# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'redis'
gem 'jwt'
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :production do
  gem 'pg'
end

group :development do

  gem 'sqlite3'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger', '>= 0.1.1'
  gem 'capistrano-sidekiq', github: 'seuros/capistrano-sidekiq'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano-rbenv'

  gem 'annotate'

  gem 'web-console', '>= 3.3.0'
  # redline for zeus support
  gem 'rb-readline'
  gem 'listen'
  gem 'guard'
  gem 'guard-zeus'
  gem 'rack-livereload'
  gem 'awesome_print'

  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
