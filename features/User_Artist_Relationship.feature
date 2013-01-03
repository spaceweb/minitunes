Feature: User can add artist

  As a user
  So that I can share with others the artists I like
  I want to be able to add artists
  
Background:
  Given the following Artists exist:
  | name              | description    | 
  | Gym Class Heroes  | American group | 
 
  Given the following Users exist:
  | name    | email               | password  | profile_name  |
  | Snoopy  | snoopy@brown.com    | 234567    | snoopyprofile |

Scenario: Add artist on Minitunes with a registered user
    When I sign in as "snoopy@brown.com/234567"
    And  I visit the "Gym Class Heroes" page artist
    When I press "Add Artist"
    Then I should be on the "Gym Class Heroes" page artist
    And  I should see "Gym Class Heroes was successfully added in your collection!"
    When I go to my profile page "snoopyprofile"
    Then I should see "Gym Class Heroes"

Scenario: Add artist on Minitunes with an unregistered user
    Given I am on the "Gym Class Heroes" page artist
    Then  I press "Add Artist"
    Then  I should be on the Login page
    
    
Scenario: Deleted artist on Minitunes with a registered user
  Given the relation "Snoopy" and "Gym Class Heroes"
  When I sign in as "snoopy@brown.com/234567"
  And  I visit the "Gym Class Heroes" page artist
  When I press "Remove Artist"
  Then I should be on the "Gym Class Heroes" page artist
  And  I should see "Gym Class Heroes was successfully deleted"
  When I go to my profile page "snoopyprofile"
  Then I should not see "Gym Class Heroes"

