class Album < ActiveRecord::Base
  attr_accessible :name, :tracks, :release_date
  has_many :participates, :dependent => :destroy
  has_many :artists, :through => :participate
  has_many :contains, :dependent => :destroy
  has_many :songs, :through => :contain
  

  def self.api_key
    '4eca38cd6745ccde896f9d2977916b15'
  end

  def self.api_secret
    'is caa318fce04f21171ed7d4bf567e5ed4'
  end

  def self.find_songs_in_lastfm(name, title)
    lastfm = Lastfm.new(self.api_key, self.api_secret)
    lastfm.album.get_info(:artist => name, :album => title)
  end

  def self.find_in_youtube(name, title)
    begin
      YoutubeSearch.search(name + ' ' + title).first['video_id']
    rescue
      return "#"
    end
  end

  def self.find_album_in_lastfm(name, title)
    lastfm = Lastfm.new(self.api_key, self.api_secret)
    lastfm.album.get_info(:artist => name, :album => title)
  end

end

