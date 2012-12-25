class Add < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  validates_presence_of :user
  validates_presence_of :artist
end
 
