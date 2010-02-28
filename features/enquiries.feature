Feature: Enquiries contact form
  In order to send enquiry emails (possible business leads)
  As a end-user
  I want to send emails to website owner
  
  Scenario: A user submits an enquiry
    Given I am viewing "/contact"
    And I should see "Contact us"
    When I fill in the following:
      | Name    | John                 |
      | Email   | john.doe@example.com |
      | Phone   | 02-66810000          |
      | Message | some text            |
      | Answer  | 7                    | 
    Then I should see "Thank you for your enquiry"