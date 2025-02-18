require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'devise'
require 'factory_bot_rails'
require 'database_cleaner/active_record'

# Require supporting Ruby files in spec/support/
Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Ensure pending migrations are applied before tests run.
begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end

RSpec.configure do |config|
  # Include FactoryBot methods
  config.include FactoryBot::Syntax::Methods

  # Include Devise helpers for authentication
  config.include Devise::Test::IntegrationHelpers, type: :request
  config.include Devise::Test::ControllerHelpers, type: :controller

  # Include Warden for user authentication testing
  config.include Warden::Test::Helpers
  config.before(:suite) { Warden.test_mode! }
  config.after(:each) { Warden.test_reset! }

  # ✅ DatabaseCleaner Configuration
  DatabaseCleaner.allow_remote_database_url = true

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.before(:each, js: true) do
    DatabaseCleaner.strategy = :truncation # Needed for JS-dependent tests
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  # Configure transactional fixtures
  config.use_transactional_fixtures = true

  # Automatically infer test type from file location
  config.infer_spec_type_from_file_location!

  # Filter Rails backtrace for better debugging
  config.filter_rails_from_backtrace!
end
