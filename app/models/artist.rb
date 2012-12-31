class Artist < ActiveRecord::Base
  attr_accessible :name, :description
  
  has_many :participates, :dependent => :destroy
  has_many :albums, :through => :participate
  has_many :reviews, :dependent => :destroy
  has_many :users, :through => :review
  has_many :adds, :dependent => :destroy
  has_many :users, :through => :add
  has_many :artist_similars
  has_many :similars, through: :artist_similar
  validates_uniqueness_of :name

end
 
