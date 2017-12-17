class AddCategoriesToGifs < ActiveRecord::Migration[5.1]
  def change
    add_reference :gifs, :category, foreign_key: true
  end
end
