# frozen_string_literal: true
source 'https://rubygems.org'

# Backend
gem 'rails', '5.0.0.1'
gem 'pg'
gem 'dotenv-rails'
gem 'devise'
gem 'kaminari'
gem 'sentry-raven'
gem 'puma'
gem 'ransack'
gem 'acts-as-taggable-on'
gem 'nokogiri', '1.13.10'
gem 'sidekiq'

# Frontend
gem 'sass-rails'
gem 'uglifier', '<3'
gem 'coffee-rails'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'slim-rails'
gem 'sprockets-rails'
gem 'select2-rails'
gem 'font-awesome-rails'

group :development do
  gem 'rubocop', '0.37.0', require: false
  gem 'rubocop-rspec', '1.3.0', require: false
end

group :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rails-controller-testing'
  gem 'database_rewinder'
  gem 'shoulda-matchers'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'simplecov', require: false
  gem 'selenium-webdriver'
  gem 'rspec-sidekiq'
end

group :development, :test do
  gem 'byebug'
end

group :production do
  gem 'foreman', require: false
end
