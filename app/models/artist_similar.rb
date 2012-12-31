class ArtistSimilar < ActiveRecord::Base
  belongs_to :artist
  belongs_to :similar, class_name:'Artist', foreign_key: 'similar_id'
  validates :artist_id, presence: true
  validates :artist_name, presence: true
  validates :similar_name, presence: true
  # validates :similar_id, presence: true
  attr_accessible :artist, :similar, :artist_id, :similar_id, :artist_name, :similar_name
end
