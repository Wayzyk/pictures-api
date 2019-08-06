source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'rails', '~> 5.2.3'

# Optimize and cache expensive computations
gem 'bootsnap', '>= 1.1.0', require: false

# Application server
gem 'puma', '~> 3.11'

# Supported DBs
gem 'mongoid'

# Uploading files
gem 'carrierwave-mongoid', :require => 'carrierwave/mongoid'
gem 'mongoid-grid_fs', github: 'ahoward/mongoid-grid_fs'
gem 'mini_magick'

# Serialize data
gem 'active_model_serializers', '~> 0.10.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 4.11.1'
  gem 'faker', '~> 1.9.3'
  gem 'pry-byebug', '~> 3.6'
  gem 'rubocop', '~> 0.63.1', require: false
  gem 'rubocop-rspec', '~> 1.31.0', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rspec-rails', '~> 3.8.1'
  gem 'rails-controller-testing', '~> 1.0.4'
  gem 'shoulda-matchers', '~> 3.1.2', require: false
  gem 'factory_trace', '~> 0.3.2'
  gem 'database_cleaner'
  gem 'mongoid-rspec'
  gem 'simplecov', require: false
end
