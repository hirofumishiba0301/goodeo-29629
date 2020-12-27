class Thumbnail < ApplicationRecord
  belongs_to :video
  has_one_attached :poster

  validates :poster, :name, presence: true
  validate :thumbnail_type

  private

  def thumbnail_type
   return unless poster.attached?
   if !poster?
      poster.content_type = nil # delete the uploaded file
      errors.add(:poster, 'content_type is not image')
   end
  end

  def poster?
      %w[image/jpeg image/png].include?(poster.blob.content_type)
  end
end
