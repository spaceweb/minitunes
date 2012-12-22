class Tiene < ActiveRecord::Base
  belongs_to :tunegoer
  belongs_to :artist
  validate_presence_of :tunegoer
  validate_presence_of :artist
end
 
