Feature: User see artist's songs

  As a client of MiniTunes
  So that I can see the songs of the artists
  I want to be able see songs

Background:

  Given the following Artists exist:
  | name          | description     |
  | Shakira       | colobiam singer |

  Given the following Albums exist:
  | name      | tracks |
  | She Wolf  | 15     |

  Given the following Songs exist:
  | name       | track  |
  | Long Time  | 10     |

Scenario: See songs of the artist
  Given the relation artist-album "Shakira" and "She Wolf"
  And  I am on the "Shakira" page artist
  Then I should see "Albums"
  Then I should see "She Wolf"
  When I follow "She Wolf"
  Then I am on the "Shakira" "She Wolf" page album
  Then I should see "Long Time"
