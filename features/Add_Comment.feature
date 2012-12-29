Feature: Users can add comments

  As a client of MiniTunes
  So that I can share my opinion with others about artists
  I want to be able to add comments if I am an registered user

Background:
  Given the following Artists exist:
  | name          | description      | similar       |
  | Shakira       | colombian singer | Paulina Rubio |
  | Paulina Rubio | mexican singer   | Shakira       |

  Given the following Users exist:
  | name    | email               | password  | profile_name   |
  | Charlie | Charlie@Charlie.com | 123456    | CharlieProfile |

Scenario: Add comments on Minitunes with a registered user
  When I sign in as "Charlie@Charlie.com/123456"
  And I go to the "Shakira" page artist
  Then I should see "Add your comment"
  Then I fill in "Add your comment" with "This is a comment"
  And I press "Create Comment"
  Then I should be on the "Shakira" page artist
  Then I should see "This is a comment"

Scenario: Try to comment on the website of an artist when not registered
  When I go to the "Shakira" page artist
  Then I should see "Add your comment"
  Then I fill in "Add your comment" with "This is a comment"
  And I press "Create Comment" 
  Then I should be on the Login page