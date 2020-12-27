class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :thumbnail
  belongs_to_active_hash :category
  has_one_attached :movie

  with_options presence: true do
    validates :name, :info, :user_id, :movie
    validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  end

  validate :video_type

  private

  def video_type
    return unless movie.attached?
    if !movie?
      movie.content_type = nil # delete the uploaded file
      errors.add(:movie, 'content_type is not video')
    end
  end

  def movie?
    %w[video/quicktime].include?(movie.blob.content_type)
  end
end
