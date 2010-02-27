gem 'rack-test', '=0.3.0'

require 'rubygems'
require 'sinatra'
require 'mocha'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

app_file = File.join(File.dirname(__FILE__), %w{.. .. application.rb})
require app_file

# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file

require 'spec/expectations'
require 'rack/test'
require 'webrat'


Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{MyWorld.new}

DataMapper.setup(:default, "sqlite3::memory:")

Before do
  DataMapper.auto_migrate!
end