# Set the environment to "test"
ENV["RACK_ENV"] = "test"
ENV["ENVIRONMENT"] = "test"
# Bring in the contents of the `app.rb` file
require './app'
# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
# Tell Capybara to talk to BookmarkManager
Capybara.app = BookmarkManager

RSpec.configure do |config|
  # rspec-expectations config goes here.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object.
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:each) do
    require_relative './setup_test_database'
  end

end
