Feature: Testing the follower's users of Minitunes

  As a registered user
  So that I have my followers list on Minitunes

  Background:

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |
    | Bilbo   | Bilbo@Baggings.com  | 123456    | BilboProfile   |
    Given Bilbo is a follower of Charlie
    Given Brown is a follower of Charlie

  Scenario: View the followers of any user on minitunes
    Given I am logged in as Charlie@Charlie.com
    And   I visit the profile page CharlieProfile
    Then  I should see "Followers"
    Then  I follow "Followers"
    Then  I should see "Bilbo"
    Then  I should see "Brown"

  Scenario: cant view profiles on minitunes when not logged in
    And   I visit the profile page CharlieProfile
    Then  I should see "You need to sign in or sign up before continuing"