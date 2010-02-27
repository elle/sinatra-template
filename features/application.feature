Feature: Show Home Page
  Scenario: Visit the home page
    Given I have a model named Test
	And I am on the home page
    Then I should see "Your Application Name"
	And I should see "Test"