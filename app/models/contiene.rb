class Contiene < ActiveRecord::Base
  belongs_to 'album'
  belongs_to 'song'
end
 
