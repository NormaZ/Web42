source 'https://rubygems.org'

ruby "2.1.5"

gem 'rails', '4.1.8'

gem 'i18n-active_record',
      :git => 'git://github.com/svenfuchs/i18n-active_record.git',
      :require => 'i18n/active_record'
gem 'activeadmin', github: 'activeadmin'
#Obligatoire pour heroku et on l'utilise aussi en locale ;)
gem 'pg'

#ssl
gem 'thin'
gem 'contact_us'

#Classique
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'haml-rails'
gem 'devise-i18n', github: 'normaz/devise-i18n'
gem 'devise-i18n-views'
gem 'devise_security_extension'
gem 'rails_email_validator'
gem 'easy_captcha'

#Bootstrap
gem 'bootstrap-sass'
gem 'autoprefixer-rails'

gem "font-awesome-rails"
gem 'bootstrap-datepicker-rails'

#Pour la connection
gem 'devise'
gem 'country_select'

group :development do 
  gem "better_errors"
  gem "binding_of_caller"
  gem 'meta_request'
  gem 'jazz_hands', github: 'jkrmr/jazz_hands'
end

group :development, :test do
  gem 'childprocess'
  gem "factory_girl_rails"
  gem 'shoulda-matchers'
  gem 'rspec-rails'
end

#Gem classique de test
group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'simplecov', :require => false
  gem 'email_spec'
  gem 'faker'
  gem 'database_cleaner'
end