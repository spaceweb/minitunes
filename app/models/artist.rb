class Artist < ActiveRecord::Base
  attr_accessible :name, :description, :similar
  
  has_many :participates, :dependent => :destroy
  has_many :albums, :through => :participate
  has_many :reviews, :dependent => :destroy
  has_many :tunegoers, :through => :review
  has_many :tienes, :dependent => :destroy
  has_many :tunegoers, :through => :tiene
  validates_uniqueness_of :name

end
 
