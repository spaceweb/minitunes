Feature: Testing the profiles's users of Minitunes

  As a registered user
  So that I can add friends with similar interests
  I want to be able to add friends

  Background:
    Given the following Artists exist:
    | name          | description      | similar       |
    | Shakira       | colombian singer | Paulina Rubio |
    | Paulina Rubio | mexican singer   | Shakira       |

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |

    Given I am logged in as Brown@Brown.com

Scenario: Add friends on Minitunes with a registered user
    And   I visit the profile page CharlieProfile
    Then  I should see "Charlie"
    Then  I should see "Favorites Artists"
    Then  I press "Add Friend"
    Then  I should see "You are now friends with Charlie"
    And   I visit my profile page BrownProfile
    Then  I should see "Charlie"
