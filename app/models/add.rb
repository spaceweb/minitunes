class Add < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  validates_presence_of :user
  validates_presence_of :artist
  validates_uniqueness_of :user_id, :scope => :artist_id
end
 
