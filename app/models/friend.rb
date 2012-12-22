class Friend < ActiveRecord::Base
  belongs_to :tunegoer
  validates_presence_of :tunegoer
  validates_presence_of :tunegoer
end
