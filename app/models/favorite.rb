class Favorite < ApplicationRecord
  validates :gif_id, presence: true, uniqueness: true
  belongs_to :user
  belongs_to :gif
end
