Feature: User can add comments

  As a client of MiniTunes
  So that I can share my opinion with others about artists
  I want to be able to add comments if I am an registered user

Scenario: Add comments on Minitunes with a registered user
  Given I am logged in
  And I visit the "Shakira" page
  When I follow "Add Comment"
  Then I should be on the Reviews page
  Then I should see "Comments"
  Then I fill in "Comments" with "Esto es un comentario"
  And I press "Create Comment"
  Then I should be on the "Shakira" page
  Then I should see "Esto es un comentario"

Scenario: Try to comment on the website of an artist when not registered
  Given I am on "Shakira" page 
  Then  I fill "Comments" with "Esto es un comentario"
  And   I press "Add Comment"
  Then  I should be on the Login page
