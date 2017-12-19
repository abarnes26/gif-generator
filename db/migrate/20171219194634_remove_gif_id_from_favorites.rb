class RemoveGifIdFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :gif_id, :integer
  end
end
