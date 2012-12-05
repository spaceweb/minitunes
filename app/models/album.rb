class Album < ActiveRecord::Base
  attr_accessible :name
  has_many :participates
  has_many :artists, :through => :participate
  has_many :contienes
  has_many :songs, :through => :contiene
end
 
