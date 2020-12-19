class Thumbnail < ApplicationRecord
  has_one_attached :poster
  belongs_to :video
  has_one_attached :poster
end
