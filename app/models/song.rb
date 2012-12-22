class Song < ActiveRecord::Base
  attr_accessible :name, :track
  has_many :contienes, :dependent => :destroy
  has_many :albums, :through => :contiene
  validates_uniqueness_of :name
end
 
