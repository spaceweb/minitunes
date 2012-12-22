class Contiene < ActiveRecord::Base
  belongs_to 'album'
  belongs_to 'song'
  validate_presence_of :album
  validate_presence_of :song
end
 
