require_relative "../spec_helper"

describe "Application" do
  include Rack::Test::Methods

  def app
    Sinatra::Application.new
  end

  specify "shows the default index page" do
    get "/"

    expect(last_response).to be_ok
  end

end
