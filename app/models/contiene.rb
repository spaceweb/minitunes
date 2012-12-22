class Contiene < ActiveRecord::Base
  belongs_to 'album'
  belongs_to 'song'
  validates_presence_of :album
  validates_presence_of :song
end
 
