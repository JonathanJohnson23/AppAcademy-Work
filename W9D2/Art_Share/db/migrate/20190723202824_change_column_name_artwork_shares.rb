class ChangeColumnNameArtworkShares < ActiveRecord::Migration[5.2]
  def change
    rename_table :artworks_users, :artwork_shares
    rename_column :artwork_shares, :user_id, :viewer_id
  end
end
