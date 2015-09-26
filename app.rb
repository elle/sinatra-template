require "sinatra/activerecord"
require "sinatra"

if development?
  require "dotenv"
  Dotenv.load
end

configure do
  set :haml, format: :html5
  set :environment, :development
  enable :logging
end

helpers do
  def development?
    settings.development?
  end

  def production?
    settings.production?
  end
end

error ActiveRecord::RecordNotFound do
  status(404)
  @error = "Page not found"
  haml :error
end

not_found do
  status(404)
  @error ||= "We don't know about that!"
  haml :error
end

error do
  @error = request.env["sinatra.error"].to_s
  haml :error
end if production?

get "/application.css" do
  scss :"stylesheets/application"
end

get "/" do
  haml :index
end

