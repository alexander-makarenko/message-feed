source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'rails', '~> 5.0.1'
gem 'puma', '~> 3.0'
gem 'pg'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'haml-rails'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap-sass'
gem 'bootstrap-will_paginate'
gem 'ancestry'
gem 'omniauth-google-oauth2'
gem 'omniauth-github'
gem 'omniauth-facebook'
gem 'pundit'
gem 'figaro'
gem 'faker'

group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false  
  gem 'byebug', platform: :mri
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'pundit-matchers'
end