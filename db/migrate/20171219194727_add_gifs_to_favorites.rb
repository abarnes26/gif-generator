class AddGifsToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_reference :favorites, :gif, foreign_key: true
  end
end
