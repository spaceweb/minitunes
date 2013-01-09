class Song < ActiveRecord::Base
  attr_accessible :name, :track, :duration
  has_many :contains, :dependent => :destroy
  has_many :albums, :through => :contain
end
