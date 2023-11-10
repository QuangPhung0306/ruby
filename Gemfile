source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

gem "bootsnap", ">= 1.1.0", require: false
gem "config", "~> 1.0"
gem "custom_password_generator", "~> 1.0", ">= 1.0.2"
gem "devise", "~> 4.6", ">= 4.6.2"
gem "dotenv-rails"
gem "i18n-js"
gem "jquery-rails", "~> 4.3", ">= 4.3.5"
gem "jquery-ui-rails", "~> 6.0", ">= 6.0.1"
gem "kaminari"
gem "mysql2", "~> 0.5.2"
gem "puma", "~> 3.11"
gem "rails", "~> 5.2.3"
gem "ransack", "~> 2.1", ">= 2.1.1"
gem "sass-rails", "~> 5.0"
gem "sprockets", "~> 3.7", ">= 3.7.2"
gem "uglifier", ">= 1.3.0"
gem "unicorn"
gem "activerecord-import"
gem "sidekiq"
gem "rubyXL"

group :development, :test, :staging do
  gem "faker", "~> 2.1", ">= 2.1.2"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "pry-rails"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
  gem "capistrano",          require: false
  gem "capistrano-rails",    require: false
  gem "capistrano-rvm",      require: false
  gem "capistrano-bundler",  require: false
  gem "capistrano3-unicorn", require: false
end

group :test do
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
