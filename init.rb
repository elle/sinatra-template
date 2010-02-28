require 'rubygems'
require 'sinatra'
require 'haml'
require 'ostruct'
require 'active_record'

configure do
  SiteConfig = OpenStruct.new(
    :title => 'Your Application Name',
    :author => 'Your Name',
    :url_base => 'http://localhost:9393/'
  )
  
  set :views, "#{File.dirname(__FILE__)}/views"
  
  # Load all the lib files (models, helpers)
  Dir["lib/*.rb"].each { |x| load x }

  # Set default for haml
  set :haml => {:attr_wrapper => '"', :format => :xhtml}
end
