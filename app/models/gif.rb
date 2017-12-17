class Gif < ApplicationRecord
  validates :image_path, presence: true, uniqueness: true
  belongs_to :category
end
