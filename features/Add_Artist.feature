Feature: User can add artist

  As a user
  So that I can share with others the artists I like
  I want to be able to add artists
  
Background:
  Given the following Artists exist:
  | name          | description      | similar       |
  | Shakira       | colombian singer | Paulina Rubio |
 
  Given the following Users exist:
  | name    | email               | password  | profile_name   |
  | Snoopy | snoopy@brown.com | 234567    | snoopyprofile |

Scenario: Add artist on Minitunes with a registered user
    When I sign in as "snoopy@brown.com/234567"
    And   I visit the "Shakira" page artist
    Then  I press "Add Artist"
    Then  I should be on the "Shakira" page artist
    Then  I should see "Shakira was successfully added in your collection!"

Scenario: Add artist on Minitunes with an unregistered user
    Given I am on the "Shakira" page artist
    Then  I press "Add Artist"
    Then  should be on the Login page


