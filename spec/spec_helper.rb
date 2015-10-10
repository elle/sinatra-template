ENV["RACK_ENV"] = "test"

require "rack/test"
require "active_record"
require "shoulda/matchers"
require_relative "../app"

Dir["./spec/support/**/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.syntax = :expect
  end

  config.order = :random
end
