class Participate < ActiveRecord::Base
  belongs_to 'artist'
  belongs_to 'album'
  validate_presence_of :artist
  validate_presence_of :album
end
 
