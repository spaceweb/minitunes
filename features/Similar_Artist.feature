Feature: Testing Similar Artist of Minitunes

  As a client of Minitunes
  So that I can find similar artists as my search
  I want to include similar artists to my collection

  Background:
    Given the following Artists exist:
    | name          | description      |
    | Shakira       | colombian singer |
    | Paulina Rubio | mexican singer   |

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |
    Given "Shakira" and "Paulina Rubio" are similars

Scenario: Add Artist from similar Artist
    Given I am logged in as Charlie@Charlie.com
    Given I am on the "Shakira" page
    Then  I should see "Similar Artists"
    Then  I should see "Paulina Rubio"
    And   I follow "Paulina Rubio"
    Then  I am on the "Paulina Rubio" page
    Then  I press "Add Artist"
    Then  I go to my Profile "CharlieProfile"
    And   I should see "Paulina Rubio"
