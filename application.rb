require 'init'

error ActiveRecord::RecordNotFound do
  status(404)
  @msg = "Page not found\n"
  content_type 'text/html'
  haml :not_found
end

not_found do
  status(404)
  @msg || "We don't know about that!\n"
  content_type 'text/html'
  haml :not_found
end

error do
  @error = request.env['sinatra.error'].to_s
  content_type 'text/html'
  haml :error
end unless Sinatra::Application.environment == :development

# root page
get '/' do
  haml :root
end

get '/contact/?' do
  haml :contact
end
