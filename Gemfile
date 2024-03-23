# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'pg', '~> 1.1'
gem 'rails', '~> 7.1.3'

gem 'puma', '>= 5.0'

gem 'devise'

gem 'vite_rails'
gem 'vite_ruby'

gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'pry-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem 'letter_opener'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'web-console'
end

group :test, :development do
  gem 'byebug'
  gem 'dotenv-rails'
  gem 'ffaker'
  gem 'js_from_routes'
  gem 'rspec-rails'
end
