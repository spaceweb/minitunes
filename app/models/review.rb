class Review < ActiveRecord::Base
  attr_accessible :review
  validates_uniqueness_of :user_id, :scope => [:artist_id]
  validates_presence_of :user
  validates_presence_of :artist
  
  belongs_to :user
  belongs_to :artist
end
