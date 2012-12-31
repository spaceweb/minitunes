class Artist < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :participates, :dependent => :destroy
  has_many :albums, :through => :participate
  has_many :reviews, :dependent => :destroy
  has_many :users, :through => :review
  has_many :adds, :dependent => :destroy
  has_many :users, :through => :add
  validates_uniqueness_of :name

end
 
