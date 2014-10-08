ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL

  Capybara.reset_sessions!
  Capybara.use_default_driver
  Capybara.default_wait_time = 5
end
