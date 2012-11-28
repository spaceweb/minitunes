Feature: User search artists

  As a client of Minitunes
  So that I can find artists on Minitunes

Scenario: Try to search existing artist

  Given I am on the MiniTunes home page
  When  I fill in "Search Terms" with "shakira"
  And   I press "Search"
  Then  I should be on the Shakira page

Scenario: Try to search nonexistent artist (sad path)

  Given I am on the MiniTunes home page
  When  I fill in "Search Terms" with "Artist That Does Not Exist"
  And   I press "Search"
  Then  I should be on the MiniTunes home page
  And   I should see 'You search "Artist That Does Not Exist" did not match anything on MiniTunes'
  