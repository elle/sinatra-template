Feature: view pages
  Scenario: Visit the home page
    Given I am viewing "/"
    Then I should see "Your Application Name"
    
  Scenario: visit the about page
    Given I have a model named Page
    And I am viewing "/about"
    Then I should see "About"
