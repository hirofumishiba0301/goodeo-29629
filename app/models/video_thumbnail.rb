class VideoThumbnail
  include ActiveModel::Model

  attr_accessor :name, :info, :image, :poster, :category_id, :user_id

  with_options presence: true do
    validates :name, :info, :user_id, :image, :poster
    validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  end

  def save
    video = Video.create!(user_id: user_id, name: name, info: info, category_id: category_id, image: image, poster: poster)
    Thumbnail.create(video_id: video.id)
  end
end