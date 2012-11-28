Feature: Testing the profiles's users of Minitunes

  As a registered user
  So that I can add friends with similar interests
  I want to be able to add friends

  Background:
    Given I am logged in
    Given Fulanito is a user of MiniTunes

Scenario: Add friends on Minitunes with a registered user
    And   I visit the user profile page of Fulanito
    Then  I should see "Favorites Artist"
    Then  I follow "Add friend"
    Then  I should see "Fulanito is now your friend"
    Then  I go to my profile
    Then  I should see "Fulanito"
