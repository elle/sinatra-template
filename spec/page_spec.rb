require "#{File.dirname(__FILE__)}/spec_helper"

describe 'page' do
  before(:each) do
    @page = Page.new(:title => 'page title')
  end

  specify 'should be valid' do
    @page.should be_valid
  end

  specify 'should require a title' do
    @page = Page.new
    @page.should_not be_valid
    @page.errors[:title].should include("can't be blank")
  end
end
