class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true


  has_many :artwork,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: :Artwork

  has_many :viewed_art,
    primary_key: :id,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare

  has_many :shared_artworks,
    through: :viewed_art,
    source: :artwork
end
