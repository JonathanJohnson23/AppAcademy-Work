class ArtworkShare < ApplicationRecord
    validates :viewer_id, uniqueness: { scope: :artwork_id, 
      message: "Please look at different stuff" }
    validates :artwork_id, uniqueness: { scope: :viewer_id, 
      message: "Please look at different stuff" }
  
    belongs_to :viewer,
      primary_key: :id,
      foreign_key: :viewer_id,
      class_name: :User

    belongs_to :artwork,
      primary_key: :id,
      foreign_key: :artwork_id,
      class_name: :Artwork
  
end