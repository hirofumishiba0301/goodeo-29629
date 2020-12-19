class VideoThumbnail
  include ActiveModel::Model

  attr_accessor :name, :info, :movie, :poster, :category_id, :user_id

  with_options presence: true do
    validates :name, :info, :user_id, :movie, :poster
    #validates :video_type
    validates :category_id, numericality: { other_than: 1, message: 'must be other than 1' }
  end

  def save
    video = Video.create!(user_id: user_id, name: name, info: info, category_id: category_id, movie: movie)
    Thumbnail.create(video_id: video.id, poster: poster)
  end

  private

  #def video_type
   # return unless video.attached?
    #if !video?
     # video.purge # delete the uploaded file
      #errors.add(:video, 'errors.messages.file_type_not_video')
    #end
  #end

  #def video?
   # %w[video/mov].include?(video.blob.content_type)
  #end
end