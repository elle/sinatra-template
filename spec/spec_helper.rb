require 'rubygems'
require 'sinatra'
require 'spec'
# require 'spec/interop/test'
require 'rack/test'

# set test environment
Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

require 'application' # <-- your sinatra app

# system "rm db/test.sqlite3"
# system "rake db:reset"

Spec::Runner.configure do |config|
  # Make Rack::Test available to all spec contexts
  config.include Rack::Test::Methods 
  # Connect to test database
  config.before(:each) {
    ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => 'db/test.sqlite3')
  }
end
