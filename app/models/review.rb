class Review < ActiveRecord::Base
  attr_accessible :comments

  belongs_to :user
  belongs_to :artist

  validates_presence_of :user
  validates_presence_of :artist
end
