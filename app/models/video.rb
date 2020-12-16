class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :thumbnail
  belongs_to_active_hash :category
  has_one_attached :image
end
