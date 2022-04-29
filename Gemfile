source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'bootsnap', require: false
gem 'cssbundling-rails', '~> 1.1'
gem 'dotenv-rails', '~> 2.7'
gem 'dry-transaction', '~> 0.13.3'
gem 'dry-validation', '~> 1.8'
gem 'httparty', '~> 0.20.0'
gem 'puma', '~> 5.0'
gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'telegram-bot-ruby'
gem 'turbo-rails'
gem 'whenever', require: false

group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'sqlite3', '~> 1.4'
end

group :development do
  gem 'web-console'
end

group :production do
  gem 'pg'
end
