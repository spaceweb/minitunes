Feature: Testing Similar Artist of Minitunes

  As a client of Minitunes
  So that I can find similar artists as my search
  I want to include similar artists to my collection

  Background:
    Given I am logged in
    And   I on Shakira page

Scenario: Add Artist from similar Artist
    Then  I should see "Similar Artists"
    Then  I should see "Paulina Rubio"
    And   I follow "Paulina Rubio"
    Then  I am on the Paulina Rubio page
    Then  I follow "Add Artist"
    Then  I go to my profile
    And   I should see "Paulina Rubio"

