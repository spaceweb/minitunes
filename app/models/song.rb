class Song < ActiveRecord::Base
  attr_accessible :name, :track
  has_many :contienes
  has_many :albums, :through => :contiene
end
 
