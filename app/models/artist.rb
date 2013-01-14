class Artist < ActiveRecord::Base
  attr_accessible :name, :description
  require 'lastfm'
  has_many :participates, :dependent => :destroy
  has_many :albums, :through => :participate
  has_many :reviews, :dependent => :destroy
  has_many :users, :through => :review
  has_many :adds, :dependent => :destroy
  has_many :users, :through => :add
  has_many :artist_similars
  has_many :similars, through: :artist_similar
  validates_uniqueness_of :name

  def self.api_key
    '4eca38cd6745ccde896f9d2977916b15'
  end

  def self.api_secret
    'is caa318fce04f21171ed7d4bf567e5ed4'
  end

  def self.find_in_lastfm(string)
    lastfm = Lastfm.new(self.api_key, self.api_secret)
    lastfm.artist.get_info(:artist => string)
  end

  def self.find_top_albums_in_lastfm(string)
    lastfm = Lastfm.new(self.api_key, self.api_secret)
    lastfm.artist.get_top_albums(:artist => string)
  end

end
 
