require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'capybara'
require 'capybara/rspec'
require 'capybara/poltergeist'
require 'support/typeahead_select'
require 'selenium-webdriver'
require 'pry'

Dotenv.load('.env')

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(
    app,
    js_errors: false,
    phantomjs_options: ['--web-security=false'])
end

Capybara.javascript_driver = ENV['DRIVER'].to_sym
Capybara.default_driver = ENV['DRIVER'].to_sym
Capybara.app_host = 'http://staging.inmateaid.com'

RSpec.configure do |config|
  config.include TypeaheadSelect, type: :feature
end
