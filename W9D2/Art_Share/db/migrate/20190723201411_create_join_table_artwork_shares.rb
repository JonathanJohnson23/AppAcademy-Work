class CreateJoinTableArtworkShares < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :artworks do |t|
      t.index [:user_id, :artwork_id]
      t.index [:artwork_id, :user_id]

    end
  end
end
