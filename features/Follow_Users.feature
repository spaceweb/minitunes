Feature: Testing the profiles's users of Minitunes

  As a registered user
  So that I can follow users with similar interests
  I want to be able to follow users

  Background:
    Given the following Artists exist:
    | name          | description      |
    | Shakira       | colombian singer |
    | Paulina Rubio | mexican singer   |

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |
    Given I am logged in as Brown@Brown.com

  Scenario: Follow a user on Minitunes with a registered user
    And   I visit the profile page CharlieProfile
    Then  I should see "Charlie"
    Then  I press "Follow"
    Then  I should see "You are now following Charlie"
    Then  I visit my profile page BrownProfile
    Then  I should see "Charlie"
  Scenario: Unfollow a user on Minitunes with a registered user
    And   I visit the profile page CharlieProfile
    Then  I press "Follow"
    Then  I should see "You are now following Charlie"
    Then  I press "Unfollow"
    Then  I should see "You are not following Charlie"
