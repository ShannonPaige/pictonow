# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/rails'
require 'capybara/rspec'
require "database_cleaner"
require "simplecov"

SimpleCov.start "rails"

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!
  # config.filter_rails_from_backtrace!
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:instagram] = OmniAuth::AuthHash.new({
    provider: 'instagram',
    uid: 'ig_uid',
    info: {
      nickname: "ig_nickname",
      name:     "ig_name",
      email:    "ig_email",
      image:    "ig_image",
      bio:      "ig_bio",
      website:  "ig_website",
    },
    credentials: {
      token: "ig_token",
    }
  })

end
