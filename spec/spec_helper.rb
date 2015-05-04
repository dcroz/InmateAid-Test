require 'capybara'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'dotenv'
require 'pry'

Dotenv.load('.env')

Capybara.default_driver = :selenium
Capybara.app_host = 'http://staging.inmateaid.com'
