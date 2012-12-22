class Participate < ActiveRecord::Base
  belongs_to 'artist'
  belongs_to 'album'
  validates_presence_of :artist
  validates_presence_of :album
end
 
