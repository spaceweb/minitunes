Feature: Testing the profiles's users of Minitunes

  As a registered user
  So that I can any profile on Minitunes

  Background:
    Given the following Artists exist:
    | name          | description      |
    | Shakira       | colombian singer |
    | Paulina Rubio | mexican singer   |

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |

  Scenario: View the profile of any user on minitunes
    Given I am logged in as Charlie@Charlie.com
    And   I visit the profile page CharlieProfile
    Then  I should see "Charlie"
    Then  I should see "Favorites Artists"

  Scenario: cant view profiles on minitunes when not logged in
    And   I visit the profile page CharlieProfile
    Then  I should see "You need to sign in or sign up before continuing"

