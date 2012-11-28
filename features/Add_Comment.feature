Feature: User can add comments

  As a client of MiniTunes
  So that I can share my opinion with others about artists
  I want to be able to add comments if I am an registered user

Scenario: Add comments on Minitunes with a registered user

    Given I am logged in
    Given I am on Shakira page
    Then  I should see "Comments"
    Then  I fill "Add Comment-Text" with "Esto es un comentario"
    And   I click "Add Comment"
    Then  I should see "Esto es un comentario"

Scenario: Try to comment on the website of an artist when not registered

    Given I am on Shakira page 
    Then  I fill "Add Comment-Text" with "Esto es un comentario"
    And   I click "Add Comment"
	Then  I should be on Login page
