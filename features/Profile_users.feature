Feature: Testing the profiles's users of Minitunes

  As a registered user
  So that I can any profile on Minitunes

  Background:
    Given I am logged in
    Given Charlie is a user of MiniTunes

  Scenario: View the profile of any user on minitunes
    And   I visit the user profile page of Charlie
    Then  I should see "Charlie Brown"
    Then  I should see "Favorites Artist"

