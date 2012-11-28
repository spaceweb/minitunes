Feature: User can add artist

  As a user
  So that I can share with others the artists I like
  I want to be able to add artists

Scenario: Add artist on Minitunes with a registered user
    Given I am logged in
    And   I visit the Shakira page
    Then  I follow "Add Artist"
    Then  I go to my profile
    Then  I should see "Shakira"

Scenario: Add artist on Minitunes with an unregistered user
    Given I visit the Shakira page
    Then  I follow "Add Artist"
    Then  I should redirect to "/login"


