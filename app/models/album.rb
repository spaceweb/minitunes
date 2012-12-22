class Album < ActiveRecord::Base
  attr_accessible :name
  has_many :participates, :dependent => :destroy
  has_many :artists, :through => :participate
  has_many :contienes, :dependent => :destroy
  has_many :songs, :through => :contiene
  validates_uniqueness_os :name
end
 
