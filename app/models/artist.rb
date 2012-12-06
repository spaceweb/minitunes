class Artist < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :participates
  has_many :albums, :through => :participate
  has_many :reviews
  has_many :tunegoers, :through => :review
  has_many :tienes
  has_many :tunegoers, :through => :tiene
  
end
 
