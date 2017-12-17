class CreateGif < ActiveRecord::Migration[5.1]
  def change
    create_table :gifs do |t|
      t.string :image_path
    end
  end
end
