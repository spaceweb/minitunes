Feature: User can add artist

  As a user
  So that I can share with others the artists I like
  I want to be able to add artists

Scenario: Add artist on Minitunes with a registered user
    Given I am logged in
    And   I visit the "Artist "Shakira" page
    Then  I follow "Add Artist"
    Then  I should be on to my "profile"
    Then  I should see "Shakira"

Scenario: Add artist on Minitunes with an unregistered user
    Given I am on the Artist "Shakira" page
    Then  I follow "Add Artist"
    Then  should be on the Login page


