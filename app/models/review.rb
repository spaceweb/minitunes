class Review < ActiveRecord::Base
  attr_accessible :review
  validates_uniqueness_of :tunegoer, :scope => [:artist]
  validates_presence_of :tunegoer
  validates_presence_of :artist
  
  belongs_to :tunegoer
  belongs_to :artist
end