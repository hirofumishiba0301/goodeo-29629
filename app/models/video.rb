class Video < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :thumbnail, dependent: :destroy
  belongs_to_active_hash :category
  has_one_attached :movie
  has_many :goodjobs, dependent: :destroy
  has_many :favorites, dependent: :destroy
  acts_as_taggable
  acts_as_taggable_on :skills, :interests

  with_options presence: true do
    validates :name, :info, :movie
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

    if size?
      movie.content_type = nil # delete the uploaded file
      errors.add(:movie, 'oversize limited (3MB)')
    end
  end

  def movie?
    %w[video/quicktime].include?(movie.blob.content_type)
  end

  def size?
      movie.blob.byte_size > (3 * 1024 * 1024) 
  end
end
