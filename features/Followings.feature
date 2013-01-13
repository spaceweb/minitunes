Feature: Testing the following's users of Minitunes

  As a registered user
  So that I have my following list on Minitunes

  Background:

    Given the following Users exist:
    | name    | email               | password  | profile_name   |
    | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |
    | Brown   | Brown@Brown.com     | 123456    | BrownProfile   |
    | Bilbo   | Bilbo@Baggings.com  | 123456    | BilboProfile   |
    Given me, Charlie, I am following to Bilbo
    Given me, Charlie, I am following to Brown

  Scenario: View the following of any user on minitunes
    Given I am logged in as Charlie@Charlie.com
    And   I visit the profile page CharlieProfile
    Then  I should see "Following"
    Then  I follow "Following"
    Then  I should see "Bilbo"
    Then  I should see "Brown"

  Scenario: cant view profiles on minitunes when not logged in
    And   I visit the profile page CharlieProfile
    Then  I should see "You need to sign in or sign up before continuing"