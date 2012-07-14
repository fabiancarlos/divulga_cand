source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'sqlite3'
gem 'thin'
gem 'slim'
gem 'heroku'

group :test, :development do
	gem 'rspec-rails'
end

group :test do
	gem 'machinist', '>= 2.0.0.beta2'
	gem 'cucumber', require: false
end

group :production do
	gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
