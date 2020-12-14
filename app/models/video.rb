class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  #has_one :samnail
  belongs_to_active_hash :category
  #has_one_attached :image

  validates :name, :image, :info, :category, presence: true
  with_options numericality: { other_than: 1 } do
    validates :category_id
  end
end
