class Artist < ActiveRecord::Base
  attr_accessible :name, :description
  has_many :participates
  has_many :albums, :through => :participates
end
 
