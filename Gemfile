source 'http://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rack'
gem 'rails', '5.1.4'
gem 'mysql2'
gem 'jquery-rails'

gem 'will_paginate'
gem 'paperclip'
gem 'annotate'
gem 'acts-as-taggable-on'
gem 'simple-navigation'
gem 'authlogic'
# gem 'rails3-generators'
gem 'haml'
gem 'rmagick'
gem 'polish'
gem 'hominid'

gem 'tinymce-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end

group :test do
  gem 'factory_girl_rails'
  # Pretty printed test output
  gem 'turn', :require => false
  gem 'sqlite3'
end

# ruby upgrade
gem 'xmlrpc'

# rails 5 upgrade gems
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks'
gem 'puma'
gem 'jbuilder'
gem 'jquery-ui-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'capistrano-rails'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
