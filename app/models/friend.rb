class Friend < ActiveRecord::Base
  belongs_to :tunegoer
  validate_presence_of :tunegoer
  validate_presence_of :tunegoer
end
