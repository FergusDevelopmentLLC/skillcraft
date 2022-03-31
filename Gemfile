source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.2'
gem 'pg', '~> 0.11'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
#gem 'webpacker', '~> 4.0'
gem 'webpacker'
gem 'uglifier', '>= 1.3.0' #???
#gem 'coffee-rails', '~> 4.2' #???
gem 'bcrypt', '~> 3.1.7'
gem 'pry' #TODO put this in a better place
gem 'bootsnap', '>= 1.4.2', require: false
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'cloudinary'
gem 'jbuilder', '~> 2.7'
gem 'websocket-extensions', '>= 0.1.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dotenv-rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'rails-erd'
  gem 'solargraph'
  gem 'rubocop'
  
  gem 'better_errors' #???
  #gem 'rails_layout' #???
  gem 'spring-commands-rspec' #???
  gem 'seed_dump'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'database_cleaner' #???
  gem 'launchy' #???
  gem 'selenium-webdriver' #???
  gem 'webdrivers'
end

group :development, :test do
  #gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
#gem 'bootstrap-sass'
gem 'high_voltage'
gem 'omniauth'
gem 'omniauth-twitter'
