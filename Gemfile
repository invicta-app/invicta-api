source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.3"

gem "sassc-rails", "~> 2.1.2"
gem "sass-rails"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# Javascript
gem "popper_js", "~> 2.11"

# CSS
gem "bootstrap", "~> 5.1.3"
gem "jsbundling-rails", "~> 1.1.1"
gem "cssbundling-rails", "~> 1.1.2"
gem "font-awesome-sass", "~> 6.1.1"

# Business
gem "devise", "~> 4.8.1"
gem "redcarpet", "~> 3.6.0"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  gem "web-console"
  gem "annotate"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
