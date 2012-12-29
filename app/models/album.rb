class Album < ActiveRecord::Base
  attr_accessible :name, :tracks, :release_date
  has_many :participates, :dependent => :destroy
  has_many :artists, :through => :participate
  has_many :contains, :dependent => :destroy
  has_many :songs, :through => :contiene
  validates_uniqueness_of :name
end
 
