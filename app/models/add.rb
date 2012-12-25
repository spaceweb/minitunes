class Add < ActiveRecord::Base
  belongs_to :tunegoer
  belongs_to :artist
  validates_presence_of :tunegoer
  validates_presence_of :artist
end
 
