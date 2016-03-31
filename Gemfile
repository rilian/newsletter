source 'https://rubygems.org'

# Backend
gem 'rails', '4.2.6'
gem 'pg'
gem 'dotenv-rails'
gem 'devise'
gem 'kaminari'

# Frontend
gem 'sass-rails'
gem 'uglifier', '<3'
gem 'coffee-rails'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'slim-rails'
gem 'sprockets-rails', '<3.0' # 3.0 has breaking changes

group :development do
  gem 'quiet_assets'
end

group :development, :test do
  gem 'byebug'
end

group :production do
  gem 'airbrake', '<5.0' # 5.0 has issues with configuration
  gem 'puma'
  gem 'foreman', require: false
end
