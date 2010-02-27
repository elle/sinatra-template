require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

Given /^I am on (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^I follow "([^\"]*)"$/ do |link|
  click_link(link)
end

When /^I press "([^\"]*)"$/ do |button|
  click_button(button)
end

When /^I fill in "([^\"]*)" with "([^\"]*)"$/ do |field, value|
  fill_in(field, :with => value) 
end

Then /^I should see "([^\"]*)"$/ do |text|
  response_body.should contain(text)
end
 
Then /^I should not see "([^\"]*)"$/ do |text|
  response_body.should_not contain(text)
end

Given /^I am viewing "([^\"]*)"$/ do |url|
  visit(url)
end

Given /^I have a model named (.+)$/ do |name|
  Model.create(:name => name)
end
