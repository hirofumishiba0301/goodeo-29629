class VideosController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @videos = Video.includes(:user).order('created_at DESC')
    @thumbnail = Thumbnail.includes(:user)
  end

  def new
    @video_thumbnail = VideoThumbnail.new
  end

  def create
    @video_thumbnail = VideoThumbnail.new(video_thumbnail_params)
    if @video_thumbnail.valid?
      @video_thumbnail.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def video_thumbnail_params
    params.require(:video_thumbnail).permit(:image, :name, :info, :category_id, :goodjob, :poster, :views).merge(user_id: current_user.id)
  end

end
