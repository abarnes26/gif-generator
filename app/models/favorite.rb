class Favorite < ApplicationRecord
  validates_uniqueness_of :gif_id, scope: :user_id
  belongs_to :user
  belongs_to :gif
end
