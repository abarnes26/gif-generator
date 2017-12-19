class RemoveUserIdFromFavorites < ActiveRecord::Migration[5.1]
  def change
    remove_column :favorites, :user_id, :integer
  end
end
