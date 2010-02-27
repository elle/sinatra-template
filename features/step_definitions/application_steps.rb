Given /^I have a model named (.+)$/ do |name|
  Model.create(:name => name)
end